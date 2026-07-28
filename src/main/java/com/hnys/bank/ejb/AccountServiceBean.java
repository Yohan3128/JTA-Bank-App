package com.hnys.bank.ejb;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.ejb.remote.LoginService;
import com.hnys.bank.entity.Account;
import com.hnys.bank.entity.AccountType;
import com.hnys.bank.entity.User;
import com.hnys.bank.exception.AccountNotFoundException;
import com.hnys.bank.exception.InsufficientFundException;
import jakarta.ejb.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;

import java.math.BigDecimal;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Stateless
public class AccountServiceBean implements AccountService {

    @PersistenceContext(unitName = "BANK-PU")
    private EntityManager em;

    @EJB
    private LoginService loginService;

    @Override
    @TransactionAttribute(TransactionAttributeType.MANDATORY)
    public void creditToAccount(String accountNo, BigDecimal amount) {
//        if (amount.compareTo(BigDecimal.ZERO) < 0) {
        if (amount.doubleValue() <= 0) {
            throw new IllegalArgumentException("Amount must be greater than zero");
        }

        try {
            Account account = em.createNamedQuery("Account.findByAccountNo", Account.class)
                    .setParameter("accountNo", accountNo)
                    .getSingleResult();

            account.setBalance(account.getBalance().add(amount));

            em.merge(account);

        } catch (NoResultException e) {
            throw new EJBException("Account not found: " + accountNo, e);
        }

    }

    @Override
    @TransactionAttribute(TransactionAttributeType.MANDATORY)
    public void debitToAccount(String accountNo, BigDecimal amount) throws InsufficientFundException {

        if (amount.doubleValue() <= 0) {
            throw new IllegalArgumentException("Amount must be greater than zero");
        }

        try {
            Account account = em.createNamedQuery("Account.findByAccountNo", Account.class)
                    .setParameter("accountNo", accountNo)
                    .getSingleResult();

            if (account.getBalance().subtract(amount).compareTo(BigDecimal.ZERO) <= 0) {
                throw new InsufficientFundException(accountNo, amount, account.getBalance());
            }
            account.setBalance(account.getBalance().subtract(amount));
            em.merge(account);

        } catch (NoResultException e) {
            throw new EJBException("Account not found: " + accountNo, e);
        }
    }

    @Override
    public Account findByAccountNo(String accountNo) throws AccountNotFoundException {
        try {
            return em.createNamedQuery("Account.findByAccountNo", Account.class).setParameter("accountNo", accountNo).getSingleResult();
        } catch (NoResultException nre) {
            throw new AccountNotFoundException(accountNo);
        }
    }

    @Override
    public List<Account> findAccountsByUserEmail(String email){
        return em.createNamedQuery("Account.findByUserEmail", Account.class)
                .setParameter("email", email).getResultList();
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Account createAccount(String email, AccountType type, BigDecimal openingBalance) {
        User user = loginService.findByEmail(email);
        if (user == null) {
            throw new EJBException("Cannot Open account , No such User: " + email);
        }

        Account account = new Account();
        account.setAccountType(type);
        account.setAccNo(generateAccountNumber(AccountType.SAVINGS));
        account.setBalance(openingBalance);
        account.setUser(user);
        em.persist(account);
        return account;
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    public String generateAccountNumber(AccountType type) {

        int branchCode = ThreadLocalRandom.current().nextInt(1, 9999);
        int typeCode = (type == AccountType.CURRENT) ? 2 : 1;
        long serial = System.currentTimeMillis() % 100_000_000L;

        return String.format("%03d%d%08d", branchCode, typeCode, serial);
    }
}

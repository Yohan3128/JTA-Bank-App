package com.hnys.bank.ejb;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.ejb.remote.RegisterService;
import com.hnys.bank.entity.AccountType;
import com.hnys.bank.entity.User;
import com.hnys.bank.exception.DuplicateEmailException;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.math.BigDecimal;
import java.rmi.RemoteException;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class RegisterServiceBean implements RegisterService {

    @PersistenceContext(unitName = "BANK-PU")
    private EntityManager em;

    @EJB
    private AccountService accountService;

    @Override
    public void registerUser(String name, String email, String password, BigDecimal openingBalance) throws DuplicateEmailException {
        long existing = em.createNamedQuery("User.findByEmail", User.class)
                .setParameter("email", email)
                .getResultList()
                .size();
        if (existing > 0) {
            throw new DuplicateEmailException(email);
        }

        User user = new User(name, email, password);
        em.persist(user);
        em.flush();

        accountService.createAccount(email, AccountType.SAVINGS, openingBalance);
    }
}

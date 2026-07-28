package com.hnys.bank.ejb;

import com.hnys.bank.ejb.remote.TransactionLogService;
import com.hnys.bank.entity.Transaction;
import com.hnys.bank.entity.TransactionType;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.math.BigDecimal;
import java.util.List;

@Stateless
public class TransactionLogServiceBean implements TransactionLogService {

    @PersistenceContext(unitName = "BANK-PU")
    private EntityManager em;

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
    public void log(String accountNo, TransactionType type, BigDecimal amount, BigDecimal balanceAfter, String relatedAccountNo) {

        Transaction transaction = new Transaction(accountNo, type,amount,balanceAfter, relatedAccountNo);
        em.persist(transaction);

    }

    @Override
    public List<Transaction> history(String accountNo) {
        return em.createNamedQuery("Transaction.findByAccountNo", Transaction.class).setParameter("accountNo", accountNo).getResultList();
    }
}

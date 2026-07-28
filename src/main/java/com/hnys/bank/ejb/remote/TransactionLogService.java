package com.hnys.bank.ejb.remote;

import com.hnys.bank.entity.Transaction;
import com.hnys.bank.entity.TransactionType;
import jakarta.ejb.Local;

import java.math.BigDecimal;
import java.util.List;

@Local
public interface TransactionLogService {
    void log(String accountNo, TransactionType type, BigDecimal amount, BigDecimal balanceAfter, String relatedAccountNo);
    List<Transaction> history(String accountNo);
}

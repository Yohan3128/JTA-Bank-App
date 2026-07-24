package com.hnys.bank.ejb.remote;

import com.hnys.bank.entity.Account;
import com.hnys.bank.entity.AccountType;
import com.hnys.bank.exception.AccountNotFoundException;
import com.hnys.bank.exception.InsufficientFundException;
import jakarta.ejb.Local;

import java.math.BigDecimal;
import java.util.List;

@Local
public interface AccountService {
    void creditToAccount(String accountNo, BigDecimal amount);

    void debitToAccount(String accountNo, BigDecimal amount) throws InsufficientFundException;

    Account findByAccountNo(String accountNo) throws AccountNotFoundException;

    List<Account> findAccountsByUserEmail(String email) throws AccountNotFoundException;

    Account createAccount(String email, AccountType type, BigDecimal openingBalance);

    String generateAccountNumber(AccountType type);
}

package com.hnys.bank.ejb.remote;

import com.hnys.bank.exception.AccountNotFoundException;
import com.hnys.bank.exception.InsufficientFundException;
import jakarta.ejb.Local;

import java.math.BigDecimal;

@Local
public interface WithdrawService {
    void withdraw(String accountNo,BigDecimal amount) throws InsufficientFundException, AccountNotFoundException;
}

package com.hnys.bank.ejb.remote;

import com.hnys.bank.exception.AccountNotFoundException;
import com.hnys.bank.exception.InsufficientFundException;
import jakarta.ejb.Local;

import java.math.BigDecimal;

@Local
public interface TransferService {
    void transferAmount(String sourceAccountNo, String destinationAccountNo, BigDecimal amount)
            throws InsufficientFundException, AccountNotFoundException;
}

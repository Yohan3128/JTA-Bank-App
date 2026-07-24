package com.hnys.bank.exception;

import jakarta.ejb.ApplicationException;

import java.math.BigDecimal;

@ApplicationException(rollback = true)
public class InsufficientFundException extends Exception {
    public InsufficientFundException(String accountNo, BigDecimal requested, BigDecimal available) {
        super("Insufficient fund in account " + accountNo + ": " + requested + " but only " + available);

    }
}

package com.hnys.bank.ejb.remote;

import jakarta.ejb.Local;
import com.hnys.bank.exception.AccountNotFoundException;

import java.math.BigDecimal;

@Local
public interface DepositService {
    void deposit(String accountNo, BigDecimal amount) throws AccountNotFoundException;
}

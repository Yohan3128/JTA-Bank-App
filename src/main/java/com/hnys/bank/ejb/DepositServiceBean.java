package com.hnys.bank.ejb;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.ejb.remote.DepositService;
import com.hnys.bank.ejb.remote.TransactionLogService;
import com.hnys.bank.entity.Account;
import com.hnys.bank.entity.TransactionType;
import com.hnys.bank.exception.AccountNotFoundException;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;

import java.math.BigDecimal;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class DepositServiceBean implements DepositService {
    @EJB
    private AccountService accountService;

    @EJB
    private TransactionLogService transactionLogService;

    @Override
    public void deposit(String accountNo, BigDecimal amount) throws AccountNotFoundException {
        accountService.creditToAccount(accountNo, amount);

        Account account = accountService.findByAccountNo(accountNo);
        transactionLogService.log(accountNo, TransactionType.DEPOSIT,amount,account.getBalance(),null);
    }
}

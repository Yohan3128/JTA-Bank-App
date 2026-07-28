package com.hnys.bank.ejb;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.ejb.remote.TransactionLogService;
import com.hnys.bank.ejb.remote.WithdrawService;
import com.hnys.bank.entity.Account;
import com.hnys.bank.entity.TransactionType;
import com.hnys.bank.exception.AccountNotFoundException;
import com.hnys.bank.exception.InsufficientFundException;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;

import java.math.BigDecimal;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class WithdrawServiceBean implements WithdrawService {

    @EJB
    private AccountService accountService;

    @EJB
    private TransactionLogService transactionLogService;

    @Override
    public void withdraw(String accountNo, BigDecimal amount) throws InsufficientFundException, AccountNotFoundException {
        accountService.debitToAccount(accountNo, amount);
        Account account = accountService.findByAccountNo(accountNo);
        transactionLogService.log(accountNo, TransactionType.WITHDRAWAL,amount,account.getBalance(),null);
    }
}

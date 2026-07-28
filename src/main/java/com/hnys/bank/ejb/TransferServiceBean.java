package com.hnys.bank.ejb;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.ejb.remote.TransactionLogService;
import com.hnys.bank.ejb.remote.TransferService;
import com.hnys.bank.entity.Account;
import com.hnys.bank.entity.TransactionType;
import com.hnys.bank.exception.AccountNotFoundException;
import com.hnys.bank.exception.InsufficientFundException;
import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionManagement;
import jakarta.ejb.TransactionManagementType;
import jakarta.transaction.*;

import java.math.BigDecimal;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class TransferServiceBean implements TransferService {

    @Resource
    private UserTransaction userTransaction;

    @EJB
    private AccountService accountService;

    @EJB
    private TransactionLogService transactionLogService;

    @Override
    public void transferAmount(String sourceAccountNo, String destinationAccountNo, BigDecimal amount) throws InsufficientFundException, AccountNotFoundException {

        if (amount.compareTo(BigDecimal.ZERO) < 0) {
            throw new IllegalArgumentException("Amount cannot be negative");
        }

        if (sourceAccountNo.equals(destinationAccountNo)) {
            throw new IllegalArgumentException("Source and Destination accounts cannot be the same");
        }

        accountService.findByAccountNo(sourceAccountNo);
        accountService.findByAccountNo(destinationAccountNo);

        try {
            userTransaction.begin();
            try {
                accountService.debitToAccount(sourceAccountNo, amount);
                accountService.creditToAccount(destinationAccountNo, amount);
                userTransaction.commit();
            } catch (InsufficientFundException | RuntimeException e) {
                safeRollBack();
                throw e;
            }
        }catch (NotSupportedException | SystemException e){
            throw new RuntimeException("Unable to Start transaction for after transfer",e);
        }catch (RollbackException| HeuristicMixedException|HeuristicRollbackException e){
            throw new RuntimeException("Transfer Commit Failed!",e);
        }

        Account source = accountService.findByAccountNo(sourceAccountNo);
        Account destination = accountService.findByAccountNo(destinationAccountNo);

        transactionLogService.log(sourceAccountNo, TransactionType.DEBITED,amount,source.getBalance(),destinationAccountNo);
        transactionLogService.log(destinationAccountNo, TransactionType.CREDITED,amount,destination.getBalance(),sourceAccountNo);
    }

    private void safeRollBack() {
        try {
            userTransaction.rollback();
        } catch (SystemException e) {
            throw new RuntimeException("Rollback failed after transfer error" , e);
        }
    }
}

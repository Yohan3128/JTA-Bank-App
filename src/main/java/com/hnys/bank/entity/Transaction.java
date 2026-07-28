package com.hnys.bank.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "transactions")
@NamedQueries({
        @NamedQuery(name="Transaction.findByAccountNo",query = "SELECT  t from Transaction t WHERE t.accountNo=:accountNo ORDER BY t.timestamp DESC ")
})
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String accountNo;

    private String relatedAccountNo;

    @Enumerated(EnumType.STRING)
    private TransactionType type;

    private BigDecimal amount;

    private BigDecimal balanceAfter;

    private LocalDateTime timestamp;

    public Transaction() {
    }

    public Transaction(String accountNo, TransactionType type, BigDecimal amount, BigDecimal balanceAfter, String relatedAccountNo) {
        this.accountNo = accountNo;
        this.type = type;
        this.amount = amount;
        this.balanceAfter = balanceAfter;
        this.relatedAccountNo = relatedAccountNo;
        this.timestamp = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getRelatedAccountNo() {
        return relatedAccountNo;
    }

    public void setRelatedAccountNo(String relatedAccountNo) {
        this.relatedAccountNo = relatedAccountNo;
    }

    public TransactionType getType() {
        return type;
    }

    public void setType(TransactionType type) {
        this.type = type;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getBalanceAfter() {
        return balanceAfter;
    }

    public void setBalanceAfter(BigDecimal balanceAfter) {
        this.balanceAfter = balanceAfter;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }
}

package com.hnys.bank.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "accounts")
@NamedQueries({
        @NamedQuery(name = "Account.findByAccountNo", query = "SELECT a FROM Account a WHERE a.accNo=:accountNo"),
        @NamedQuery(name = "Account.findByUserEmail", query = "SELECT a FROM Account a WHERE a.user.email=:email ORDER BY a.id")
})
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(unique = true, nullable = false)
    private String accNo;

    private BigDecimal balance;

    private LocalDateTime openDate;

    @Enumerated(EnumType.STRING)
    private AccountType accountType;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Account() {
    }

    public Account(String accNo, BigDecimal balance, AccountType accountType, User user) {
        this.accNo = accNo;
        this.balance = balance;
        this.accountType = accountType;
        this.user = user;
        this.openDate = LocalDateTime.now();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccNo() {
        return accNo;
    }

    public void setAccNo(String accNo) {
        this.accNo = accNo;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public LocalDateTime getOpenDate() {
        return openDate;
    }

    public void setOpenDate(LocalDateTime openDate) {
        this.openDate = openDate;
    }

    public AccountType getAccountType() {
        return accountType;
    }

    public void setAccountType(AccountType accountType) {
        this.accountType = accountType;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

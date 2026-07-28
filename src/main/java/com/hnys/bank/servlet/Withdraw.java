package com.hnys.bank.servlet;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.ejb.remote.WithdrawService;
import com.hnys.bank.entity.Account;
import com.hnys.bank.exception.AccountNotFoundException;
import com.hnys.bank.exception.InsufficientFundException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/withdraw")
public class Withdraw extends HttpServlet {

    @EJB
    private AccountService accountService;

    @EJB
    private WithdrawService withdrawService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getSession().getAttribute("user").toString();
        List<Account> accounts = accountService.findAccountsByUserEmail(email);
        req.setAttribute("accounts", accounts);
        req.getRequestDispatcher("withdraw.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountNo = req.getParameter("accountNo");
        BigDecimal amount = new BigDecimal(req.getParameter("amount"));

        try{
            withdrawService.withdraw(accountNo,amount);
            resp.sendRedirect(req.getContextPath()+"/dashboard");
        }catch(InsufficientFundException | AccountNotFoundException e){
            req.setAttribute("error",e.getMessage());
            req.getRequestDispatcher("withdraw.jsp").forward(req,resp);
        }

    }
}

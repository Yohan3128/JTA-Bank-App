package com.hnys.bank.servlet;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.entity.Account;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/deposit")
public class Deposit extends HttpServlet {

    @EJB
    private AccountService accountService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getSession().getAttribute("user").toString();
        List<Account> accounts = accountService.findAccountsByUserEmail(email);
        req.setAttribute("accounts",accounts);
        req.getRequestDispatcher("deposit.jsp").forward(req,resp);
    }
}

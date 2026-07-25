package com.hnys.bank.servlet;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.exception.AccountNotFoundException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/dashboard")
public class Dashboard extends HttpServlet {

    @EJB
    private AccountService accountService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = (String) req.getSession().getAttribute("user");
        System.out.println("email:"+email);
        req.setAttribute("accounts", accountService.findAccountsByUserEmail(email));
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }
}

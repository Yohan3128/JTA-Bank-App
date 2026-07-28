package com.hnys.bank.servlet;

import com.hnys.bank.ejb.remote.AccountService;
import com.hnys.bank.ejb.remote.TransferService;
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

@WebServlet("/transfer")
public class Transfer extends HttpServlet {

    @EJB
    private AccountService accountService;

    @EJB
    private TransferService transferService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getSession().getAttribute("user").toString();
        List<Account> accounts= accountService.findAccountsByUserEmail(email);
        req.setAttribute("accounts", accounts);
        req.getRequestDispatcher("transfer.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String sourceAccountNo = req.getParameter("sourceAccountNo");
        String destinationAccountNo = req.getParameter("destinationAccountNo");
        BigDecimal amount = new BigDecimal(req.getParameter("amount"));

        try{
            transferService.transferAmount(sourceAccountNo,destinationAccountNo,amount);
            resp.sendRedirect(req.getContextPath()+"/dashboard");
        }catch (InsufficientFundException | AccountNotFoundException|IllegalArgumentException e){
            req.setAttribute("error",e.getMessage());
            req.getRequestDispatcher("transfer.jsp").forward(req,resp);
        }

    }
}

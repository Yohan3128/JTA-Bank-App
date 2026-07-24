package com.hnys.bank.servlet;

import com.hnys.bank.ejb.remote.RegisterService;
import com.hnys.bank.exception.DuplicateEmailException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.rmi.RemoteException;

@WebServlet("/register")
public class Register extends HttpServlet {

    private static final BigDecimal DEFAULT_OPENING_BALANCE  = new BigDecimal("1000.00");

    @EJB
    private RegisterService registerService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            registerService.registerUser(name, email, password,DEFAULT_OPENING_BALANCE);
            req.setAttribute("message", "Register successful");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } catch (DuplicateEmailException ex) {
            req.setAttribute("error", ex.getMessage());
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}

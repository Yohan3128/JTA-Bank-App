package com.hnys.bank.servlet;

import com.hnys.bank.ejb.remote.RegisterService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.RemoteException;

@WebServlet("/register")
public class Register extends HttpServlet {

    @EJB
    private RegisterService registerService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            registerService.registerUser(name, email, password);
            req.setAttribute("message", "Register successful");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } catch (Exception ex) {
            req.setAttribute("error", "Register Failed!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}

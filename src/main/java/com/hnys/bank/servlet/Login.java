package com.hnys.bank.servlet;

import com.hnys.bank.ejb.remote.LoginService;
import com.hnys.bank.entity.User;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {

    @EJB
    private LoginService loginService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        boolean login = loginService.login(email, password);

        if (login) {

            User user = loginService.findByEmail(email);

            HttpSession session = req.getSession();
            session.setAttribute("user", email);
            session.setAttribute("userName", user.getUsername());

            req.getRequestDispatcher(req.getContextPath()+ "/dashboard").forward(req, resp);

        }else {
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}

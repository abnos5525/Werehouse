package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "/subFactorIDDlt",urlPatterns = {"/subFactorIDDlt"})
public class SubFactorIdDelete extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("facID");
        session.removeAttribute("facNumber");
        response.sendRedirect("factor.jsp");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("facID");
        session.removeAttribute("facNumber");
        response.sendRedirect("factor.jsp");
    }
}

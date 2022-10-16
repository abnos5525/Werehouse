package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "/subFactorID",urlPatterns = {"/subFactorID"})
public class SendIdtoSubFactor extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       String facid = request.getParameter("subfID");
        String fNumber = request.getParameter("subfNumber");
        HttpSession session = request.getSession();

        session.setAttribute("facID",facid);
        session.setAttribute("facNumber",fNumber);
        response.sendRedirect("subFactor.jsp");
    }
}

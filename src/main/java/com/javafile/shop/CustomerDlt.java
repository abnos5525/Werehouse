package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/deleteCustomer",urlPatterns = {"/deleteCustomer"})
public class CustomerDlt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String buyerCode = request.getParameter("cusdlt");
            String sql = "DELETE FROM tbl_customers WHERE ccode=?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,buyerCode);
            state.execute();
            response.sendRedirect("buyers.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("buyers.jsp");
        }
    }
}

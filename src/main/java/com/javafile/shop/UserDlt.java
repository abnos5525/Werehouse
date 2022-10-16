package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/deleteuser",urlPatterns = {"/deleteuser"})
public class UserDlt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String username = request.getParameter("userdlt");
            String sql = "DELETE FROM tbl_users WHERE username=?;";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,username);
            state.execute();
            response.sendRedirect("userControl.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("userControl.jsp");
        }
    }
}

package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/deletesell",urlPatterns = {"/deletesell"})
public class SellDlt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String sellCode = request.getParameter("selldlt");
            String sql = "DELETE FROM tbl_sells WHERE sID=?;";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,sellCode);
            state.execute();
            response.sendRedirect("sell.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

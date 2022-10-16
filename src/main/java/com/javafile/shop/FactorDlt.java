package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/deleteFactor",urlPatterns = {"/deleteFactor"})
public class FactorDlt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String factorCode = request.getParameter("facdlt");
            String sql = "DELETE FROM tbl_factors WHERE fID=?;";
            String sql2 = "DELETE FROM tbl_subfactors WHERE fID=?;";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            PreparedStatement state2 = connect.prepareStatement(sql2);
            state.setString(1,factorCode);
            state2.setString(1,factorCode);
            state.execute();
            state2.execute();
            response.sendRedirect("factor.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

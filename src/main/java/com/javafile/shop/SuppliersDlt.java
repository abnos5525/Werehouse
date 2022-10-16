package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/deleteSupplier",urlPatterns = {"/deleteSupplier"})
public class SuppliersDlt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String supplierCode = request.getParameter("supdlt");
            String sql = "DELETE FROM tbl_suppliers WHERE scode=?;";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,supplierCode);
            state.execute();
            response.sendRedirect("suppliers.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

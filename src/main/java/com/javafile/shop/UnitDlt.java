package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/DeleteUnit",urlPatterns = {"/DeleteUnit"})
public class UnitDlt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String unitCode = request.getParameter("unitdlt");
            String sql = "DELETE FROM tbl_units WHERE unit_code=?;";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,unitCode);
            state.execute();
            response.sendRedirect("units.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

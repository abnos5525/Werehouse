package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/insertUnit",urlPatterns = "/insertUnit")
public class UnitIns extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String unitName = request.getParameter("units");
            System.out.println(unitName);
            String sql = "insert into tbl_units (unit_name) values (?);";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,unitName);
            if(!unitName.equals("")) {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("units.jsp");
            }else {
                response.sendRedirect("units.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

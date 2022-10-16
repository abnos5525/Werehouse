package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/editUnit",urlPatterns = {"/editUnit"})
public class UnitEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String unitName = request.getParameter("units");
            String unitCode = request.getParameter("unitsId");

            String sql = "update tbl_units set unit_name = ? where unit_code =?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,unitName);
            state.setString(2,unitCode);
            if(unitName.equals("") || unitName == null || unitCode.equals("") || unitCode == null){
                response.sendRedirect("units.jsp");
            }else {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("units.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("units.jsp");
            e.printStackTrace();
        }
    }
}

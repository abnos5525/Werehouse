package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/factorUpd",urlPatterns = {"/factorUpd"})
public class FactorEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String supplierCode = request.getParameter("supName");
            String factorCode = request.getParameter("fid");
            String factorDate = request.getParameter("facdate");
            String factorOff = request.getParameter("facOff");
            String factorAll = request.getParameter("facAll");

            String sql = "update tbl_factors set scode = ?, fdate= ?, foff=?, fsum=? where fID =?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,supplierCode);
            state.setString(2,factorDate);
            state.setString(3,factorOff);
            state.setString(4,factorAll);
            state.setString(5,factorCode);
            if(supplierCode.equals("") || supplierCode == null || factorOff.equals("") || factorOff == null
            || factorAll.equals("") || factorAll == null){
                response.sendRedirect("err_factor.jsp");
            }else {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("factor.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("factor.jsp");
            e.printStackTrace();
        }
    }
}

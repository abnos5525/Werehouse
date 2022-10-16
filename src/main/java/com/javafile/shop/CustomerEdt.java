package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/customersUpd",urlPatterns = {"/customersUpd"})
public class CustomerEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String buyerName = request.getParameter("Cunamee");
            String buyerPhone = request.getParameter("Cuphonee");
            String buyerAddress = request.getParameter("Cuaddress");
            String buyerCode = request.getParameter("Cucode");

            String sql = "update tbl_customers set cflname = ?, caddress= ?, cphone= ? where ccode =?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,buyerName);
            state.setString(2,buyerAddress);
            state.setString(3,buyerPhone);
            state.setString(4,buyerCode);
            if(buyerName.equals("") || buyerName == null || buyerPhone.equals("") || buyerPhone == null
            || buyerAddress.equals("") || buyerAddress == null){
                response.sendRedirect("buyers.jsp");
            }else {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("buyers.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("buyers.jsp");
            e.printStackTrace();
        }
    }
}

package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/customersIns",urlPatterns = {"/customersIns"})
public class CustomerInsert extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String cnamee = request.getParameter("Cuname");
        String caddress = request.getParameter("Cuaddress");
        String cphone = request.getParameter("Cuphone");
        try {
            if(!cnamee.equals("") || !caddress.equals("") || !cphone.equals("")) {
                Class.forName("com.mysql.jdbc.Driver");
                String sql = "insert into tbl_customers (cflname,caddress,cphone) values (?,?,?)";
                Connection connect = new SqlConnection().connect();
                PreparedStatement state = connect.prepareStatement(sql);
                state.setString(1, cnamee);
                state.setString(2, caddress);
                state.setString(3, cphone);
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("buyers.jsp");
            }else {
                response.sendRedirect("err_buyer.jsp");
            }

        }catch (Exception e){
            System.out.println(e);
            response.sendRedirect("buyers.jsp");
        }
    }
}
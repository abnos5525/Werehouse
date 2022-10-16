package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "/productsInsert",urlPatterns = {"/productsInsert"})
public class ProductInsert extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pnamee = request.getParameter("Pname");
        String Punite = request.getParameter("punit");
        try {

                System.out.println("111");
                Class.forName("com.mysql.jdbc.Driver");
                String sql = "insert into tbl_products (punitcode,pname) values (?,?)";
                Connection connect = new SqlConnection().connect();
                PreparedStatement state = connect.prepareStatement(sql);
                state.setInt(1, Integer.parseInt(Punite));
                state.setString(2, pnamee);
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("products.jsp");


        }catch (Exception e){
            System.out.println(e);
            response.sendRedirect("products.jsp");
        }
    }
}
package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/productsUpdate",urlPatterns = {"/productsUpdate"})
public class ProductEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String prodName = request.getParameter("PNamee");
            String unitName = request.getParameter("unitname");
            String prodCode = request.getParameter("pCodee");

            String sql = "update tbl_products set pname = ? , punitcode = ? where pcode = ?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,prodName);
            state.setString(2, unitName);
            state.setString(3, prodCode);
            if(prodName.equals("")){
                response.sendRedirect("products.jsp");
            }else {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("products.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("products.jsp");
            e.printStackTrace();
        }
    }
}

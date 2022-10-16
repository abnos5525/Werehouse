package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/deletesubFactor",urlPatterns = {"/deletesubFactor"})
public class SubFactorDelete extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String SubFacCode = request.getParameter("subfacdlt");
            String sql = "DELETE FROM tbl_subfactors WHERE ID=?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,SubFacCode);
            state.execute();
            response.sendRedirect("subFactor.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("subFactor.jsp");
        }
    }
}

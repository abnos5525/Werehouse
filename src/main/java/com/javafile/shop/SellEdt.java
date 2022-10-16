package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/sellUpd",urlPatterns = {"/sellUpd"})
public class SellEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String ID = request.getParameter("id");
            String Pname = request.getParameter("pName");
            String Cname = request.getParameter("cName");
            String Amount = request.getParameter("Number");
            String Sprice = request.getParameter("sNumber");
            String Sall = request.getParameter("sAll");

            String sql = "update tbl_sells set pcode = ?, ccode= ?, samount=?, sprice=?,sall=? where sID =?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setInt(1, Integer.parseInt(Pname));
            state.setInt(2, Integer.parseInt(Cname));
            state.setInt(3, Integer.parseInt(Amount));
            state.setInt(4, Integer.parseInt(Sprice));
            state.setInt(5, Integer.parseInt(Sall));
            state.setInt(6, Integer.parseInt(ID));
            if(Amount.equals("") || Amount == null || Sprice.equals("") || Sprice == null
            || Sall.equals("") || Sall == null){
                response.sendRedirect("err_sell.jsp");
            }else {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("sell.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("sell.jsp");
            e.printStackTrace();
        }
    }
}

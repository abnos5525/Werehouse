package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/userUpd",urlPatterns = {"/userUpd"})
public class UserEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String Name = request.getParameter("namee");
            String username = request.getParameter("usernamee");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            String type = request.getParameter("userType");
            String permission = request.getParameter("userPermission");

            System.out.println(username);

            String sql = "update tbl_users set flname = ?, password= ?, phone=?, mail=?,user_type=?,user_permission=? where username =?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,Name);
            state.setString(2,password);
            state.setString(3,phone);
            state.setString(4,email);
            state.setString(5,type);
            state.setString(6,permission);
            state.setString(7,username);
            if(Name.equals("") || Name == null || password.equals("") || password == null
            || phone.equals("") || phone == null || email.equals("") || email == null){
                response.sendRedirect("userControl.jsp");
            }else {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("userControl.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("userControl.jsp");
            e.printStackTrace();
        }
    }
}

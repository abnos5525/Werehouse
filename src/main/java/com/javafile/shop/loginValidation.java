package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

@WebServlet(name = "/login_valid", urlPatterns = "/login_valid")
public class loginValidation extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String user = request.getParameter("username");
        String pass = request.getParameter("pass");
        try {
            if(valid(user,pass) == 1){
                session.setAttribute("user_login",user);
                session.setAttribute("pass_login",pass);
                response.sendRedirect("home_member.jsp");
            }else if(valid(user,pass) == 2){
                session.setAttribute("user_login",user);
                session.setAttribute("pass_login",pass);
                response.sendRedirect("home_admin.jsp");
            }else if(valid(user,pass) == 3){
                response.sendRedirect("err_userPermission.jsp");
            }
            else {
                response.sendRedirect("err_login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int valid(String user, String pass) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String sql = "select * from tbl_users where username=? and password=? and user_type=? and user_permission=?";

        Connection connect = new SqlConnection().connect();

        PreparedStatement state = connect.prepareStatement(sql);
        PreparedStatement state2 = connect.prepareStatement(sql);
        PreparedStatement state3 = connect.prepareStatement(sql);
        PreparedStatement state4 = connect.prepareStatement(sql);

        state.setString(1,user);
        state.setString(2,pass);
        state.setString(3,"member");
        state.setString(4,"yes");

        state2.setString(1,user);
        state2.setString(2,pass);
        state2.setString(3,"admin");
        state2.setString(4,"yes");

        state3.setString(1,user);
        state3.setString(2,pass);
        state3.setString(3,"admin");
        state3.setString(4,"no");

        state4.setString(1,user);
        state4.setString(2,pass);
        state4.setString(3,"member");
        state4.setString(4,"no");

        ResultSet rs = state.executeQuery();
        ResultSet rs2 = state2.executeQuery();
        ResultSet rs3 = state3.executeQuery();
        ResultSet rs4 = state4.executeQuery();

        if(rs.next()){
            return 1;
        }else if(rs2.next()) {
            return 2;
        }else if(rs3.next() || rs4.next()){
            return 3;
        }
        else {
            return 4;
        }
    }
}

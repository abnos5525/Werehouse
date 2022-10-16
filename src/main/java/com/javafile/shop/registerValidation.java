package com.javafile.shop;

import java.io.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "/register_valid",urlPatterns = {"/register_valid"})
public class registerValidation extends HttpServlet {
    private int flag = 0;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String user = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String pass2 = request.getParameter("pass2");

        try {
            if(Valid(name,user,phone,pass,pass2)){
                Class.forName("com.mysql.jdbc.Driver");
                String sql = "insert into tbl_users values (?,?,?,?,?,?,?)";
                Connection connect = new SqlConnection().connect();
                PreparedStatement state = connect.prepareStatement(sql);
                state.setString(1,user);
                state.setString(2,pass);
                state.setString(3,name);
                state.setString(4,"member");
                state.setString(5,"yes");
                state.setString(6,phone);
                state.setString(7,email);
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("index.jsp");
            }else {
                if(flag == 1)
                    response.sendRedirect("err_name.jsp");
                else if(flag == 2)
                    response.sendRedirect("err_name2.jsp");
                else if(flag == 3)
                    response.sendRedirect("err_pass.jsp");
                else if(flag == 4)
                    response.sendRedirect("err_pass2.jsp");
                else if(flag == 5)
                    response.sendRedirect("err_user.jsp");
                else if(flag == 6)
                    response.sendRedirect("err_phone.jsp");
            }

        }catch (Exception e){
            System.out.println(e);
            response.sendRedirect("register.jsp.jsp");
        }
    }

    public Boolean Valid(String name,String user,String phone,String pass,String pass2) throws ClassNotFoundException, SQLException {
        String[] st = {"/","*","-",",","?",">","<",".","!","`","~","@","#","$","%","^","&","(",
                ")","_","=","+", "'", "\"","\\"};

        String[] st2 = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t",
                "u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L",
                "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};

        String[] st3 = {"A","B","C","D","E","F","G","H","I","J","K","L",
                "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};

        String[] num = {"0","1","2","3","4","5","6","7","8","9"};


            //-------------------------------------------------------
            for (String a : num) {
                for (String b : st) {
                    if (name.contains(a) || name.contains(b)) {
                        flag = 1;
                        return false;  //no number and symbol for name
                    }
                }
            }

            //-------------------------------------------------------
            for (String a : st2) {
                if (name.contains(a)) {
                    flag = 2;
                    return false;     //persian name
                }
            }
            //-------------------------------------------------------
                if (pass.length() < 8) {
                    flag = 3;
                    return false;      //8 char password
                }
            //-------------------------------------------------------
            if(!pass.equals(pass2)){
                flag = 4;
                return false;
            }
            //-------------------------------------------------------
             for (String a : st2) {
                 for (String b : st) {
                     if (phone.length() != 11 || phone.contains(a) || phone.contains(b)) {
                         flag = 6;
                         return false;
                     }
                 }
             }
            //-------------------------------------------------------
        Class.forName("com.mysql.jdbc.Driver");
            String sql = "select * from tbl_users where username=?";
        Connection connect = new SqlConnection().connect();
        PreparedStatement state = connect.prepareStatement(sql);
        state.setString(1,user);
        ResultSet rs = state.executeQuery();
            if(rs.next()) {
                flag = 5;
                state.close();
                connect.close();
                return false;
            }
        state.close();
        connect.close();
        return true;
    }
}
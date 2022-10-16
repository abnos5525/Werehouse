package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/factorIns",urlPatterns = {"/factorIns"})
public class FactorInsert extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String supname = request.getParameter("supName");
        String buyname = (String) session.getAttribute("user_login");
        String fdate = request.getParameter("fdate");
        String fnumber = request.getParameter("facNum");
        String foff = request.getParameter("facOff");
        String fall = request.getParameter("facAll");
        try {
                Class.forName("com.mysql.jdbc.Driver");
                String sql = "insert into tbl_factors (scode,fbuyer,fnumber,fdate,foff,fsum) values (?,?,?,?,?,?)";
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
                state.setString(1,supname);
                state.setString(2,buyname);
                state.setString(3,fnumber);
                state.setString(4,fdate);
                state.setString(5,foff);
                state.setString(6,fall);
            if(supname.equals("") || supname == null || fdate.equals("") || fdate == null
                    || fnumber.equals("") || fnumber == null || foff.equals("") || foff == null
            || fall.equals("") || fall == null) {
                response.sendRedirect("err_factor.jsp");
            }else{
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("factor.jsp");
            }
        }catch (Exception e){
            System.out.println(e);
            response.sendRedirect("factor.jsp");
        }
    }
}
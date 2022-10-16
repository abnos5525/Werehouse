package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/subfactorIns",urlPatterns = {"/subfactorIns"})
public class SubFactorInsert extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String fid = request.getParameter("fID");
        String pCode = request.getParameter("pName");
        String subPNumber = request.getParameter("subPnumber");
        String subfeNumber = request.getParameter("feNumber");
        String subfAll = request.getParameter("subfacAll");
        try {
                Class.forName("com.mysql.jdbc.Driver");
                String sql = "insert into tbl_subfactors (fID,pcode,famount,ffe,fsum) values (?,?,?,?,?)";
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
                state.setInt(1, Integer.parseInt(fid));
                state.setInt(2, Integer.parseInt(pCode));
                state.setInt(3, Integer.parseInt(subPNumber));
                state.setInt(4, Integer.parseInt(subfeNumber));
                state.setInt(5, Integer.parseInt(subfAll));
            if(subPNumber.equals("") || subPNumber == null
                    || subfeNumber.equals("") || subfeNumber == null || subfAll.equals("") || subfAll == null) {
                response.sendRedirect("err_subfactor.jsp");
            }else{
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("subFactor.jsp");
            }
        }catch (Exception e){
            System.out.println(e);
            response.sendRedirect("subFactor.jsp");
        }
    }
}
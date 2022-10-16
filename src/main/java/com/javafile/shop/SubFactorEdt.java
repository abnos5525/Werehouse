package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/subfactorUpd",urlPatterns = {"/subfactorUpd"})
public class SubFactorEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String id = request.getParameter("ID");
            String fId = request.getParameter("fID");
            String pCode = request.getParameter("pName");
            String subAmount = request.getParameter("subPnumber");
            String subFe = request.getParameter("feNumber");
            String subAll = request.getParameter("subfacAll");

            String sql = "update tbl_subfactors set fID = ?, pcode= ?, famount=?, ffe=?, fsum=? where ID =?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setInt(1, Integer.parseInt(fId));
            state.setInt(2, Integer.parseInt(pCode));
            state.setInt(3, Integer.parseInt(subAmount));
            state.setInt(4, Integer.parseInt(subFe));
            state.setInt(5, Integer.parseInt(subAll));
            state.setInt(6, Integer.parseInt(id));
            if(subAmount.equals("") || subAmount == null || subFe.equals("") || subFe == null
            || subAll.equals("") || subAll == null){
                response.sendRedirect("err_subfactor.jsp");
            }else {
                state.execute();
                state.close();
                connect.close();
                response.sendRedirect("subFactor.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("subFactor.jsp");
            e.printStackTrace();
        }
    }
}

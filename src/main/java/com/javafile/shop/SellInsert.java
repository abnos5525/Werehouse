package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "/sellIns",urlPatterns = {"/sellIns"})
public class SellInsert extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String pname = request.getParameter("pName");
        String cname = request.getParameter("cName");
        String amount = request.getParameter("Number");
        String snumber = request.getParameter("sNumber");
        String sall = request.getParameter("sAll");
        try {
                Class.forName("com.mysql.jdbc.Driver");
                String sql = "insert into tbl_sells (pcode,ccode,samount,sprice,sall) values (?,?,?,?,?)";
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
                state.setString(1,pname);
                state.setString(2,cname);
                state.setString(3,amount);
                state.setString(4,snumber);
                state.setString(5,sall);
            if(amount.equals("") || amount == null || snumber.equals("") || snumber == null
                    || sall.equals("") || sall == null) {
                response.sendRedirect("err_sell.jsp");
            }else{
                if(Amountt(Integer.parseInt(amount),pname)) {
                    state.execute();
                    state.close();
                    connect.close();
                    response.sendRedirect("sell.jsp");
                }else {
                    response.sendRedirect("err_amountSell.jsp");
                }
            }
        }catch (Exception e){
            System.out.println(e);
            response.sendRedirect("sell.jsp");
        }
    }

    public boolean Amountt(int amo,String prod) throws ClassNotFoundException, SQLException {

            Class.forName("com.mysql.jdbc.Driver");
            String sql = "SELECT tbl_products.pname,tbl_products.pcode,\n" +
                    "                (SELECT SUM(famount) FROM tbl_subfactors WHERE tbl_subfactors.pcode=tbl_products.pcode) as kh,\n" +
                    "                (SELECT SUM(samount) FROM tbl_sells WHERE tbl_sells.pcode=tbl_products.pcode) as fo\n" +
                    "                FROM tbl_products\n" +
                    "                INNER JOIN tbl_subfactors ON tbl_subfactors.pcode=tbl_products.pcode\n" +
                    "                GROUP BY pname;";
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            ResultSet rs = state.executeQuery();
            while(rs.next()) {
                int buy = rs.getInt("kh");
                int sell = rs.getInt("fo");
                String product = rs.getString("pcode");
                if (buy - sell > amo) {
                    if(product.equals(prod)) {
                        return true;
                    }else{
                        continue;
                    }
                } else {
                    if(product.equals(prod)){
                        return false;
                    }else {
                        continue;
                    }

                }
            }
            return false;
        }
    }
package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

@WebServlet(name = "/suppliersIns",urlPatterns = {"/suppliersIns"})
public class SuppliersInsert extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sname = request.getParameter("Sname");
        String sphone =request.getParameter("Sphone");
        String ncode =request.getParameter("Ncode");
        String saddress = request.getParameter("Saddress");
        try {
            if(!sname.equals("") || !sphone.equals("") || !ncode.equals("") || !saddress.equals("")) {
                if (code(ncode)) {
                    Class.forName("com.mysql.jdbc.Driver");
                    String sql = "insert into tbl_suppliers (sname,saddress,sphone,ncode) values (?,?,?,?)";
                    Connection connect = new SqlConnection().connect();
                    PreparedStatement state = connect.prepareStatement(sql);
                    state.setString(1, sname);
                    state.setString(2, saddress);
                    state.setString(3, sphone);
                    state.setString(4, ncode);
                    state.execute();
                    state.close();
                    connect.close();
                    response.sendRedirect("suppliers.jsp");
                } else {
                    response.sendRedirect("err_ncode.jsp");
                }
            }else {
                response.sendRedirect("err_supplier.jsp");
            }

        }catch (Exception e){
            System.out.println(e);
            response.sendRedirect("suppliers.jsp");
        }
    }

    public boolean code(String idcode){

        if (idcode.length() != 10)
            return false;

        long nationalCode = Long.parseLong(idcode);
        byte[] arrayNationalCode = new byte[10];

        //extract digits from number
        for (int i = 0; i < 10 ; i++) {
            arrayNationalCode[i] = (byte) (nationalCode % 10);
            nationalCode = nationalCode / 10;
        }

        //Checking the control digit
        int sum = 0;
        for (int i = 9; i > 0 ; i--)
            sum += arrayNationalCode[i] * (i+1);
        int temp = sum % 11;
        if (temp < 2)
            return arrayNationalCode[0] == temp;
        else
            return arrayNationalCode[0] == 11 - temp;

    }
}
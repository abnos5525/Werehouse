package com.javafile.shop;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "/suppliersUpd",urlPatterns = {"/suppliersUpd"})
public class SupplierEdt extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String supplierName = request.getParameter("Snamee");
            String supplierPhone = request.getParameter("Sphonee");
            String supplierAddress = request.getParameter("Saddress");
            String supplierNcode = request.getParameter("Ncode");
            String supplierCode = request.getParameter("Scode");

            String sql = "update tbl_suppliers set sname = ?, sphone= ?, saddress= ?, ncode=? where scode =?";
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = new SqlConnection().connect();
            PreparedStatement state = connect.prepareStatement(sql);
            state.setString(1,supplierName);
            state.setString(2,supplierPhone);
            state.setString(3,supplierAddress);
            state.setString(4,supplierNcode);
            state.setString(5,supplierCode);
            if(supplierName.equals("") || supplierName == null || supplierPhone.equals("") || supplierPhone == null
            || supplierAddress.equals("") || supplierAddress == null || supplierNcode.equals("") || supplierNcode == null){
                response.sendRedirect("suppliers.jsp");
            }else {
                if(code(supplierNcode)) {
                    state.execute();
                    state.close();
                    connect.close();
                    response.sendRedirect("suppliers.jsp");
                }else{
                    state.close();
                    connect.close();
                    response.sendRedirect("err_ncode.jsp");
                }
            }
        } catch (Exception e) {
            response.sendRedirect("suppliers.jsp");
            e.printStackTrace();
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

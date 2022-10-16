<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="fa">
<head>
    <title>انبار</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/admin_menu.css">

    <style>
        @media print and (width: 21cm) and (height: 29.7cm) {
            @page {
                margin: 3cm;
            }
        }

        /* style sheet for "letter" printing */
        @media print and (width: 11.5in) and (height: 11in) {
            @page {
                margin: 1in;
            }
        }

        /* A4 Landscape*/
        @page {
            size: A4 landscape;
            margin: 10%;
        }
    </style>

</head>
<body>
<%@ include file = "Loginaccess.jsp" %>
<%@ include file = "setDatabase.jsp" %>

<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');top: 1px;">
        <div style="width: 1000px;" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>

                <input onclick="Printfun('ddd')" style="border-radius: 14%;float: left;position: relative;font-size: 17px;padding: 1px;bottom: 24px;width: 68px;" type="submit" value="چاپ">


            <sql:query var="q" dataSource="${sd}">
                SELECT tbl_products.pname,tbl_products.pcode,
                (SELECT SUM(famount) FROM tbl_subfactors WHERE tbl_subfactors.pcode=tbl_products.pcode) as kh,
                (SELECT SUM(samount) FROM tbl_sells WHERE tbl_sells.pcode=tbl_products.pcode) as fo
                FROM tbl_products
                INNER JOIN tbl_subfactors ON tbl_subfactors.pcode=tbl_products.pcode
                GROUP BY pname;
            </sql:query>

            <div style="float:right;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: -53px;" id="ddd">
                <p style="color: white;text-align: center;font-size: 30px;">بسمه تعالی</p>
                <p style="color: white;text-align: center;font-size: 15px;">گزارش موجودی انبار</p>
                <hr style="background-color: white">

                <label style="left: 71px;margin-right: 116px;float: right;color: white;font-size: 20px;position: relative;">نام محصول</label>
                <label style="margin-right: 0;right: 0;float: right;color: white">|</label>
                <label style="left: 69px;margin-right: 153px;float: right;color: white;font-size: 20px;position: relative;">مقدار خرید</label>
                <label style="margin-right: 0;right: 0;float: right;color: white">|</label>
                <label style="left: 69px;margin-right: 117px;float: right;color: white;font-size: 20px;position: relative;">مقدار فروش</label>
                <label style="margin-right: 0;right: 0;float: right;color: white">|</label>
                <label style="left: -76px;margin-right: 0;float: right;color: white;font-size: 20px;position: relative;">موجودی</label><br>
                <hr style="background-color: white">
                <c:forEach var="f" items="${q.rows}">
                    <c:set var="pCodee" value="${f.pcode}" />

                    <sql:query var="q5" dataSource="${sd}">
                        SELECT distinct (unit_name) FROM tbl_units,tbl_products
                        WHERE tbl_units.unit_code = tbl_products.punitcode
                        and tbl_products.pcode = <c:out value="${pCodee}"/> ;
                    </sql:query>

                <div style="margin-top: 8px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">
                    <div>
                        <p class="Pproduct" style="position: relative;left: 2px;margin-left: -7px;">
                            <c:forEach items="${q5.rows}" var="f9">
                                <c:out value="${f9.unit_name}"/>
                            </c:forEach>
                            <c:out value="${f.kh - f.fo}"/>
                        </p>
                    </div>
                    <label class="productShow" style="margin-right: 0;right: 0;">|</label>

                    <div>
                        <p class="Pproduct" style="position: relative;left: 6px;margin-left: -7px;">
                            <c:forEach items="${q5.rows}" var="f9">
                                <c:out value="${f9.unit_name}"/>
                            </c:forEach>
                            <c:out value="${f.fo}"/>
                        </p>
                    </div>
                    <label class="productShow" style="margin-right: 0;right: 0;">|</label>
                    <div>
                        <p class="Pproduct" style="position: relative;left: 15px;margin-left: -7px;">

                            <c:forEach items="${q5.rows}" var="f9">
                                <c:out value="${f9.unit_name}"/>
                            </c:forEach>
                            <c:out value="${f.kh}"/>
                        </p>
                    </div>
                    <label class="productShow" style="margin-right: 46px;right: 0;">|</label>
                    <div>
                        <p class="Pproduct" style="position: relative;left: -47px;margin-left: -7px;">
                            <c:out value="${f.pname}"/>
                        </p>
                    </div>
                </div>
                    <hr style="background-color: white">
                </c:forEach>

            </div>
        </div>
    </div>
</div>
<div id="dropDownSelect1"></div>

<script>
    const Printfun = function (areaID){
        let printContent = document.getElementById(areaID);
        let WinPrint = window.open('', '', 'width=900,height=650');
        WinPrint.document.write(printContent.innerHTML);
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        WinPrint.close();
    }
</script>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
</html>

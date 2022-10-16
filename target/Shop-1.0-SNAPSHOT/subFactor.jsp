<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="fa">
<head>
    <title>ثبت زیرفاکتور</title>
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

</head>
<body>
<%@ include file = "Loginaccess.jsp" %>
<%@ include file = "setDatabase.jsp" %>

<%
    String fID = (String) session.getAttribute("facID");
    String fNumber = (String) session.getAttribute("facNumber");
%>
<sql:query var="q" dataSource="${sd}">
    select * from tbl_subfactors where fID = <%=fID%>;
</sql:query>

<sql:query var="q2" dataSource="${sd}">
    select * from tbl_products;
</sql:query>

<%-- ----------------------- After main Java codes --%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');top: 1px;">
        <div style="width: 1000px;" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>

                <div class="ProductDiv">
                    <div style="float:right;position: relative;right: 54px;">
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">نام محصول</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">مقدار</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">فی</label>
                        <label style="bottom: 16px;margin-top: 17px;" class="productlbl">مبلغ کل</label>
                    </div>
                    <p style="color: white;float: left;">
                    <c:out value="<%=fNumber%>" />
                    </p>
                    <form action="subfactorIns" method="post" class="login100-form validate-form" style="margin-left: 15px;" id="subfactorIns">
                        <input type="hidden" name="fID" value="<%=fID%>">
                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام محصول را وارد کنید">
                            <select name="pName">
                                <c:forEach items="${q2.rows}" var="f2">
                                    <option value="${f2.pcode}">
                                        <c:out value="${f2.pname}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مقدار را وارد کنید">
                            <input type="number" style="width: 195px;text-align: center;position: relative;left: 20px;" name="subPnumber">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="فی را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="feNumber" style="width: 194px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مبلغ کل را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="subfacAll" style="width: 194px;">
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>
                         <form method="post" action="subFactorIDDlt" style="display: block;" id="backFactorBtn">
                              <div class="container-login100-form-btn">
                                     <button class="login100-form-btn">
                                         بازگشت به فاکتور
                                     </button>
                                </div>
                           </form>
                    <form action="subfactorUpd" method="post" class="login100-form" style="margin-left: 15px;display: none;" id="subfactorUpd">
                        <input type="hidden" name="ID" id="id">
                        <input type="hidden" name="fID" id="fId">
                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام محصول را وارد کنید">
                            <select name="pName" id="pName">
                                <c:forEach items="${q2.rows}" var="f2">
                                    <option value="${f2.pcode}">
                                        <c:out value="${f2.pname}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مقدار را وارد کنید">
                            <input type="number" style="width: 195px;text-align: center;position: relative;left: 20px;" name="subPnumber" id="subAmount">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="فی را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="feNumber" style="width: 194px;" id="subFe">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مبلغ کل را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="subfacAll" style="width: 194px;" id="subSum">
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>

                    </form>

                    <form action="subFactor.jsp" id="create" style="float: left;display: none;">
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ایجاد
                            </button>
                        </div>
                    </form>
                </div>
            <div style="float:left;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: 52px;">

                <label style="left: 71px;margin-right: 217px;" class="productShow">محصول</label>
                <label style="left: 69px;margin-right: 117px;" class="productShow">مقدار</label>
                <label style="left: 67px;margin-right: 117px;" class="productShow">فی</label>
                <label style="left: 220px;margin-right: 117px;float: left;" class="productShow">مبلغ کل</label><br>
                <hr style="background-color: white">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 20px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 54px;">
                                <label style="color: white;">تومان</label>
                                <c:out value="${f.fsum}"/>
                            </p>
                        </div>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 80px;">
                                <label style="color: white;">تومان</label>
                                <c:out value="${f.ffe}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;right: 120px;">
                            <p class="Pproduct" style="right: 154px;">

                                <c:set var="pCodee" value="${f.pcode}" />

                                <sql:query var="q5" dataSource="${sd}">
                                    SELECT distinct (unit_name) FROM tbl_units,tbl_products,tbl_subfactors
                                    WHERE tbl_units.unit_code = tbl_products.punitcode
                                    and tbl_products.pcode = tbl_subfactors.pcode
                                    and tbl_products.pcode = <c:out value="${pCodee}"/> ;
                                </sql:query>

                                <c:forEach items="${q5.rows}" var="f9">
                                    <c:out value="${f9.unit_name}"/>
                                    <c:out value="${f.famount}"/>
                                </c:forEach>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;">
                            <p class="Pproduct" style="right: 172px;">

                                <c:set var="pname" value="${f.pcode}" />

                                <sql:query var="q3" dataSource="${sd}">
                                    select pname from tbl_products where pcode= <c:out value="${pname}" />;
                                </sql:query>
                                <c:forEach items="${q3.rows}" var="f3">
                                    <c:out value="${f3.pname}" />
                                </c:forEach>
                            </p>
                        </div>

                        <form method="post" action="deletesubFactor" style="right: 99px;position: relative;">
                            <input type="hidden" value="${f.ID}" name="subfacdlt" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="subfactor2.jsp" method="post" style="right: 51px;position: relative;">
                            <input type="hidden" value="${f.ID}" name="fID" />
                            <input type="hidden" value="${f.fID}" name="subFID" />
                            <input type="hidden" value="${f.pcode}" name="subPCode" />
                            <input type="hidden" value="${f.famount}" name="subFAmount" />
                            <input type="hidden" value="${f.ffe}" name="subFfe" />
                            <input type="hidden" value="${f.fsum}" name="subFsum" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;right: 40px;"
                                   type="submit" value="ویرایش">
                        </form>
                    </div>
                    <hr style="background-color: white">
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div id="dropDownSelect1"></div>

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

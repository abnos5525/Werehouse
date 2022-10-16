<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>ثبت محصول</title>
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

    <link type="text/css" rel="stylesheet" href="css/persianDatepicker-default.css" />
    <script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="js/persianDatepicker.min.js"></script>

</head>
<body>
<%@ include file = "Loginaccess.jsp" %>
<%@ include file = "setDatabase.jsp" %>
<sql:query var="q" dataSource="${sd}">
    select * from tbl_products;
</sql:query>
<sql:query var="q2" dataSource="${sd}">
    select * from tbl_units;
</sql:query>
<%-- ----------------------- After main Java codes --%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');top: 1px;">
        <div style="width: 1000px" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>

            <div class="ProductDiv">
                <div style="float:right;position: relative;right: 54px;">
                    <label style="bottom: 16px;margin-top: 26px;" class="productlbl">نام محصول</label>
                    <label style="bottom: 16px;margin-top: 26px;" class="productlbl">واحد</label>
                </div>
                <form action="productsInsert" method="post" class="login100-form validate-form" style="margin-left: 15px;" id="productIns">

                    <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100 validate-input" data-validate = "نام محصول را وارد کنید">
                        <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 32px;" class="input100" type="text" name="Pname">
                    </div>

                    <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="واحد را وارد کنید">
                        <select name="punit">
                            <c:forEach items="${q2.rows}" var="f2">
                                 <option value="${f2.unit_code}">
                                     <c:out value="${f2.unit_name}"/>
                                 </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn">
                            ثبت
                        </button>
                    </div>
                </form>

                <form action="productsUpdate" method="post" class="login100-form" style="margin-left: 15px;display: none;" id="productUpd">

                    <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام محصول را وارد کنید">
                        <input type="hidden" name="pCodee" id="selectUnit">
                        <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 32px;" class="input100" type="text" id="pName" name="PNamee">
                    </div>

                    <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100" data-validate="واحد را وارد کنید">
                        <select id="punitee" name="unitname">
                            <c:forEach items="${q2.rows}" var="f2">
                                <option value="${f2.unit_code}">
                                    <c:out value="${f2.unit_name}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn">
                            ثبت
                        </button>
                    </div>
                </form>

                <form action="products.jsp" id="create" style="float: left;display: none;">
                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn">
                            ایجاد
                        </button>
                    </div>
                </form>
            </div>

            <div style="float:left;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: 52px;">

                <label style="left: 103px;margin-right: 268px;" class="productShow">کدمحصول</label>
                <label style="left: 120px;margin-right: 142px;" class="productShow">نام</label>
                <label style="left: 120px;margin-right: 142px;" class="productShow">واحد</label><br>
                <hr style="background-color: white">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 30px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">

                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="position: relative;left: 60px;">
                                <c:set var="uname" value="${f.punitcode}" />

                                <sql:query var="q3" dataSource="${sd}">
                                    select unit_name from tbl_units where unit_code= <c:out value="${uname}" />;
                                </sql:query>
                              <c:forEach items="${q3.rows}" var="f2">
                                <c:out value="${f2.unit_name}" />
                              </c:forEach>
                            </p>
                        </div>

                        <div>
                            <p class="Pproduct" style="position: relative;left: 34px;">
                                <c:out value="${f.pname}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;">
                            <p class="Pproduct">
                                <c:out value="${f.pcode}"/>
                            </p>
                        </div>

                        <form method="post" action="deleteProduct">
                            <input type="hidden" value="${f.pcode}" name="supdlt" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="products2.jsp" method="post">
                            <input type="hidden" value="${f.pcode}" name="prodcode" />
                            <input type="hidden" value="${f.pname}" name="prodname" />
                            <input type="hidden" value="${f.punitcode}" name="produnit" />
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

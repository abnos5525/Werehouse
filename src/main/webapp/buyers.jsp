<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>ثبت خریداران</title>
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
<sql:query var="q" dataSource="${sd}">
    select * from tbl_customers;
</sql:query>
<%-- ----------------------- After main Java codes --%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');top: 1px;">
        <div style="width: 1000px" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>

                <div class="ProductDiv">
                    <div style="float:right;position: relative;right: 54px;">
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">نام</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">شماره موبایل</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">آدرس</label>
                    </div>
                    <form action="customersIns" method="post" class="login100-form validate-form" style="margin-left: 15px;" id="CustomIns">

                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100 validate-input" data-validate = "نام خریدار را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 32px;" class="input100" type="text" name="Cuname">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="شماره موبایل را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 30px;" class="input100" type="text" name="Cuphone">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="آدرس را وارد کنید">
                            <textarea style="text-align: right;background-color: white;width: 221px;color: black;position: relative;left: 30px;" class="input100" type="text" maxlength="150"  name="Cuaddress" ></textarea>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>


                    <form action="customersUpd" method="post" class="login100-form" style="margin-left: 15px;display: none;" id="CustomUpd">

                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام خریدار را وارد کنید">
                            <input type="hidden" name="Cucode" id="customcodee">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 32px;" class="input100" type="text" id="cuname" name="Cunamee">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100" data-validate="شماره موبایل را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 30px;" class="input100" type="text" id="cuphone" name="Cuphonee">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100" data-validate="آدرس را وارد کنید">
                            <textarea style="text-align: right;background-color: white;width: 221px;color: black;position: relative;left: 30px;" class="input100" type="text" id="cuaddresse" maxlength="150"  name="Cuaddress" ></textarea>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>

                    <form action="buyers.jsp" id="create" style="float: left;display: none;">
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ایجاد
                            </button>
                        </div>
                    </form>
                </div>
            <div style="float:left;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: 52px;">

                <label style="left: 103px;margin-right: 284px;" class="productShow">نام</label>
                <label style="left: 120px;margin-right: 284px;" class="productShow">شماره</label>
                <label style="left: 185px;margin-right: 284px;" class="productShow">آدرس</label><br>
                <hr style="background-color: white">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 30px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="font-size:11px;">
                                <c:out value="${f.caddress}"/>
                            </p>
                        </div>
                        <div>
                            <p class="Pproduct">
                                <c:out value="${f.cphone}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;">
                            <p class="Pproduct">
                                <c:out value="${f.cflname}"/>
                            </p>
                        </div>

                        <form method="post" action="deleteCustomer">
                            <input type="hidden" value="${f.ccode}" name="cusdlt" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="buyers2.jsp" method="post">
                            <input type="hidden" value="${f.ccode}" name="Supcode" />
                            <input type="hidden" value="${f.cflname}" name="supname" />
                            <input type="hidden" value="${f.caddress}" name="Supaddress" />
                            <input type="hidden" value="${f.cphone}" name="supphone" />
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

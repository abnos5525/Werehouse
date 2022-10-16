<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="fa">
<head>
    <title>کاربران</title>
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
    select * from tbl_users;
</sql:query>

<%-- ----------------------- After main Java codes --%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');top: 1px;">
        <div style="width: 1000px;" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>

                <div class="ProductDiv">
                    <div style="float:right;position: relative;right: 54px;">
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">نام و نام خانوادگی</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl" id="userlbl">نام کاربری</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">شماره تلفن</label>
                        <label style="bottom: 16px;margin-top: 17px;" class="productlbl">ایمیل</label>
                        <label style="bottom: 16px;margin-top: 17px;" class="productlbl">رمزعبور</label>
                        <label style="bottom: 16px;margin-top: 17px;" class="productlbl">نوع کاربر</label>
                        <label style="bottom: 16px;margin-top: 17px;" class="productlbl">دسترسی</label>
                    </div>
                    <form action="userIns" method="post" class="login100-form validate-form" style="margin-left: 15px;" id="userIns">
                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام را وارد کنید">
                            <input type="text" style="width: 195px;text-align: center;position: relative;left: 20px;" name="name">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نام کاربری را وارد کنید">
                            <input type="text" style="width: 195px;text-align: center;position: relative;left: 20px;" name="username">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="شماره را وارد کنید">
                            <input type="tel" name="phone" style="width: 194px;position: relative;left: 21px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="ایمیل را وارد کنید">
                            <input type="email" name="email" style="width: 194px;position: relative;left: 21px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="رمزعبور را وارد کنید">
                            <input type="password" name="pass" style="width: 194px;position: relative;left: 21px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نوع کاربر را وارد کنید">
                            <select name="userType" style="position: relative;left: 21px;">
                                <option value="admin">
                                    ادمین
                                </option>
                                <option value="member">
                                    کاربر
                                </option>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نوع دسترسی را وارد کنید">
                            <select name="userPermission" style="position: relative;left: 21px;">
                                <option value="yes">
                                    بله
                                </option>
                                <option value="no">
                                    خیر
                                </option>
                            </select>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>
                    <form action="userUpd" method="post" class="login100-form" style="margin-left: 15px;display: none;" id="userUpd">
                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام را وارد کنید">
                            <input type="text" style="width: 195px;text-align: center;position: relative;left: 20px;" name="namee" id="Uname">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نام کاربری را وارد کنید">
                            <input type="hidden" style="width: 195px;text-align: center;position: relative;left: 20px;" name="usernamee" id="uUsername">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="شماره را وارد کنید">
                            <input type="tel" name="phone" style="width: 194px;position: relative;left: 21px;" id="uPhone">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="ایمیل را وارد کنید">
                            <input type="email" name="email" style="width: 194px;position: relative;left: 21px;" id="uEmail">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="رمزعبور را وارد کنید">
                            <input type="password" name="pass" style="width: 194px;position: relative;left: 21px;" id="uPassword">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نوع کاربر را وارد کنید">
                            <select name="userType" id="uType" style="position: relative;left: 21px;">
                                <option value="admin">
                                    ادمین
                                </option>
                                <option value="member">
                                    کاربر
                                </option>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نوع دسترسی را وارد کنید">
                            <select name="userPermission" id="uPermission" style="position: relative;left: 21px;">
                                <option value="yes">
                                    بله
                                </option>
                                <option value="no">
                                    خیر
                                </option>
                            </select>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>

                    </form>

                    <form action="userControl.jsp" id="create" style="float: left;display: none;">
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ایجاد
                            </button>
                        </div>
                    </form>
                </div>
            <div style="float:left;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: 52px;">

                <label style="left: 54px;margin-right: 217px;" class="productShow">نام</label>
                <label style="left: 69px;margin-right: 90px;" class="productShow">نام کاربری</label>
                <label style="left: 67px;margin-right: 46px;" class="productShow">شماره تلفن</label>
                <label style="left: 220px;margin-right: 235px;" class="productShow">ایمیل</label>
                <label style="left: 220px;margin-right: 62px;" class="productShow">رمزعبور</label>
                <label style="left: 155px;margin-right: -28px;" class="productShow">نوع کاربر</label>
                <label style="left: 24px;margin-right: -102px;" class="productShow">نوع دسترسی</label><br>
                <hr style="background-color: white">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 30px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 101px;font-size: 10px;margin-left: 133px;">
                                <c:out value="${f.user_permission}"/>
                            </p>
                        </div>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 105px;font-size: 10px;margin-left: 133px;">
                                <c:out value="${f.user_type}"/>
                            </p>
                        </div>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 118px;font-size: 10px;margin-left: 133px;">
                                ***
                            </p>
                        </div>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 78px;font-size: 8px;margin-left: 133px;">
                                <c:out value="${f.mail}"/>
                            </p>
                        </div>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 63px;font-size: 10px;margin-left: 133px;">
                                <c:out value="${f.phone}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;right: 120px;">
                            <p class="Pproduct" style="right: 136px;font-size: 10px;margin-left: 133px;">
                                <c:out value="${f.username}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;">
                            <p class="Pproduct" style="right: 172px;font-size: 10px;margin-left: 133px;">
                                <c:out value="${f.flname}"/>
                            </p>
                        </div>

                        <form method="post" action="deleteuser" style="right: 99px;position: relative;">
                            <input type="hidden" value="${f.username}" name="userdlt" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="userControl2.jsp" method="post" style="right: 51px;position: relative;">
                            <input type="hidden" value="${f.username}" name="userID" />
                            <input type="hidden" value="${f.flname}" name="uflname" />
                            <input type="hidden" value="${f.phone}" name="uphone" />
                            <input type="hidden" value="${f.mail}" name="umail" />
                            <input type="hidden" value="${f.password}" name="upass" />
                            <input type="hidden" value="${f.user_type}" name="utype" />
                            <input type="hidden" value="${f.user_permission}" name="uper" />
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

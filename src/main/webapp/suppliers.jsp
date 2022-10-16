<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>ثبت تامین کنندگان</title>
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
    select * from tbl_suppliers;
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
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">کدملی</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">آدرس</label>
                    </div>
                    <form action="suppliersIns" method="post" class="login100-form validate-form" style="margin-left: 15px;" id="supplierIns">

                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100 validate-input" data-validate = "نام تامین کننده را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 32px;" class="input100" type="text" name="Sname">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="شماره موبایل را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 30px;" class="input100" type="text" name="Sphone">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100" data-validate="کدملی را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 30px;" class="input100" type="text" name="Ncode">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="آدرس را وارد کنید">
                            <textarea style="text-align: right;background-color: white;width: 221px;color: black;position: relative;left: 30px;" class="input100" type="text" maxlength="150"  name="Saddress" ></textarea>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>

                    <form action="suppliersUpd" method="post" class="login100-form" style="margin-left: 15px;display: none;" id="supplierUpd">

                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام تامین کننده را وارد کنید">
                            <input type="hidden" name="Scode" id="supcodee">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 32px;" class="input100" type="text" id="sname" name="Snamee">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100" data-validate="شماره موبایل را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 30px;" class="input100" type="text" id="sphone" name="Sphonee">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="کدملی را وارد کنید">
                            <input style="text-align: right;background-color: white;width: 221px;height: 30px;color: black;position: relative;left: 30px;" class="input100" type="text" name="Ncode" id="ncode">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100" data-validate="آدرس را وارد کنید">
                            <textarea style="text-align: right;background-color: white;width: 221px;color: black;position: relative;left: 30px;" class="input100" type="text" id="saddresse" maxlength="150"  name="Saddress" ></textarea>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>

                    <form action="suppliers.jsp" id="create" style="float: left;display: none;">
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ایجاد
                            </button>
                        </div>
                    </form>
                </div>
            <div style="float:left;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: 52px;">

                <label style="left: 103px;margin-right: 245px;" class="productShow">نام</label>
                <label style="left: 100px;margin-right: 176px;" class="productShow">شماره تلفن</label>
                <label style="left: 120px;margin-right: 164px;" class="productShow">کدملی</label>
                <label style="left: 185px;margin-right: 237px;" class="productShow">آدرس</label><br>
                <hr style="background-color: white">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 30px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="font-size:11px;right: 120px;">
                                <c:out value="${f.saddress}"/>
                            </p>
                        </div>
                        <div>
                            <p class="Pproduct" style="right: 120px;">
                                <c:out value="${f.ncode}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 44px;">
                            <p class="Pproduct" style="right: 120px;">
                                <c:out value="${f.sphone}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 10px;width: 223px;">
                            <p class="Pproduct" style="right: 120px;">
                                <c:out value="${f.sname}"/>
                            </p>
                        </div>

                        <form method="post" action="deleteSupplier">
                            <input type="hidden" value="${f.scode}" name="supdlt" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;right: 74px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="suppliers2.jsp" method="post">
                            <input type="hidden" value="${f.scode}" name="Supcode" />
                            <input type="hidden" value="${f.sname}" name="supname" />
                            <input type="hidden" value="${f.saddress}" name="Supaddress" />
                            <input type="hidden" value="${f.sphone}" name="supphone" />
                            <input type="hidden" value="${f.ncode}" name="ncode" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;right: 75px;"
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

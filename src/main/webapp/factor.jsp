<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="fa">
<head>
    <title>ثبت فاکتور</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/admin_menu.css">
    <!--===============================================================================================-->

    <link rel="stylesheet" href="js-persian-cal.css">
    <script type="text/javascript" src="js-persian-cal.min.js"></script>

</head>
<body>

<%@ include file = "Loginaccess.jsp" %>
<%@ include file = "setDatabase.jsp" %>
<sql:query var="q" dataSource="${sd}">
    select * from tbl_factors;
</sql:query>
<sql:query var="q2" dataSource="${sd}">
    select * from tbl_suppliers;
</sql:query>
<%-- ----------------------- After main Java codes --%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');top: 1px;">
        <div style="width: 1000px" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>

                <div class="ProductDiv">
                    <div style="float:right;position: relative;right: 54px;">
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">فروشنده</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">خریدار</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">تاریخ فاکتور</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">شماره فاکتور</label>
                        <label style="bottom: 16px;margin-top: 16px;" class="productlbl">تخفیف</label>
                        <label style="bottom: 16px;margin-top: 17px;" class="productlbl">جمع کل</label>
                    </div>
                    <form action="factorIns" method="post" class="login100-form validate-form" style="margin-left: 15px;" id="factorIns">

                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام فروشنده را وارد کنید">
                            <select name="supName">
                                <c:forEach items="${q2.rows}" var="f2">
                                    <option value="${f2.scode}">
                                        <c:out value="${f2.sname}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نام خریدار را وارد کنید">
                            <input type="text" value="<%=session.getAttribute("user_login")%>" disabled style="width: 195px;text-align: center;">
                        </div>

                        <div id="calendar-container" style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input example" data-validate="تاریخ را وارد کنید">
                            <input type="text" name="fdate" class="pdate" id="pcal1" style="width: 194px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="شماره فاکتور را وارد کنید">
                            <input type="text" name="facNum" style="width: 194px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="تخفیف را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="facOff" style="width: 194px;margin-right: 40px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="جمع کل را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="facAll" style="width: 194px;margin-right: 40px;">
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>

                    <form action="factorUpd" method="post" class="login100-form" style="margin-left: 15px;display: none;" id="factorUpd">

                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام فروشنده را وارد کنید">
                            <select name="supName" id="fSupplier">
                                <c:forEach items="${q2.rows}" var="f2">
                                    <option value="${f2.scode}">
                                        <c:out value="${f2.sname}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نام خریدار را وارد کنید">
                            <input type="hidden" id="fID" name="fid">
                            <input type="text" disabled id="fBuyer" style="width: 195px;text-align: center;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="تاریخ را وارد کنید">
                            <input type="text" class="pdate" id="pcal2" name="facdate" style="width: 194px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="شماره فاکتور را وارد کنید">
                            <input type="text" id="fNum" name="facNum" style="width: 194px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="تخفیف را وارد کنید">
                            <span>تومان</span>
                            <input type="number" id="fOff" name="facOff" style="width: 194px;margin-right: 40px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="جمع کل را وارد کنید">
                            <span>تومان</span>
                            <input type="number" id="fAll" name="facAll" style="width: 194px;margin-right: 40px;">
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>

                    <form action="factor.jsp" id="create" style="float: left;display: none;">
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ایجاد
                            </button>
                        </div>
                    </form>
                </div>
            <div style="float:left;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: 52px;">

                <label style="left: 62px;margin-right: 210px;" class="productShow">فروشنده</label>
                <label style="left: 110px;margin-right: 119px;" class="productShow">خریدار</label>
                <label style="left: 195px;margin-right: 160px;" class="productShow">تاریخ فاکتور</label>
                <label style="left: 169px;margin-right: 32px;" class="productShow">شماره فاکتور</label>
                <label style="left: 160px;margin-right: 52px;" class="productShow">تخفیف</label>
                <label style="left: 133px;margin-right: -5px;float: left;" class="productShow">کل</label><br>
                <hr style="background-color: white">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 30px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">
                        <form method="post" action="subFactorID" style="right: 75px;position: relative;">
                            <input type="hidden" value="${f.fID}" name="subfID" />
                            <input type="hidden" value="${f.fnumber}" name="subfNumber" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;"
                                   type="submit" value="زیرفاکتور">
                        </form>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 42px;">
                                <label style="color: white;">تومان</label>
                                <c:out value="${f.fsum}"/>
                            </p>
                        </div>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 27px;">
                                <label style="color: white;">تومان</label>
                                <c:out value="${f.foff}"/>
                            </p>
                        </div>
                        <div>
                            <p class="Pproduct" style="right: 76px;">
                                <c:out value="${f.fnumber}"/>
                            </p>
                        </div>
                        <div>
                            <p class="Pproduct" style="right: 85px;">
                                <c:out value="${f.fdate}"/>
                            </p>
                        </div>

                        <div style="position: relative;left: 23px;width: 223px;right: 120px;">
                            <p class="Pproduct" style="right: 125px;">
                                <c:out value="${f.fbuyer}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;">
                            <p class="Pproduct" style="right: 172px;">
                                <c:set var="sname" value="${f.scode}" />

                                <sql:query var="q3" dataSource="${sd}">
                                    select sname from tbl_suppliers where scode= <c:out value="${sname}" />;
                                </sql:query>
                                <c:forEach items="${q3.rows}" var="f3">
                                    <c:out value="${f3.sname}" />
                                </c:forEach>
                            </p>
                        </div>

                        <form method="post" action="deleteFactor" style="right: 99px;position: relative;">
                            <input type="hidden" value="${f.fID}" name="facdlt" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="factor2.jsp" method="post" style="right: 51px;position: relative;">
                            <input type="hidden" value="${f.fID}" name="Faccode" />
                            <input type="hidden" value="${f.scode}" name="Scode" />
                            <input type="hidden" value="${f.fbuyer}" name="Fbuyer" />
                            <input type="hidden" value="${f.fdate}" name="Fdate" />
                            <input type="hidden" value="${f.fnumber}" name="Fnum" />
                            <input type="hidden" value="${f.foff}" name="Foff" />
                            <input type="hidden" value="${f.fsum}" name="Fsum" />
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

<script type="text/javascript">
    let objCal1 = new AMIB.persianCalendar("pcal1");
    let objCal2 = new AMIB.persianCalendar("pcal2");
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

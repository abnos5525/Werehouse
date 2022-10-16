<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="fa">
<head>
    <title>ثبت فروش</title>
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
    select * from tbl_sells;
</sql:query>

<sql:query var="q2" dataSource="${sd}">
    select * from tbl_products;
</sql:query>

<sql:query var="q3" dataSource="${sd}">
    select * from tbl_customers;
</sql:query>

<%-- ----------------------- After main Java codes --%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');top: 1px;">
        <div style="width: 1000px;" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>

                <div class="ProductDiv">
                    <div style="float:right;position: relative;right: 54px;">
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">نام محصول</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">خریدار</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">مقدار</label>
                        <label style="bottom: 16px;margin-top: 26px;" class="productlbl">مبلغ فروش</label>
                        <label style="bottom: 16px;margin-top: 17px;" class="productlbl">مبلغ کل</label>
                    </div>
                    <form action="sellIns" method="post" class="login100-form validate-form" style="margin-left: 15px;" id="sellIns">
                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام محصول را وارد کنید">
                            <select name="pName" id="selectedID">
                                <c:forEach items="${q2.rows}" var="f2">
                                    <option value="${f2.pcode}">
                                        <c:out value="${f2.pname}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نام خریدار را وارد کنید">
                            <select name="cName">
                                <c:forEach items="${q3.rows}" var="f3">
                                    <option value="${f3.ccode}">
                                        <c:out value="${f3.cflname}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مقدار را وارد کنید">
                            <input type="number" style="width: 195px;text-align: center;position: relative;left: 20px;" name="Number">
                            <%--<sql:query var="q6" dataSource="${sd}">
                                SELECT distinct (unit_name) FROM tbl_units,tbl_products,tbl_sells
                                WHERE tbl_units.unit_code = tbl_products.punitcode
                                and tbl_products.pcode = tbl_sells.pcode
                                and tbl_products.pcode = <c:out value="${ppcode}"/> ;
                            </sql:query>
                            <p style="color: white;">
                            <c:forEach items="${q6.rows}" var="f6">
                                <c:out value="${f6.unit_name}" />
                            </c:forEach>--%>
                            </p>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مبلغ فروش را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="sNumber" style="width: 194px;">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مبلغ کل را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="sAll" style="width: 194px;">
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>
                    </form>

                    <form action="sellUpd" method="post" class="login100-form" style="margin-left: 15px;display: none;" id="sellUpd">
                        <div style="margin-bottom: 20px;margin-top: 10px;border-bottom:0;position: relative;" class="wrap-input100" data-validate = "نام محصول را وارد کنید">
                           <input type="hidden" name="id" id="Id">
                            <select name="pName" id="pname">
                                <c:forEach items="${q2.rows}" var="f2">
                                    <option value="${f2.pcode}">
                                        <c:out value="${f2.pname}"/>
                                    </option>
                                </c:forEach>

                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="نام خریدار را وارد کنید">
                            <select name="cName" id="cname">
                                <c:forEach items="${q3.rows}" var="f3">
                                    <option value="${f3.ccode}">
                                        <c:out value="${f3.cflname}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مقدار را وارد کنید">
                            <input type="number" style="width: 195px;text-align: center;position: relative;left: 20px;" name="Number" id="number">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مبلغ فروش را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="sNumber" style="width: 194px;" id="sprice">
                        </div>

                        <div style="margin-bottom: 20px;border-bottom:0;" class="wrap-input100 validate-input" data-validate="مبلغ کل را وارد کنید">
                            <span>تومان</span>
                            <input type="number" name="sAll" style="width: 194px;" id="sall">
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ثبت
                            </button>
                        </div>

                    </form>

                    <form action="sell.jsp" id="create" style="float: left;display: none;">
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                ایجاد
                            </button>
                        </div>
                    </form>
                </div>
            <div style="float:left;width: 995px;background-color: #232d39;border-radius: 20px;position: relative;top: -14px;box-shadow: 3px 10px 40px black;right: 52px;">

                <label style="left: 71px;margin-right: 217px;" class="productShow">محصول</label>
                <label style="left: 71px;margin-right: 115px;" class="productShow">خریدار</label>
                <label style="left: 69px;margin-right: 117px;" class="productShow">مقدار</label>
                <label style="left: 67px;margin-right: 72px;" class="productShow">مبلغ فروش</label>
                <label style="left: 156px;margin-right: 117px;float: left;" class="productShow">مبلغ کل</label><br>
                <hr style="background-color: white">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 20px;text-align: center;display: flex;justify-content: space-evenly;position: relative;left: 76px;">
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 54px;">
                                <label style="color: white;">تومان</label>
                                <c:out value="${f.sall}"/>
                            </p>
                        </div>
                        <div style="display: block ruby;width: 272px;">
                            <p class="Pproduct" style="right: 122px;margin-left: 102px;">
                                <label style="color: white;">تومان</label>
                                <c:out value="${f.sprice}"/>
                            </p>
                        </div>
                        <div style="position: relative;left: 23px;width: 223px;right: 120px;">
                            <p class="Pproduct" style="right: 154px;">

                                    <%--<c:set var="pCode" value="${f.pcode}" />

                                    <sql:query var="q5" dataSource="${sd}">
                                        select punitcode from tbl_products where pcode= <c:out value="${pCode}" />;
                                    </sql:query>

                    <c:forEach items="${q5.rows}" var="f5">

                        <sql:query var="q5" dataSource="${sd}">
                            select unit_name from tbl_units where unit_code= <c:out value="${f5.punitcode}" />;
                        </sql:query>

                        <c:forEach items="${q5.rows}" var="f6">
                            <c:out value="${f6.unit_name}"/>
                            <c:out value="${f.samount}"/>
                        </c:forEach>

                    </c:forEach>--%>
                                        <c:set var="pCode" value="${f.pcode}" />

                                        <sql:query var="q5" dataSource="${sd}">
                                            SELECT distinct (unit_name) FROM tbl_units,tbl_products,tbl_sells
                                            WHERE tbl_units.unit_code = tbl_products.punitcode
                                            and tbl_products.pcode = tbl_sells.pcode
                                            and tbl_products.pcode = <c:out value="${pCode}"/> ;
                                        </sql:query>

                                        <c:forEach items="${q5.rows}" var="f9">
                                            <c:out value="${f9.unit_name}"/>
                                            <c:out value="${f.samount}"/>
                                        </c:forEach>

                            </p>
                        </div>

                        <div style="position: relative;left: 23px;width: 223px;">
                            <p class="Pproduct" style="right: 172px;">

                                <c:set var="cname" value="${f.ccode}" />

                                <sql:query var="q7" dataSource="${sd}">
                                    select cflname from tbl_customers where ccode= <c:out value="${cname}" />;
                                </sql:query>
                                <c:forEach items="${q7.rows}" var="f7">
                                    <c:out value="${f7.cflname}" />
                                </c:forEach>
                            </p>
                        </div>

                        <div style="position: relative;left: 23px;width: 223px;">
                            <p class="Pproduct" style="right: 172px;">

                                <c:set var="pname" value="${f.pcode}" />

                                <sql:query var="q4" dataSource="${sd}">
                                    select pname from tbl_products where pcode= <c:out value="${pname}" />;
                                </sql:query>
                                <c:forEach items="${q4.rows}" var="f4">
                                    <c:out value="${f4.pname}" />
                                </c:forEach>
                            </p>
                        </div>

                        <form method="post" action="deletesell" style="right: 99px;position: relative;">
                            <input type="hidden" value="${f.sID}" name="selldlt" />
                            <input style="border-radius: 50%;float: right;position: relative;font-size: 17px;padding: 1px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="sell2.jsp" method="post" style="right: 51px;position: relative;">
                            <input type="hidden" value="${f.sID}" name="sID" />
                            <input type="hidden" value="${f.pcode}" name="pcode" />
                            <input type="hidden" value="${f.ccode}" name="ccode" />
                            <input type="hidden" value="${f.samount}" name="samount" />
                            <input type="hidden" value="${f.sprice}" name="sprice" />
                            <input type="hidden" value="${f.sall}" name="sall" />
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

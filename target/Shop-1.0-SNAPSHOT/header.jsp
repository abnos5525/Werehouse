<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
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

    <div dir="rtl" id="container" style="z-index: 2;">
        <ul id="menu">
            <li style="float: right;"><a href="#">اطلاعات پایه</a>
                <ul style="right: 0;">
                    <li style="right: 0;" class="menu-li"><a href="units.jsp">ثبت واحد</a></li>
                    <li style="right: 0;" class="menu-li"><a href="products.jsp">ثبت محصول</a></li>
                    <li style="right: 0;" class="menu-li"><a href="buyers.jsp">خریداران</a></li>
                    <li style="right: 0;" class="menu-li"><a href="suppliers.jsp">تامین کنندگان</a></li>
                </ul>
            </li>
            <li style="float: right;"><a href="#">خرید</a>
                <ul style="right: 0;">
                    <li class="menu-li"><a href="subFactorIDDlt">فاکتور</a></li>
                </ul>
            </li>
            <li style="float: right;"><a href="sell.jsp">فروش</a></li>
            <li style="float: right;"><a href="#">گزارش</a>
                <ul style="right: 0;">
                    <li style="right: 0;" class="menu-li"><a href="sell_report.jsp">سود</a></li>
                    <li style="right: 0;" class="menu-li"><a href="source.jsp">انبار</a></li>
                </ul>
            </li>
            <li style="float: right;"><a href="userControl.jsp">کاربران</a></li>
            <li style="float: right;"><a href="exit">خروج</a></li>
        </ul>
    </div>
</body>
</html>

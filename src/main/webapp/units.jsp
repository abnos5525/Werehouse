<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>ثبت واحدها</title>
    <meta charset="UTF-8" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/admin_menu.css">
</head>
<body>
<%@ include file = "Loginaccess.jsp" %>
<%@ include file = "setDatabase.jsp" %>
<sql:query var="q" dataSource="${sd}">
    select * from tbl_units;
</sql:query>
<%-- ----------------------- After main Java codes --%>
<div class="limiter">
    <div class="container-login100" style="background-image: url('images/bg-02.jpg');">
        <div style="width: 1000px;" class="wrap-login100">
            <%@ include file = "header.jsp" %>  <%-- Header --%>


                <div style="width: 368px;background-color: #992e15;text-align: center;color: white;font-size: 20px;
float: right;position: relative;top: 80px;padding: 12px;box-shadow: 3px 10px 40px black; height: 160px;">

                    <form action="insertUnit" method="post" id="InsertFrm" style="display: block;">
                        <label style="float: right;position: relative;right: 100px;" for="unit">واحد</label>
                        <input style="width: 100px;text-align: right;" type="text" name="units" id="unit"><br>
                        <input style="width: 50px;margin-top: 10px;" type="submit" value="ثبت">
                    </form>

                    <form action="editUnit" method="post" style="display: none;" id="UpdFrm">
                        <label style="float: right;position: relative;right: 100px;" for="unit">واحد</label>
                        <input style="width: 100px;text-align: right;" type="text" name="units" id="unitEdt"><br>
                        <input type="hidden" name="unitsId" id="unitIdEdt">
                        <input style="width: 50px;margin-top: 10px;" type="submit" value="ثبت">
                    </form>

                    <form action="units.jsp" method="get" style="float:left;display: none;" id="creatUnit">
                        <input style="width: 50px;margin-top: 10px;" type="submit" value="ایجاد">
                    </form>
                </div>

            <div style="float:left;width: 313px;background-color: #232d39;border-radius: 20px;position: relative;top:-24px;box-shadow: 3px 10px 40px black;">
                <c:forEach items="${q.rows}" var="f">

                    <div style="margin-top: 22px;margin-left: 20px;">
                        <p style="color: white;font-size: 20px;position: relative;left: 14px;">
                            <c:out value="${f.unit_name}"/>
                        </p>

                        <form method="post" action="DeleteUnit" style="margin-top: 7px;">
                            <input type="hidden" value="${f.unit_code}" name="unitdlt" />
                            <input style="border-radius: 50%;float: right;position: relative;right: 60px;bottom: 40px;font-size: 17px;padding: 2px;"
                                   type="submit" value="حذف">
                        </form>
                        <form action="units2.jsp" method="post" style="margin-top: 7px;">
                            <input type="hidden" value="${f.unit_code}" name="unitid" />
                            <input type="hidden" value="${f.unit_name}" name="unitname" />
                            <input style="border-radius: 50%;float: right;position: relative;right: 68px;bottom: 40px;font-size: 17px;padding: 3px;"
                                   type="submit" value="ویرایش">
                        </form>
                    </div>
                    <hr style="background-color: white">
                </c:forEach>
            </div>

        </div>
    </div>
</div>

</body>
</html>

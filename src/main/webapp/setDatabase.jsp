<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>

</head>
<body>
<sql:setDataSource var="sd" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/shopdb" user="root" password="" />
</body>
</html>

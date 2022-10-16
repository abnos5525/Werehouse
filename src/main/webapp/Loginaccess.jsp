<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    response.setHeader("cache-control", "no-store");
    String user = (String) session.getAttribute("user_login");
    String pass = (String) session.getAttribute("pass_login");
    if(user == null || user.equals("") || pass == null || pass.equals(""))
        response.sendRedirect("index.jsp");
%>
</body>
</html>

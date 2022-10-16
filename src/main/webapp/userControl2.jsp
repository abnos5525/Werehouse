<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "userControl.jsp" %>
<%
    String username = request.getParameter("userID");
    String name = request.getParameter("uflname");
    String phone = request.getParameter("uphone");
    String email = request.getParameter("umail");
    String password = request.getParameter("upass");
    String type = request.getParameter("utype");
    String permission = request.getParameter("uper");
%>

<script>
            document.getElementById("userIns").style.display = "none";
            document.getElementById("userlbl").style.display = "none";
            document.getElementById("userUpd").style.display = "block";
            document.getElementById("create").style.display = "block";
            document.getElementById("Uname").value = "<%=name%>";
            document.getElementById("uUsername").value = "<%=username%>";
            document.getElementById("uPhone").value = "<%=phone%>";
            document.getElementById("uEmail").value = "<%=email%>";
            document.getElementById("uPassword").value = "<%=password%>";
            document.getElementById("uType").value = "<%=type%>";
            document.getElementById("uPermission").value = "<%=permission%>";
</script>

</body>
</html>

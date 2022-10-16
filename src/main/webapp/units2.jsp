<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "units.jsp" %>
<%
    String unitName = request.getParameter("unitname");
    String unitId = request.getParameter("unitid");
    System.out.println(unitName);
%>

<script>
            document.getElementById("InsertFrm").style.display = "none";
            document.getElementById("UpdFrm").style.display = "block";
            document.getElementById("creatUnit").style.display = "block";
            document.getElementById("unitEdt").value = "<%=unitName%>";
            document.getElementById("unitIdEdt").value = "<%=unitId%>";
</script>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "suppliers.jsp" %>
<%
    String supplierName = request.getParameter("supname");
    String supplierAddress = request.getParameter("Supaddress");
    String supplierPhone = request.getParameter("supphone");
    String supplierNcode = request.getParameter("ncode");
    String supplierCode = request.getParameter("Supcode");
%>

<script>
            document.getElementById("supplierIns").style.display = "none";
            document.getElementById("supplierUpd").style.display = "block";
            document.getElementById("create").style.display = "block";
            document.getElementById("sname").value = "<%=supplierName%>";
            document.getElementById("sphone").value = "<%=supplierPhone%>";
            document.getElementById("saddresse").value = "<%=supplierAddress%>";
            document.getElementById("ncode").value = "<%=supplierNcode%>";
            document.getElementById("supcodee").value = "<%=supplierCode%>";
</script>

</body>
</html>

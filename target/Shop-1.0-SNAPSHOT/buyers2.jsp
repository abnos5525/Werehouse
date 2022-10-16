<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "buyers.jsp" %>
<%
    String customertId = request.getParameter("Supcode");
    String customerName = request.getParameter("supname");
    String customerAddress = request.getParameter("Supaddress");
    String customerPhone = request.getParameter("supphone");

%>

<script>
            document.getElementById("CustomIns").style.display = "none";
            document.getElementById("CustomUpd").style.display = "block";
            document.getElementById("create").style.display = "block";
            document.getElementById("cuname").value = "<%=customerName%>";
            document.getElementById("cuphone").value = "<%=customerPhone%>";
            document.getElementById("cuaddresse").value = "<%=customerAddress%>";
            document.getElementById("customcodee").value = "<%=customertId%>";
</script>

</body>
</html>

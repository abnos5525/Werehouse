<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "products.jsp" %>
<%
    String productId = request.getParameter("prodcode");
    String productName = request.getParameter("prodname");
    String productUnit = request.getParameter("produnit");

%>

<script>
            document.getElementById("productIns").style.display = "none";
            document.getElementById("productUpd").style.display = "block";
            document.getElementById("create").style.display = "block";
            document.getElementById("pName").value = "<%=productName%>";
            document.getElementById("selectUnit").value = "<%=productId%>";
            document.getElementById("punitee").value = "<%=productUnit%>";
</script>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "sell.jsp" %>
<%
    String ID = request.getParameter("sID");
    String pcode = request.getParameter("pcode");
    String ccode = request.getParameter("ccode");
    String samount = request.getParameter("samount");
    String sprice = request.getParameter("sprice");
    String sall = request.getParameter("sall");
%>

<script>
            document.getElementById("sellIns").style.display = "none";
            document.getElementById("sellUpd").style.display = "block";
            document.getElementById("create").style.display = "block";
            document.getElementById("Id").value = "<%=ID%>";
            document.getElementById("pname").value = "<%=pcode%>";
            document.getElementById("cname").value = "<%=ccode%>";
            document.getElementById("number").value = "<%=samount%>";
            document.getElementById("sprice").value = "<%=sprice%>";
            document.getElementById("sall").value = "<%=sall%>";
</script>

</body>
</html>

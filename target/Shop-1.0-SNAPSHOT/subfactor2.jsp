<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "subFactor.jsp" %>
<%
    String ID = request.getParameter("fID");
    String fId = request.getParameter("subFID");
    String fpCode = request.getParameter("subPCode");
    String fAmount = request.getParameter("subFAmount");
    String fFe = request.getParameter("subFfe");
    String fSum = request.getParameter("subFsum");
%>

<script>
            document.getElementById("subfactorIns").style.display = "none";
            document.getElementById("backFactorBtn").style.display = "none";
            document.getElementById("subfactorUpd").style.display = "block";
            document.getElementById("create").style.display = "block";
            document.getElementById("id").value = "<%=ID%>";
            document.getElementById("fId").value = "<%=fId%>";
            document.getElementById("pName").value = "<%=fpCode%>";
            document.getElementById("subAmount").value = "<%=fAmount%>";
            document.getElementById("subFe").value = "<%=fFe%>";
            document.getElementById("subSum").value = "<%=fSum%>";
</script>

</body>
</html>

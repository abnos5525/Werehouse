<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@ include file = "factor.jsp" %>
<%
    String factorCode = request.getParameter("Faccode");
    String supplierCode = request.getParameter("Scode");
    String factorBuyer = request.getParameter("Fbuyer");
    String factorDate = request.getParameter("Fdate");
    String factorNumber = request.getParameter("Fnum");
    String factorOff = request.getParameter("Foff");
    String factorAll = request.getParameter("Fsum");
%>

<script>
            document.getElementById("factorIns").style.display = "none";
            document.getElementById("factorUpd").style.display = "block";
            document.getElementById("create").style.display = "block";
            document.getElementById("fSupplier").value = "<%=supplierCode%>";
            document.getElementById("fBuyer").value = "<%=factorBuyer%>";
            document.getElementById("pcal2").value = "<%=factorDate%>";
            document.getElementById("fOff").value = "<%=factorOff%>";
            document.getElementById("fNum").value = "<%=factorNumber%>";
            document.getElementById("fAll").value = "<%=factorAll%>";
            document.getElementById("fID").value = "<%=factorCode%>";
</script>

</body>
</html>

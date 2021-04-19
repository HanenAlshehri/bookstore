<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                 <%@ include file="Common.jsp" %>
      <%@ page import="store.user.Data" %>
          <%@ page import="store.user.CheckOut" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="container">
		<div style="text-align:center">
<%
 CheckOut order =Data.getOrder( Integer.parseInt( request.getParameter("ordercode")));

String s = "<h1> Code :"+order.getOrderCode()+"</h1>";
s+="<h2>Date :"+order.getDate()+"</h2>";
s+="<h2> Full Name :"+order.getFirstName()+" "+order.getLastName()+"</h2>";
s+="<h2> Card Number :**********"+order.getcardNumber().substring(order.getcardNumber().length() - 4)+"</h2>";
s+="<h2> Email :"+order.getEmail()+"</h2>";
s+="<h2> Phone :"+order.getPhone()+"</h2>";
s+="<h2> Address :"+order.getAddress()+"</h2>";
s+="<h2> book name :"+order.getbookName()+"</h2>";
s+="<h2> price :"+order.getPrice()+"</h2>";
out.print(s );

%>
 
</div>
</div>
</div>
 
</body>
</html>
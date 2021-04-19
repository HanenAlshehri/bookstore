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
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Orders</h3>
			<hr>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
					    <th>Order ID</th>
						<th>Name</th>
						<th>Book Name</th>
						<th>Price </th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<%
 
				if (request.getParameter("action") != null) {
					if(request.getParameter("action").equals("delete")){
					boolean result=	Data.deleteOrder(Integer.parseInt( request.getParameter("ordercode")));
				}
				}
				
				 for (CheckOut order : Data.orders) 
			        {
					 String s ="<tr>";
					 s+="<td>"+order.getOrderCode()+"</td>";
					 s+="<td>"+order.getFirstName()+" "+order.getLastName()+" </td>";
					 s+="<td>"+order.getbookName()+" </td>";
					 s+="<td>"+order.getPrice()+" </td>";
					 s+="<td><a href='/BookStore/ShowOrder.jsp?ordercode="+order.getOrderCode()+"' class='btn btn-success'>Show</button>";
					 s+=" <a href='/BookStore/Orders.jsp?action=delete&ordercode="+order.getOrderCode()+"'  class='btn btn-btn-warning'>Delete</a></td> ";
					 s+="</tr>";
					 out.print(s);
			        }
			 
			 
				
				%>
 
				</tbody>

			</table>
		</div>
	</div>
	   <%@ include file="Footer.jsp" %>
</body>
</html>
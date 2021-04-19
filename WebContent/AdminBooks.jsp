<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ include file="Common.jsp" %>
      <%@ page import="store.user.Data" %>
          <%@ page import="store.user.Book" %>
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
			<h3 class="text-center">List of Books</h3>
			<hr>
			<div class="container text-left">

				<a href="AddBook.jsp"
					class="btn btn-success">Add Book</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Image</th>
						<th>Title</th>
						<th>Description</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<%
 
				if (request.getParameter("action") != null) {
					// out.println("delete");
					if(request.getParameter("action").equals("delete")){
					//	 out.println("true");
					boolean result=	Data.deleteBook(request.getParameter("book"));
					// out.println(result);
				}
				}
				
				 for (Book book : Data.books) 
			        {
					 String s ="<tr>";
					 s+="<td> <img src='"+book.getImage()+"'/> </td>";
					 s+="<td>"+book.getTitle()+" </td>";
					 s+="<td>"+book.getDescription()+" </td>";
					 s+="<td><a href='/BookStore/UpdateBook.jsp?bookname="+book.getTitle()+"' class='btn btn-success'>Update</button>";
					 s+=" <a href='/BookStore/AdminBooks.jsp?action=delete&book="+book.getTitle()+"'  class='btn btn-btn-warning'>Delete</a></td> ";
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
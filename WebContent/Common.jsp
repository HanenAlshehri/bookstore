<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList"%>
 <%@ page import="java.util.List,store.user.User" %>
 <%@ page import="store.user.Data" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> </title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand navbar-light bg-light">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="Index.jsp">Home <span class="sr-only">(current)</span></a>
      <% 
      if(Data.getMainUser()==null){
    	  String s=" <a class='nav-item nav-link' href='/BookStore/Login.jsp'>Login</a>";
    			  s+=" <a class='nav-item nav-link' href='/BookStore/SignUp.jsp'>Sign Up</a>";
    	  out.print(s);
      }
      else{
      String s=" <a class='nav-item nav-link' href='/BookStore/LogOut.jsp'>LogOut</a>";
	  out.print(s);
      }
      %>
            <%  
            if(Data.getMainUser()!=null&&Data.getMainUser().getIsAdmin()){
    	  String s2=" <a class='nav-item nav-link' href='/BookStore/AddBook.jsp'>Add Book</a>";
    			  s2+=" <a class='nav-item nav-link' href='/BookStore/AdminBooks.jsp'>Books</a>";
    			  s2+=" <a class='nav-item nav-link' href='/BookStore/Orders.jsp'>Orders</a>";
    	  out.print(s2);
    	 
      }
      %>
 
    </div>
  
</nav>
 
</body>
</html>
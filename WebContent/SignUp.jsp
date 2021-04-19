<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="Common.jsp" %>
      <%@ page import="store.user.Data" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<h2>User Register Form</h2>
		<%
		if (request.getParameter("submit") != null) {
		    // ...
	   //ArrayList<User> users2 = new ArrayList<User>();
	    String firstName=	request.getParameter("firstName");
		String lastName=	request.getParameter("lastName");
		String username=	request.getParameter("username");
		String password=	request.getParameter("password");
		//var isExist =users.stream().filter(carnet -> username.equals(carnet.getUsername())).findFirst().orElse(null);
	//	boolean isExist  = Data.users.stream().anyMatch(p -> p.getUsername().equals(username));
		if(!Data.IsUserExist(username)){
			Data.AddUser(new User(firstName,lastName,username,password));
		  	  response.sendRedirect("/BookStore/Index.jsp");
		}
		else{
			out.write("<p style='color:red'>User Already Exist</p>");
 
		}
		}
		%>
	<div class="col-md-6 col-md-offset-3">
 
			
				<form action="SignUp.jsp" method="post">

					<div class="form-group">
						<label for="uname">First Name:</label> <input type="text"
							class="form-control" id="uname" placeholder="First Name"
							name="firstName" required>
					</div>

					<div class="form-group">
						<label for="uname">Last Name:</label> <input type="text"
							class="form-control" id="uname" placeholder="last Name"
							name="lastName" required>
					</div>

					<div class="form-group">
						<label for="uname">User Name:</label> <input type="text"
							class="form-control" id="username" placeholder="User Name"
							name="username" required>
					</div>

					<div class="form-group">
						<label for="uname">Password:</label> <input type="password"
							class="form-control" id="password" placeholder="Password"
							name="password" required>
					</div>

					<button type="submit" name="submit" class="btn btn-primary">Submit</button>
					<hr/>
				<h5>OR</h5>
 
                    <a  href="/BookStore/Login.jsp" class="btn btn-primary">Login</a>
				</form>
			</div>
		</div>
		   <%@ include file="Footer.jsp" %>
</body>
</html>
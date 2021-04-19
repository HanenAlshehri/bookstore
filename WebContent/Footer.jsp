<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List,store.user.User" %>
 <%@ page import="store.user.Data" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<style>
footer.page-footer a {
    color: #fff;
}
.list-unstyled {
    padding-left: 0;
    list-style: none;
}
footer.page-footer {
    bottom: 0;
    color: #fff !important;
}
footer.page-footer .footer-copyright {
    overflow: hidden;
    color: rgba(255,255,255,0.6);
    background-color: rgba(0,0,0,0.2);
}
.blue {
    background-color: #2196f3 !important;
}
</style>
<footer style="margin-top: 10%;" class="page-footer font-small blue pt-4">

  <div class="container-fluid text-center text-md-left">

    <div class="row">

      <div class="col-md-6 mt-md-0 mt-3">

        <h5 class="text-uppercase">BookStore Website</h5>
        <p>Website where you can find all what you need to boost your knowledge in one place </p>

      </div>

      <hr class="clearfix w-100 d-md-none pb-3">

      <div class="col-md-3 mb-md-0 mb-3">

        <h5 class="text-uppercase">Links</h5>

        <ul class="list-unstyled">
         <% 
      if(Data.getMainUser()==null){
    	  String s="<li> <a class='nav-item nav-link' href='/BookStore/Login.jsp'>Login</a> </li>";
    			  s+=" <li><a class='nav-item nav-link' href='/BookStore/SignUp.jsp'>Sign Up</a> </li>";
    	  out.print(s);
      }
      else{
      String s="<li> <a class='nav-item nav-link' href='/BookStore/LogOut.jsp'>LogOut</a> </li>";
	  out.print(s);
      }
      %>
            <%  
            if(Data.getMainUser()!=null&&Data.getMainUser().getIsAdmin()){
    	  String s2="<li> <a class='nav-item nav-link' href='/BookStore/AddBook.jsp'>Add Book</a> </li>";
    			  s2+="<li> <a class='nav-item nav-link' href='/BookStore/AdminBooks.jsp'>Books</a> </li>";
    			  s2+="<li> <a class='nav-item nav-link' href='/BookStore/Orders.jsp'>Orders</a> </li>";
    	  out.print(s2);
    	 
      }
      %>
 
        </ul>

      </div>

      <div class="col-md-3 mb-md-0 mb-3">
<img width="150px" alt="" src="img/bfooter.png">
      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <div class="footer-copyright text-center py-3">� 2021 Copyright:
    <a href="https://mdbootstrap.com/"> BookStore</a>
  </div>

</footer>

</body>
</html>
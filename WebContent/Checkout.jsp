<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="Common.jsp" %>
      <%@ page import="store.user.Data" %>
       <%@ page import="store.user.Book" %>
        <%@ page import="java.util.Date" %>
             <%@ page import="store.user.CheckOut" %>
        <%@ page import=" java.text.SimpleDateFormat" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<h2>Checkout</h2>
		<%
		Book book = null;
 

 
 
		if (request.getParameter("CObook") != null){
			book=Data.getBook(request.getParameter("CObook"));
		}
		else{
			out.print(request.getParameter("bookName"));
			if (request.getParameter("bookName") != null){
			book=Data.getBook(request.getParameter("bookName"));
			}
		}
		if (request.getParameter("submit") != null) {

	    String firstName=	request.getParameter("firstName");
		String lastName=	request.getParameter("lastName");
		String Email=	request.getParameter("Email");
		String Address=	request.getParameter("Address");
		String Phone=	request.getParameter("Phone");
		String cardNumber=	request.getParameter("cardNumbere");
	    double Price=	book.getPrice();
		String bookName= 	book.getTitle();
	System.out.print(firstName);
	System.out.print(lastName);
	System.out.print(Email);
	System.out.print(Address);
	System.out.print(Price);
	 
	 	Date date = new Date(System.currentTimeMillis());
	 boolean result=	Data.makeOrder(new CheckOut(cardNumber,firstName,lastName,Address,Phone,Email,bookName,Price,date));
 if(result){
 	  response.sendRedirect("/BookStore/Complete.jsp");
   }
 
 
		}
		%>
	<div class="col-md-6 col-md-offset-3">
 
			
				<form action="Checkout.jsp" method="post">
                 <input type="hidden" value="<%=book.getTitle() %>" name="CObook"/>
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
						<label for="Email">Email:</label> <input type="email"
							class="form-control" id="Email" placeholder="Email"
							name="Email" required>
					</div>

					<div class="form-group">
						<label for="Phone">Phone:</label> <input type="text"
							class="form-control" id="Phone" placeholder="Phone"
							name="Phone" required>
					</div>
					<div class="form-group">
						<label for="Address">Address:</label> <input type="text"
							class="form-control" id="Address" placeholder="Address"
							name="Address" required>
					</div>
			       <div class="form-group">
						<label for="bookName">bookName:</label> <input type="text"
							class="form-control" id="bookName" placeholder="book Name"
							value="<%if(book!=null) out.print(book.getTitle()); %>"
							name="" disabled required>
							<input type="hidden"
							value="<%if(book!=null) out.print(book.getTitle()); %>"
							name="bookName" disabled required>
					</div>
	                   <div class="form-group">
						<label for="Price">Price:</label> <input type="text"
							class="form-control" id="Price" placeholder="Price"
								value="<% if(book!=null) out.print(book.getPrice()); %>"
							  disabled  >
							<input type="hidden"
								value="<% if(book!=null) out.print(book.getPrice()); %>"
							name="Price" disabled required>
					</div>
				 
			 
				 <div id="credit-card" class="tab-pane fade show active pt-3">
                       
                                <div class="form-group"> <label for="username">
                                        <h6>Card Owner</h6>
                                    </label> <input type="text" name="username" placeholder="Card Owner Name" required class="form-control "> </div>
                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Card number</h6>
                                    </label>
                                    <div class="input-group"> <input type="text" name="cardNumbere" placeholder="Valid card number" class="form-control " required>
                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group"> <label><span class="hidden-xs">
                                                    <h6>Expiration Date</h6>
                                                </span></label>
                                            <div class="input-group"> <input type="number" placeholder="MM" name="" class="form-control" required> <input type="number" placeholder="YY" name="" class="form-control" required> </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                            </label> <input type="text" required class="form-control"> </div>
                                    </div>
                                </div>
                             
                       
                        </div>
                    </div> <!-- End -->
                 
                    	<button type="submit" name="submit" class="btn btn-primary ml-10">Checkout</button>
               
 
				</form>
			</div>
		</div>
		   <%@ include file="Footer.jsp" %>
</body>
</html>
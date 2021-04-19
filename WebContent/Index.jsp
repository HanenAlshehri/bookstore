<%@page import="java.util.stream.Collector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
             <%@ include file="Common.jsp" %>
      <%@ page import="store.user.Data" %>
          <%@ page import="store.user.Book" %>
              <%@ page import=" java.util.ArrayList" %>
                        <%@ page import="java.util.stream.Collectors" %>
             
         
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
.masthead {
    height: 30vh;
    min-height: 280px;
  background-image: url('img/bk.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
.hed{
    font-weight: 500!important;
    color: white;
}

</style>
<header class="masthead">
  <div class="container h-100">
    <div class="row h-100 align-items-center">
      <div class="col-12 text-center">
        <h1 class="hed">Welcome to BookSre</h1>
      </div>
    </div>
  </div>
</header>
<div class="container mt-4">
<div class="row">
 
    <div class="col-sm-8 mb-3">
     
      <input type="text" id="myFilter" class="form-control" onkeyup="myFunction()" placeholder="Search for names..">
    </div>
</div>
    <form class="mb-4" action="Index.jsp" method="get">
  <h6 class="font-weight-bold mb-3">Price</h6>
<div class="row">
  <div class="form-check col-3">
    <input
      value="0-25"
      type="radio"
      class="filter-option form-check-input"
      id="under25"
      name="price"
    />
    <label
      class="form-check-label small text-uppercase card-link-secondary"
      for="under25"
      >Under $25</label
    >
  </div>
  <div class="form-check col-3">
    <input
     value="25-50"
      type="radio"
      class="filter-option form-check-input"
      id="2550"
      name="price"
    />
    <label
      class="form-check-label small text-uppercase card-link-secondary"
      for="2550"
      >$25 to $50</label
    >
  </div>
  <div class="form-check  col-3">
    <input
    value="50-100"
      type="radio"
      class="filter-option form-check-input"
      id="50100"
      name="price"
    />
    <label
      class="form-check-label small text-uppercase card-link-secondary"
      for="50100"
      >$50 to $100</label
    >
  </div>
  <div class="form-check col-3">
    <input
      value="100-100000000"
      type="radio"
      class="filter-option form-check-input"
      id="100200"
      name="price"
    />
    <label
      class="form-check-label small text-uppercase card-link-secondary"
      for="100200"
      >upove $100</label
    >
  </div>
 
  
  <button class="btn" type="submit">filter</button>
</div>
</form>
 
 
 <div class="row" id="myItems">
				
 
				<%
  
				if (request.getParameter("price") != null) {
					String[] values = request.getParameter("price").split("-");
				     double from = Double.parseDouble(values[0]);
				     double to = Double.parseDouble(values[1]);
					
					 for (Book book : Data.getFilter(from, to)) 
				        {
						 String s ="<div class='col-auto mb-3'><div class='card' style='width: 25 rem;'>";
						 s+="<img class='card-img-top' src='"+book.getImage()+"' alt='Card image cap'>";
						 s+="<div class='card-body'>";
						 s+= "<h5 class='card-title'>"+book.getTitle()+"</h5>";
						 s+= "<p class='card-text'>"+book.getDescription()+"</p>";
						 s+= "<h1 class='card-text pricing-card-title'>$"+book.getPrice()+"</h1>";
						 s+= " <a href='/BookStore/Checkout.jsp?CObook="+book.getTitle()+"'  class='btn btn-primary'>Buy</a>";
						 s+= " </div>";
						 s+= " </div>";
						 s+= " </div>";
						 out.print(s);
				        }
				}
				else{
					 for (Book book : Data.books) 
				        {
						 String s ="<div class='col-auto mb-3'><div class='card' style='width: 25 rem;'>";
						 s+="<img class='card-img-top' src='"+book.getImage()+"' alt='Card image cap'>";
						 s+="<div class='card-body'>";
						 s+= "<h5 class='card-title'>"+book.getTitle()+"</h5>";
						 s+= "<p class='card-text'>"+book.getDescription()+"</p>";
						 s+= "<h1 class='card-text pricing-card-title'>$"+book.getPrice()+"</h1>";
						 s+= " <a href='/BookStore/Checkout.jsp?CObook="+book.getTitle()+"'  class='btn btn-primary'>Buy</a>";
						 s+= " </div>";
						 s+= " </div>";
						 s+= " </div>";
						 out.print(s);
				        }
				 
				}
				
			 
				
				%>
 </div>
				</div>
				<script>
				function myFunction() {
				    var input, filter, cards, cardContainer, h5, title, i;
				    input = document.getElementById("myFilter");
				    filter = input.value.toUpperCase();
				    cardContainer = document.getElementById("myItems");
				    cards = cardContainer.getElementsByClassName("card");
				    for (i = 0; i < cards.length; i++) {
				        title = cards[i].querySelector(".card-body h5.card-title");
				        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
				            cards[i].style.display = "";
				        } else {
				            cards[i].style.display = "none";
				        }
				    }
				}
		 
				</script>
				             <%@ include file="Footer.jsp" %>
</body>
</html>
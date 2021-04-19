<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
             <%@ include file="Common.jsp" %>
      <%@ page import="store.user.Data" %>
      <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
 <%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import = "java.nio.file.Paths" %>
 
   <%@ page import="store.user.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<%
 
 Book Updatedbook =null;
if (request.getParameter("bookname") != null) {
	Updatedbook=Data.getBook(request.getParameter("bookname"));
}


String contentType = request.getContentType();
 
if (contentType!=null &&contentType.contains("form-data")) {
 
 
        try {
        	
        	Part filePart = request.getPart("file"); //  
        	String fileName = Data.getSubmittedFileName(filePart);
                        String title= request.getParameter("title");
                        String Description = request.getParameter("discrtiption");
                        String author = request.getParameter("author");
                        double price= Double.parseDouble( request.getParameter("price"));
                    
                            boolean result =  Data.updateBook(request.getParameter("OldTitle"),new Book(title,Description,fileName,author,price));
                            if(result){
                                out.println("<h1 style='color:green'>Success</h1> ");
                              
                              	  response.sendRedirect("/BookStore/AdminBooks.jsp");
                              }
                        
                            else{
                            	out.println("<h1 style='color:red'>Failed</h1> ");
                            }
                      
                  
               
      
        
        } catch (Exception e) {
        	 System.out.println(e);
        }
	 
   } else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
      <h3>File Upload:</h3>
      Select a file to upload: <br />
      <form action = "UpdateBook.jsp" method = "post"
         enctype = "multipart/form-data">
         <input type="hidden"
							value="<%if(request.getParameter("bookname")!=null)out.print(request.getParameter("bookname")); %>"
							name="OldTitle" required>
					<div class="form-group">
						<label for="title">title:</label> <input type="text"
							class="form-control" id="uname" placeholder="title"
							value="<%if(Updatedbook!=null)out.print(Updatedbook.getTitle()); %>"
							name="title" required>
					</div>
					
					<div class="form-group">
						<label for="discrtiption">Description:</label> <input type="text"
							class="form-control" id="uname" placeholder="discrtiption"
								value="<% if(Updatedbook!=null)out.print(Updatedbook.getDescription());%>"
							name="discrtiption" required>
					</div>
					
					<div class="form-group">
						<label for="author">Author:</label> <input type="text"
							class="form-control" id="uname" placeholder="author"
									value="<%if(Updatedbook!=null)out.print(Updatedbook.getAuthor());%>"
							name="author" required>
					</div>
					<div class="form-group">
						<label for="price">Price:</label> <input type="text"
							class="form-control" id="uname" placeholder="price"
								value="<%if(Updatedbook!=null)out.print(Updatedbook.getPrice());%>"
							name="price" required>
					</div>
					<div class="form-group">
         <input type = "file" name = "file" size = "50"  />
         <br />
          <br />
	<button type="submit" name="submit" class="btn btn-primary">Submit</button>
					</div>

      </form>
      </div>
         <%@ include file="Footer.jsp" %>
   </body>
</html>
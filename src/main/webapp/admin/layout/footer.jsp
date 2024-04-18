<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <script src="http://localhost:8080/ucst-library/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="http://localhost:8080/ucst-library/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://localhost:8080/ucst-library/assets/js/sidebarmenu.js"></script>
    <script src="http://localhost:8080/ucst-library/assets/js/app.min.js"></script>
    <script src="http://localhost:8080/ucst-library/assets/libs/simplebar/dist/simplebar.js"></script>
   	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <%
	 String message = (String)session.getAttribute("success");
 	 session.removeAttribute("success");
 	 if(message!=null){
 		 
 	 
 %>
   <script>
       $(document).ready(function(){
    	   Swal.fire({
    		   position: "top-end",
    		   icon: 'success',
    		   title: "<%=message%>",
    		   showConfirmButton: false,
    		   timer: 1500
    		 });
       })
   </script>
<%} %>

<%
	String error = (String)session.getAttribute("error");
	if(error!=null){
%>
    <script>
        $(document).ready(function(){
            swal({
                title: ",
                text: "<%=error%>",
                icon: "error",
            });  
        })
    </script>
<%}%>
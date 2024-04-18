<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="utils.Path" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
   <%
      pageContext.setAttribute("test_books_list_id", Integer.parseInt(request.getParameter("id")));
      System.out.println(request.getParameter("id"));
   %>

	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
	   url = "jdbc:mysql://localhost/library"
	   user = "root"  password = "root"/>
	<sql:query dataSource = "${snapshot}" var="textBooks">
	SELECT * from test_books_list where id=?;
	<sql:param value = "${test_books_list_id}" />
	</sql:query>
	
	<c:set var="textBook" value="${textBooks.rows[0]}"></c:set>
      <jsp:include page="../layout/sidebar.jsp" /> 
      
      <!--  Main wrapper -->
      
      <div class="body-wrapper">
      
        <!--  Header Start -->
        <jsp:include page="../layout/header.jsp"/>
        <!--  Header End -->
        
                  <div class="container-fluid">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title fw-semibold mb-4 text-info">
                 Edit Test book list
                </h5>
                <div class="card">
                  <div class="card-body">
                    <form action="<%=Path.getRoute("admin/test-book-list/update")%>" method="post">
                      <div class="mb-3 col-6 col-md-12">
                        <label for="name" class="form-label"
                          >Code</label
                        >
                        <input
                        	type="text"
                        	class="d-none"
                        	name="test_book_id"
                        	id="test_book_id"
                        	value="<%=Integer.parseInt(request.getParameter("id"))%>" 
                        />
                        <input
                          type="text"
                          class="form-control"
                          name="code"
                          id="code"
                          value="${textBook.code }"
                        />
                      </div>
                      <button type="submit" class="btn btn-primary">
                        Update
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        
      </div>
    </div>
    
     <jsp:include page="../layout/footer.jsp"/>

</body>
</html>
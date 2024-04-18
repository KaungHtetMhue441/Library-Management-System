<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
    <%@ page import="utils.Path,java.util.List,dao.Book" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
	 
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
     url = "jdbc:mysql://localhost/library"
     user = "root"  password = "root"/>
    <sql:query dataSource = "${snapshot}" var = "categories">
       SELECT * from categories;
    </sql:query>
    <%
    String search = request.getParameter("search");
	search = search==null?"":search;
   	pageContext.setAttribute("catetory_id",request.getParameter("category_id"));
   	List<Book> books = (List<Book>)request.getAttribute("books"); 
   	pageContext.setAttribute("books", books.toArray());
    %>
    
      <jsp:include page="../layout/sidebar.jsp" > 
	      	<jsp:param name="book-menu" value="active"/>
      </jsp:include>
      <!--  Main wrapper -->
      
      <div class="body-wrapper">
      
        <!--  Header Start -->
        <jsp:include page="../layout/header.jsp"/>
        <!--  Header End -->
        
           <div class="container-fluid">
            <div class="row justify-content-between mb-3">
              <div class="col-9">
                <form class="row gap-3" action="">
                  <div class="col-auto">
                    <input type="text" class="form-control" name="search"
                    value="<%=search%>" id="search"
                    placeholder="Search....">
                  </div>
                  <div class="col-auto">
                    <select name="category_id" class="from-select form-control" id="">
                      <option selected value="">Choose category</option>
                      <c:forEach var="row" items="${categories.rows}">
                      <option value="${row.category_id}" ${row.category_id==category_id?'selected':''}>
                        <c:out value="${row.name}" />
                      </option>
                    </c:forEach>
                    </select>
                  </div>
                  <div class="col-auto">
                    <button type="submit" class="btn btn-outline-secondary btn-md rounded">
                      Search
                    </button>
			        <a href="/ucst-library/admin/book/all" class="btn btn-outline-secondary ms-2">clear</a>

                  </div>
                </form>
              </div>
              <div class="col-3">
                <a class="btn btn-outline-primary float-end" href="create.jsp">
                  <i class="fa fa-plus-circle"></i>
                  Add New
                </a>
              </div>
            </div>
            <div class="card">
              <div class="card-body pt-2">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Book's Title</th>
                      <th>Author</th>
                      <th>Category</th>
                      <th>Status</th>
                      <th>Description</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach var="book" items="${pageScope.books}">
                  <tr>
                  	<td>
                  	 <img
                          src="${book.getImageUrl()}"
                          class="rounded-circle"
                          width="35"
                          height="35"
                          alt=""
                          srcset=""
                     />
                  	</td>
                  	<td>
                  		<c:out value="${book.getTitle()}"></c:out>
                  	</td>
                  	<td>
                  		<c:out value="${book.getAuthorName()}"></c:out>
                  	</td>
                  	<td>
                  		<c:out value="${book.getCategoryName() }"></c:out>
                  	</td>
                  	<td>
                  		<c:out value="${book.is_borrowed }"></c:out>
                  	</td>
                  	<td>
                  		<c:out value="${book.getDescription()}"></c:out>
                  	</td>
                  	
                  	<td>
                  	 <div class="row m-0 p-0">
                          <div class="col-3">
                            <a href="<%=Path.getRoute("admin/book/edit.jsp")%>?id=${book.getId()}">
                              <i class="fa fa-edit fa-lg text-indigo"></i>
                            </a>
                          </div>
                          <div class="col-3">
                          	<form action="<%=Path.getRoute("admin/book/delete")%>?id=${book.getId()}" method="post">
	                          	<button type="submit" class="border-0" onclick="return confirm('Are you sure to delete!')">
	                              <i class="fa fa-trash fa-lg text-danger"></i>
	                            </button>
                          	</form>
                          </div>
                      </div>
                  	</td>
                  	
                  </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        
      </div>
    </div>
    
     <jsp:include page="../layout/footer.jsp"/>

</body>
</html>
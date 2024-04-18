<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="utils.Path" %>
 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
     
      
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/library"
         user = "root"  password = "root"/>
 
       <%
	      pageContext.setAttribute("book_id", Integer.parseInt(request.getParameter("id")));
       %>
      <sql:query dataSource = "${snapshot}" var = "authors">
         SELECT * from authors;
      </sql:query>
      
      <sql:query dataSource = "${snapshot}" var = "categories">
         SELECT * from categories;
      </sql:query>
      <sql:query dataSource = "${snapshot}" var="books">
         SELECT * from  books where book_id=?;
         <sql:param value = "${book_id}" />
      </sql:query>
      
      <c:set var="book" value="${books.rows[0]}"></c:set>
      
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
                  Add New Book
                </h5>
                <div class="card">
                  <div class="card-body">
                    <form action="<%=Path.getRoute("admin/book/update")%>?id=${book.book_id}" method="post" enctype="multipart/form-data">
                      <div class="row">
                        <div class="col-12 mb-3">
                          <div
                            class="profile-container border border-cyan shadow shadow-2xl mx-auto mb-3 overflow-hidden"
                          >
                            <img
                              src="<%=Path.getImagePath("/books/") %>${book.image}"
                              id="image_placeholder"
                              class="w-100"
                              alt="default-profile-image"
                            />
                          </div>
                        </div>
                        <div class="mb-3 col-6">
                          <label for="file" class="form-label"
                            >Book Image</label
                          >
                          <input
                            class="form-control"
                            name="file"
                            type="file"
                            id="file"
                          />
                          <input 
                          	type="text"
                          	name="image"
                          	value="${book.image }"
                          	class="d-none"
                          	/>
                          	<input 
                          	type="text"
                          	name="image_name"
                          	value="${book.image }"
                          	class="d-none"
                          	/>
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="title" class="form-label"
                            >Book's Title</label
                          >
                          <input
                            type="text"
                            class="form-control"
                            name="title"
                            id="title"
                            value="${book.title}"
                          />
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="code" class="form-label"
                            >Book's Code</label
                          >
                          <input
                            type="text"
                            class="form-control"
                            name="code"
                            id="code"
                            value="${book.code}"
                          />
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="author_id" class="form-label"
                            >Author's Name</label>
                          <select
                            class="form-control form-select"
                            name="author_id"
                            id="author_id"
                          >
	                          <c:forEach var="row" items="${authors.rows}">
	                          	<option value="${row.author_id}" ${row.author_id==book.author_id?'selected':''}>
	                              <c:out value="${row.name}" />
	                            </option>
	                          </c:forEach>
                          </select>
                        </div>
                        
                        <div class="mb-3 col-12">
                          <label for="category_id" class="form-label"
                            >Category</label
                          >
                           <select
                            class="form-control form-select"
                            name="category_id"
                            id="category_id"
                          >
                          <c:forEach var="row" items="${categories.rows}">
                          	<option value="${row.category_id}" ${row.category_id==book.category_id?'selected':''}>
                              <c:out value="${row.name}" />
                            </option>
                          </c:forEach>
                          </select>
                        </div>
                        <div class="mb-3 col-12">
                          <label for="description" class="form-label"
                            >Description</label
                          >
                          <textarea
                            class="form-control"
                            name="description"
                            id="description"
                          ><c:out value="${book.description}"></c:out></textarea>
                        </div>
                        <div>
                          <button type="submit" class="btn btn-primary">
                            Update
                          </button>
                        </div>
                      </div>
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
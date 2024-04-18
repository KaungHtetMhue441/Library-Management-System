<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page import="utils.Path" %>
      
      <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
		<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
		<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
	 
	      
      
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/library"
         user = "root"  password = "root"/>
 
      <sql:query dataSource = "${snapshot}" var = "authors">
         SELECT * from authors;
      </sql:query>
      
      <sql:query dataSource = "${snapshot}" var = "categories">
         SELECT * from categories;
      </sql:query>
      
      <%
      	pageContext.setAttribute("author_id", 1);
      	pageContext.setAttribute("category_id", 1);
      %>

          
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
                    <form action="<%=Path.getRoute("admin/book/create") %>" class="" method="post" enctype="multipart/form-data">
                      <div class="row">
                        <div class="col-12 mb-3">
                          <div
                            class="profile-container border border-cyan shadow shadow-2xl mx-auto mb-3 overflow-hidden"
                          >
                            <img
                              src="../assets/images/person-placeholder.png"
                              id="image_placeholder"
                              class="w-100"
                              alt="default-profile-image"
                            />
                          </div>
                        </div>
                        <div class="mb-3 col-6">
                          <label for="image" class="form-label"
                            >Book Image</label
                          >
                          <input
                            class="form-control"
                            name="file"
                            type="file"
                            id="file"
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
                          />
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="artist_name" class="form-label"
                            >Author's Name</label
                          >
                          
                          <select
                            class="form-control form-select"
                            name="author_id"
                            id="author_id"
                          >
                          <c:forEach var="row" items="${authors.rows}">
                          	<option value="${row.author_id}" ${row.author_id==author_id?'selected':'' }>
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
                          	<option value="${row.category_id}" ${row.category_id==category_id?'selected':''}>
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
                          ></textarea>
                        </div>
                        <div>
                          <button type="submit" class="btn btn-primary">
                            Create
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
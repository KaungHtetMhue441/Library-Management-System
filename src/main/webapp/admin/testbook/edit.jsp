<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page import="utils.Path" %>
		<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
	 
	   <%
	      pageContext.setAttribute("test_book_id", Integer.parseInt(request.getParameter("id")));
       %>
      
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/library"
         user = "root"  password = "root"/>
 
      <sql:query dataSource = "${snapshot}" var = "authors">
         SELECT * from authors;
      </sql:query>
      
      <sql:query dataSource = "${snapshot}" var = "categories">
         SELECT * from categories;
      </sql:query>
      
      <sql:query dataSource = "${snapshot}" var="testBooks">
         SELECT * from  test_books where id=?;
      	<sql:param value = "${test_book_id}" />
      </sql:query>
      
      <c:set var="testBook" value="${testBooks.rows[0]}"></c:set>
      
      
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
                    <form action="<%=Path.getRoute("admin/testbook/update")%>?id=${testBook.id}" class="" method="post" enctype="multipart/form-data">
                      <div class="row">
                        <div class="col-12 mb-3">
                          <div
                            class="profile-container border border-cyan shadow shadow-2xl mx-auto mb-3 overflow-hidden"
                          >
                            <img
                              src="<%=Path.getImagePath("/testbooks/")%>${testBook.image}"
                              id="image_placeholder"
                              class="w-100"
                              alt="default-profile-image"
                            />
                          </div>
                        </div>
                        <div class="mb-3 col-6">
                          <label for="image" class="form-label"
                            >Book Image</label>
                          <input
                            class="form-control"
                            name="file"
                            type="file"
                            id="file"
                          />
                          <input
                          	type="text"
                          	name="image"
                          	class="d-none"
                          	value="${testBook.image}"
                          />
                          <input
                          	type="text"
                          	name="image_name"
                          	class="d-none"
                          	value="${testBook.image_name }"
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
                            value="${testBook.title}"
                          />
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="year" class="form-label"
                            >Year</label>
                          <select 
                          	name="year"
                          	id="year"
                          	class="form-select form-control"
                          >
                          	<option >Choose</option>
                          	<option value="First year" ${testBook.year.equals("First year")?'selected':''}>First year</option>
                            <option value="Second year" ${testBook.year.equals("Second year")?'selected':''}>Second year</option>
                            <option value="Third year" ${testBook.year.equals("Third year")?'selected':''}>Third year</option>
                            <option value="Fourth year" ${testBook.year.equals("Forth year")?'selected':''}>Fourth year</option>
                            <option value="Fith year" ${testBook.year.equals("Fifth year")?'selected':''}>Fifth year</option>
                          </select>
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="semester" class="form-label"
                            >Semester</label
                          >
                          <select
                            class="form-control form-select"
                            name="semester"
                            id="semester"
                          >
                          	<option >Choose something</option>
                            <option value="First Semester" ${testBook.semester.equals("First Semester")?'selected':''}>First Semester</option>
                            <option value="Second Semester" ${testBook.semester.equals("Second Semester")?'selected':''}>Second Semester</option>
                          </select>
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="code" class="form-label"
                            >Book's Isbn</label>
                          <input
                            type="text"
                            class="form-control"
                            name="isbn"
                            id="isbn"
                            value="${testBook.isbn}"
                          />
                        </div>
                        <div class="mb-3 col-12 col-md-6">
                          <label for="author_id" class="form-label"
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
                          	<option>Choose Categories</option>
                          	<option value="${row.category_id}" ${row.category_id==testBook.category_id?'selected':''}>
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
                          ><c:out value="${testBook.description }"></c:out>
                          </textarea>
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
     <script>
     $('#file').change(function(){
         $('#image_placeholder').prop('src',window.URL.createObjectURL(this.files[0]));
         	console.log(window.URL.createObjectURL(this.files[0]));
     	})
   	 
     </script>
</body>
</html>
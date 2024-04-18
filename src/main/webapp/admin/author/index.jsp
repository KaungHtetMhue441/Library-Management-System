
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page import="java.util.List,dao.Author,utils.Path,java.util.ArrayList"%>


<%
String search = request.getParameter("search");
search = search==null?"":search;
List<Author> authors=(List<Author>) request.getAttribute("authors");
pageContext.setAttribute("authors", authors.toArray());
%>
      <!-- Sidebar Start -->
      
      <jsp:include page="../layout/sidebar.jsp" > 
	      	<jsp:param name="author-menu" value="active"/>
      </jsp:include>
      
      <!--  Sidebar End -->
      <!--  Main wrapper -->
      <div class="body-wrapper">
        <!--  Header Start -->
        <jsp:include page="../layout/header.jsp"/>
        <!--  Header End -->
        <div class="container-fluid">
          <div class="container-fluid">
            <div class="row justify-content-between mb-3">
			  <div class="col-9">
			    <form class="row gap-3" action="">
			      <div class="col-auto">
			        <input
			          type="text"
			          class="form-control"
			          name="search"
			          value="<%=search%>"
			          id="search"
			          placeholder="Search...."
			        />
			      </div>
			      <div class="col-auto">
			        <button type="submit" class="btn btn-outline-secondary btn-md rounded">
			          Search
			        </button>
			        <a href="/ucst-library/admin/author/all" class="btn btn-outline-secondary ms-2">clear</a>

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
              <div class="card-body p-0 px-3">
                <table class="table table-hover table-responsive">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Author's name</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="author" items="${pageScope.authors}">
                  	<tr>
                  		<td>
                  	      <img
                          src="${author.getImageUrl()}"
                          class="rounded-circle"
                          width="35"
                          height="35"
                          alt=""
                          srcset=""
                        />
                      </td>
                      <td>${author.name}</td>
                      <td>
                        <div class="row m-0 p-0">
                          <div class="col-3">
                            <a href="<%=Path.getRoute("admin/author/edit")%>?id=${author.id}">
                              <i class="fa fa-edit fa-lg text-indigo"></i>
                            </a>
                          </div>
                          <div class="col-3">
                          <form action=<%=Path.getRoute("admin/author/delete")%> method="post">
                          	<input type="text" name="id" value="${author.id}" class="d-none"/>
                            <button type="submit" class="border-0" onclick="return confirm('Are you sure to delete!')">
                              <i class="fa fa-trash fa-lg text-danger"></i>
                            </button>
                            </form>
                          </div>
                        </div>
                      </td>
                    </tr>
<%-- 					<c:out value="${author.name}"/> <br> <br> --%>
					</c:forEach>
                  
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../layout/footer.jsp"/>


</body>
</html>

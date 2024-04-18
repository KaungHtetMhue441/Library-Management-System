<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
    <%@ page import="java.util.List,dao.Category,utils.Path" %>
    
    <%
    String search = request.getParameter("search");
	search = search==null?"":search;
	
	
 	List<Category> categories=(List<Category>) request.getAttribute("categories");
	pageContext.setAttribute("categories", categories.toArray());
	%>
    
      <jsp:include page="../layout/sidebar.jsp" > 
	      	<jsp:param name="category-menu" value="active"/>
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
			         <a href="/ucst-library/admin/category/all" class="btn btn-outline-secondary ms-2">clear</a>
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
              <div class="card-body">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>Category's name</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach var="category" items="${pageScope.categories}">
                    <tr>
                      <td>${category.getName()}</td>
                      <td>
                        <div class="row m-0 p-0">
                          <div class="col-3">
                            <a href="<%=Path.getRoute("admin/category/edit")%>?id=${category.getId()}">
                              <i class="fa fa-edit fa-lg text-indigo"></i>
                            </a>
                          </div>
                          <div class="col-3">
                          
                          <from action="<%=Path.getRoute("admin/category/delete")%>?id=${category.getId()}">
                            <button type="submit" class="border-0" onclick="return confirm('Are you sure to delete!')">
                              <i class="fa fa-trash fa-lg text-danger"></i>
                            </button>
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
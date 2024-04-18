<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="utils.Path,dao.Category" %>
    
    <%Category category = (Category)request.getAttribute("category"); %>
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
                 Edit Category
                </h5>
                <div class="card">
                  <div class="card-body">
                    <form action="<%=Path.getRoute("admin/category/update")%>?id=<%=category.getId()%>" method="post" enctype="multipart/form-data">
                      <div class="mb-3 col-6 col-md-12">
                        <label for="name" class="form-label"
                          >Category Name</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="name"
                          value="<%=category.getName() %>"
                          id="name"
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
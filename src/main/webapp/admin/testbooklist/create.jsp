<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="utils.Path" %>
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
                 Create Category
                </h5>
                <div class="card">
                  <div class="card-body">
                    <form action="<%=Path.getRoute("admin/text-book-list/create")%>" method="post">
                      <div class="mb-3 col-6 col-md-12">
                        <label for="name" class="form-label"
                          >Code</label
                        >
                        <input
                        	type="text"
                        	class="d-none"
                        	name="text_book_id"
                        	id="text_book_id"
                        	value="<%=Integer.parseInt(request.getParameter("id")) %>"
                        />
                        <input
                          type="text"
                          class="form-control"
                          name="code"
                          id="code"
                        />
                      </div>
                      <button type="submit" class="btn btn-primary">
                        Create
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
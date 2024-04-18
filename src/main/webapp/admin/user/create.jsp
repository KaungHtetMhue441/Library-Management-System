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
                 Create user
                </h5>
                <div class="card">
                  <div class="card-body">
                    <form action="<%=Path.getRoute("admin/user/create")%>" method="post">
                      <div class="mb-3 col-6 col-md-12">
                        <label for="name" class="form-label"
                          >User name</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="name"
                          id="name"
                        />
                      </div>
                      <div class="mb-3 col-6 col-md-12">
                        <label for="phone" class="form-label"
                          >Phone number</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="phone"
                          id="phone"
                        />
                      </div>
                      <div class="mb-3 col-6 col-md-12">
                        <label for="email" class="form-label"
                          >Email</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="email"
                          id="email"
                        />
                      </div>
                      <div class="mb-3 col-6 col-md-12">
                        <label for="type" class="form-label"
                          >User type</label
                        >
                        <select
                          class="form-control"
                          name="type"
                          id="type"
                        >   <option value="Other">Other</option>
                        	<option value="Student">Student</option>
                        	<option value="Teacher">Teacher</option>
                        	<option value="Staff">Staff</option>
                        </select>
                      </div>
                      <div class="mb-3 col-6 col-md-12">
                        <label for="cardno" class="form-label"
                          >Card number</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="cardno"
                          id="cardno"
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
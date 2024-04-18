<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="utils.Path" %>

   <%
      pageContext.setAttribute("id", Integer.parseInt(request.getParameter("id")));
   %>
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
	   url = "jdbc:mysql://localhost/library"
	   user = "root"  password = "root"/>
	<sql:query dataSource = "${snapshot}" var="users">
		SELECT * from users where id=?;
		<sql:param value = "${id}" />
	</sql:query>
		<c:set var="user" value="${users.rows[0]}"></c:set>

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
                 Update user
                </h5>
                <div class="card">
                  <div class="card-body">
                    <form action="<%=Path.getRoute("admin/user/update")%>?id=${user.id}" method="post">
                      <div class="mb-3 col-6 col-md-12">
                        <label for="name" class="form-label"
                          >User name</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="name"
                          id="name"
                          value="${user.name}"
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
                          value="${user.phone }"
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
                          value="${user.email}"
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
                        >   <option value="Other" ${user.type.equals("Other")?'selected':''}>Other</option>
                        	<option value="Student" ${user.type.equals("Student")?'selected':''}>Student</option>
                        	<option value="Teacher" ${user.type.equals("Teacher")?'selected':''}>Teacher</option>
                        	<option value="Staff" ${user.type.equals("Staff")?'selected':''}>Staff</option>
                        </select>
                      </div>
                      <div class="mb-3 col-6 col-md-12">
                        <label for="cardno" class="form-label"
                          >Card Number</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="cardno"
                          id="cardno"
                          value="${user.cardno }"
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
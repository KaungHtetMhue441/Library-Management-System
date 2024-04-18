<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="jakarta.tags.core" prefix="c"%>
	<%@ page import="java.util.List,dao.User,utils.Path,utils.Paginate,java.util.ArrayList"%>

    <%
	    String type = request.getParameter("code");
		type = type==null?"":type;
		String search = request.getParameter("search");
		search = search==null?"":search;
    	List<User> users = (List<User>)request.getAttribute("userList");
    	if(users!=null)
    	pageContext.setAttribute("users", users.toArray());
    	session.setAttribute("user-active", "active");
    %>
    
    
         
    
    
      <jsp:include page="../layout/sidebar.jsp" > 
	      	<jsp:param name="user-menu" value="active"/>
      </jsp:include>
      
      <!--  Main wrapper -->
      
      <div class="body-wrapper">
      
        <!--  Header Start -->
        <jsp:include page="../layout/header.jsp"/>
        <!--  Header End -->
           <div class="container-fluid">
            <div class="row justify-content-between mb-3">
            <div class="col-12 mb-3">
                <a class="btn btn-outline-primary float-end" href="create.jsp"> 
                  <i class="fa fa-plus-circle"></i>
                  Add New
               </a>
              </div>
              <div class="col-12">
                <form class="row gap-3" action="">
                  <div class="col-auto">
                    <input type="text" class="form-control" name="search" value="<%=search %>" id="search" placeholder="Search....">
                  </div>
                  <div class="col-auto">
                    <input type="text" class="form-control" name="type" value="<%=type %>" id="isbn" placeholder="Enter code..">
                  </div>
                  <div class="col-auto">
                    <button type="submit" class="btn btn-outline-secondary btn-md rounded">Search</button>
			        <a href="/ucst-library/admin/user/all" class="btn btn-outline-secondary ms-2">clear</a>
                  </div>
                </form>
              </div>
            </div>
            <div class="card">
              <div class="card-body p-2 pt-2">
                <table class="table table-hover table-striped">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Phone</th>
                      <th>Email</th>
                      <th>Type</th>
                      <th>Card no</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="user" items="${pageScope.users}">
                  	 <tr>
                      <td>
                      	<c:out value="${user.getName()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${user.getPhone()}"></c:out>
                      </td>
                      <td>
                      <c:out value="${user.getEmail()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${user.getType()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${user.getCardNo()}"></c:out>
                      </td>
                      <td>
                        <div class="row m-0 p-0">
                          <div class="col-3 me-3">
                            <a href="<%=Path.getRoute("admin/user/edit.jsp")%>?id=${user.getId()}">
                              <i class="fa fa-edit fa-lg text-indigo"></i>
                            </a>
                          </div>
                          <div class="col-3">
                            <form action="<%=Path.getRoute("admin/user/delete")%>?id=${user.getId()}" method="post">
                              <button type="submit" class="border-0" onclick="return confirm('Are you sure to delete!')"><i class="fa fa-trash fa-lg text-danger"></i></button>
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
            
            
            <div class="row">
             <%
            out.println(users==null?"hello":"");
            String uri=(String)request.getAttribute("uri");
            String queryString = (String)request.getAttribute("queryString");
           	String pag =request.getParameter("page");
            int requestedPage=1;
           	if(!(pag==null||pag=="")){
           		requestedPage = Integer.parseInt(pag);
           	}

           	String previousUri="";
           	String page1="";
           	String page2="";
           	String page3="";
           	String nextUri = "";
           	if(queryString!=null){
           		previousUri=uri+"&page="+(requestedPage-1);
           		page1=uri+"&page="+requestedPage;
           		page2=uri+"&page="+(requestedPage+1);
           		page3=uri+"&page="+(requestedPage+2);
           		nextUri=uri+"&page="+(requestedPage+1);
           	}else{
           		previousUri=uri+"?page="+(requestedPage-1);
           		page1=uri+"?page="+requestedPage;
           		page2=uri+"?page="+(requestedPage+1);
           		page3=uri+"?page="+(requestedPage+2); 
           		nextUri=uri+"?page="+(requestedPage+1);
           	}
           		
           	int totalPages = (int)request.getAttribute("totalPages");
           	System.out.println("totalPages "+totalPages);
           	if(requestedPage>=totalPages){
           		nextUri="";
           	}
           	if(requestedPage<=1){
           		previousUri="";
           	}
       


            %>
            <%if(totalPages>1){ %>
            <div class="row justify-content-between">
	            <nav aria-label="Page navigation" class="col-6">
				  <ul class="pagination col-4">
				    <li class="page-item <%=requestedPage<=1?"disabled":""%>"><a class="page-link" href="<%=previousUri%>">Previous</a></li>
				    
				    <li class="page-item"><a class="page-link <%=Paginate.lastIndex(page1)==requestedPage?"active":""%>" href="<%=page1%>"><%=requestedPage %></a></li>
            		<%if(requestedPage+1<=totalPages){ %>   
				    <li class="page-item"><a class="page-link <%=Paginate.lastIndex(page2)==requestedPage?"active":""%>" href="<%=page2%>"><%=requestedPage+1 %></a></li>
				    <%}
				    if(requestedPage+2<=totalPages){
				    %>
				    <li class="page-item"><a class="page-link <%=Paginate.lastIndex(page3)==requestedPage?"active":""%>" href="<%=page3%>"><%=requestedPage+2 %></a></li>
				    <%}%>
				    
				    <li class="page-item <%=requestedPage>=totalPages?"disabled":""%>"><a class="page-link" href="<%=nextUri%>">Next</a></li>
				  </ul>
				</nav>
				<div class="col-3 text-end">
				  	Total pages - <span class="fw-bolder"><%=totalPages %></span>
				  </div>
				</div>
			<%} %>
            </div>
          </div>
      </div>
    </div>
     <jsp:include page="../layout/footer.jsp"/>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
	<%@ page import="java.util.List,dao.TestBook,utils.Path,utils.Paginate,java.util.ArrayList"%>

    <%
	    String year = request.getParameter("year");
		year = year==null?"":year;
		String search = request.getParameter("search");
		search = search==null?"":search;
    	List<TestBook> testBooks = (List<TestBook>)request.getAttribute("testbooks");
    	if(testBooks!=null)
    	pageContext.setAttribute("testBooks", testBooks.toArray());
    %>
      <jsp:include page="../layout/sidebar.jsp" > 
	     <jsp:param name="text-book-menu" value="active"/>
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
                    <input type="text" class="form-control" name="search" value="<%=search %>" id="search" placeholder="Search....">
                  </div>
                  <div class="col-auto">
                    <select class="form-select form-control"  name="year" id="year">
                       <option value="First year" <%=year.equals("First year")?"selected":"" %>>First year</option>
                       <option value="Second year" <%=year.equals("Second year")?"selected":"" %>>Second year</option>
                       <option value="Third year" <%=year.equals("Third year")?"selected":"" %>>Third year</option>
                       <option value="Fourth year" <%=year.equals("Fourth year")?"selected":"" %>>Fourth year</option>
                       <option value="Fith year" <%=year.equals("Fith year")?"selected":"" %>>Fifth year</option>
                    </select>
                  </div>
                  <div class="col-auto">
                    <button type="submit" class="btn btn-outline-secondary btn-md rounded">Search</button>
			        <a href="/ucst-library/admin/testbook/all" class="btn btn-outline-secondary ms-2">clear</a>
                    
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
              <div class="card-body p-2 pt-2">
                <table class="table table-hover table-striped">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Title</th>
                      <th>Isbn</th>
                      <th>Year</th>
                      <th>Semester</th>
                      <th>Author</th>
                      <th>Category</th>
                      <th>Total</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="testBook" items="${pageScope.testBooks}">
                  	 <tr>
                      <td>
                        <img
                          src="<%=Path.getImagePath("/testbooks/") %>${testBook.getImage()}"
                          class="rounded-circle"
                          width="35"
                          height="35"
                          alt=""
                          srcset=""
                        />
                      </td>
                      <td>
                      	<c:out value="${testBook.getTitle()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${testBook.getIsbn()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${testBook.getYear()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${testBook.getSemester()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${testBook.getAuthorName()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${testBook.getCategoryName()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${testBook.getTotal()}"></c:out>
                      </td>
                      <td>
                        <div class="row m-0 p-0">
                          <div class="col-3">
                            <a href="<%=Path.getRoute("admin/testbook/edit.jsp")%>?id=${testBook.getId()}">
                              <i class="fa fa-edit fa-lg text-indigo"></i>
                            </a>
                          </div>
                          <div class="col-3">
                            <form action="<%=Path.getRoute("admin/testbook/delete")%>?id=${testBook.getId()}" method="post">
                              <button type="submit" class="border-0"><i class="fa fa-trash fa-lg text-danger" onclick="return confirm('Are you sure to delete!')"></i></button>
                            </form>
                          </div>
                          <div class="col-3">
                            <a href="<%=Path.getRoute("admin/testbooklist/create.jsp")%>?id=${testBook.getId()}">
                              <i class="fa fa-plus-circle fa-lg text-indigo"></i>
                            </a>
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
            		<%if(totalPages<1||(requestedPage+1)<=totalPages){ %>   
				    <li class="page-item"><a class="page-link <%=Paginate.lastIndex(page2)==requestedPage?"active":""%>" href="<%=page2%>"><%=requestedPage+1 %></a></li>
				    <%}
				    if(totalPages<2||(requestedPage+2<=totalPages)){
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
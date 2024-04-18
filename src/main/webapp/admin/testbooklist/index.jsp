<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
	<%@ page import="java.util.List,dao.TextBookList,utils.Path,utils.Paginate,java.util.ArrayList"%>

    <%
	    String code = request.getParameter("code");
		code = code==null?"":code;
		String isbn = request.getParameter("isbn");
		isbn = isbn==null?"":isbn;
		String search = request.getParameter("search");
		search = search==null?"":search;
    	List<TextBookList> textBookList = (List<TextBookList>)request.getAttribute("textBookList");
    	if(textBookList!=null)
    	pageContext.setAttribute("textBookList", textBookList.toArray());
    %>
    
    
         
    
    
    <jsp:include page="../layout/sidebar.jsp" > 
 		<jsp:param name="text-book-list-menu" value="active"/>
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
                    <input type="text" class="form-control" name="code" value="<%=code %>" id="isbn" placeholder="Enter code..">
                  </div>
                   <div class="col-auto">
                    <input type="text" class="form-control" name="isbn" value="<%=isbn %>" id="isbn" placeholder="Enter isbn..">
                  </div>
                  <div class="col-auto">
                    <button type="submit" class="btn btn-outline-secondary btn-md rounded">Search</button>
			        <a href="/ucst-library/admin/text-book-list/all" class="btn btn-outline-secondary ms-2">clear</a>
 
                  </div>
                </form>
              </div>
            </div>
            <div class="card">
              <div class="card-body pt-2">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>Title</th>
                      <th>Isbn</th>
                      <th>code</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="book" items="${pageScope.textBookList}">
                  	 <tr>
                      <td>
                      	<c:out value="${book.getTitle()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${book.getIsbn()}"></c:out>
                      </td>
                      <td>
                      	<c:out value="${book.getCode()}"></c:out>
                      </td>
                      <td>
                      <c:out value="${book.getBorrowStatus()}"></c:out>
                      </td>
                      <td>
                        <div class="row m-0 p-0">
                          <div class="col-3">
                            <a href="<%=Path.getRoute("admin/testbooklist/edit.jsp")%>?id=${book.getId()}">
                              <i class="fa fa-edit fa-lg text-indigo"></i>
                            </a>
                          </div>
                          <div class="col-3">
                            <form action="<%=Path.getRoute("admin/text-book-list/delete")%>?id=${book.getId()}" method="post">
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
            out.println(textBookList==null?"hello":"");
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
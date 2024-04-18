      
      
      <%@ page import="utils.Path,dao.Author" %>
      
      <%Author author =(Author) request.getAttribute("author"); %>
      
      <!-- Sidebar Start -->
      
      <jsp:include page="../layout/sidebar.jsp" /> 
      <!--  Sidebar End -->
      
      <!--  Main wrapper -->
      
      <div class="body-wrapper">
        <!--  Header Start -->
        
        <jsp:include page="../layout/header.jsp"/>
        
        <!--  Header End -->
                <div class="container-fluid">
          <div class="container-fluid">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title fw-semibold mb-4 text-info">
                  Create Author
                </h5>
                <div class="card">
                  <div class="card-body">
                    <form action="<%=Path.getRoute("admin/author/update")%>?id=${author.getId()}" method="post" enctype="multipart/form-data">
                      <div class="col-12 mb-3">
                        <div
                          class="profile-container rounded-circle border border-cyan shadow shadow-2xl mx-auto mb-3 overflow-hidden"
                        >
                          <img
                            src="<%=author.getImageUrl()%>"
                            id="profile_image_placeholder"
                            class="w-100"
                            alt="default-profile-image"
             
                          />
                        </div>
                      </div>
                      <div class="mb-3 col-6 col-md-12">
                        <label for="formFile" class="form-label"
                          >Profile Image</label
                        >
                        <input
                          class="form-control"
                          name="file"
                          type="file"
                          id="file"
                        />
                      </div>
                      <div class="mb-3 col-6 col-md-12">
                        <label for="name" class="form-label"
                          >Author's Name</label
                        >
                        <input
                          type="text"
                          class="form-control"
                          name="name"
                          id="name"
                          value="<%=author.getName()%>"
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
    </div>
    
     <jsp:include page="../layout/footer.jsp"/>
     <script>
     $('#file').change(function(){
         $('#profile_image_placeholder').prop('src',window.URL.createObjectURL(this.files[0]));
         	console.log(window.URL.createObjectURL(this.files[0]));
     })
   	 
     </script>
</body>
</html>
    <form action="../../CreateAuthors" method="post">
      <input type="text" name="name" />
      <button type="submit">Create</button>
    </form>
  </body>
</html>

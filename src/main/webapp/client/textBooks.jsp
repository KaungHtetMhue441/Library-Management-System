
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
	<%@ page import="java.util.List,dao.TextBookList,utils.Path,utils.Paginate,java.util.ArrayList"%>



    <%
	    String year = request.getParameter("year");
		year = year==null?"":year;
		String semester = request.getParameter("semester");
		semester = semester==null?"":semester;
		String search = request.getParameter("search");
		search = search==null?"":search;
    	List<TextBookList> textBookList = (List<TextBookList>)request.getAttribute("textBookList");
    	if(textBookList!=null)
    	pageContext.setAttribute("year",request.getParameter("year"));
    	pageContext.setAttribute("textBookList", textBookList.toArray());
    %>
    

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>UCST Library</title>
    <link rel="stylesheet" href="./custom.css" />
    <link rel="stylesheet" href="./style.css"/>
    <link rel="stylesheet" href="./style.css"/>
    <link rel="stylesheet" href="./node_module/animate.css/animate.min.css" />
  </head>
  <body>
    <session style="position: sticky; top: 0; z-index: 2001">
      <nav class="navbar navbar-expand-lg" style="background-color: #4E8397">
        <div class="container-fluid px-3">
          <a class="navbar-brand fw-bolder" href="#">
          	<img src="<%=Path.getRoute("assets/images/logos/lo.jpg") %>" width="40" alt="" />
          </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div
            class="collapse navbar-collapse justify-content-end"
            id="navbarSupportedContent"
          >
            <ul class="navbar-nav mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<%=Path.getRoute("client/index")%>">Home</a>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                All Books
                </a>
                <ul class="dropdown-menu  ">
                  <li><a class="dropdown-item" href="<%=Path.getRoute("client/books")%>">Books</a></li>
                  <li>
                    <a class="dropdown-item" href="<%=Path.getRoute("client/text-books")%>">Text Books</a>
                  </li>
                  
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.jsp">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact</a>
              </li>
              <!-- <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  Dropdown
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">Action</a></li>
                  <li>
                    <a class="dropdown-item" href="#">Another action</a>
                  </li>
                  <li><hr class="dropdown-divider" /></li>
                  <li>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </li>
                </ul>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>
    </session>

    <section>
      <div class="container-fluid">
        <div class="row pl-2 mt-3">
          <div class="col-3">
            <div class="card border-0">
              <div class="card-title">
                <h2 class="text-body-emphasis">Collections</h2>
              </div>
              <div class="card-body category">
                <ul class="nav nav-pills nav-fill flex-column ">
                  <li class="nav-item">
                    <a class="nav-link text-start ${year.equals('First year')?'active-menu':''}"  href="?year=First year">First Year</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-start ${year.equals('Second year')?'active-menu':''}" href="?year=Second year">Second Year</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-start ${year.equals('Third year')?'active-menu':''}" href="?year=Third year">Third Year</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-start ${year.equals('Fourth year')?'active-menu':''}" href="?year=Fourth year">Fourth Year</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-start ${year.equals('Fith year')?'active-menu':''}" href="?year=Fith year">Fifth Year</a>
                  </li>
                 
                </ul>
              </div>
            </div>
          </div>
          <div class="col-9">
            <session id="trending">
              <div class="">
                <div class="card border-0">
                  <div class="card-title">
                    <div class="row justify-content-between">
                      <div class="col-6">
                        <h2> Textbooks</h2>
                      </div>
                      <div class="col-6">
                        <form class="d-flex" role="search" action="">

                            <select class="form-select me-3" name="semester">
                              <option value="First Semester" >First Semester</option>
                              <option value="Second Semester">Second Semester</option>
                             
                            </select>
                          <input
                            class="form-control me-2"
                            type="search"
                            name="search"
                            placeholder="Search"
                            aria-label="Search"
                          />
                          <button class="btn btn-outline-secondary" type="submit">
                            Search
                          </button>

                        </form>
                      </div>
                    </div>
                    <hr />
                  </div>
                  
                  <div class="card-body">
                    <div class="row justify-content-between">
                    
                    <c:forEach var="book" items="${pageScope.textBookList}">
                     <div
                        class="card p-2 mb-3 wow animate__fadeInLeft"
                        style="width: 18rem"
                      >
                        <img
                          src="<%=Path.getImagePath("")%>/testbooks/${book.image}"
                          class="card-img-top"
                          alt="..."
                          height="270"
                        />
                        <div class="card-body">
                          <p class="card-text">
                            <c:out value="${book.description }"></c:out>
                          </p>
                        </div>
                      </div>
                    </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </session>
          </div>
        </div>
      </div>
    </section>
    
        <script src="/node_module/wow.js/dist/wow.min.js"></script>
    <script src="node_module/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
     

    <script src="./node_module/scrollreveal/dist/scrollreveal.min.js"></script>

    <script src="./node_module/wow.js/dist/wow.min.js"></script>
    <script src="./node_module/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>


    <script type="text/javascript">
      wow = new WOW({
        boxClass: "wow", // default
        animateClass: "animate__animated", // default
        offset: 2, // default
        mobile: true, // default
        live: true, // default
      });
      wow.init();

      var node = document.querySelectorAll(".animate__animated");

      const myCarouselElement = document.querySelector("#myCarousel");

      const carousel = new bootstrap.Carousel(myCarouselElement, {
        interval: 1000,
        touch: false,
      });

      //   ScrollReveal().reveal(node);
    </script>
  </body>
</html>

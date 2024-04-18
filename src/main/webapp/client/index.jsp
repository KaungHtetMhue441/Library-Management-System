    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
    <%@ page import="utils.Path,java.util.List,dao.Book" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
	 
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
     url = "jdbc:mysql://localhost/library"
     user = "root"  password = "root"/>
    <sql:query dataSource = "${snapshot}" var = "trendings">
       SELECT * from books limit 8;
    </sql:query>
    <sql:query dataSource = "${snapshot}" var = "readings">
       SELECT * from books order by created_at ASC limit 8;
    </sql:query>
    <sql:query dataSource = "${snapshot}" var = "latests">
       SELECT * from books order by created_at DESC limit 8 ;
    </sql:query>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>UCST Library</title>
    <link rel="stylesheet" href="./custom.css" />
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="./node_module/animate.css/animate.min.css" />
  </head>
  <body>
    <!-- <header style="position: sticky;"> -->
    <session style="position: sticky; top: 0; z-index: 2001">
      <nav class="navbar navbar-expand-lg" style="background-color: #4E8397">
        <div class="container-fluid px-3">
         
  
    <a class="navbar-brand" href="#">
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
    <!-- </header> -->

    <section style="height: 91vh; overflow: hidden">
      <div
        id="myCarousel"
        class="carousel slide"
        style="overflow: hidden; position: relative; height: 100%"
        data-bs-ride="carousel"
      >
        <div class="search-container">
          <div class="search">
            <div class="search__container">
              <p class="search__title text-white">Welcome our Library Website</p>
        <!--    <input class="search__input" type="text" placeholder="Search" /> -->   
            </div>

            <div class="credits__container">
              <p class="credits__text">
                Today is reader,Tomorrow is a Leader!
              </p>
            </div>
          </div>
        </div>

        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="images/home1.jpg" class="d-block w-100" alt="..." />
          </div>
          <div class="carousel-item">
            <img src="images/home4.jpg" class="d-block w-100" alt="..." />
          </div>
          <div class="carousel-item">
            <img src="images/home5.jpg" class="d-block w-100" alt="..." />
          </div>
        </div>
      </div>
    </section>

    <session id="trending">
      <div class="px-5 pt-4">
        <div class="card border-0">
          <div class="card-title mt-4">
            <div class="row justify-content-between">
              <div class="col-6">
                <h2>Trending Books</h2>
              </div>
              
            </div>
            <hr />
          </div>
          <div class="card-body">
            <div class="row justify-content-between">           
            <c:forEach var="book" items="${readings.rows}">
	            <div
	                class="card p-2 wow animate__fadeInLeft mb-5"
	                style="width: 18rem"
	              >
	                <img
	                  src="<%=Path.getImagePath("") %>/books/${book.image}"
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

    <session id="trending">
      <div class="px-5 pt-4">
        <div class="card border-0">
          <div class="card-title mt-4">
            <div class="row justify-content-between">
              <div class="col-6">
                <h2>Best Books of the Month</h2>
              </div>
              
            </div>
            <hr />
          </div>
          <div class="card-body">
            <div class="row justify-content-between">
            
            
              <c:forEach var="book" items="${trendings.rows}">
	            <div
	                class="card p-2 wow animate__fadeInLeft mb-5"
	                style="width: 18rem"
	              >
	                <img
	                  src="<%=Path.getImagePath("") %>/books/${book.image}"
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

    <session id="trending">
      <div class="px-5 pt-4">
        <div class="card border-0">
          <div class="card-title mt-4">
            <div class="row justify-content-between">
              <div class="col-6">
                <h2>Latest Books</h2>
              </div>
             
            </div>
            <hr />
          </div>
          <div class="card-body">
            <div class="row justify-content-between">
              <c:forEach var="book" items="${latests.rows}">
	            <div
	                class="card p-2 wow animate__fadeInLeft mb-5"
	                style="width: 18rem"
	              >
	                <img
	                  src="<%=Path.getImagePath("") %>/books/${book.image}"
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
 	<div class="absolute w-100 mt-5" style="bottom: 0;height: 35px; background-color:#d1d1d1;">
            <center class="mt-2">
              <p class="copy p-2" style="font-size: 15px;">  © Copyright 2024 Online Burma/Myanmar Library. All rights reserved.</p>
            </center>
     </div>
     
     
         <script src="/node_module/scrollreveal/dist/scrollreveal.min.js"></script>

    <script src="/node_module/wow.js/dist/wow.min.js"></script>
    <script src="node_module/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
     


    <script src="./node_module/scrollreveal/dist/scrollreveal.min.js"></script>

    <script src="./node_module/wow.js/dist/wow.min.js"></script>
    <script src="./node_module/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
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

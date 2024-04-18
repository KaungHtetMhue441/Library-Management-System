<%@ page import="utils.Path,java.util.List,dao.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="About.css" />
    <link rel="stylesheet" href="custom.css"/>
  
    <link rel="stylesheet" href="/node_modules/animate.css/animate.min.css" />
      <style>
    	.p{
    		 font-family:none;
    	}
    	.h{
    	 font-family:none;
    	}
    </style>
  
</head>
<body>
    <session style="position: sticky; top: 0; z-index: 2001">
        <nav class="navbar navbar-expand-lg" style="background-color: #4E8397">
          <div class="container-fluid px-3">
            <a class="navbar-brand fw-bolder" href="#">
                  <img src="http://localhost:8080/ucst-library/assets/images/logos/lo.jpg" width="40" alt="" />
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
                  <a class="nav-link  " href="about.jsp">About</a>
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

      
  <div class="center-vertical ">
    <div class="about-us-section ">
      <div class="container">
        <div class="row">
          <div class="col-12 col-lg-6 mb-4 " >
            <div class="img-head">
              <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="1000">
                    <img src="images/about1.jpg" class="d-block w-70" alt="...">
                  </div>
                  <div class="carousel-item" data-bs-interval="2000">
                    <img src="images/vision1.jpg" class="d-block w-70" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="images/about3.jpg" class="d-block w-70" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>
          </div>
          <div class="col-12 col-lg-6  text-head wow animate__fadeInRight">
            <h2>Our Library about us</h2>
            <div class="break-small mb-2 wow animate__fadeInRight">

            </div>
            <p class="text-para wow animate__fadeInRight">
              <p>
               Welcome to our library website! <br>

				We're dedicated to providing a convenient website for accessing our collection of books.

 				Users can browse and read for their interests and needs.</p>
            </p>
            <p>
              Our admin team works diligently behind the scenes to manage the library's inventory and ensure that our collection remains diverse and up-to-date.

 We're committed to fostering a love for reading and knowledge within our community.
              
            </p>
          </div>
        </div>
        
        <div class="row">
          <div class="line_space">
              
          </div>
          <div class="col-12 col-lg-6 mb-6  text-head wow" >
            
              <h2 style="text-align: center;">Mission</h2>
            <img src="images/mission1.jpg" class="about_img">
           <center>
            <p> Our mission is to provide a user-friendly platform where visitors 
            can explore our curated collection of books. We aim to facilitate easy access to literary resources, fostering a love for reading and learning within our community.</p>
           </center>
            </div>
            <div class="col-12 col-lg-6 mb-6  text-head wow" >
            
              <h2 style="text-align: center;">Vision</h2>
              <img src="images/vision4.jpg" class="about_img">
            <center>
            <p> Our vision is to create a digital space that knowledge .
Administrators can efficiently manage our library’s inventory 
 We  promote literacy and lifelong learning by making quality literature accessible to all</p>
            </center>
            </div>
          </div>
      </div>
    </div>
  </div>
   <div class="absolute w-100 mt-5" style="bottom: 0;height: 35px; background-color:#d1d1d1;">
            <center class="mt-2">
              <p class="copy p-2" style="font-size: 15px;">  © Copyright 2024 Online Burma/Myanmar Library. All rights reserved.</p>
            </center>
   </div>





    <script src="/node_module/wow.js/dist/wow.min.js"></script>
    <script src="node_module/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
     

      <script src="/node_modules/scrollreveal/dist/scrollreveal.min.js"></script>

    <script src="/node_modules/wow.js/dist/wow.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

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
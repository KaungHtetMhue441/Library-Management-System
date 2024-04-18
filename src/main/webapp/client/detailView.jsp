
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="About.css" />
    <link rel="stylesheet" href="custom.css"/>
  
    <link rel="stylesheet" href="/node_modules/animate.css/animate.min.css" />
</head>
<body>
    <session style="position: sticky; top: 0; z-index: 2001">
              <nav class="navbar navbar-expand-lg" style="background-color: #4E8397">
   
          <div class="container-fluid px-3">
             <a class="navbar-brand" href="#">
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
                  <a class="nav-link active" aria-current="page" href="index.html">Home</a>
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
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="Books.html">Books</a></li>
                    <li>
                      <a class="dropdown-item" href="Textbooks.html">Text Books</a>
                    </li>
                    
                  </ul>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Aboutus.html">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="contact _us.html">Contact</a>
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
      <div class="row">
      <div class="col-12 col-lg-4">
        <img src="images/view.jpg" class="w-100 p-5 wow animate__fadeInLeftBig"> 
      </div>
      <div class="view-text col-12 col-lg-6 ">
        <h1 class="mt-5 wow animate__fadeInDown">Traveller</h1>
        <hr class="mt-4">
        <table  class="table table-striped table-hover wow animate__fadeInRight ">
            <tr>
                <td>Code </td>
                <td>:</td>
               <td>E1101 </td>
            </tr>
            <tr>
                <td>Author</td>
                <td>:</td>
                <td><a href="author.html" style="text-decoration: none; color: black;">H.Q.Mitchell</a></td>
            </tr>
            <tr>
                <td>Collections</td>
                <td>:</td>
                <td>History</td>
            </tr>
            <tr>
<td>Description</td>
                <td>:</td>
                <td>Second year second semester English (text-book),Level B2 and Other Examination tests </td>
            </tr>
        </table>
      </div>
</div>



      <script src="/node_module/scrollreveal/dist/scrollreveal.min.js"></script>

      <script src="/node_module/wow.js/dist/wow.min.js"></script>
      <script src="node_module/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  
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
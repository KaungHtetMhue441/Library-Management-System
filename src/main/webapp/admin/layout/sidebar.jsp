<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="utils.Path"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link
      rel="shortcut icon"
      type="image/png"
      href="<%=Path.getRoute("assets/images/logo/favicon.png") %>"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />
    <link rel="stylesheet" href="<%=Path.getRoute("assets/css/styles.min.css") %>" />
    <link rel="stylesheet" href="<%=Path.getRoute("assets/css/custom.css") %>" />
    
</head>
<body>
    <div
      class="page-wrapper"
      id="main-wrapper"
      data-layout="vertical"
      data-navbarbg="skin6"
      data-sidebartype="full"
      data-sidebar-position="fixed"
      data-header-position="fixed"
    >

<!-- Sidebar Start -->
<aside class="left-sidebar">
  <!-- Sidebar scroll-->
  <div>
    <div class="brand-logo d-flex align-items-center justify-content-between">
      <a href="./index.html" class="text-nowrap logo-img ms-5 pt-3">
        <img src="<%=Path.getRoute("assets/images/logos/lo.jpg") %>" width="75" alt="" />
      </a>
      <div
        class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
        id="sidebarCollapse"
      >
        <i class="ti ti-x fs-8"></i>
      </div>
    </div>
    <!-- Sidebar navigation-->
    <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
      <ul id="sidebarnav">
        <li class="nav-small-cap">
          <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
          <span class="hide-menu">Home</span>
        </li>
        <li class="sidebar-item <%=request.getParameter("author-menu")!=null?"selected":""%>">
          <a
            class="sidebar-link <%=request.getParameter("author-menu")%>"
            href="<%=Path.getRoute("admin/author/all")%>"
            aria-expanded="false"
          >
            <span> <i class="fa fa-user"></i> </span>
            <span class="hide-menu">Author</span>
          </a>
        </li>
         <li class="sidebar-item <%=request.getParameter("book-menu")!=null?"selected":""%>">
          <a
            class="sidebar-link <%=request.getParameter("book-menu")%>"
            href="<%=Path.getRoute("admin/book/all")%>"
            aria-expanded="false"
          >
            <span> <i class="ti ti-book"></i> </span>
            <span class="hide-menu">Books</span>
          </a>
        </li>
        <li class="sidebar-item <%=request.getParameter("text-book-menu")!=null?"selected":""%>">
          <a
            class="sidebar-link <%=request.getParameter("text-book-menu")%>"
            href="<%=Path.getRoute("admin/testbook/all") %>"
            aria-expanded="false"
          >
            <span> <i class="ti ti-books"></i> </span>
            <span class="hide-menu">Text books</span>
          </a>
        </li>
        
         <li class="sidebar-item <%=request.getParameter("text-book-list-menu")!=null?"selected":""%>">
          <a
            class="sidebar-link <%=request.getParameter("text-book-list-menu")%>"
            href="<%=Path.getRoute("admin/text-book-list/all") %>"
            aria-expanded="false"
          >
            <span> <i class="ti ti-list"></i> </span>
            <span class="hide-menu">Text books list</span>
          </a>
        </li>
        
        <li class="sidebar-item <%=request.getParameter("category-menu")!=null?"selected":""%>">
          <a
            class="sidebar-link <%=request.getParameter("category-menu")%>"
            href="<%=Path.getRoute("admin/category/all") %>"
            aria-expanded="false"
          >
            <span> <i class="ti ti-category"></i> </span>
            <span class="hide-menu">Category</span>
          </a>
        </li>
        <li class="sidebar-item <%=request.getParameter("user-menu")!=null?"selected":""%>">
          <a
            class="sidebar-link <%=request.getParameter("user-menu")%>"
            href="<%=Path.getRoute("admin/user/all") %>"
            aria-expanded="false"
          >
            <span> <i class="fa fa-user"></i> </span>
            <span class="hide-menu">Manage user</span>
          </a>
        </li>
      </ul>
    </nav>
    <!-- End Sidebar navigation -->
  </div>
  <!-- End Sidebar scroll-->
</aside>
<!--  Sidebar End -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
%>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>Tech Blog</title>
   <%@ include file ="css-links.jsp"%>
   <!-- Bootstrap 5 CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
   <link rel="stylesheet" href="<c:url value='/css/indexs.css'/>" />
</head>
<body>

<!-- Navbar -->
<%@ include file="navbar.jsp"%>

<!-- Hero Section -->
<div class="hero-section">
    <div id="particles-js"></div>
    <div style="position: relative; z-index: 1;">
        <h1><i class="fa fa-rocket me-2"></i>Welcome to Tech Blog</h1>
        <p>Dive into programming, projects, and innovation with a modern, clean design.</p>
        <a href="signup.jsp" class="btn btn-outline-light btn-lg btn-hero"><i class="fa fa-play me-2"></i>Get Started</a>
        <a href="login.jsp" class="btn btn-light text-success btn-lg btn-hero"><i class="fa fa-user-plus me-2"></i>Login</a>
    </div>
</div>

<!-- Cards Section -->
<!-- Cards Section -->
<div class="cards-container">
  <div class="container">
    <div class="row g-4">
      <!-- Programming Card -->
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
        <div class="card hover-card text-center p-4 shadow h-100">
          <i class="fa fa-code fa-3x text-success mb-3"></i>
          <h5 class="card-title fw-bold">Programming</h5>
          <p class="card-text">
            Learn popular languages like Java, Python, and JavaScript with real-world examples.
          </p>
          <a href="programming.jsp" class="btn btn-success card-btn w-50 mx-auto d-block mt-3">
            Explore <i class="fa fa-arrow-right ms-1"></i>
          </a>
        </div>
      </div>

      <!-- Projects Card -->
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
        <div class="card hover-card text-center p-4 shadow h-100">
          <i class="fa fa-cogs fa-3x text-primary mb-3"></i>
          <h5 class="card-title fw-bold">Projects</h5>
          <p class="card-text">
            Step-by-step project guides to help you apply your coding knowledge practically.
          </p>
          <a href="projects.jsp" class="btn btn-primary card-btn w-50 mx-auto d-block mt-3">
            Explore <i class="fa fa-arrow-right ms-1"></i>
          </a>
        </div>
      </div>

      <!-- Data Structures Card -->
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
        <div class="card hover-card text-center p-4 shadow h-100">
          <i class="fa fa-database fa-3x text-danger mb-3"></i>
          <h5 class="card-title fw-bold">Data Structures</h5>
          <p class="card-text">
            Strengthen your DSA skills with visual explanations and practice problems.
          </p>
          <a href="dsa.jsp" class="btn btn-danger card-btn w-50 mx-auto d-block mt-3">
            Explore <i class="fa fa-arrow-right ms-1"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>


  <div>
      <%@ include file ="footer.jsp"%>
  </div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script  src="<c:url value='/js/common-particle.js'/>" ></script>

</body>
</html>

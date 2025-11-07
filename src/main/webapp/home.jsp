<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.tech.entities.Category"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tech Blog | Home</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
   <link rel="stylesheet" href="<c:url value='/css/home.css'/>" />

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<!-- AOS Animation Library -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />

<!-- Particles.js -->
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>

</head>
<body>
<%@ include file ="navbar.jsp"%>
<!-- Hero Section -->
<div class="hero-section">
    <div id="particles-js"></div>
    <div style="position: relative; z-index: 1;">
        <h1 data-aos="fade-down"><i class="fa fa-rocket me-2"></i>Welcome to Tech Blog</h1>
        <p data-aos="fade-up" data-aos-delay="300">
            Discover tutorials, projects, and coding knowledge — crafted for modern developers.
        </p>

        <c:choose>
            <c:when test="${not empty sessionScope.username}">
                <a href="dasboard.jsp" class="btn btn-light text-success btn-lg btn-hero">
                    <i class="fa fa-arrow-right me-2"></i>Go to Dashboard
                </a>
            </c:when>
            <c:otherwise>
                <a href="signup.jsp" class="btn btn-outline-light btn-lg btn-hero"><i class="fa fa-play me-2"></i>Get Started</a>
                <a href="#" class="btn btn-light text-success btn-lg btn-hero"><i class="fa fa-user me-2"></i>Login</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Posts Section -->
<div class="posts-section py-5">
    <div class="container">

        <h2 class="text-center mb-4" data-aos="zoom-in">Latest Posts by Category</h2>

        <c:forEach var="cat" items="${categories}">
            <div class="mt-5" data-aos="fade-up">

                <!-- Category Name -->
                <h3 class="text-primary border-bottom pb-2">
                    <i class="fa fa-folder-open me-2"></i>
                    ${cat.name}
                </h3>

                <!-- Posts under category -->
                <c:choose>

                    <c:when test="${not empty cat.posts}">
                        <div class="row g-4">

                            <c:forEach var="post" items="${cat.posts}">
                                <div class="col-md-4">
                                    <div class="card h-100 shadow-sm">
                                        <c:if test="${not empty post.imageName}">
                                            <img src="<c:url value='/post_pics/${post.imageName}'/>" class="card-img-top" alt="Post image"/>
                                        </c:if>

                                        <div class="card-body">
                                            <h5 class="card-title">${post.title}</h5>

                                            <p class="card-text">
                                                ${post.content.substring(0, Math.min(post.content.length(), 100))}...
                                            </p>

                                            <a href="view-post.jsp?pid=${post.id}" class="btn btn-sm btn-primary">
                                                Read More
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </c:when>

                    <c:otherwise>
                        <p class="text-muted">No posts available in this category.</p>
                    </c:otherwise>

                </c:choose>

            </div>
        </c:forEach>

    </div>
</div>


<!-- Features Section -->
<div class="features-section">
    <div class="container">
        <h2 data-aos="zoom-in">Explore Our Sections</h2>
        <div class="row g-4">
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                <div class="feature-box h-100">
                    <i class="fa fa-code text-success"></i>
                    <h5 class="fw-bold mt-3">Programming</h5>
                    <p>Learn languages like Java, Python, and JavaScript with step-by-step guides.</p>
                </div>
            </div>
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                <div class="feature-box h-100">
                    <i class="fa fa-cogs text-primary"></i>
                    <h5 class="fw-bold mt-3">Projects</h5>
                    <p>Hands-on coding projects to help you apply and deepen your learning.</p>
                </div>
            </div>
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                <div class="feature-box h-100">
                    <i class="fa fa-database text-danger"></i>
                    <h5 class="fw-bold mt-3">Data Structures</h5>
                    <p>Strengthen problem-solving with structured tutorials and visual explanations.</p>
                </div>
            </div>
             <div class="feature-card">
                  <i class="bi bi-shield-lock"></i>
                  <h4>Safe & Secure</h4>
                  <p>Your data is fully encrypted and protected for privacy.</p>
                </div>
                <div class="feature-card">
                  <i class="bi bi-cloud-upload"></i>
                  <h4>Access Anywhere</h4>
                  <p>Sync your notes and access them across devices seamlessly.</p>
                </div>
                <div class="feature-card">
                  <i class="bi bi-bar-chart-line"></i>
                  <h4>Track Progress</h4>
                  <p>Visualize your productivity and growth over time.</p>
                </div>
        </div>
    </div>
</div>

<!-- Footer -->
<div>
 <%@ include file="footer.jsp"%>
</div>
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script  src="<c:url value='/js/common-particle.js'/>" ></script>


</body>
</html>

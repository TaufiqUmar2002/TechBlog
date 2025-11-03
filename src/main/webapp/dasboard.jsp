<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tech Blog | Dashboard</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<!-- AOS Animation -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />

<style>
body {
  font-family: 'Poppins', sans-serif;
  background: linear-gradient(135deg, #16a085, #1abc9c);
  color: #fff;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.navbar {
  background: rgba(22,160,133,0.95);
  backdrop-filter: blur(10px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.navbar .nav-link, .navbar .navbar-brand { color: #fff; font-weight: 500; }
.navbar .nav-link:hover { color: #e0f7f1; }

.dashboard-header {
  text-align: center;
  padding: 50px 0 30px;
}

.dashboard-header h2 {
  font-weight: 700;
  text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
}

.dashboard-header p {
  color: #e0f7f1;
}

.card {
  border: none;
  border-radius: 20px;
  backdrop-filter: blur(10px);
  background: rgba(255,255,255,0.1);
  color: #fff;
  padding: 25px;
  transition: all 0.4s ease;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 15px 25px rgba(0,0,0,0.2);
}

.card i {
  font-size: 2.5rem;
  margin-bottom: 10px;
}

footer {
  background: rgba(22,160,133,0.95);
  color: #fff;
  text-align: center;
  padding: 20px 0;
  margin-top: auto;
}
footer a {
  color: #e0f7f1;
  text-decoration: none;
  font-weight: 500;
}
footer a:hover {
  text-decoration: underline;
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp"><i class="fa fa-asterisk me-2"></i>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="home.jsp"><i class="fa fa-home me-1"></i>Home</a></li>
        <li class="nav-item"><a class="nav-link" href="writePost.jsp"><i class="fa fa-pen me-1"></i>Write Post</a></li>
        <li class="nav-item"><a class="nav-link" href="profile.jsp"><i class="fa fa-user me-1"></i>Profile</a></li>
      </ul>
      <div class="d-flex">
        <c:choose>
          <c:when test="${not empty sessionScope.username}">
            <span class="me-3"><i class="fa fa-user-circle"></i> ${sessionScope.username}</span>
            <a href="LogoutServlet" class="btn btn-outline-light"><i class="fa fa-sign-out-alt"></i> Logout</a>
          </c:when>
          <c:otherwise>
            <a href="login.jsp" class="btn btn-outline-light me-2"><i class="fa fa-user"></i> Login</a>
            <a href="signup.jsp" class="btn btn-light text-success"><i class="fa fa-user-plus"></i> Sign Up</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</nav>

<!-- Dashboard Header -->
<section class="dashboard-header" data-aos="fade-down">
  <h2><i class="fa fa-chart-line me-2"></i>Welcome, ${sessionScope.username}</h2>
  <p>Your personalized dashboard overview</p>
</section>

<!-- Dashboard Cards -->
<div class="container my-4">
  <div class="row g-4">
    <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
      <div class="card text-center">
        <i class="fa fa-code text-success"></i>
        <h5 class="fw-bold mt-2">Your Posts</h5>
        <p>View, edit, or delete your published articles and tutorials.</p>
        <a href="#" class="btn btn-outline-light btn-sm">Manage Posts</a>
      </div>
    </div>
    <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
      <div class="card text-center">
        <i class="fa fa-book text-warning"></i>
        <h5 class="fw-bold mt-2">Learning Progress</h5>
        <p>Track your learning streaks and completed lessons.</p>
        <a href="#" class="btn btn-outline-light btn-sm">View Progress</a>
      </div>
    </div>
    <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
      <div class="card text-center">
        <i class="fa fa-users text-info"></i>
        <h5 class="fw-bold mt-2">Community</h5>
        <p>Engage with other developers and join discussions.</p>
        <a href="#" class="btn btn-outline-light btn-sm">Join Now</a>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  © 2025 Tech Blog | Crafted with 💻 and ☕ by <a href="#">Taufiq Umar</a>
</footer>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
AOS.init({ duration: 1200, once: true });
</script>

</body>
</html>

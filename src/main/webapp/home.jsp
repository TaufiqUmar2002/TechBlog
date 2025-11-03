<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tech Blog | Home</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<!-- AOS Animation Library -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />

<!-- Particles.js -->
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>

<style>
body {
    font-family: 'Poppins', sans-serif;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
    color: #fff;
    background: #16a085;
}

/* Navbar */
.navbar {
    background: rgba(22,160,133,0.95);
    backdrop-filter: blur(10px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 999;
}
.navbar .nav-link, .navbar .navbar-brand { color: #fff; font-weight: 500; }
.navbar .nav-link:hover { color: #e0f7f1; }
.navbar .navbar-text {
    color: #f9f9f9;
    font-weight: 600;
}

/* Hero Section */
.hero-section {
    position: relative;
    flex: 1;
    min-height: 80vh;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    overflow: hidden;
}
.hero-section h1 {
    font-size: 3.5rem;
    font-weight: 700;
    text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
}
.hero-section p {
    font-size: 1.2rem;
    margin-bottom: 30px;
    z-index: 1;
    position: relative;
}

/* Particles Background */
#particles-js {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 0;
}

/* Feature Section */
.features-section {
    background-color: rgba(255,255,255,0.05);
    padding: 60px 20px;
    text-align: center;
}
.features-section h2 {
    font-weight: 700;
    margin-bottom: 40px;
}
.feature-box {
    border-radius: 20px;
    backdrop-filter: blur(10px);
    background: rgba(255,255,255,0.1);
    padding: 30px;
    transition: transform 0.4s, box-shadow 0.4s;
}
.feature-box:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 25px rgba(0,0,0,0.2);
}
.feature-box i {
    font-size: 3rem;
    margin-bottom: 15px;
}

/* Buttons */
.btn-hero {
    margin: 5px;
    border-radius: 50px;
    padding: 10px 25px;
    font-weight: 500;
    transition: transform 0.3s, box-shadow 0.3s;
}
.btn-hero:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.25);
}

/* Footer */
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
        <a class="navbar-brand" href="#"><i class="fa fa-asterisk me-2"></i>Tech Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="#"><i class="fa fa-home me-1"></i>Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-code me-1"></i>Learning Code</a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-user me-1"></i>Contact</a></li>
            </ul>

            <!-- Show username if logged in, else show login/signup -->
            <div class="d-flex">
                <c:choose>
                    <c:when test="${not empty sessionScope.username}">
                        <span class="navbar-text me-3">
                            <i class="fa fa-user-circle me-1"></i> Welcome, ${sessionScope.username}
                        </span>
                        <a href="logoutServlet" class="btn btn-outline-light"><i class="fa fa-sign-out-alt"></i> Logout</a>
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
<footer>
    © 2025 Tech Blog | Crafted with 💻 and ☕ by <a href="#">Taufiq Umar</a>
</footer>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
AOS.init({ duration: 1200, once: true });
</script>

<!-- Particles.js Config -->
<script>
particlesJS('particles-js', {
  "particles": {
    "number": { "value": 80 },
    "color": { "value": "#ffffff" },
    "shape": { "type": "circle" },
    "opacity": { "value": 0.5 },
    "size": { "value": 3 },
    "line_linked": { "enable": true, "distance": 150, "color": "#ffffff", "opacity": 0.3, "width": 1 },
    "move": { "enable": true, "speed": 2 }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": { "onhover": { "enable": true, "mode": "repulse" } }
  },
  "retina_detect": true
});
</script>
</body>
</html>

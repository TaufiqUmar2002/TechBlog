<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tech Blog | Profile</title>
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>

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

/* Navbar */
.navbar {
  background: rgba(22,160,133,0.95);
  backdrop-filter: blur(10px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}
/* Particles Canvas */
#particles-js {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 0;
}

.navbar .nav-link, .navbar .navbar-brand {
  color: #fff;
  font-weight: 500;
}
.navbar .nav-link:hover { color: #e0f7f1; }

/* Profile Container */
.profile-container {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 50px 15px;
}

.profile-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(15px);
  border-radius: 20px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.2);
  padding: 40px 30px;
  width: 400px;
  max-width: 90%;
  text-align: center;
  transition: 0.3s;
}
.profile-card:hover {
  transform: translateY(-5px);
}

.profile-pic {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  border: 3px solid #fff;
  object-fit: cover;
  margin-bottom: 15px;
}

h3 {
  font-weight: 700;
  margin-bottom: 10px;
}

p {
  color: #e0f7f1;
}

.btn-edit {
  background: #fff;
  color: #16a085;
  border-radius: 50px;
  font-weight: 600;
  padding: 8px 20px;
  transition: 0.3s;
}
.btn-edit:hover {
  background: #e0f7f1;
  transform: translateY(-2px);
}

</style>
</head>
<body>

<%@ include file="navbar.jsp"%>

<!-- Profile Section -->
<div class="position-relative flex-grow-1 d-flex justify-content-center align-items-center">
  <!-- Particles Background -->
  <div id="particles-js" class="position-absolute top-0 start-0 w-100 h-100"></div>

  <!-- Profile Card -->
  <div class="profile-card" data-aos="zoom-in" style="z-index: 1;">
    <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="Profile Picture" class="profile-pic">
    <h3>${sessionScope.username}</h3>
    <p><i class="fa fa-envelope me-2"></i>${sessionScope.email}</p>
    <p><i class="fa fa-calendar me-2"></i>Member since: <span>${sessionScope.joinDate}</span></p>
    <hr style="border-color: rgba(255,255,255,0.3);">
    <p>"Coding is not just typing — it's creating logic from imagination."</p>
       <a href="home.jsp" class="btn btn-edit mt-3"><i class="fa fa-pen me-2"></i>Close</a>
       <a href="edit-profile.jsp" class="btn btn-edit mt-3"><i class="fa fa-pen me-2"></i>Edit Profile</a>

</div>
</div>

<%@ include file="footer.jsp"%>

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

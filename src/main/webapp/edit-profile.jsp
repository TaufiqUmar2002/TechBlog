<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile | Tech Blog</title>

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
.navbar .nav-link, .navbar .navbar-brand {
  color: #fff;
  font-weight: 500;
}
.navbar .nav-link:hover { color: #e0f7f1; }

/* Container */
.edit-container {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  padding: 60px 15px;
}
#particles-js {
  position: absolute;
  top: 0; left: 0;
  width: 100%; height: 100%;
  z-index: 0;
}

/* Card */
.edit-card {
  position: relative;
  z-index: 2;
  background: rgba(255,255,255,0.1);
  backdrop-filter: blur(15px);
  padding: 40px 30px;
  border-radius: 20px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.2);
  width: 420px;
  max-width: 90%;
  text-align: center;
}

.profile-pic {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  border: 3px solid #fff;
  object-fit: cover;
  margin-bottom: 15px;
}

input[type="file"] {
  display: none;
}

.custom-file-label {
  display: inline-block;
  background: #fff;
  color: #16a085;
  padding: 8px 16px;
  border-radius: 50px;
  font-weight: 600;
  cursor: pointer;
  transition: 0.3s;
}
.custom-file-label:hover {
  background: #e0f7f1;
}

.form-control {
  border-radius: 10px;
  border: none;
  padding: 10px 12px;
  font-size: 15px;
  background: rgba(255,255,255,0.9);
  color: #333;
  margin-bottom: 15px;
}

.btn-save {
  background: #fff;
  color: #16a085;
  font-weight: 600;
  border-radius: 50px;
  padding: 10px 20px;
  border: none;
  transition: 0.3s;
}
.btn-save:hover {
  background: #e0f7f1;
  transform: translateY(-2px);
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
footer a:hover { text-decoration: underline; }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp"><i class="fa fa-asterisk me-2"></i>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item"><a class="nav-link" href="home.jsp"><i class="fa fa-home me-1"></i>Home</a></li>
        <li class="nav-item"><a class="nav-link" href="dashboard.jsp"><i class="fa fa-chart-line me-1"></i>Dashboard</a></li>
        <li class="nav-item"><a class="nav-link active" href="profile.jsp"><i class="fa fa-user me-1"></i>Profile</a></li>
      </ul>
      <div class="d-flex">
        <c:choose>
          <c:when test="${not empty sessionScope.username}">
            <span class="me-3"><i class="fa fa-user-circle"></i> ${sessionScope.username}</span>
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

<!-- Edit Profile Section -->
<div class="edit-container">
  <div id="particles-js"></div>

  <div class="edit-card" data-aos="zoom-in">
    <form action="updateProfileServlet" method="post" enctype="multipart/form-data">
      <img id="preview" src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="Profile Picture" class="profile-pic">
      <label for="profilePic" class="custom-file-label"><i class="fa fa-camera"></i> Change Photo</label>
      <input type="file" id="profilePic" name="profilePic" accept="image/*" onchange="previewImage(event)">

      <input type="text" class="form-control" name="name" placeholder="Full Name" value="${sessionScope.username}" required>
      <input type="email" class="form-control" name="email" placeholder="Email" value="${sessionScope.email}" required>
      <textarea class="form-control" name="bio" rows="3" placeholder="Write something about yourself...">${sessionScope.bio}</textarea>

      <div class="d-flex justify-content-between mt-3">
        <button type="submit" class="btn btn-save"><i class="fa fa-save me-2"></i>Save Changes</button>
        <button type="button" class="btn btn-secondary" onclick="window.location.href='profile.jsp'"><i class="fa fa-times me-2"></i>Close</button>
      </div>
    </form>
  </div>
</div>

<!-- Footer -->
<footer>
  © 2025 Tech Blog | Crafted with 💻 and ☕ by <a href="#">Taufiq Umar</a>
</footer>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
<script>
AOS.init({ duration: 1200, once: true });

// Preview uploaded image instantly
function previewImage(event) {
  const reader = new FileReader();
  reader.onload = function() {
    document.getElementById('preview').src = reader.result;
  };
  reader.readAsDataURL(event.target.files[0]);
}

// Particles background
particlesJS('particles-js', {
  "particles": {
    "number": { "value": 70 },
    "color": { "value": "#ffffff" },
    "opacity": { "value": 0.5 },
    "size": { "value": 3 },
    "line_linked": { "enable": true, "color": "#ffffff", "opacity": 0.3 },
    "move": { "enable": true, "speed": 2 }
  },
  "interactivity": {
    "events": { "onhover": { "enable": true, "mode": "repulse" } }
  },
  "retina_detect": true
});
</script>

</body>
</html>

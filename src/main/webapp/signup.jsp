<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up | Tech Blog</title>
    <%@ include file ="css-links.jsp"%>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
    <link rel="stylesheet" href="<c:url value='/css/signup.css'/>" />
  </head>
  <body>
     <%@ include file="navbar.jsp"%>

    <!-- Hero Section -->
    <div class="hero-section">
      <div id="particles-js"></div>
      <div style="position: relative; z-index: 1">
        <h1><i class="fa fa-user-plus me-2"></i>Create Your Account</h1>
        <p>
          Join Tech Blog to explore programming, projects, and data structures.
        </p>
      </div>
    </div>

    <!-- Sign Up Form -->
    <div class="signup-container" data-aos="fade-up">
      <form action="signUpServlet" id="reg-form" method="post" enctype="multipart/form-data" >
        <div class="row g-3 mb-3">
          <div class="col-md-6 input-icon">
            <i class="fa fa-user"></i>
            <input
              type="text"
              class="form-control ps-4"
              name="name"
              placeholder="Full Name"
              required
            />
          </div>
          <div class="col-md-6 input-icon">
            <i class="fa fa-envelope"></i>
            <input
              type="email"
              class="form-control ps-4"
              name="email"
              placeholder="Email"
              required
            />
          </div>
        </div>

        <div class="row g-3 mb-3">
          <div class="col-md-6 input-icon">
            <i class="fa fa-lock"></i>
            <input
              type="password"
              class="form-control ps-4"
              name="password"
              placeholder="Password"
              required
            />
          </div>
          <div class="col-md-6 input-icon">
            <i class="fa fa-lock"></i>
            <input
              type="password"
              class="form-control ps-4"
              name="correctPass"
              placeholder="Confirm Password"
              required
            />
          </div>
        </div>

        <div class="row g-3 mb-3">
          <div class="col-md-6 input-icon">
            <i class="fa fa-venus-mars"></i>
            <select class="form-select ps-4" required name ="gender">
              <option value="">Select Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
          </div>
          <div class="col-md-6 input-icon">
            <i class="fa fa-phone"></i>
            <input
              type="tel"
              class="form-control ps-4"
              placeholder="Contact Number"
              name ="phone"
              required
            />
          </div>
        </div>

        <div class="mb-3 input-icon">
          <i class="fa fa-info-circle"></i>
          <textarea
            class="form-control ps-4"
            placeholder="About Yourself..."
            name="about"
            rows="3"
          ></textarea>
        </div>
         <div class="mb-3 input-icon">
                  <input type="file" name="image" class="form-control" accept="image/*" />
                </div>

        <button type="submit" class="btn btn-primary w-100 btn-lg mb-3">
          <i class="fa fa-user-plus me-2"></i> Sign Up
        </button>

        <div class="text-center">
          <a href="login.jsp" class="btn btn-outline-success btn-sm">
            Already have an account? Login
          </a>
        </div>
      </form>
    </div>

    <!-- Cards Section (Optional, same as index) -->
    <div class="cards-container">
      <div class="container">
        <div class="row g-4">
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
            <div class="card hover-card text-center p-4 shadow h-100">
              <i class="fa fa-code fa-3x text-success mb-3"></i>
              <h5 class="card-title fw-bold">Programming</h5>
              <p class="card-text">
                Learn popular languages like Java, Python, and JavaScript with
                real-world examples.
              </p>
              <a
                href="programming.jsp"
                class="btn btn-success card-btn w-50 mx-auto d-block mt-3"
              >
                Explore <i class="fa fa-arrow-right ms-1"></i>
              </a>
            </div>
          </div>
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
            <div class="card hover-card text-center p-4 shadow h-100">
              <i class="fa fa-cogs fa-3x text-primary mb-3"></i>
              <h5 class="card-title fw-bold">Projects</h5>
              <p class="card-text">
                Step-by-step project guides to help you apply your coding
                knowledge practically.
              </p>
              <a
                href="projects.jsp"
                class="btn btn-primary card-btn w-50 mx-auto d-block mt-3"
              >
                Explore <i class="fa fa-arrow-right ms-1"></i>
              </a>
            </div>
          </div>
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
            <div class="card hover-card text-center p-4 shadow h-100">
              <i class="fa fa-database fa-3x text-danger mb-3"></i>
              <h5 class="card-title fw-bold">Data Structures</h5>
              <p class="card-text">
                Strengthen your DSA skills with visual explanations and practice
                problems.
              </p>
              <a
                href="dsa.jsp"
                class="btn btn-danger card-btn w-50 mx-auto d-block mt-3"
              >
                Explore <i class="fa fa-arrow-right ms-1"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="footer.jsp"%>
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script  src="<c:url value='/js/common-particle.js'/>" ></script>
  </body>
</html>

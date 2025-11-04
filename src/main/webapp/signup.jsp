<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up | Tech Blog</title>

    <!-- Bootstrap 5 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- AOS Animation Library -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css"
      rel="stylesheet"
    />
       <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />

<!-- SweetAlert2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Particles.js -->
    <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>

    <style>
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
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
      }

      /* Hero Section */
      .hero-section {
        position: relative;
        flex: 1;
        min-height: 70vh;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        overflow: hidden;
      }
      .hero-section h1 {
        font-size: 3rem;
        font-weight: 700;
        text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
      }
      .hero-section p {
        font-size: 1.2rem;
        margin-bottom: 30px;
        z-index: 1;
        position: relative;
      }

      /* Signup Form Container */
      .signup-container {
        max-width: 600px;
        background: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        padding: 40px 30px;
        margin: -60px auto 50px auto;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        position: relative;
        z-index: 2;
        color: #2c3e50;
      }
      .signup-container h2 {
        text-align: center;
        color: #16a085;
        margin-bottom: 25px;
        font-weight: 700;
      }
      .input-icon {
        position: relative;
      }
      .input-icon i {
        position: absolute;
        top: 50%;
        left: 12px;
        transform: translateY(-50%);
        color: #16a085;
      }
      .form-control.ps-4,
      .form-select.ps-4,
      textarea.ps-4 {
        padding-left: 40px !important;
      }

      /* Login Link as modern button */
      a.btn-outline-success {
        border-radius: 50px;
        padding: 6px 20px;
        font-weight: 500;
        transition: all 0.3s ease;
      }
      a.btn-outline-success:hover {
        background-color: #16a085;
        color: #fff !important;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      }
      input,
      select,
      textarea {
        padding-left: 40px;
        border-radius: 12px;
        border: 1px solid #ccc;
        padding: 10px 12px;
        font-size: 15px;
        transition: all 0.3s ease;
      }

      select {
        appearance: none;
        background: url('data:image/svg+xml;charset=US-ASCII,<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" stroke="%2316a085" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="2,4 7,9 12,4"/></svg>')
          no-repeat right 12px center;
        background-size: 12px;
        cursor: pointer;
      }
      input:focus,
      select:focus,
      textarea:focus {
        border-color: #16a085;
        box-shadow: 0 0 8px rgba(22, 160, 133, 0.3);
        outline: none;
      }
      textarea {
        resize: none;
        height: 80px;
      }

      .btn-primary {
        background: #16a085;
        border: none;
        font-weight: 600;
        transition: all 0.3s ease;
      }
      .btn-primary:hover {
        background: #1abc9c;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      }

      /* Cards Section */
      .cards-container {
        background-color: rgba(255, 255, 255, 0.05);
        padding: 60px 20px;
      }
      .hover-card {
        border-radius: 20px;
        backdrop-filter: blur(10px);
        background: rgba(255, 255, 255, 0.1);
        border: none;
        transition: transform 0.4s, box-shadow 0.4s;
      }
      .hover-card:hover {
        transform: translateY(-15px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
      }
      .hover-card i {
        font-size: 3rem;
        margin-bottom: 15px;
      }
      .card-btn {
        margin-top: 15px;
        border-radius: 50px;
        transition: transform 0.3s, box-shadow 0.3s;
      }
      .card-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
      }

      /* Footer */
      footer {
        background: rgba(22, 160, 133, 0.95);
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

      /* Particles Canvas */
      #particles-js {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: 0;
      }
    </style>
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
      <form action="signUpServlet" id="reg-form" method="post">
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

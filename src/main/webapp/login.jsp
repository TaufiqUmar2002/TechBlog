<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.tech.helper.Message" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | Tech Blog</title>
    <%@ include file ="css-links.jsp"%>
   <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
    <style>

      /* Login Section */
      .login-section {
        position: relative;
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        padding: 80px 20px;
        overflow: hidden;
      }
      .login-container {
        background: rgba(255, 255, 255, 0.95);
        color: #2c3e50;
        border-radius: 20px;
        padding: 40px 30px;
        max-width: 450px;
        width: 100%;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        position: relative;
        z-index: 2;
      }
      .login-container h2 {
        color: #16a085;
        font-weight: 700;
        margin-bottom: 25px;
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
      .form-control.ps-4 {
        padding-left: 40px !important;
        border-radius: 12px;
        border: 1px solid #ccc;
        font-size: 15px;
        transition: all 0.3s ease;
      }
      .form-control:focus {
        border-color: #16a085;
        box-shadow: 0 0 8px rgba(22, 160, 133, 0.3);
      }

      .btn-login {
        width: 100%;
        padding: 12px;
        border-radius: 50px;
        background: #16a085;
        border: none;
        color: #fff;
        font-weight: 600;
        font-size: 16px;
        transition: all 0.3s ease;
      }
      .btn-login:hover {
        background: #1abc9c;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      }

      .links {
        margin-top: 15px;
        font-size: 14px;
      }
      .error-container  {
          font-size: 18px;
          margin-bottom: 30px;
      }
      .error-container h5{
          text-decoration: none;
          color: #fff;
          background: #e74c3c;
          padding: 12px 28px;
          border-radius: 50px;
          font-weight: 600;
          transition: background 0.3s ease, transform 0.3s ease;
      }
      .links a {
        color: #16a085;
        font-weight: 600;
        text-decoration: none;
      }
      .links a:hover {
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
    <%@ include file="navbar.jsp"%>
    <!-- Login Section -->
    <div class="login-section">
      <div id="particles-js"></div>
      <div class="login-container" data-aos="zoom-in">
        <div class="logo mb-3">
          <img
            src="https://cdn-icons-png.flaticon.com/512/1828/1828506.png"
            alt="Tech Blog Logo"
            width="70"
          />
        </div>
        <h2>Welcome Back!</h2>
        <%
           Message message1 =(Message) session.getAttribute("msg");
           if(message1 !=null){
        %>
              <div class="error-container">
                <h5 class=""><%=message1.getContent()%></h5>
              </div>
        <%
           }
           session.removeAttribute("msg");
        %>
        <form id="login-form" method="post" action="loginServlet">
          <div class="mb-3 input-icon">
            <i class="fa fa-user"></i>
            <input
              type="text"
              class="form-control ps-4"
              name="name"
              placeholder="Name"
              required
            />
          </div>
          <div class="mb-3 input-icon">
            <i class="fa fa-envelope"></i>
            <input
              type="email"
              class="form-control ps-4"
              name="email"
              placeholder="Email"
              required
            />
          </div>
          <div class="mb-3 input-icon">
            <i class="fa fa-lock"></i>
            <input
              type="password"
              class="form-control ps-4"
              name="password"
              placeholder="Password"
              required
            />
          </div>
          <button type="submit" class="btn-login">
            <i class="fa fa-sign-in-alt me-1"></i> Login
          </button>
          <div class="links mt-3">
            <p>Don’t have an account? <a href="signup.jsp">Sign Up</a></p>
            <p><a href="#">Forgot Password?</a></p>
          </div>
        </form>
      </div>
    </div>

    <div>
      <%@ include file ="footer.jsp"%>
    </div>

    <!-- JS Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      AOS.init({ duration: 1200, once: true });

      particlesJS("particles-js", {
        particles: {
          number: { value: 80 },
          color: { value: "#ffffff" },
          shape: { type: "circle" },
          opacity: { value: 0.5 },
          size: { value: 3 },
          line_linked: {
            enable: true,
            distance: 150,
            color: "#ffffff",
            opacity: 0.3,
            width: 1,
          },
          move: { enable: true, speed: 2 },
        },
        interactivity: {
          detect_on: "canvas",
          events: { onhover: { enable: true, mode: "repulse" } },
        },
        retina_detect: true,
      });
    </script>
  </body>
</html>

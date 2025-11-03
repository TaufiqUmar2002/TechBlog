<%@ page import="com.entities.User" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Profile</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Animate.css -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
      body {
          background: linear-gradient(135deg, #e0f7fa, #ffffff);
          min-height: 100vh;
          display: flex;
          flex-direction: column;
      }
      .edit-container {
          background: #fff;
          border-radius: 15px;
          box-shadow: 0 8px 20px rgba(0,0,0,0.1);
          padding: 30px;
          width: 100%;
          max-width: 600px;
          margin: auto;
          margin-top: 40px;
      }
      .form-label {
          font-weight: 500;
          color: #555;
      }
      .btn-primary {
          background-color: #007bff;
          border: none;
          transition: 0.3s;
      }
      .btn-primary:hover {
          background-color: #0056b3;
      }
      footer {
          background: #222;
          color: #fff;
          text-align: center;
          padding: 15px 0;
          margin-top: auto;
      }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp">MyApp</a>
      <div class="collapse navbar-collapse justify-content-end">
          <ul class="navbar-nav">
              <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
              <li class="nav-item"><a class="nav-link active" href="editProfile.jsp">Edit Profile</a></li>
              <li class="nav-item"><a class="nav-link" href="logoutServlet">Logout</a></li>
          </ul>
      </div>
  </div>
</nav>

<!-- Edit Profile Form -->
<div class="edit-container animate__animated animate__fadeInUp">
    <h3 class="text-center mb-4">Edit Your Profile</h3>
    <form id="edit-form">
        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" name="name" value="<%=user.getName()%>" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" required>
        </div>

        <div class="mb-3">
            <label for="gender" class="form-label">Gender</label>
            <select name="gender" class="form-select">
                <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="contact" class="form-label">Contact</label>
            <input type="text" class="form-control" name="contact" value="<%=user.getContact()%>">
        </div>

        <div class="mb-3">
            <label for="about" class="form-label">About</label>
            <textarea class="form-control" name="about" rows="3"><%=user.getAbout()%></textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary px-5">Save Changes</button>
        </div>
    </form>
</div>

<!-- Footer -->
<footer>
    <p>© 2025 MyApp | Designed by Taufiq Umar</p>
</footer>

<!-- Script -->
<script>
$(document).ready(function() {
    $('#edit-form').on('submit', function(event) {
        event.preventDefault();

        let formData = new FormData(this);

        $.ajax({
            url: "EditProfileServlet",
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function() {
                Swal.fire({
                    title: 'Saving...',
                    text: 'Please wait while we update your profile.',
                    didOpen: () => Swal.showLoading(),
                    allowOutsideClick: false
                });
            },
            success: function(data) {
                Swal.fire({
                    icon: 'success',
                    title: 'Profile Updated!',
                    text: 'Your profile has been successfully updated.',
                    confirmButtonColor: '#3085d6'
                });
            },
            error: function(xhr) {
                Swal.fire({
                    icon: 'error',
                    title: 'Update Failed!',
                    text: 'Something went wrong. Try again later.',
                    confirmButtonColor: '#d33'
                });
                console.log("Error:", xhr.responseText);
            }
        });
    });
});
</script>
</body>
</html>

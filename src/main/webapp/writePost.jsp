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
    <title>Write New Post</title>
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
        .post-container {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            padding: 30px;
            width: 100%;
            max-width: 700px;
            margin: 40px auto;
        }
        .form-label {
            font-weight: 500;
            color: #444;
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
        textarea {
            resize: none;
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
              <li class="nav-item"><a class="nav-link active" href="writePost.jsp">Write Post</a></li>
              <li class="nav-item"><a class="nav-link" href="profile.jsp"><%= user.getName() %></a></li>
              <li class="nav-item"><a class="nav-link" href="logoutServlet">Logout</a></li>
          </ul>
      </div>
  </div>
</nav>

<!-- Write Post Form -->
<div class="post-container animate__animated animate__fadeInUp">
    <h3 class="text-center mb-4">Create a New Post</h3>
    <form id="post-form" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Post Title</label>
            <input type="text" name="title" class="form-control" placeholder="Enter your post title" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Category</label>
            <select name="category" class="form-select" required>
                <option value="">Select Category</option>
                <option value="Technology">Technology</option>
                <option value="Education">Education</option>
                <option value="Lifestyle">Lifestyle</option>
                <option value="Business">Business</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Content</label>
            <textarea name="content" class="form-control" rows="6" placeholder="Write your post content..." required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Upload Image (optional)</label>
            <input type="file" name="image" class="form-control" accept="image/*">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary px-5">Publish Post</button>
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
    $('#post-form').on('submit', function(e) {
        e.preventDefault();

        let formData = new FormData(this);

        $.ajax({
            url: "AddPostServlet",
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function() {
                Swal.fire({
                    title: 'Publishing...',
                    text: 'Please wait while we publish your post.',
                    didOpen: () => Swal.showLoading(),
                    allowOutsideClick: false
                });
            },
            success: function(data) {
                Swal.fire({
                    icon: 'success',
                    title: 'Post Published!',
                    text: 'Your post has been successfully uploaded.',
                    confirmButtonColor: '#3085d6'
                }).then(() => {
                    window.location = 'dashboard.jsp';
                });
            },
            error: function(xhr) {
                Swal.fire({
                    icon: 'error',
                    title: 'Failed!',
                    text: 'Something went wrong while publishing your post.',
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

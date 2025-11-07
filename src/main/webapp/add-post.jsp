<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.tech.dao.CommonDao" %>
<%@ page import="java.util.List"%>
<%@ page import="com.tech.entities.Category"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tech Blog | Add Post</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/home.css'/>" />

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<!-- AOS Animation Library -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />
</head>
<body>

<%@ include file="navbar.jsp" %>

<%
 CommonDao commonDao = new CommonDao();
 session.setAttribute("categories",commonDao.getAllCategories());

List<Category>  categories = (List<Category>) session.getAttribute("categories");
%>

<!-- Add Post Section -->
<div class="container mt-5 mb-5" data-aos="fade-up">

    <h2 class="text-center mb-4">
        <i class="fa fa-pen me-2"></i>Add New Post
    </h2>

    <div class="card shadow p-4">

        <form action="addPostServlet" method="post" enctype="multipart/form-data">

            <!-- Post Title -->
            <div class="mb-3">
                <label class="form-label fw-bold">Post Title</label>
                <input type="text" name="title" class="form-control" required placeholder="Enter post title" />
            </div>

            <!-- Category -->
            <div class="mb-3">
                <label class="form-label fw-bold">Category</label>
                <select name="categoryId" class="form-select" required>
                    <option value="">-- Select Category --</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}">${cat.name}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Content -->
            <div class="mb-3">
                <label class="form-label fw-bold">Post Content</label>
                <textarea name="content" rows="6" class="form-control" placeholder="Write your content here..." required></textarea>
            </div>

            <!-- Photo Upload -->
            <div class="mb-3">
                <label class="form-label fw-bold">Upload Image</label>
                <input type="file" name="image" class="form-control" accept="image/*" />
            </div>

            <!-- Submit -->
            <div class="text-center">
                <button class="btn btn-success btn-lg">
                    <i class="fa fa-upload me-2"></i>Publish Post
                </button>
            </div>

        </form>
    </div>
</div>


<!-- Footer -->
<div>
    <%@ include file="footer.jsp" %>
</div>


<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

<script>
    AOS.init();
</script>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.tech.dao.CommonDao" %>
<%@ page import="java.util.List"%>
<%@ page import="com.tech.entities.Category"%>
<%@ page import="com.tech.entities.Post"%>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tech Blog | Home</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
   <link rel="stylesheet" href="<c:url value='/css/home.css'/>" />
<style>
  /* ✅ Post container */
  #postsContainer {
      background: #0fa57a; /* your green base */
      padding: 20px;
      border-radius: 10px;
  }

  .post-card-modern {
      background: #fff;
      border-radius: 18px;
      display: flex;
      gap: 20px;
      padding: 20px;
      margin-bottom: 20px;
      align-items: flex-start;
  }

  .thumb-img {
      width: 120px;
      height: 120px;
      border-radius: 10px;
      object-fit: cover;
  }

  .post-content {
      flex: 1;
  }

  .post-title {
      font-size: 22px;
      font-weight: 700;
      margin-bottom: 10px;
      color: #046E61;
  }

  .post-summary {
      color: #333;
      font-size: 15px;
      margin-bottom: 18px;
  }

  .post-actions {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
  }
.btn-modern {
    background: white;
    border: 2px solid #0ea06c;
    padding: 10px 18px;
    border-radius: 30px;
    font-weight: 600;
    color: #0ea06c;
    transition: 0.25s;
}

.btn-modern:hover {
    background: #0ea06c;
    color: white;
}

.btn-view {
    border-color: #198754;
    color: #198754;
}

.btn-view:hover {
    background: #198754;
    color: white;
}



    </style>
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<!-- AOS Animation Library -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />

<!-- Particles.js -->
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>

<%
 CommonDao commonDao = new CommonDao();
 session.setAttribute("categories",commonDao.getAllCategories());

List<Category>  categories = (List<Category>) session.getAttribute("categories");
%>
</head>
<body>
<%@ include file ="navbar.jsp"%>
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
<div class="container py-4">

    <div class="row">

        <!-- ✅ LEFT CATEGORIES -->
        <div class="col-md-3">
            <div class="list-group" id="categoryList">

                <a data-id="0" class="list-group-item list-group-item-action">
                    All Posts
                </a>
                <a data-id="-1" class="list-group-item list-group-item-action">
                    Public Posts
                </a>
                <a data-id="-2" class="list-group-item list-group-item-action">
                    My Posts
                </a>

                <c:forEach var="cat" items="${categories}">
                    <a data-id="${cat.id}" class="list-group-item list-group-item-action">
                        ${cat.name}
                    </a>
                </c:forEach>

            </div>
        </div>

        <!-- ✅ RIGHT POSTS PANEL -->
        <div class="col-md-9">
            <div id="postsContainer">
                Select a category
            </div>
        </div>

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
<div>
 <%@ include file="footer.jsp"%>
</div>
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script  src="<c:url value='/js/common-particle.js'/>" ></script>
<script>
   const ctx = "${pageContext.request.contextPath}";
   console.log(ctx)
</script>

<script>
    function loadPosts(cid) {

        document.querySelectorAll("#categoryList .list-group-item")
            .forEach(i => i.classList.remove("active"));

        let x = document.querySelector(`#categoryList .list-group-item[data-id="${cid}"]`);
        if (x) x.classList.add("active");

        document.getElementById("postsContainer").innerHTML = "Loading...";

        fetch(ctx + "/getPosts?cid=" + cid)
            .then(res => res.json())
            .then(list => {

                if (!list || list.length === 0) {
                    document.getElementById("postsContainer").innerHTML = "";
                    return;
                }

                let html = "";

                list.forEach(post => {
                    let summary = (post.summary ?? "").substring(0, 180);
                    let imgSrc = post.imageName
                        ? `${pageContext.request.contextPath}/img/\${post.imageName}`

                        : "https://via.placeholder.com/120?text=No+Image";
                    html += `
                    <div class="post-card-modern">
                        <img src="\${imgSrc}" class="thumb-img" alt="Post Image">

                        <div class="post-content">
                            <h3 class="post-title">\${post.title}</h3>

                            <p class="post-summary">\${summary}...</p>

                            <div class="post-actions">
                                <button class="btn-modern btn-like">
                                    <i class="fa fa-thumbs-up"></i> Like
                                </button>

                                <button class="btn-modern btn-dislike">
                                    <i class="fa fa-thumbs-down"></i> Dislike
                                </button>

                                <button class="btn-modern btn-comment">
                                    <i class="fa fa-comment"></i> Comment
                                </button>

                                <a href="${pageContext.request.contextPath}/view-post.jsp?pid=${post.id}"
                                   class="btn-modern btn-view">
                                    <i class="fa fa-eye"></i> View Full
                                </a>
                            </div>
                        </div>
                    </div>
                    `;
                });


                document.getElementById("postsContainer").innerHTML = html;
            })
            .catch(err => console.log(err));
    }

    // Attach click
    document.querySelectorAll("#categoryList .list-group-item")
        .forEach(item => {
            item.addEventListener("click", () => loadPosts(item.getAttribute("data-id")));
        });

</script>






</body>
</html>

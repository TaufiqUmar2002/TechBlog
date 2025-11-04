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
                <li class="nav-item"><a class="nav-link" href="writePost.jsp"><i class="fa fa-pen me-1"></i>Write Post</a></li>
            </ul>
            <!-- Show username if logged in, else show login/signup -->
            <div class="d-flex">
                <c:choose>
                    <c:when test="${not empty sessionScope.username}">
                       <span class="navbar-text me-3 d-flex align-items-center">
                         <i class="fa fa-user-circle me-1"></i>
                         <a class="nav-link p-0" href="profile.jsp">${sessionScope.username}</a>
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

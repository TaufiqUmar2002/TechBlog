<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.tech.dao.CommonDao" %>
<%@ page import="com.tech.entities.Post" %>
<%@ page isELIgnored="false" %>
<%@ page import ="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>View Post | TechBlog</title>

    <%@ include file="css-links.jsp"%>

    <!-- Bootstrap + Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v24.0&appId=APP_ID"></script>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
    <link rel="stylesheet" href="<c:url value='/css/indexs.css'/>" />

    <style>


        .post-wrapper {
            max-width: 900px;
            margin: auto;
            background: linear-gradient(135deg, #23c1a1, #21b79c);
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.18);
            color: #fff;
        }

        .post-title {
            font-size: 32px;
            font-weight: 700;
            color: #fff;
        }

        .post-content {
            font-size: 18px;
            line-height: 1.65;
            color: #fff;
        }

        .btn-pill {
            border-radius: 40px;
            font-weight: 600;
            padding: 10px 24px;
            background: #fff !important;
            color: #0b9c7c !important;
            border: none;
            transition: 0.2s ease-in-out;
        }

        .btn-pill:hover {
            background: #f5f5f5 !important;
            transform: scale(1.04);
        }

        .btn-pill i {
            color: #0b9c7c !important;
            margin-right: 5px;
        }

        pre {
            background: rgba(255,255,255,0.3);
            border-radius: 10px;
            padding: 16px;
            color: #fff;
            border: 1px solid rgba(255,255,255,0.5);
            font-size: 16px;
        }


        .post-image {
            width: 280px;
            height: 180px;
            object-fit: cover;
            border-radius: 14px;
            margin-bottom: 20px;
            float: left;
            margin-right: 25px;
        }
        .comment-wrapper {
            background: #ffffff;
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 3px 14px rgba(0,0,0,0.15);
        }

        .comment-input {
            border-radius: 12px;
            border: 1px solid #ccc;
            padding: 12px;
            font-size: 15px;
        }

        .btn-add-comment {
            background: #16a085;
            border: none;
            color: white;
            padding: 8px 20px;
            border-radius: 25px;
            font-weight: 600;
            transition: 0.25s;
        }

        .btn-add-comment:hover {
            background: #0f8067;
        }

        .comment-item {
            background: #f5fdf8;
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 12px;
            border-left: 4px solid #16a085;
        }

        .comment-meta {
            font-size: 12px;
            color: #6b6b6b;
            margin-bottom: 6px;
        }
        .no-comment {
            color: #999;
            font-style: italic;
        }

    </style>

    <%
        int pid = Integer.parseInt(request.getParameter("pid"));
        Post post = new CommonDao().getPostById(pid);
    %>
</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="container py-5">

    <div class="post-wrapper">
         <div class="d-flex align-items-center gap-3 mb-3 text-muted" style="font-size:15px;">
           <span class="navbar-text me-3 d-flex align-items-center">
              <i class="fa fa-user-circle me-1"></i>
                <b><a class="nav-link p-0" href="profile.jsp?pid=<%= post.getUser().getId() %>"><%= post.getUser() != null ? post.getUser().getName() : "Unknown" %></a></b>
           </span>

            <span>.</span>
            <span>
                   <i class="fa fa-clock me-1"></i>
                   <%
                       Object ts = post.getCreationTimeStamp();
                       String formattedDate = "";

                       if (ts instanceof java.time.LocalDateTime) {
                           formattedDate = ((java.time.LocalDateTime) ts)
                                   .format(DateTimeFormatter.ofPattern("dd-MMM-yyyy hh:mm a"));
                       } else if (ts instanceof java.time.LocalDate) {
                           formattedDate = ((java.time.LocalDate) ts)
                                   .format(DateTimeFormatter.ofPattern("dd-MMM-yyyy"));
                       }
                   %>
                   <%= formattedDate %>
               </span>
         </div>
        <h2 class="post-title mb-3">
            <%= post.getTitle() %>
        </h2>

        <p class="post-category mb-3">
            <i class="fa fa-folder-open me-2"></i>
            <%= post.getCategory() != null ? post.getCategory().getName() : "Uncategorized" %>
        </p>

        <%
            String img = post.getPic();
            if (img != null && !img.isEmpty()) {
        %>
        <img src="<%= request.getContextPath() %>/img/<%= img %>" class="post-image mb-4" alt="Post Image">
        <% } %>

        <h5 class="fw-semibold">Description</h5>
        <p class="post-content"><%= post.getContent() %></p>

        <%
            if (post.getCode() != null && !post.getCode().isEmpty()) {
        %>
        <h5 class="fw-semibold mt-4">Full Content</h5>
        <pre><%= post.getCode() %></pre>
        <% } %>

        <div class="d-flex gap-3 mt-4 justify-content-center" id ="#id">
        <%
          Long count = new CommonDao().likeCount(pid);
        %>
            <a href="#id" onclick ="doLike(<%=post.getId()%>,<%= post.getUser().getId() %>,'like')" class="btn btn-pill" >
                <i class="fa fa-thumbs-up"></i> <span id ="like-counter-<%=post.getId()%>"><%=count%></span> Like
            </a>

            <a href="#id" onclick ="doLike(<%=post.getId()%>,<%= post.getUser().getId() %>,'dislike')" class="btn btn-pill">
                <i class="fa fa-thumbs-down"><span id ="like-counter-<%=post.getId()%>"> <%=count%></i> Dislike
            </a>
            <a href="#id"  class="btn btn-pill" onclick="toggleComments()"  >
                            <i class="fa fa-comment"></i> Comment
            </a>
            <a href="home.jsp" class="btn btn-pill">
                <i class="fa fa-arrow-left"></i> Back
            </a>

        </div>
    </div>
</div>
<div id="comment-wrapper" class="comment-wrapper mt-4" style="display:none;">

    <h5 class="fw-bold text-secondary mb-3">Comments</h5>

    <div class="mb-3">
        <textarea class="form-control comment-input" id="comment-input"
           rows="3" placeholder="Write your thoughts..."></textarea>
    </div>

    <button class="btn btn-add-comment" onclick="addComment(<%= post.getId() %>)">
        Add Comment
    </button>

    <div id="comments-container" class="mt-3 text-secondary small">
        <p class="no-comment">No comments yet</p>
    </div>
</div>


<%@ include file="footer.jsp"%>
  <script>
     const ctx = "${pageContext.request.contextPath}";

   function toggleComments() {
       const box = document.getElementById("comment-wrapper");

       if (!commentVisible) {
           box.style.display = "block";
           loadComments(<%= post.getId() %>);
           box.scrollIntoView({ behavior: "smooth" });
       } else {
           box.style.display = "none";
       }

       commentVisible = !commentVisible;
   }
   function loadComments(pid) {
       fetch(`getComments?pid=` + pid)
           .then(res => res.json())
           .then(list => {

               let box = document.getElementById("comments-container");

               if (!list || list.length === 0) {
                   box.innerHTML = `<p class="no-comment">No comments yet</p>`;
                   return;
               }

               let html = "";
               list.forEach(c => {
                   html += `
                   <div class="comment-item">
                       <div class="comment-meta">
                           <strong>\${c.user}</strong> • \${c.time}
                       </div>
                       <div>\${c.text}</div>
                   </div>`;
               });

               box.innerHTML = html;
           });
   }
function addComment(pid) {

    let text = $("#comment-input").val().trim();
    if (text === "") return;
        console.log(text)

    $.ajax({
        url: ctx + "/addCommentServlet",
        type: "POST",
        data: {
            pid: pid,
            text: text
        },
        success: function (res) {
            $("#comment-input").val("");   // clear textbox
            loadComments(pid);             // reload comments
        },
        error: function (err) {
            console.log("Error:", err);
        }
    });
}



    </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script  src="<c:url value='/js/common-particle.js'/>" ></script>
<script  src="<c:url value='/js/like.js'/>" ></script>

</body>
</html>

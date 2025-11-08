<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.tech.dao.CommonDao" %>
<%@ page import="com.tech.entities.Post" %>



<!DOCTYPE html>
<html>
<head>
<%
    String pidStr = request.getParameter("id");


%>
    <title><%=pidStr%> | TechBlog</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>



    <style>
        .post-wrapper {
            max-width: 900px;
            margin: auto;
            background: #fff;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 18px rgba(0,0,0,0.08);
        }

        .post-image {
            width: 100%;
            max-height: 380px;
            object-fit: cover;
            border-radius: 12px;
        }

        .btn-pill {
            border-radius: 40px;
            font-weight: 600;
            padding: 10px 18px;
        }

        .post-category {
            font-size: 15px;
            font-weight: 600;
            color: #007b5e;
        }

        pre {
            background: #f7f7f7;
            padding: 16px;
            border-radius: 10px;
        }
    </style>
</head>

<body class="bg-light">

<%@ include file="navbar.jsp" %>

<div class="container py-5">

   <div class="post-wrapper">

        <h2 class="fw-bold mb-3">d   ||  <%=pidStr%></h2>
</div>


</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

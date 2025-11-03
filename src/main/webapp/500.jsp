<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>500 Server Error | Tech Blog</title>

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #e74c3c, #c0392b);
    padding: 50px 0;
}

.error-container {
    background: rgba(255,255,255,0.1);
    backdrop-filter: blur(15px);
    padding: 50px 40px;
    border-radius: 20px;
    box-shadow: 0 15px 30px rgba(0,0,0,0.2);
    width: 450px;
    max-width: 90%;
    text-align: center;
    color: #fff;
}

.error-container h1 {
    font-size: 120px;
    margin-bottom: 20px;
    font-weight: 700;
}

.error-container h2 {
    font-size: 28px;
    margin-bottom: 15px;
    font-weight: 600;
}

.error-container p {
    font-size: 18px;
    margin-bottom: 30px;
}

.error-container a {
    text-decoration: none;
    color: #fff;
    background: #e74c3c;
    padding: 12px 28px;
    border-radius: 50px;
    font-weight: 600;
    transition: background 0.3s ease, transform 0.3s ease;
}

.error-container a:hover {
    background: #c0392b;
    transform: translateY(-2px);
}

.logo img {
    width: 60px;
    margin-bottom: 20px;
}
</style>
</head>
<body>

<div class="error-container">
    <div class="logo">
        <img src="https://cdn-icons-png.flaticon.com/512/1828/1828506.png" alt="Tech Blog Logo" />
    </div>
    <h1>500</h1>
    <h2>Oops! Something Went Wrong</h2>
    <p>There was an internal server error. Please try again later.</p>
    <a href="index.jsp"><i class="fa fa-home me-2"></i>Go Back Home</a>
</div>

</body>
</html>

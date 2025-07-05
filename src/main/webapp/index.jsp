<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Register Student</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h2>Register Student</h2>
    <form action="addStudent" method="post">
        Name: <input type="text" name="name" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        <input type="submit" value="Register">
    </form>
    <br>
    <a href="view-students.jsp">View All Students</a>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>

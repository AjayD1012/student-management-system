<%@ page import="java.sql.*" %>
<%@ page import="com.studentApp.utils.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container { max-width: 600px; margin: 30px auto; }
    </style>
</head>
<body class="bg-light">
    <div class="container form-container">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h2 class="mb-0">Edit Student</h2>
            </div>
            <div class="card-body">
                <%
                int id = Integer.parseInt(request.getParameter("id"));
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM students1 WHERE id = ?");
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (!rs.next()) {
                    response.sendRedirect("viewStudents");
                    return;
                }
                %>
                <form action="${pageContext.request.contextPath}/updateStudent" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
    
    <div class="mb-3">
        <label class="form-label">Name</label>
        <input type="text" class="form-control" name="name" 
               value="<%= rs.getString("name") %>" required>
    </div>
    
    <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" name="email" 
               value="<%= rs.getString("email") %>" required>
    </div>
    
    <button type="submit" class="btn btn-primary">Update</button>
    <a href="${pageContext.request.contextPath}/viewStudents" 
       class="btn btn-secondary">Cancel</a>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
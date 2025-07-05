<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container { max-width: 600px; margin: 30px auto; }
    </style>
</head>
<body class="bg-light">
    <div class="container form-container">
        <div class="card shadow">
            <div class="card-header bg-success text-white">
                <h2 class="mb-0">Register Student</h2>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/addStudent" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    
                    <div class="d-flex justify-content-between">
                        <a href="${pageContext.request.contextPath}/viewStudents" 
                           class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-success">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
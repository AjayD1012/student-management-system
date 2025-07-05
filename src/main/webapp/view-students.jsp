<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h1 class="mb-4">Student List</h1>
    
    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th>#</th> <!-- Sequential number column -->
                <th>ID</th> <!-- Database ID column -->
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td> <!-- Display sequential number -->
                    <td>${student.id}</td> <!-- Original database ID -->
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/edit-student.jsp?id=${student.id}" 
                           class="btn btn-sm btn-warning">Edit</a>
                        <a href="${pageContext.request.contextPath}/deleteStudent?id=${student.id}" 
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Delete ${student.name}?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <a href="${pageContext.request.contextPath}/add-student.jsp" class="btn btn-primary">Add Student</a>
    
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
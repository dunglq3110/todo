<%--
  Created by IntelliJ IDEA.
  User: Roman
  Date: 17.07.2022
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: rgba(165, 66, 187, 0.53)">
        <div>
            <a href="https://github.com/flngs" class="navbar-brand">Todo App</a>
        </div>

        <ul class="navbar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/list" class="nav-link">Todos</a>
            </li>
        </ul>

        <ul class="navbar-nav navbar-collapse justify-content-end">
            <li>
                <a href="<%=request.getContextPath()%>/logout" class="nav-link">Logout</a>
            </li>
        </ul>
    </nav>
</header>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Todos</h3>
        <hr>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add Todo</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Title</th>
                <th>Target Date</th>
                <th>Todo Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="todo" items="${listTodo}">

                <tr>
                    <td><c:out value="${todo.title}"/></td>
                    <td><c:out value="${todo.targetDate}"/></td>
                    <td><c:out value="${todo.status}"/></td>

                    <td>
                        <a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${todo.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

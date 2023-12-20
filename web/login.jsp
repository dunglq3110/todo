<%--
  Created by IntelliJ IDEA.
  User: Roman
  Date: 16.07.2022
  Time: 01:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .container {
            display: grid;
            place-items: center;
            vertical-align: middle;
        }

    </style>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
    <h1>Login Form</h1>
    <div class="col-md-6 col-md-offset-3" role="alert" aria-live="assertive">
        <div class="alert alert-success center" role="alert" aria-live="assertive">
            <p style="place-items: center; color: rgba(255,0,0,0.53)">${NOTIFICATION_LOG}</p>
        </div>

        <form action="<%=request.getContextPath()%>/login" method="post">

            <div class="form-group">
                <label for="username">User Name:</label> <input type="text" class="form-control" id="username"
                                                                placeholder="User Name" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label> <input type="password" class="form-control" id="password"
                                                               placeholder="Password" name="password" required>
            </div>

            <div style="text-align: center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>

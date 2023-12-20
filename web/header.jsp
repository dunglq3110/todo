<%--
  Created by IntelliJ IDEA.
  User: Roman
  Date: 14.07.2022
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: rgba(165, 66, 187, 0.53)">
        <div>
            <a href="https://github.com/flngs" class="navbar-brand"> Todo App</a>
        </div>

        <ul class="navbar-nav navbar-collapse justify-content-end">
            <li><a href="<%= request.getContextPath() %>/login" class="nav-link">Login</a></li>
            <li><a href="<%= request.getContextPath() %>/register" class="nav-link">Signup</a></li>
        </ul>
    </nav>
</header>

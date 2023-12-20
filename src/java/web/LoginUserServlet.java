package web;

import dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginUserServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        authenticate(req, resp);
    }

    private void authenticate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int result = userDao.getUserByUsernameAndPassword(username, password);
        if (result == 0) {
            HttpSession session = req.getSession();
            session.setAttribute("user", username);
            session.setAttribute("NOTIFICATION_LOG", "Wrong username or password!");
            resp.sendRedirect("login.jsp");
        } else {
            req.getRequestDispatcher("todo-list.jsp").forward(req, resp);
        }
    }
}
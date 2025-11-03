package com.tech.servlet;

import com.tech.dao.UserDao;
import com.tech.entities.User;
import com.tech.helper.Message;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

public class LoginServlet extends HttpServlet {
    UserDao userDao = new UserDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Optional<User> user =userDao.getUserByName(name,email);
        if(user.isPresent()){
            if(user.get().getPassword().equals(password.trim())){
                req.getSession().setAttribute("username",name);
                req.getSession().setAttribute("email",email);
                resp.sendRedirect("home.jsp");
            }
            else{
                Message message = new Message("Incorrect Password","error","");
                HttpSession session = req.getSession();
                session.setAttribute("msg",message);
                resp.sendRedirect("login.jsp");

            }
        }
        else{
            resp.sendRedirect("login.jsp");
        }
    }
}

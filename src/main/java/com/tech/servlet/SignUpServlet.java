package com.tech.servlet;

import com.tech.dao.IUserDao;
import com.tech.dao.UserDao;
import com.tech.entities.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;


@MultipartConfig
public class SignUpServlet extends HttpServlet {

    private final IUserDao userDao=new UserDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        Map<String, Object> data = new HashMap<>();
        String fullName =req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPass = req.getParameter("correctPass");
        String gender = req.getParameter("gender");
        Long phone = Long.parseLong(req.getParameter("phone"));
        String about = req.getParameter("about");
        Optional<User> user1 =userDao.getUserByName(fullName,email);
        if(password.equals(confirmPass)){
            if(user1.isPresent()){
                data.put("status","error");
                data.put("message","User is already present");
            }else {
                User user = new User(fullName,email,password,gender,phone,about);
                userDao.saveUser(user);
                req.getSession().setAttribute("username",fullName);
                req.getSession().setAttribute("email",email);
                resp.sendRedirect("home.jsp");
            }
        }
        else{
            data.put("status","error");
            data.put("message","Password is not matched");
            resp.sendRedirect("signup.jsp");
        }
    }
}

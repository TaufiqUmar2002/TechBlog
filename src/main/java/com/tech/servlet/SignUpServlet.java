package com.tech.servlet;

import com.tech.dao.ICommonDao;
import com.tech.dao.CommonDao;
import com.tech.entities.User;
import com.tech.helper.FileHelper;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;


@MultipartConfig
public class SignUpServlet extends HttpServlet {

    private final ICommonDao userDao=new CommonDao();
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
        Part part = req.getPart("image");
        ServletContext context = req.getServletContext();
        String param2 = context.getInitParameter("param2");
        String param3 = context.getInitParameter("param3");
        Optional<User> user1 =userDao.getUserByName(fullName,email);
        if(password.equals(confirmPass)){
            if(user1.isPresent()){
                data.put("status","error");
                data.put("message","User is already present");
            }else {
                String path = param2+param3+ File.separator+part.getSubmittedFileName();
                User user = new User(fullName,email,password,gender,phone,about,part.getSubmittedFileName(), LocalDateTime.now());
                FileHelper.saveFile(part.getInputStream(),path);
                userDao.saveUser(user);
                resp.sendRedirect("login.jsp");
            }
        }
        else{
            data.put("status","error");
            data.put("message","Password is not matched");
            resp.sendRedirect("signup.jsp");
        }
    }
}

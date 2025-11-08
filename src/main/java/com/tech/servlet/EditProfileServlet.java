package com.tech.servlet;

import com.tech.dao.CommonDao;
import com.tech.dao.ICommonDao;
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
@MultipartConfig
public class EditProfileServlet extends HttpServlet {

    ICommonDao commonDao = new CommonDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user =  (User)req.getSession().getAttribute("user");
        String name=req.getParameter("name");
        user.setName(name);
        String email =req.getParameter("email");
        user.setEmail(email);
        String bio =req.getParameter("bio");
        user.setAbout(bio);
        Part part = req.getPart("profilePic");
        ServletContext context =req.getServletContext();
        String param3 = context.getInitParameter("param3");
        String param2 = context.getInitParameter("param2");
        if(part.getSubmittedFileName() !=null && part.getSize()>1 ){
            String fileName = part.getSubmittedFileName();
            user.setProfilePicPath(fileName);
            String path =param2+param3+ File.separator+fileName;
            if(FileHelper.deleteFile(path)){
                if(FileHelper.saveFile(part.getInputStream(),path)){
                    System.out.println("File Saved");
                }
            }
        }
        commonDao.saveUser(user);
        req.getSession().removeAttribute("user");
        req.getSession().setAttribute("user",user);
        resp.sendRedirect("profile.jsp");

    }
}

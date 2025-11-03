package com.tech.servlet;

import com.tech.helper.FileHelper;

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
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        String email =req.getParameter("email");
        String bio =req.getParameter("bio");
        Part part = req.getPart("profilePic");
        String fileName = part.getSubmittedFileName();
        String path =req.getRealPath("/")+"pics"+ File.separator+fileName;
        System.out.println(path);
        resp.sendRedirect("profile.jsp");
        if(FileHelper.deleteFile(path)){
            if(FileHelper.saveFile(part.getInputStream(),path)){
                System.out.println("File Saved");
            };
        }
    }
}

package com.tech.servlet;

import com.tech.dao.CommonDao;
import com.tech.dao.ICommonDao;
import com.tech.entities.Category;
import com.tech.entities.Post;
import com.tech.helper.FileHelper;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Optional;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    ICommonDao commonDao = new CommonDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        Integer id =  Integer.parseInt(req.getParameter("categoryId"));
        String content = req.getParameter("content");
        Optional<Part> part = Optional.ofNullable(req.getPart("image"));
        Post post = new Post();
        if(part.isPresent()){
            String fileName=part.get().getSubmittedFileName();
            System.out.println(fileName);
            String path =req.getRealPath("/")+"img"+ File.separator+fileName;
            System.out.println(path);
            FileHelper.saveFile(part.get().getInputStream(),path);
            post.setPic(fileName);
        }

        post.setTitle(title);
        post.setContent(content);
        Category category =commonDao.getCategoryById(id);
        post.setCategory(category);
        commonDao.savePost(post);
        resp.sendRedirect("home.jsp");
    }
}

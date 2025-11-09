package com.tech.servlet;

import com.tech.dao.CommonDao;
import com.tech.dao.ICommonDao;
import com.tech.entities.Like;
import com.tech.entities.Post;
import com.tech.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

public class LikeServlet extends HttpServlet {
    ICommonDao commonDao = new CommonDao();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("operation");
        Integer pId = Integer.parseInt(req.getParameter("pid"));
        PrintWriter out =resp.getWriter();
        User user =(User) req.getSession().getAttribute("user");
        System.out.println(user);
        Post post = commonDao.getPostById(pId);
        Like like = new Like();
        like.setUser(user);
        like.setPost(post);
        like.setCreationTimeStamp(LocalDateTime.now());
        commonDao.saveLike(like);
        out.println("true");
    }
}

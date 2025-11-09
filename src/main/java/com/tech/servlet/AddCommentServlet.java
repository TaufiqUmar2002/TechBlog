package com.tech.servlet;

import com.tech.dao.CommonDao;
import com.tech.dao.ICommonDao;
import com.tech.entities.Comment;
import com.tech.entities.User;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

public class AddCommentServlet extends HttpServlet {
    ICommonDao dao = new CommonDao();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int pid = Integer.parseInt(req.getParameter("pid"));
        String text = req.getParameter("text");
        User user = (User) req.getSession().getAttribute("user");
        Comment c = new Comment();
        c.setContent(text);
        c.setPost(dao.getPostById(pid));
        c.setUser(user);
        c.setCreatedAt(LocalDateTime.now());
        dao.addComment(c);
        resp.getWriter().print("success");
    }
}

package com.tech.servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tech.dao.CommonDao;
import com.tech.dao.ICommonDao;
import com.tech.entities.Comment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ICommonDao dao = new CommonDao();

        int pid = Integer.parseInt(req.getParameter("pid"));
        List<Comment> comments = dao.getCommentsByPost(pid);
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        JsonArray arr = new JsonArray();
        for(Comment c : comments){
            JsonObject o = new JsonObject();
            o.addProperty("user", c.getUser().getName());
            System.out.println(c.getContent());
            System.out.println(c.getUser().getName());
            o.addProperty("text", c.getContent());
            o.addProperty("time", c.getCreatedAt().toString());
            arr.add(o);
        }
        out.print(arr);
    }
}

package com.tech.servlet;

import com.google.gson.Gson;
import com.tech.dao.CommonDao;
import com.tech.dao.ICommonDao;
import com.tech.entities.Post;
import com.tech.entities.PostDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/getPosts")
public class GetPostsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int cid = Integer.parseInt(req.getParameter("cid"));

        CommonDao dao = new CommonDao();
        List<Post> posts = dao.getAllPostByCategory(cid);

        List<PostDTO> safe = new ArrayList<>();
        for (Post p : posts) {
            safe.add(new PostDTO(p));
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
String s =String.valueOf(req.getAttribute("ss"));
        new Gson().toJson(safe, resp.getWriter());

    }
}

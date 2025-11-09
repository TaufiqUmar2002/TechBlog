package com.tech.dao;

import com.tech.entities.*;

import java.util.List;
import java.util.Optional;

public interface ICommonDao {

    void saveUser(User user);

    Optional<User> getUserByName(String name, String email);

    List<Category> getAllCategories();

    Category getCategoryById(Integer id);

    void savePost(Post post);

    List<Post> getAllPostByCategory(Integer id);

    Post getPostById(Integer id);

    User getUserById(Integer id);

    Boolean saveLike(Like like);
    void deleteLike(Integer id,Integer lId);

    Long likeCount(Integer postId);

    Boolean isLikeByUser(Integer id);

    List<Comment> getCommentsByPost(int postId);

    void addComment(Comment c);

}

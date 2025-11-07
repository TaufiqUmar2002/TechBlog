package com.tech.dao;

import com.tech.entities.Category;
import com.tech.entities.User;

import java.util.List;
import java.util.Optional;

public interface ICommonDao {

    void saveUser(User user);

    Optional<User> getUserByName(String name, String email);

    List<Category> getAllCategories();

}

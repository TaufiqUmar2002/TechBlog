package com.tech.dao;

import com.tech.entities.User;

import java.util.Optional;

public interface IUserDao {

    void saveUser(User user);

    Optional<User> getUserByName(String name, String email);

}

package com.webkotecoder.springmvc.dao;

import java.util.List;

import com.webkotecoder.springmvc.model.User;

public interface UserDao {

	User findById(int id);

	void saveUser(User user);

	void deleteUserByEmail(String email);

	List<User> findAllUsers();

	User findUserByEmail(String email);

	List<User> findUsersByName(String name);

}

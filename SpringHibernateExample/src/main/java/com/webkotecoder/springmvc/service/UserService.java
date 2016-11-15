package com.webkotecoder.springmvc.service;

import java.util.List;

import com.webkotecoder.springmvc.model.User;

public interface UserService {

	User findById(int id);

	void saveUser(User employee);

	void updateUser(User employee);

	void deleteUserByEmail(String email);

	List<User> findAllUsers();

	User findUserByEmail(String email);

	List<User> findUsersByName(String name);

	boolean isUserEmailUnique(Integer id, String email);

}

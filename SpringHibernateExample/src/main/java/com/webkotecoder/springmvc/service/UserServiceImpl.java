package com.webkotecoder.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webkotecoder.springmvc.dao.UserDao;
import com.webkotecoder.springmvc.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	public User findById(int id) {
		return dao.findById(id);
	}

	public void saveUser(User user) {
		dao.saveUser(user);
	}

	public void updateUser(User user) {
		User entity = dao.findById(user.getId());
		if (entity != null) {
			entity.setName(user.getName());
			entity.setJoiningDate(user.getJoiningDate());
			entity.setAdmin(user.getAdmin());
			entity.setEmail(user.getEmail());
			entity.setAge(user.getAge());
		}
	}

	public void deleteUserByEmail(String email) {
		dao.deleteUserByEmail(email);
	}

	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}

	public User findUserByEmail(String email) {
		return dao.findUserByEmail(email);
	}

	public List<User> findUsersByName(String name) {
		return dao.findUsersByName(name);
	}

	public boolean isUserEmailUnique(Integer id, String email) {
		User user = findUserByEmail(email);
		return (user == null || ((id != null) && (user.getId() == id)));
	}

}

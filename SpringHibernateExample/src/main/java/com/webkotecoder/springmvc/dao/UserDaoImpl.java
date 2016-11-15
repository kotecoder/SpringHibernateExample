package com.webkotecoder.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.webkotecoder.springmvc.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	public User findById(int id) {
		return getByKey(id);
	}

	public void saveUser(User user) {
		persist(user);
	}

	public void deleteUserByEmail(String email) {
		Query query = getSession().createSQLQuery("delete from User where email = :email");
		query.setString("email", email);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria();
		return (List<User>) criteria.list();
	}

	public User findUserByEmail(String email) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("email", email));
		return (User) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<User> findUsersByName(String name) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("name", name));
		return (List<User>) criteria.list();
	}

}

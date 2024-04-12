package com.example.demo.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.User;
@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<User> getUsers() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<User> query = session.createQuery("from User",User.class);
		
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(theUser);
		
	}

	@Override
	@Transactional
	public User getUser(int theId) {

		Session session = sessionFactory.getCurrentSession();
		
		return session.get(User.class, theId);
	}
	
	@Override
	@Transactional
	public User getUserByEmail(String email) {
		try {
		Session session = sessionFactory.getCurrentSession();
		
		Query<User> query = session.createQuery("from User where email =:email",User.class);
		query.setParameter("email", email);
		
		return query.getSingleResult();
		} catch (NoResultException e) {
			// TODO: handle exception
			return null;
		}
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from User where id=:userId");
		query.setParameter("userId", theId);
		query.executeUpdate();
	}

}

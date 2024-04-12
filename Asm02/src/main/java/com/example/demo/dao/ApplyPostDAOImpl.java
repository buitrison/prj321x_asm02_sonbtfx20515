package com.example.demo.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.ApplyPost;

@Repository
public class ApplyPostDAOImpl implements ApplyPostDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<ApplyPost> getApplyPosts() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<ApplyPost> query = session.createQuery("from ApplyPost", ApplyPost.class);
		
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveApplyPost(ApplyPost applyPost) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(applyPost);
		
	}

	@Override
	@Transactional
	public ApplyPost getApplyPost(int theId) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.get(ApplyPost.class, theId);
	}

	@Override
	@Transactional
	public void deleteApplyPost(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from ApplyPost where id=:theId");
		query.setParameter("theId", theId);
		query.executeUpdate();
		
	}

	@Override
	@Transactional
	public List<ApplyPost> getListByUserId(int userId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			
			Query<ApplyPost> query = session.createQuery("from ApplyPost where user_id =:userId",ApplyPost.class);
			query.setParameter("userId", userId);
			
			return query.getResultList();
			} catch (NoResultException e) {
				return null;
			}
	}

}

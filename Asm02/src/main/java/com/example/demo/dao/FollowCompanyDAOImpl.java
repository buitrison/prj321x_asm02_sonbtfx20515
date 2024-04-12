package com.example.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FollowCompany;
@Repository
public class FollowCompanyDAOImpl implements FollowCompanyDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<FollowCompany> getFollowCompanies() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<FollowCompany> query = session.createQuery("from FollowCompany", FollowCompany.class);
		
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveFollowCompany(FollowCompany followCompany) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(followCompany);		
	}

	@Override
	@Transactional
	public FollowCompany getFollowCompany(int theId) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.get(FollowCompany.class, theId);
	}

	@Override
	@Transactional
	public void deleteFollowCompany(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from FollowCompany where id=:theId");
		query.setParameter("theId", theId);
		query.executeUpdate();
		
	}

}

package com.example.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Cv;
@Repository
public class CvDAOImpl implements CvDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Cv> getCvList() {
        Session session = sessionFactory.getCurrentSession();
		
		Query<Cv> query = session.createQuery("from Cv",Cv.class);
		
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveCv(Cv cv) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cv);
		
		
	}

	@Override
	@Transactional
	public Cv getCv(int theId) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.get(Cv.class, theId);
	}
	
	

	@Override
	@Transactional
	public void deleteCv(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from Cv where id=:theId");
		query.setParameter("theId", theId);
		query.executeUpdate();
	}

	@Override
	@Transactional
	public Cv getCvByUserId(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<Cv> query = session.createQuery("from Cv where user_id=:userId", Cv.class).setParameter("userId", theId); 
		return query.uniqueResult();
	}

}

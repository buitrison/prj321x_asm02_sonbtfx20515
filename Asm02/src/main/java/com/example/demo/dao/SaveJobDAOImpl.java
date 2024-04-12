package com.example.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.SaveJob;

@Repository
public class SaveJobDAOImpl implements SaveJobDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<SaveJob> getSaveJobs() {
        Session session = sessionFactory.getCurrentSession();
		
		Query<SaveJob> query = session.createQuery("from SaveJob", SaveJob.class);
		
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveSaveJob(SaveJob saveJob) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(saveJob);
		
	}

	@Override
	@Transactional
	public SaveJob getSaveJob(int theId) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.get(SaveJob.class, theId);
	}

	@Override
	@Transactional
	public void deleteSaveJob(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from SaveJob where id=:theId");
		query.setParameter("theId", theId);
		query.executeUpdate();
		
	}

}

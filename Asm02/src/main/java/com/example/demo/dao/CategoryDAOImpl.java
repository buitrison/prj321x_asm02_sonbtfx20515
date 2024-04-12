package com.example.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Category;
@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Category> getCategories() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		Query<Category> query = session.createQuery("from Category", Category.class);
		
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<Category> getCategoriesSorted() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		Query<Category> query = session.createQuery("from Category ORDER BY numberChoose DESC", Category.class);
		
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveCategory(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(category);
		
	}

	@Override
	@Transactional
	public void deleteCategory(int theId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from Category where id=:catId");
		query.setParameter("CatId", theId);
		query.executeUpdate();
		
		
	}

	@Override
	@Transactional
	public Category getCategoryById(int theId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		return session.get(Category.class, theId);
	}

}

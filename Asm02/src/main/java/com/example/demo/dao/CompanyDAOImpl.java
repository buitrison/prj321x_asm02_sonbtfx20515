package com.example.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.Base.BestCompany;
import com.example.demo.entity.Company;
@Repository
public class CompanyDAOImpl implements CompanyDAO {

	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	@Transactional
	public List<Company> getCompanys() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<Company> query = session.createQuery("from Company",Company.class);
		
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveCompany(Company theCompany) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(theCompany);
		
	}

	@Override
	@Transactional
	public Company getCompany(int theId) {

		Session session = sessionFactory.getCurrentSession();
		
		return session.get(Company.class, theId);
	}
	

	@Override
	@Transactional
	public void deleteCompany(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from Company where id=:CompanyId");
		query.setParameter("CompanyId", theId);
		query.executeUpdate();
	}

	@Override
	@Transactional
	public Company getCompanyByUserId(int userId) {
		// get Company By UserId
		Session session = sessionFactory.getCurrentSession();
		Query<Company> query = session.createQuery("from Company where user_id=:userId",Company.class);
		query.setParameter("userId", userId);
		return query.uniqueResult();
	}

	@Override
	@Transactional
	public BestCompany getSpecial() {
		Session session = sessionFactory.getCurrentSession();
//		String hql = "SELECT r.id, COUNT(a.id)" +
//	             "FROM Recruitment r " +
//	             "LEFT JOIN ApplyPost a ON r.id = a.recruitment.id " +
//	             "GROUP BY r.id " +
//	             "ORDER BY r.salary DESC, num DESC, r.quantity DESC, r.createdAt DESC";
		String hql = "SELECT new com.example.demo.Base.BestCompany(c.id, COUNT(r.id)) " +
	             "FROM Company c " +
	             "LEFT JOIN Recruitment r ON r.company.id = c.id " +
	             "GROUP BY c.id " +
	             "ORDER BY COUNT(r.id) DESC";

        Query<BestCompany> query = session.createQuery(hql, BestCompany.class);
        query.setMaxResults(1);
        return query.uniqueResult();
	}	
	

}

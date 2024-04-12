package com.example.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.Base.BestRecruitment;
import com.example.demo.entity.Recruitment;

@Repository
public class RecruitmentDAOImpl implements RecruitmentDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Recruitment> getRecruitments(int page, int size) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query<Recruitment> query = session.createQuery("from Recruitment ORDER BY createdAt DESC", Recruitment.class);
		int offset = (page - 1) * size;
		query.setFirstResult(offset);
		query.setMaxResults(size);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Recruitment> getRecruitments() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query<Recruitment> query = session.createQuery("from Recruitment ORDER BY createdAt DESC", Recruitment.class);
		return query.getResultList();
	}

	@Override
	@Transactional
	public void saveRecruitment(Recruitment theRecruitment) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(theRecruitment);

	}

	@Override
	@Transactional
	public Recruitment getRecruitment(int theId) {

		Session session = sessionFactory.getCurrentSession();

		return session.get(Recruitment.class, theId);
	}

	@Override
	@Transactional
	public void deleteRecruitment(int theId) {
		Session session = sessionFactory.getCurrentSession();
		Query<?> query = session.createQuery("delete from Recruitment where id=:RecruitmentId");
		query.setParameter("RecruitmentId", theId);
		query.executeUpdate();
	}

	@Override
	@Transactional
	public List<BestRecruitment> getReSpecials() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT new com.example.demo.Base.BestRecruitment(r.id, COUNT(a.id))" + "FROM Recruitment r "
				+ "LEFT JOIN ApplyPost a ON r.id = a.recruitment.id " + "GROUP BY r.id "
				+ "ORDER BY COUNT(a.id) DESC, r.createdAt DESC, r.salary DESC, r.quantity DESC";

//		String hql = "SELECT new com.example.demo.Base.BestCompany(c.id, COUNT(r.id)) " +
//	             "FROM Company c " +
//	             "LEFT JOIN Recruitment r ON r.company.id = c.id " +
//	             "GROUP BY c.id " +
//	             "ORDER BY COUNT(r.id) DESC";

		Query<BestRecruitment> query = session.createQuery(hql, BestRecruitment.class);
		query.setMaxResults(3);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Recruitment> findRecruitments(String keySearch) {
		Session session = sessionFactory.getCurrentSession();
		Query<Recruitment> query = session
				.createQuery("from Recruitment WHERE title LIKE :title ORDER BY createdAt DESC", Recruitment.class);
		query.setParameter("title", "%" + keySearch + "%");
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Recruitment> findRecruitmentsByCompany(String keySearch) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT r FROM Recruitment r JOIN r.company c WHERE c.nameCompany LIKE :keySearch ORDER BY r.createdAt DESC";
		Query<Recruitment> query = session.createQuery(hql, Recruitment.class);
		query.setParameter("keySearch", "%" + keySearch + "%");
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Recruitment> findRecruitmentsByAddress(String keySearch) {
		Session session = sessionFactory.getCurrentSession();
		Query<Recruitment> query = session.createQuery(
				"from Recruitment WHERE address LIKE :keySearch ORDER BY createdAt DESC", Recruitment.class);
		query.setParameter("keySearch", "%" + keySearch + "%");
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<Recruitment> findJobByAdvanceSearch(String keySearch, String type, String location) {
		if (keySearch == null) {
			keySearch = "";
		}
		if (type == null) {
			type = "";
		}
		if (location == null) {
			location = "";
		}
		Session session = sessionFactory.getCurrentSession();
		Query<Recruitment> query = session.createQuery(
				"from Recruitment WHERE title LIKE :title AND type LIKE :type AND address LIKE :location ORDER BY createdAt DESC",
				Recruitment.class);
		query.setParameter("title", "%" + keySearch + "%");
		query.setParameter("type", "%" + type + "%");
		query.setParameter("location", "%" + location + "%");
		return query.getResultList();
	}

}

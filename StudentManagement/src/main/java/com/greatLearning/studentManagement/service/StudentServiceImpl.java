package com.greatLearning.studentManagement.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.greatLearning.studentManagement.entity.Student;

@Repository
public class StudentServiceImpl implements StudentService {
	
	// create session
	private Session session;
	private SessionFactory sessionFactory;
	
	
	@Autowired
	StudentServiceImpl(SessionFactory sessionFactory) {
		
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		}
		catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
	}
	
	
	@Transactional
	public List<Student> findAll() {

		Transaction transaction = session.beginTransaction();

		// get all student details from the database table
		List<Student> students = session.createQuery("from Student").list();

		transaction.commit();

		return students;
	}
	
	@Transactional
	public Student findById(int theId) {

		Transaction transaction = session.beginTransaction();

		// get student by id from database table
		Student student = session.get(Student.class, theId);

		transaction.commit();

		return student;
	}

	@Transactional
	public void save(Student theStudent) {

		Transaction transaction = session.beginTransaction();

		// save transaction :: student details
		session.saveOrUpdate(theStudent);

		transaction.commit();

	}
	
	@Transactional
	public void deleteById(int theId) {

		Transaction transaction = session.beginTransaction();

		// get transaction
		Student student = session.get(Student.class, theId);

		// delete record
		session.delete(student);

		transaction.commit();

	}
	

}

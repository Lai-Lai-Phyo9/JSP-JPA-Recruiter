package com.recruitment.team.model.service;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import com.recruitment.team.model.entity.Recruiter;

public class RecruiterService {
	private EntityManager em;
	
	public RecruiterService(EntityManager em) {
		this.em=em;
	}

	public Recruiter login(String email, String password) throws NoResultException{
		
		TypedQuery<Recruiter> query=em.createQuery("SELECT u FROM Recruiter u WHERE u.email = :email AND u.password = :pass",Recruiter.class);
		query.setParameter("email", email);
		query.setParameter("pass", password);
		return query.getSingleResult();
	}

}

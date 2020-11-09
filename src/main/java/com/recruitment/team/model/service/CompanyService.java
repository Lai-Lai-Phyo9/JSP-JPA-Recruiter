package com.recruitment.team.model.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.recruitment.team.model.entity.Company;

public class CompanyService {
	private EntityManager em;
	
	public CompanyService(EntityManager em) {
		this.em=em;
	}

	public Company findById(int id) {
		// TODO Auto-generated method stub
		return em.find(Company.class, id);
	}

	public void save(Company company) {
		em.getTransaction().begin();
		if(company.getId()==0)//new company
			em.persist(company);
		else
			em.merge(company);//edit
		em.getTransaction().commit();
		
	}

	public List<Company> findAll() {
		
		TypedQuery<Company> query=em.createNamedQuery("Company.findAll", Company.class);
		return query.getResultList();
	}

	public void delete(int id) {
		em.getTransaction().begin();
		Company company=em.find(Company.class, id);
		em.remove(company);
		em.getTransaction().commit();
		
	}

}

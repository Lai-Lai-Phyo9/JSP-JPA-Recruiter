package com.recruitment.team.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import static javax.persistence.CascadeType.REMOVE;

/**
 * Entity implementation class for Entity: Township
 *
 */
@Entity
@NamedQuery(name = "Township.getAll", query = "SELECT t FROM Township t")
public class Township implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private static final long serialVersionUID = 1L;
	
	@OneToMany(mappedBy = "township", cascade = REMOVE)
	private List<Company> company;
	
	
	public List<Company> getCompany() {
		return company;
	}

	public void setCompany(List<Company> company) {
		this.company = company;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Township() {
		super();
	}
   
}

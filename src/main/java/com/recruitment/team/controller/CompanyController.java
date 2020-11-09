package com.recruitment.team.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.recruitment.team.model.entity.Company;
import com.recruitment.team.model.entity.Township;
import com.recruitment.team.model.service.CompanyService;
import com.recruitment.team.model.service.TownshipService;

@WebServlet({"/company-add","/company","/company-edit","/company-delete"})
public class CompanyController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private TownshipService townshipservice;
	private CompanyService cmpservice;
	
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		
		EntityManagerFactory EMF=null;
		
		Object obj=getServletContext().getAttribute("emf");//application scope
		if(obj==null) {
			EMF=Persistence.createEntityManagerFactory("jsp-jpa-recruiter");
			getServletContext().setAttribute("emf", EMF);
		}
		else {
			EMF=(EntityManagerFactory) obj;
		}
		townshipservice=new TownshipService(EMF.createEntityManager());
		cmpservice=new CompanyService(EMF.createEntityManager());	
	}
	
	@Override
	public void destroy() {
		EntityManagerFactory emf= (EntityManagerFactory) getServletContext().getAttribute("emf");
		if(emf!=null && emf.isOpen())
			emf.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=req.getServletPath();
		if("/company-add".equals(action)) {
			
			//get data from req
			String cId=req.getParameter("companyid");
			String tId=req.getParameter("townshipid");
			String cname=req.getParameter("companyname");
			String phone1=req.getParameter("phone1");
			String address=req.getParameter("address");
			String phone2=req.getParameter("phone2");
			String website=req.getParameter("website");
			String ownername=req.getParameter("ownername");
			String email=req.getParameter("email");
			String remark=req.getParameter("remark");
//			boolean agree = req.getParameter("check") != null;


			
//			System.out.println("tid" +tId);
			//create entity obj
			Company comp=(cId==null || cId.equals("") ? new Company(): cmpservice.findById(Integer.parseInt(cId)));
			
			comp.setTownship(townshipservice.findById(Integer.parseInt(tId)));
			comp.setName(cname);
			comp.setPhone1(phone1);
			comp.setAddress(address);
			comp.setPhone2(phone2);
			comp.setWebsite(website);
			comp.setOwnerName(ownername);
			comp.setEmail(email);
			comp.setRemark(remark);
			
			//insert into db
			cmpservice.save(comp);
			
			//redirect to page
			resp.sendRedirect(req.getContextPath().concat("/company"));
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path=req.getServletPath();
		
		if("/company-add".equals(path) || "/company-edit".equals(path)) {
			
			//get township list from db
			List<Township> townlist=townshipservice.findAll();
			
			System.out.println(townlist);
			//add list to req
			req.setAttribute("township", townlist);
			
			if("/company-edit".equals(path)){
				//get company id from request
				String id=req.getParameter("companyid");
				
				//find company to db
				Company companyobj=cmpservice.findById(Integer.parseInt(id));
				
				//add company to req
				req.setAttribute("company", companyobj);
				
			}
			
			//forward
			getServletContext().getRequestDispatcher("/company-add.jsp").forward(req, resp);
		}
		else if("/company".equals(path)) {
			
			//get companes from db
			List<Company> list=cmpservice.findAll();
			
			//add company to req
			req.setAttribute("companies", list);
			
			//forward
			getServletContext().getRequestDispatcher("/company.jsp").forward(req, resp);
		}
		else if("/company-delete".equals(path)) {
			
			//get id from rq
			String companyid=req.getParameter("companyid");
			
			//remove from db
			cmpservice.delete(Integer.parseInt(companyid));
			
			//redirect page
			resp.sendRedirect(req.getContextPath().concat("/company"));
		}

	}

}

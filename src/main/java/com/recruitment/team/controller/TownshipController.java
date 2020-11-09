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

import com.recruitment.team.model.entity.Township;
import com.recruitment.team.model.service.TownshipService;

@WebServlet({"/township","/township-add","/township-edit","/township-delete"})
public class TownshipController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private TownshipService townshipService;
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		EntityManagerFactory EMF=null;
		
		Object obj=getServletContext().getAttribute("emf");//application scope
		if(obj==null) {
			EMF=Persistence.createEntityManagerFactory("jsp-jpa-crud");
			getServletContext().setAttribute("emf", EMF);
		}
		else {
			EMF=(EntityManagerFactory) obj;
		}
		townshipService=new TownshipService(EMF.createEntityManager());
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
		if("/township-add".equals(action)) {
			
			//get data from req
			String name=req.getParameter("townshipname");
			String id=req.getParameter("townshipid");
			
			//create entity obj
			Township t=(id==null || id.equals("") ? new Township(): townshipService.findById(Integer.parseInt(id)));
			t.setName(name);
			
			//insert into db
			townshipService.save(t);
			
			//redirect to page
			resp.sendRedirect(req.getContextPath().concat("/township"));
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=req.getServletPath();
		if("/categories".equals(action)) {
			
			//get data from DB
			List<Township> list=townshipService.findAll();
			
			//set data to request
			req.setAttribute("townships", list);
			
			//forward page
			getServletContext().getRequestDispatcher("/township.jsp").forward(req, resp);
		}
		else if("/township-edit".equals(action)) {
			
			//get id from request
			String tId=req.getParameter("townshipid");
			
			//get data from database
			Township cat=townshipService.findById(Integer.parseInt(tId));
			
			//set data to request
			req.setAttribute("township", cat);
			
			//forward page
			getServletContext().getRequestDispatcher("/township-add.jsp").forward(req, resp);
		}
		else if("/township-delete".equals(action)) {
			
			//get id from rq
			String townshipid=req.getParameter("townshipid");
			
			//remove from db
			townshipService.delete(Integer.parseInt(townshipid));
			
			//redirect page
			resp.sendRedirect(req.getContextPath().concat("/townships"));
		}

	}

}

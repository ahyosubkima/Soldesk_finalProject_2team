package com.team2.danim.plan;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.danim.TokenMaker;

@Controller
public class PlanController {
	
	@Autowired
	private PlanDAO pDAO;
	
	@RequestMapping(value = "/planMain", method = RequestMethod.GET)

	public String planMain(HttpServletRequest req) {
		TokenMaker.make(req);
		pDAO.getAllPlan(req);
		
		req.setAttribute("contentPage", "plan/planMain.jsp");
		return "home";
	}
	
	
	@RequestMapping(value = "/plan.writePlanner", method = RequestMethod.GET)
	public String planWrite(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "plan/planWrite.jsp");
		return "home";

	}
	
	
	@RequestMapping(value = "/plan.detailPlanner", method = RequestMethod.POST)
	public String planDetail(HttpServletRequest req) {
		
		TokenMaker.make(req);
		pDAO.upload(req);
		pDAO.getAllPlan(req);
		
		req.setAttribute("contentPage", "plan/planMain.jsp");
		
		return "home";
	}
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/domestic.getjson", method = RequestMethod.GET,
			produces = "application/json; charset=utf-8")
	public String planJson(HttpServletRequest req) {
		
		TokenMaker.make(req);
		req.setAttribute("contentPage", "plan/planWrite.jsp.jsp");
		
		return "home";

	}
	
	
	
	

}

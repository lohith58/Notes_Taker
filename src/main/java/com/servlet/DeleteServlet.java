package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnect;
import com.dao.PostDao;


@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		int pid=Integer.parseInt(req.getParameter("pid"));
		
		PostDao dao=new PostDao(DbConnect.getConnection());
		
		boolean b=dao.deletePostById(pid);
		HttpSession session=req.getSession();
		if (b) {
			session.setAttribute("successMsg","Contact Deleted Successfully");
			resp.sendRedirect("viewNotes.jsp"); 
		} else {
			session.setAttribute("failureMsg","Please Try Again");
			resp.sendRedirect("viewNotes.jsp"); 

			
		}
	
	}
}

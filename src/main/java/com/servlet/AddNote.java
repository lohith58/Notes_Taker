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


@WebServlet("/addNote")
public class AddNote extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		int userId=Integer.parseInt(req.getParameter("userid"));
		String title=req.getParameter("title");
		String content=req.getParameter( "content");
		PostDao dao=new PostDao(DbConnect.getConnection());
		boolean b=dao.addNotes(title, content, userId);
		HttpSession session=req.getSession();
		if (b) {
			session.setAttribute("successMsg","Your Notes Saved Successfully");
			resp.sendRedirect("addNotes.jsp");
		} else {
			session.setAttribute("failureMsg","SomethingWent Wrong Pls Try Again");
			resp.sendRedirect("addNotes.jsp");

		}
	}
	
	

}

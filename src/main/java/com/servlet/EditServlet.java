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
import com.entity.Post;


@WebServlet("/update")
public class EditServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		int pid=Integer.parseInt(req.getParameter("pid"));
		 
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
        Post p=new Post();
        p.setId(pid);
        p.setTitle(title);
        p.setContent(content);
         
		
		PostDao dao=new PostDao(DbConnect.getConnection());
		boolean b=dao.updatePost(p);
		HttpSession session=req.getSession();
		
		if (b) {
			session.setAttribute("successMsg","Your Contact Updated Successfully");
			resp.sendRedirect("viewNotes.jsp");
		} else {
			session.setAttribute("failureMsg","SomethingWent Wrong Pls Try Again");
			resp.sendRedirect("editPost.jsp?cid="+pid);

		}
		
		
		
	}
	
	

}
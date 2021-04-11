<%@page import="com.connection.DbConnect"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.entity.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EditPost Page</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Please Login First To Access Others...");
		response.sendRedirect("login.jsp");
	}
	%>
	 <div class="container">

		<div class="row mt-5">
			<div class="col-md-12">
						<h3 class="text-center">
							  Edit Your Notes
						</h3>
						<%
						String failureMsg = (String) session.getAttribute("failureMsg");

						if (failureMsg != null) {
						%>

						<p class="text-danger text-center"><%=failureMsg%></p>

						<%
						session.removeAttribute("failureMsg");

						}
						%>

						<form action="update" method="post">
							<%
							int pid = Integer.parseInt(request.getParameter("pid"));
                            PostDao dao=new PostDao(DbConnect.getConnection());
                            Post p=dao.getPostById(pid);
                             
							%>
							<input type="hidden" value="<%=pid%>" name="cid">
							<div class="form-group">
								<input type="hidden" name="pid" value="<%=p.getId()%>">
								<label for="exampleInputEmail1">Title</label> <input type="text"
									value="<%=p.getTitle()%>"name="title" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Title">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Content</label>
								<textarea rows="12" cols="" placeholder="Enter Content"
									 name="content" class="form-control"><%=p.getContent() %></textarea>
							</div>

							<button type="submit" class="btn btn-primary">edit</button>
						</form>

					</div>
				</div>
			</div>
		 
 

</body>
</html>
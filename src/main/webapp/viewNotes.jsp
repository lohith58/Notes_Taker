<%@page import="com.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnect"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ViewPost Page</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #c9c9c7;
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Please Login First To Access Others...");
		response.sendRedirect("login.jsp");
	}
	%>
	<%
	String successMsg = (String) session.getAttribute("successMsg");
	if (successMsg != null) {
	%>

	<div class="alert alert-success" role="alert"><%=successMsg%></div>

	<%
	session.removeAttribute("successMsg");
	}
	%>

	<%
	String failureMsg = (String) session.getAttribute("failureMsg");
	if (failureMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=successMsg%></div>
	<%
	session.removeAttribute("successMsg");

	}
	%>

	<div class="container">
		<h2 class="text-center">Check Below To Edit or Delete Your Notes
			That You Saved Upto Now :</h2>
		<div class="row">
			<div class="col-md-12">


				<%
				if (user != null) {

					PostDao dao = new PostDao(DbConnect.getConnection());
					List<Post> post = dao.getAllPost(user.getId());

					for (Post p : post) {
				%>
				<div class="card mt-3">
					<img alt="" src="img/notebook_icon.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px;">
					<div class="card-body p-4">

						<h5 class="card-title"><%=p.getTitle()%></h5>
						<p><%=p.getContent()%></p>

						<p>
							<b class="text-success">Published Date:</b><br> <br> <b
								class="text-primary"><%=p.getDate()%></b>
						</p>
						<div class="container text-center mt-2">
							  
								<a href="editPost.jsp?pid=<%=p.getId()%>"
								 class="btn btn-danger">Edit</a>
							     <br><br>
								<form action="delete?pid=<%=p.getId()%>" method="post">
									<button type="submit" class="btn btn-primary">Delete</button>
								</form>

							</div>

						</div>


					</div>

					<%
					}

					}
					%>

				</div>
			</div>
		</div>
</body>
</html>
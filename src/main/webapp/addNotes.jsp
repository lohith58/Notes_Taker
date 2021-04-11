<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddNotes Page</title>
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
				<%
				String successMsg = (String) session.getAttribute("successMsg");
				String failureMsg = (String) session.getAttribute("failureMsg");

				if (successMsg != null) {
				%>

				<p class="text-success text-center"><%=successMsg%></p>

				<%
				session.removeAttribute("successMsg");
				}
				if (failureMsg != null) {
				%>

				<p class="text-danger text-center"><%=failureMsg%></p>

				<%
				session.removeAttribute("failureMsg");

				}
				%>
				

				<form action="addNote" method="post">
					<div class="form-group">
						<input type="hidden" name="userid" value="<%=user.getId()%>">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name="title" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter Title">

					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea rows="12" cols="" placeholder="Enter Content"
							name="content" class="form-control"></textarea>
					</div>

					<button type="submit" class="btn btn-primary">Add</button>
				</form>


			</div>
		</div>






	</div>






	<div style="margin-top: 60px">
		<%@include file="component/footer.jsp"%>
	</div>

</body>
</html>
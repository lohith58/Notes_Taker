<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserHome Page</title>
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
	<div class="container-fluid">
	      

		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<div class="container text-center">
							<img alt="" src="img/notebook_icon.png" class="img-fluid mx-auto"
								style="max-width: 300px;">
							<h1>Start Making Your Notes</h1>
							<a href="addNotes.jsp" class="btn btn-outline-primary">Click Here To
								Start</a>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<div style="margin-top: 40px">
		<%@include file="component/footer.jsp"%>
	</div>

</body>
</html>
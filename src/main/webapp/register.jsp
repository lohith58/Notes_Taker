<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid ">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-6">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration Page</h4>


					</div>
					<div class="card-body">
						<%
						String successMsg = (String) session.getAttribute("successMsg");
						String errorMsg = (String) session.getAttribute("errorMsg");

						if (successMsg != null) {
						%>

						<p class="text-success text-center"><%=successMsg%></p>

						<%
						session.removeAttribute("successMsg");
						}
						if (errorMsg != null) {
						%>

						<p class="text-danger text-center"><%=errorMsg%></p>

						<%
						session.removeAttribute("errorMsg");

						}
						%>


						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter full name</label> <input
									type="text" name="name" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter full name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>



					</div>





				</div>


			</div>
		</div>
	</div>








	<div style="margin-top: 100px">
		<%@include file="component/footer.jsp"%>
	</div>



</body>
</html>
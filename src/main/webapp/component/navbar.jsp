<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="index.jsp"><i class="fa fa-book"
		aria-hidden="true"></i>Notes Taker</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa fa-home" aria-hidden="true"></i>Home<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link" href="homepage.jsp"><i
					class="fa fa-plus" aria-hidden="true"></i>Add Notes</a></li>

			<li class="nav-item active"><a class="nav-link " href="viewNotes.jsp"><i
					class="fa fa-eye" aria-hidden="true"></i>View Notes</a></li>
		</ul>
		<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
		%>
		<form class="form-inline my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-3"
				type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
			<a href="register.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
		</form>


		<%
		} else {
		%>
		<form class="form-inline my-2 my-lg-0">
			<a   class="btn btn-light my-2 my-sm-0 mr-3"
			 ><i class="fa fa-user-circle-o" aria-hidden="true"></i>
				<%=user.getName()%></a> 
				<a data-toggle="modal"
				data-target="#exampleModalCenter" class="btn btn-light my-2 my-sm-0"><i
				class="fa fa-sign-out" aria-hidden="true"></i>Logout</a>
		</form>
		<%
		}
		%>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Please
						Check This Out.....</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h6>You Wanna Logout ???....</h6>
					<form action="logout" method="post">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Logout</button>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!--logout popup-->

</nav>
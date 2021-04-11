<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 .back-img{
  background:url(img/NoteBook.jpg);
  width: 100%;
  height: 80vh;
  background-repeat:no-repeat;
  background-size:cover;
 
  }

</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
<%@include file="component/navbar.jsp" %>
 <div class="container-fluid back-img">
  <div class="text-center">
  <h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i>NotesTaker-Keep Your Notes</h1>
  
  </div>
  <h3 class="text-white">Hey welcome to Notes Taker!!! </h3>
  <h4 class="text-white">Notes Taker is an Web Application platfrom which helps you to maintain your own notes and records privately....</h4>
  
 </div>
  
 <div style="margin-top: 8px">
<%@include file="component/footer.jsp" %>
</div>
 
</body>
</html>
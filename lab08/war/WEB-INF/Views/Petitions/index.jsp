<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%List<Petition> users =(List<Petition>)request.getAttribute("users");
UserJava uj=(UserJava)request.getAttribute("u");%>
<%@ page import= "controller.PMF" %>
<%@ page import= "javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<% User user = us.getCurrentUser(); %>
<% PersistenceManager pm=PMF.get().getPersistenceManager(); %>
<html>
<head>
  <title>Pettions</title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/style.css"> 
</head>
	<body>
	<!--Inicio del codigo del logo de facebook-->
  <div class="row" style="background-color:#000000;color:#908F99;">
    <div class="col-sm-10">
Calle Jerusalén N° 506 - Yanahuara. (5,97 km)
054 Arequipa Contact: (054) 271946</div>
    <div class="col-sm-1"><a href="https://www.facebook.com/pages/biz/medical_health-arequipa-054/ArguiDent-Aqp-300624626728028/" target="_blank" class="float-right"><img src="../img/logoFace.png" width="20" height="20"></a></div>
  </div>
  <!--Fin del codigo del logo de facebook-->
  <div class="container">
    <!--Inicio del logo de arguident-->
    <nav class="navbar navbar-expand-lg navbar-light bg-white">      
  <a class="navbar-brand" href="/gmail">
    <img src="../img/arguident2.jpg" width="90" height="70" alt="logo de arguident">
    Arguident
  </a>
  <!--Fin del logo de arguident-->
  <!--Inicio Obcciones de la parte derecha-->
  <div class="container-fluid">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>  
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a href="/gmail"><button class="button button1">Inicio</button></a>
      </li>
      <li class="nav-item">
        <a href="#"><button class="button button1">Servicios</button></a>
      </li>
      <li class="nav-item">
        <a href="#"><button class="button button1">Consultas</button></a>
      </li>
      <li class="nav-item">
        <a href="#"><button class="button button1">Calendario</button></a>
      </li>
      <li class="nav-item">
        <a href="#"><button class="button button1">Instalaciones</button></a>
      </li>
      <li class="nav-item">
        <a href="#"><button class="button button1">Sign in</button></a>
      </li>
      <%if(user == null){ %>
      <li class="nav-item">
        <a href="<%=us.createLoginURL("/gmail")%>"><button class="button button1">Login</button></a>
      </li>
      <%} %>	
      <%if(user != null){ %>
      <li class="nav-item">
        <a href="<%=us.createLogoutURL("/gmail") %>"><button class="button button1">Logout</button></a>
      </li>
      <%} %>
      <%if(user != null){ %>
      <li class="nav-item">
        <a href="/users"><button class="button button2">Acl</button></a>
      </li>
      <%} %>            
    </ul>	
  </div>

  </div>  
</nav><hr>
<!--Fin Obcciones de la parte derecha-->

<nav class="navbar navbar-expand-lg navbar-light bg-white">
  <div class="collapse navbar-collapse" id="navbarNav">
  <ul class="navbar-nav">
      <li class="nav-item">
        <a href="/users/add"><button class="button button1">Create</button></a>
      </li>      
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a href="/users"><button class="button button1">Users</button></a>
      </li>
      <li class="nav-item">
        <a href="/roles"><button class="button button1">Roles</button></a>
      </li>
      <li class="nav-item">
        <a href="/resources"><button class="button button1">Resources</button></a>
      </li>
      <li class="nav-item">
        <a href="/access"><button class="button button1">Access</button></a>
      </li>
      <li class="nav-item">
        <a href="/petition"><button class="button button2">Peticiones</button></a>
      </li>
    </ul>
  </div>
</nav>
<div class="row">
    <div class="col-sm-12 bg-dark">
      <center class="cent1" >Usuarios Registrados</center>
    </div>
  </div><br>
		<div class="container">
		<input class="form-control" id="myInput" type="text" placeholder="Nombre del usuario..."><br>
			<% if (users.size() > 0) { %>
				<table class="table table-hover">
			    <thead>
			      <tr>
			        <th>NOMBRE</th>			        
			      </tr>
			    </thead>
			    <tbody id="myList">					
					<% for (int i = 0;i<users.size();i++) { %>
					<% Petition u = (Petition)users.get(i); %>
															
					<tr>
					<td><%=u.getName() %></td>
					<td><%=u.getEmail() %></td>					
					<td>					
			    	<a href="/petitions/accept?id=<%=u.getId()%>" class="btn btn-outline-info btn-sm RbtnMargin float-right">Edit</button></a>
			    	</td>
			    	</tr>
			    	
					<% } %>
					</tbody>
					</table>
					</div>
					<% } else { %>     
      <div class="alert alert-info alert-dismissible fade show">
					   <button type="button" class="close" data-dismiss="alert">&times;</button>
					   <strong>Danger!</strong>No hay usuarios registrados recientemente.
					 </div>            
    <% } %>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myList tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<!--Inicio del script para que cambie de color el boton cuando el puntero esta sobre el-->
<script>
  $('.button1').hover(function() {            
            $(this).toggleClass("button2");
        });
</script>
<!--Fin del script-->
</body>
</html>
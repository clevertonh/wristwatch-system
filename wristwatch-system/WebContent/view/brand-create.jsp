<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@include  file="home-open.jsp" %>

      <form action="${pageContext.servletContext.contextPath}/brand/create" method="POST">
          <h2 class="form-signin-heading">Informe os dados cadastrais da marca</h2>
           <div class="form-group">
			    <label for="inputName">Nome*</label>
			    <input type="text" name="name" class="form-control" id="inputName" placeholder="Nome" required>
	 		</div>

           <div class="form-group">
	   			<label for="inputCountry">Pais*</label>
	   	   <input type="text" name="country" class="form-control" id="inputCountry" placeholder="Pais" required>
	 	  </div>
	 
	 
		  <button type="submit" class="btn btn-primary">Cadastrar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="model.Brand" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% Brand brand = (Brand) request.getSession().getAttribute("brand"); %>

<%@include  file="home-open.jsp" %>

<% String error = (String) request.getSession().getAttribute("error"); %>

	<c:if test="${error != null}">
		<div class="alert alert-warning alert-dismissible fade show" role="alert">
		  <strong>Aviso!</strong> <%= error %>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<% request.getSession().setAttribute("error", null); %>
	</c:if>

      <form action="${pageContext.servletContext.contextPath}/brand/update" method="POST">
          <h2 class="form-signin-heading">Marca <c:out value="${brand.name}"/></h2>
   
          <div class="form-group">
	   			<label for="inputCountry">Pais*</label>
	   	   		<input type="text" name="country" class="form-control" id="inputCountry" value="<c:out value="${brand.country}"/>" placeholder="<c:out value="${brand.country}"/>">
	 	  </div>
	 	  
	 	    <div class="form-group">
			    <label for="inputDate">Data de Criação*</label>
			    <input type="text" name="date" class="form-control" id="inputDate" placeholder="<c:out value="${brand.creation}"/>" value="<c:out value="${brand.creation}"/>" required>
	 		</div>
	 		
	 	       <input type="text" name="name" value="<c:out value="${brand.name}"/>" hidden=""/>
		  <button type="submit" class="btn btn-primary">Atualizar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
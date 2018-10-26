<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="model.Brand" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% Brand brand = (Brand) request.getSession().getAttribute("brand"); %>

<%@include  file="home-open.jsp" %>

      <form action="${pageContext.servletContext.contextPath}/brand/update" method="POST">
          <h2 class="form-signin-heading">Marca <c:out value="${brand.name}"/></h2>
   
          <div class="form-group">
	   			<label for="inputCountry">Pais*</label>
	   	   		<input type="text" name="country" class="form-control" id="inputCountry" value="<c:out value="${brand.country}"/>" placeholder="<c:out value="${brand.country}"/>">
	 	  </div>
	 	       <input type="text" name="name" value="<c:out value="${brand.name}"/>" hidden=""/>
		  <button type="submit" class="btn btn-primary">Atualizar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
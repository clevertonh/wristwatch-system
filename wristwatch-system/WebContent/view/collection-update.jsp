<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="model.Collection" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% Collection collection = (Collection) request.getSession().getAttribute("collection"); %>

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

      <form action="${pageContext.servletContext.contextPath}/collection/update" method="POST">
          <h2 class="form-signin-heading">Marca <c:out value="${collection.name}"/></h2>
   
          <div class="form-group">
	   			<label for="inputName">Nome*</label>
	   	   		<input type="text" name="name" class="form-control" id="inputName" value="<c:out value="${collection.name}"/>" placeholder="<c:out value="${collection.name}"/>">
	 	  </div>
	 	  <div class="form-group">
	   			<label for="inputBrand">Marca*</label>
	   	   		<input type="text" name="brand" class="form-control" id="inputBrand" value="<c:out value="${collection.brand_name}"/>" placeholder="<c:out value="${collection.brand_name}"/>">
	 	  </div>
		  <button type="submit" class="btn btn-primary">Atualizar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
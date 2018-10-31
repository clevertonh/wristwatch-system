<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% String error = (String) request.getSession().getAttribute("error"); %>

<%@include  file="home-open.jsp" %>

	<c:if test="${error != null}">
		<div class="alert alert-warning alert-dismissible fade show" role="alert">
		  <strong>Aviso!</strong> <%= error %>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<% request.getSession().setAttribute("error", null); %>
	</c:if>

      <form enctype="multipart/form-data" action="${pageContext.servletContext.contextPath}/wristwatch-json/insert" method="POST">
          <h2 class="form-signin-heading">Inserir dados de relógios por Json</h2>
	  	 	   
           <div class="form-group">
	   			<label for="inputJson">Json</label>
	   	   		<input type="file" name="json" class="form-control" id="inputJson" required>
	 	  </div>
	 	  
		  <button type="submit" class="btn btn-primary">Inserir</button>
	
     </form>


<%@include  file="home-close.jsp" %>
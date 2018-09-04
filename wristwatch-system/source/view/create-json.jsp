<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@include  file="home-open.jsp" %>

      <form enctype="multipart/form-data" action="${pageContext.servletContext.contextPath}/json/insert" method="POST">
          <h2 class="form-signin-heading">Inserir dados de relógios por Json</h2>

           <div class="form-group">
	   			<label for="inputSalesman">Nome do Vendedor</label>
	   	   		<input type="text" name="salesman" class="form-control" id="inputSalesman" required>
	 	  </div>
	 	  	 	   
           <div class="form-group">
	   			<label for="inputJson">Json</label>
	   	   		<input type="file" name="json" class="form-control" id="inputJson" required>
	 	  </div>
	 	  
		  <button type="submit" class="btn btn-primary">Inserir</button>
	
     </form>


<%@include  file="home-close.jsp" %>
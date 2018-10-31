<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
	
      <form action="${pageContext.servletContext.contextPath}/sale/create" method="POST">
          <h2 class="form-signin-heading">Informe os dados cadastrais da empresa de venda do rel�gio</h2>
           <div class="form-group">
			    <label for="inputID">ID do Rel�gio*</label>
			    <input type="number" name="id" class="form-control" id="inputID" placeholder="Identifica��o" required>
	 	  </div>

           <div class="form-group">
			    <label for="inputSalesman">Nome Vendedor*</label>
			    <input type="text" name="salesman" class="form-control" id="inputSalesman" placeholder="Vendedor" required>
	 	   </div>
	 
	 
		  <button type="submit" class="btn btn-primary">Cadastrar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
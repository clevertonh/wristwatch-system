<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Brand" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@include  file="home-open.jsp" %>

      <form action="${pageContext.servletContext.contextPath}/salesman/create" method="POST">
          <h2 class="form-signin-heading">Informe os dados cadastrais do revendedor</h2>
           <div class="form-group">
			    <label for="inputName">Nome*</label>
			    <input type="text" name="name" class="form-control" id="inputName" placeholder="Nome" required>
	 		</div>

           <div class="form-group">
	   			<label for="inputQtdProduct">Quantidade de Produtos*</label>
	   	   <input type="number" name="qtdProducts" class="form-control" id="inputQtdProduct" placeholder="Produtos" required>
	 	  </div>
	 	   
           <div class="form-group">
	   			<label for="inputQtdBrands">Quantidade de Marcas*</label>
	   	   <input type="number" name="qtdBrands" class="form-control" id="inputQtdBrands" placeholder="Marcas" required>
	 	  </div>
	 	  
		  <button type="submit" class="btn btn-primary">Cadastrar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
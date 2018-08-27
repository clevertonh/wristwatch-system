<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@include  file="home-open.jsp" %>

      <form action="${pageContext.servletContext.contextPath}/brand/create" method="POST">
          <h2 class="form-signin-heading">Informe os dados cadastrais do rel�gio</h2>
           <div class="form-group">
			    <label for="inputName">Nome*</label>
			    <input type="text" name="name" class="form-control" id="inputName" placeholder="Nome">
	 		</div>

           <div class="form-group">
	   			<label for="inputPrice">Pre�o</label>
	   	   <input type="number" name="price" class="form-control" id="inputPrice" placeholder="Pre�o">
	 	  </div>
	 	   
           <div class="form-group">
	   			<label for="inputQtdPlots">Quantidade de Parcelas</label>
	   	   <input type="number" name="qtdPlots" class="form-control" id="inputQtdPlots" placeholder="Quantidade das Parcelas">
	 	  </div>

           <div class="form-group">
	   			<label for="inputPlotPrice">Pre�o das Parcelas</label>
	   	   <input type="number" name="plotPrice" class="form-control" id="inputPlotPrice" placeholder="Pre�o das Parcelas">
	 	  </div>

           <div class="form-group">
	   			<label for="inputLink">Link</label>
	   	   <input type="text" name="link" class="form-control" id="inputLink" placeholder="Link">
	 	  </div>
	 	  	  
		  <button type="submit" class="btn btn-primary">Cadastrar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
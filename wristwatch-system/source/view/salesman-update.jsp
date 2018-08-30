<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="model.Salesman" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% Salesman salesman = (Salesman) request.getSession().getAttribute("salesman"); %>

<%@include  file="home-open.jsp" %>

      <form action="${pageContext.servletContext.contextPath}/salesman/update" method="POST">
          <h2 class="form-signin-heading">Revendedor <c:out value="${salesman.name}"/></h2>

           <div class="form-group">
	   			<label for="inputQtdProduct">Quantidade de Produtos*</label>
	   	   <input type="number" name="qtdProducts" class="form-control" id="inputQtdProduct" value="<c:out value="${salesman.qtdProducts}"/>" placeholder="<c:out value="${salesman.qtdProducts}"/>">
	 	  </div>
	 	  
	 	   
          <div class="form-group">
	   			<label for="inputQtdBrands">Quantidade de Marcas*</label>
	   	   		<input type="number" name="qtdBrands" class="form-control" id="inputQtdBrands" value="<c:out value="${salesman.qtdBrands}"/>" placeholder="<c:out value="${salesman.qtdBrands}"/>">
	 	  </div>
	 	  
		  <button type="submit" class="btn btn-primary">Atualizar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
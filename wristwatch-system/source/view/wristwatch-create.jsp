<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Brand" %>
<%@ page import="model.Salesman" %>

<% List<Brand> brandList = (List<Brand>) request.getSession().getAttribute("brandList"); %>
<% List<Salesman> salesmanList = (List<Salesman>) request.getSession().getAttribute("salesmanList"); %>

<%@include  file="home-open.jsp" %>

      <form action="${pageContext.servletContext.contextPath}/wristwatch/create" method="POST">
          <h2 class="form-signin-heading">Informe os dados cadastrais do relógio</h2>
           <div class="form-group">
			    <label for="inputName">Nome*</label>
			    <input type="text" name="name" class="form-control" id="inputName" placeholder="Nome" required>
	 		</div>

           <div class="form-group">
	   			<label for="inputPrice">Preço*</label>
	   	   <input type="number" name="price" class="form-control" id="inputPrice" placeholder="Preço" required>
	 	  </div>
	 	   
           <div class="form-group">
	   			<label for="inputQtdPlots">Quantidade de Parcelas*</label>
	   	   <input type="number" name="qtdPlots" class="form-control" id="inputQtdPlots" placeholder="Quantidade das Parcelas" required>
	 	  </div>

           <div class="form-group">
	   			<label for="inputPlotPrice">Preço das Parcelas*</label>
	   	   <input type="number" name="plotPrice" class="form-control" id="inputPlotPrice" placeholder="Preço das Parcelas" required>
	 	  </div>

           <div class="form-group">
	   			<label for="inputBrand">Marca*</label>
	   			<select name="brand" class="form-control" id="inputBrand">
				  
				  	<c:forEach items="${brandList}" var="brand">
					  	<option value="<c:out value="${brand.name}"/>">
					     
					      <c:out value="${brand.name}"/>
					      
					    </option>
					</c:forEach>
					
				</select>
	 	  </div>
	 	  
           <div class="form-group">
	   			<label for="inputSalesman">Revendedor*</label>
	   		    <select name="salesman" class="form-control" id="inputSalesman">

				    <c:forEach items="${salesmanList}" var="salesman">
					  	<option value="<c:out value="${salesman.name}"/>">
					     
					      <c:out value="${salesman.name}"/>
					      
					    </option>
					</c:forEach>
					
				</select>
	 	  </div>
	 	  	  
		  <button type="submit" class="btn btn-primary">Cadastrar</button>
	
     </form>


<%@include  file="home-close.jsp" %>
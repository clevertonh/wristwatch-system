<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Brand" %>
<%@ page import="model.Salesman" %>
<%@ page import="model.Wristwatch" %>

<% List<Brand> brandList = (List<Brand>) request.getSession().getAttribute("brandList"); %>
<% List<Salesman> salesmanList = (List<Salesman>) request.getSession().getAttribute("salesmanList"); %>
<% Wristwatch wristwatch = (Wristwatch) request.getSession().getAttribute("Wristwatch"); %>

<%@include  file="home-open.jsp" %>

      <form action="${pageContext.servletContext.contextPath}/wristwatch/update" method="POST">
          <h2 class="form-signin-heading">Relógio <c:out value="${wristwatch.name}"/></h2>
          
          <input type="number" name="id" value="<c:out value="${wristwatch.id}"/>" hidden=""/>
          
           <div class="form-group">
			    <label for="inputName">Nome*</label>
			    <input type="text" name="name" class="form-control" id="inputName" placeholder="<c:out value="${wristwatch.name}"/>" required>
	 		</div>

           <div class="form-group">
	   			<label for="inputPrice">Preço*</label>
	   	   <input type="number" name="price" class="form-control" id="inputPrice" placeholder="<c:out value="${wristwatch.price}"/>" required>
	 	  </div>
	 	   
           <div class="form-group">
	   			<label for="inputQtdPlots">Quantidade de Parcelas*</label>
	   	   <input type="number" name="qtdPlots" class="form-control" id="inputQtdPlots" placeholder="<c:out value="${wristwatch.qtdPlots}"/>" required>
	 	  </div>

           <div class="form-group">
	   			<label for="inputPlotPrice">Preço das Parcelas*</label>
	   	   <input type="number" name="plotPrice" class="form-control" id="inputPlotPrice" placeholder="<c:out value="${wristwatch.plotPrice}"/>" required>
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
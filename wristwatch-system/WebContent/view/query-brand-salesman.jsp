<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Brand" %>
<%@ page import="model.Salesman" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<Salesman> salesmanList = (List<Salesman>) request.getSession().getAttribute("salesmanList"); %>
<% List<Brand> brandList = (List<Brand>) request.getSession().getAttribute("brandList"); %>
<% String error = (String) request.getSession().getAttribute("error"); %>

<%@include  file="home-open.jsp" %>

<div>
	<p>Relatório que fornecerá uma listagem de todos os revendedores que são distribuidores de uma dada marca.</p>
</div>

<c:choose>

<c:when test="${error == null && salesmanList.size() > 0}">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nome</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${salesmanList}" var="salesman">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${salesman.name}" /> </td>
    </tr>
  
  </c:forEach>
  
  </tbody>
  
</table>

</c:when>

<c:when test="${error == null && salesmanList.size() == 0 }">

	<div class="alert alert-info alert-dismissible fade show" role="alert">
	  <strong>Informação!</strong> Não foram encontrados dados para essa análise.
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>

</c:when>

<c:when test="${error != null}">
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
	  <strong>Aviso!</strong> <%= error %>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
</c:when>

<c:otherwise>

<form action="${pageContext.servletContext.contextPath}/brand-salesman/Analysis" method="GET">

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
	
	<button type="submit" class="btn btn-primary">Consultar</button>
	
</form>
<% request.getSession().removeAttribute("brandList"); %>
</c:otherwise>

</c:choose>
<% request.getSession().removeAttribute("salesmanList"); %>
<% request.getSession().setAttribute("brandList", null); %>
<%@include  file="home-close.jsp" %>
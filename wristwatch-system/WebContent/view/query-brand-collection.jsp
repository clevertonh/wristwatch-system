<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Brand" %>
<%@ page import="model.Collection" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<Collection> collectionList = (List<Collection>) request.getSession().getAttribute("collectionList"); %>
<% List<Brand> brandList = (List<Brand>) request.getSession().getAttribute("brandList"); %>
<% String error = (String) request.getSession().getAttribute("error"); %>

<%@include  file="home-open.jsp" %>

<c:choose>

<c:when test="${error == null && collectionList.size() > 0}">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Cole��o</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${collectionList}" var="collection">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${collection.name}" /> </td>
    </tr>
  
  </c:forEach>
  
  </tbody>
  
</table>

		<% request.getSession().setAttribute("collectionList", null); %>
</c:when>

<c:when test="${error != null && collectionList.size() == 0 }">

	<div class="alert alert-info alert-dismissible fade show" role="alert">
	  <strong>Informa��o!</strong> N�o foram encontrados dados para essa an�lise.
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
	<% request.getSession().setAttribute("error", null); %>
</c:when>

<c:otherwise>

<form action="${pageContext.servletContext.contextPath}/brand-collection/Analysis" method="POST">

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
	
	<button type="submit" class="btn btn-primary">Cadastrar</button>
	
</form>
	<% request.getSession().setAttribute("brandList", null); %>
</c:otherwise>

</c:choose>

<%@include  file="home-close.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Collection" %>
<%@ page import="model.Wristwatch" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<Wristwatch> wristwatchList = (List<Wristwatch>) request.getSession().getAttribute("wristwatchList"); %>
<% List<Collection> collectionList = (List<Collection>) request.getSession().getAttribute("collectionList"); %>
<% String error = (String) request.getSession().getAttribute("error"); %>

<%@include  file="home-open.jsp" %>

<c:choose>

<c:when test="${error == null && wristwatchList.size() > 0}">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nome Relógio</th>
      <th scope="col">Marca</th>
      <th scope="col">Preço</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${wristwatchList}" var="wristwatch">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${wristwatch.name}" /> </td>
      <td> <c:out value="${wristwatch.brand_name}" /> </td>
      <td> <c:out value="${wristwatch.price}" /> </td>
    </tr>
  
  </c:forEach>
  
  </tbody>
  
</table>

		<% request.getSession().setAttribute("wristwatchList", null); %>
</c:when>

<c:when test="${error != null && wristwatchList.size() == 0 }">

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
	<% request.getSession().setAttribute("error", null); %>
</c:when>

<c:otherwise>

<form action="${pageContext.servletContext.contextPath}/collection-wristwatch/Analysis" method="POST">

	<div class="form-group">
		<label for="inputSalesman">Coleção*</label>
	    <select name="collection" class="form-control" id="inputSalesman">

	    <c:forEach items="${collectionList}" var="collection">
		  	<option value="<c:out value="${collection.name}"/>">
		     
		      <c:out value="${collection.name}"/>
		      
		    </option>
		</c:forEach>
		
		</select>
	</div>
	
	<button type="submit" class="btn btn-primary">Cadastrar</button>
	
</form>
	<% request.getSession().setAttribute("collectionList", null); %>
</c:otherwise>

</c:choose>

<%@include  file="home-close.jsp" %>
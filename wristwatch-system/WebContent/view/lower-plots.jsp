<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="model.Wristwatch" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="home-open.jsp" %>

<div>
	<p>Relatório que fornecerá uma listagem dos relógios cadastrados com os menores valores de parcelas.</p>
</div>

<% String error = (String) request.getSession().getAttribute("error"); %>

<% List<Wristwatch> wristwatchList = (List<Wristwatch>) request.getSession().getAttribute("wristwatchList"); %>

<c:choose>

<c:when test="${error == null && wristwatchList.size() > 0}">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nome</th>
      <th scope="col">Marca</th>
      <th scope="col">Coleção</th>
      <th scope="col">Quantidade Parcelas</th>
      <th scope="col">Parcelas</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${wristwatchList}" var="wristwatch">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${wristwatch.name}" /> </td>
      <td> <c:out value="${wristwatch.brand_name}" /> </td>
      <td> <c:out value="${wristwatch.collection_name}" /> </td>
      <td> <c:out value="${wristwatch.qtdPlots}" /> </td>
      <td> <c:out value="${wristwatch.plotPrice}" /> </td>
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

<form class="form-signin" action="${pageContext.servletContext.contextPath}/lower-plots/Analysis" method="GET">
	<h2 class="form-signin-heading">Menores parcelas</h2>
	
    <div class="form-group">
		<label for="QtdElements">Quantidade de Itens a serem analisados *</label>
	  	<input type="number" name="qtdElements" class="form-control" id="QtdElements" min="1" required/>
	</div>
	
    <div class="form-group">
		<label for="FloorValue">Valor de piso para consulta</label>
	  	<input type="number" name="floorValue" class="form-control" min="1.00" max="1000000.00" step="0.01" id="FloorValue"/>
	</div>
	
  	<button type="submit" class="btn btn-primary">Consultar</button>
  	
</form>

</c:otherwise>

</c:choose>

<%@include file="home-close.jsp" %>

</body>
</html>
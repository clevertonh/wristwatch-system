<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Wristwatch" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<Wristwatch> wristwatchList = (List<Wristwatch>) request.getSession().getAttribute("wristwatchList"); %>

<%@include  file="home-open.jsp" %>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nome</th>
      <th scope="col">Marca</th>
      <th scope="col">Revendedor</th>
      <th scope="col">Preço</th>
      <th scope="col">Atualizar</th>
      <th scope="col">Excluir</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${wristwatchList}" var="wristwatch">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${wristwatch.name}" /> </td>
      <td> <c:out value="${wristwatch.brand_name}" /> </td>
      <td> <c:out value="${wristwatch.salesman_name}" /> </td>
      <td> <c:out value="${wristwatch.price}" /> </td>
      <td><a style="color:#007bff" href="${pageContext.servletContext.contextPath}/wristwatch/set-update?id=<c:out value="${wristwatch.id}" />">Atualizar</a></td>
      <td><a style="color:#007bff" href="${pageContext.servletContext.contextPath}/wristwatch/delete?id=<c:out value="${wristwatch.id}" />">Excluir</a></td>
    </tr>
  
  </c:forEach>
  
  </tbody>
  
</table>


<%@include  file="home-close.jsp" %>
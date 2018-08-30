<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Salesman" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<Salesman> salesmanList = (List<Salesman>) request.getSession().getAttribute("salesmanList"); %>
<% String error = (String) request.getSession().getAttribute("error"); %>
<% error.toString(); %>

<%@include  file="home-open.jsp" %>


<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nome</th>
      <th scope="col">Quantidade De Marcas</th>
      <th scope="col">Quantidade De Produtos</th>
      <th scope="col">Atualizar</th>
      <th scope="col">Excluir</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${salesmanList}" var="salesman">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${salesman.name}" /> </td>
      <td> <c:out value="${salesman.qtdBrands}" /> </td>
      <td> <c:out value="${salesman.qtdProducts}" /> </td>
      <td><a style="color:#007bff" href="${pageContext.servletContext.contextPath}/salesman/set-update?name=<c:out value="${salesman.name}" />">Atualizar</a></td>
      <td><a style="color:#007bff" href="${pageContext.servletContext.contextPath}/salesman/delete?name=<c:out value="${salesman.name}" />"?>Excluir</a></td>
    </tr>
  
  </c:forEach>
  
  </tbody>
  
</table>


<%@include  file="home-close.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<User> userList = (List<User>) request.getSession().getAttribute("userList"); %>

<%@include  file="home-open.jsp" %>

<% String error = (String) request.getSession().getAttribute("error"); %>

<c:choose>

<c:when test="${error == null && userList.size() > 0}">

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nome</th>
      <th scope="col">Email</th>
      <th scope="col">Excluir</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${userList}" var="user">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${user.name}" /> </td>
      <td> <c:out value="${user.email}" /> </td>
      <td><a style="color:#007bff" href="${pageContext.servletContext.contextPath}/user/delete?id=<c:out value="${user.id}" />">Excluir</a></td>
    </tr>
  
  </c:forEach>
  
  </tbody>
  
</table>
</c:when>

<c:when test="${userList.size() == 0 }">

	<div class="alert alert-info alert-dismissible fade show" role="alert">
	  <strong>Informação!</strong> Nenhum usuário cadastrado na base de dados.
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>

</c:when>

<c:otherwise>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
	  <strong>Aviso!</strong> <%= error %>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	<% request.getSession().setAttribute("error", null); %>
</c:otherwise>

</c:choose>

<%@include  file="home-close.jsp" %>
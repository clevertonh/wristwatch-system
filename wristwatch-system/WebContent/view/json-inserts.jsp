<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@include  file="home-open.jsp" %>

	
<table class="table">
  <thead>
    <tr>
      <th scope="col">Inserção de dados por Json</th>
    </tr>
  </thead>
  <tbody>
  
  	<tr>
      <td><a href="create-wristwatch-json.jsp" style="color:#007bff">Armazenar relógios por Json </a> </td>
    </tr>
  	<tr>
      <td><a href="create-salesman-json.jsp" style="color:#007bff"> Armazenar vendedores por Json </a></td>
    </tr>
  	<tr>
      <td><a href="create-brand-json.jsp" style="color:#007bff"> Armazenar marcas por Json </a></td>
    </tr>
  	<tr>
      <td><a href="create-collection-json.jsp" style="color:#007bff"> Armazenar Coleções por json </a></td>
    </tr>
  	<tr>
      <td><a href="create-sale-json.jsp" style="color:#007bff"> Armazenar empresas de compra por json </a></td>
    </tr>
  	<tr>
      <td><a href="create-purchase-json.jsp" style="color:#007bff"> Armazenar empresas de distribuição por json </a></td>
    </tr>

  </tbody>
  
</table>


<%@include  file="home-close.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@include  file="home-open.jsp" %>

	
<table class="table">
  <thead>
    <tr>
      <th scope="col">An�lise</th>
    </tr>
  </thead>
  <tbody>
  
  	<tr>
      <td><a href="higher-price.jsp" style="color:#007bff"> Maiores pre�os </a> </td>
    </tr>
    
  	<tr>
      <td><a href="lower-price.jsp" style="color:#007bff"> Menores pre�os </a></td>
    </tr>
    
  	<tr>
      <td><a href="higher-plots.jsp" style="color:#007bff"> Maiores parcelas </a></td>
    </tr>
    
  	<tr>
      <td><a href="lower-plots.jsp" style="color:#007bff"> Menores parcelas </a></td>
    </tr>

  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=1" style="color:#007bff"> Rela��o Marca com Revendedor </a></td>
    </tr>
    
  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=2" style="color:#007bff"> Relacionamento de Marcas com Cole��es </a></td>
    </tr>

  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=3" style="color:#007bff"> Relacionamento de Marcas com Rel�gios </a></td>
    </tr>
    
  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=4" style="color:#007bff"> Relacionamento de Cole��es com Rel�gios </a></td>
    </tr>
    
   	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/products-brand/Analysis" style="color:#007bff"> M�dia de Rel�gios Agrupados por Marcas </a></td>
    </tr>
    
  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/products-collection/Analysis" style="color:#007bff"> M�dia de Rel�gios Agrupados por Cole��o </a></td>
    </tr>

  </tbody>
  
</table>


<%@include  file="home-close.jsp" %>
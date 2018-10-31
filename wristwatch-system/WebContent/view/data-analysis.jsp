<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@include  file="home-open.jsp" %>

	
<table class="table">
  <thead>
    <tr>
      <th scope="col">Análise</th>
    </tr>
  </thead>
  <tbody>
  
  	<tr>
      <td><a href="higher-price.jsp" style="color:#007bff"> Maiores preços </a> </td>
    </tr>
    
  	<tr>
      <td><a href="lower-price.jsp" style="color:#007bff"> Menores preços </a></td>
    </tr>
    
  	<tr>
      <td><a href="higher-plots.jsp" style="color:#007bff"> Maiores parcelas </a></td>
    </tr>
    
  	<tr>
      <td><a href="lower-plots.jsp" style="color:#007bff"> Menores parcelas </a></td>
    </tr>

  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=1" style="color:#007bff"> Relação Marca e Revendedor </a></td>
    </tr>
    
  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=2" style="color:#007bff"> Relacionamento de Marcas e Coleções </a></td>
    </tr>

  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=3" style="color:#007bff"> Relacionamento de Marcas e Relógios </a></td>
    </tr>
    
  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}/set-Analysis?query=4" style="color:#007bff"> Relacionamento de Coleções e Relógios </a></td>
    </tr>
    
   	<tr>
      <td><a href="${pageContext.servletContext.contextPath}" style="color:#007bff"> Média de Produtos Agrupados por Marcas </a></td>
    </tr>
    
  	<tr>
      <td><a href="${pageContext.servletContext.contextPath}" style="color:#007bff"> Média de Produtos Agrupados por Coleção </a></td>
    </tr>
    
  </tbody>
  
</table>


<%@include  file="home-close.jsp" %>
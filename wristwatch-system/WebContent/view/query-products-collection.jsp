<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Brand" %>
<%@ page import="model.Wristwatch" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<Wristwatch> wristwatchList = (List<Wristwatch>) request.getSession().getAttribute("wristwatchList"); %>
<% String error = (String) request.getSession().getAttribute("error"); %>

<%@include  file="home-open.jsp" %>

<div>
	<p>Relat�rio que fornecer� uma an�lise da m�dia de pre�os dos rel�gios agrupados por cole��es.</p>
</div>

<c:choose>

<c:when test="${error == null && wristwatchList.size() > 0}">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Cole��o</th>
      <th scope="col">M�dia de Pre�o</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="count" value="1" scope="page" />
  <c:forEach items="${wristwatchList}" var="wristwatch">
  
  	<tr>
      <th scope="row"><c:out value="${count}" /><c:set var="count" value="${count + 1}" scope="page"/></th>
      <td> <c:out value="${wristwatch.collection_name}" /> </td>
      <td> <c:out value="${wristwatch.avg}" /> </td>
    </tr>
  
  </c:forEach>
  
  </tbody>
  
</table>

	<canvas id="myChart" width="400" height="400"></canvas>
	<script>
		var ctx = document.getElementById("myChart");
		
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				 labels: [
					  <% for(int i = 0; i < wristwatchList.size(); i+=1){ %>"<%= wristwatchList.get(i).getCollection_name() %>"<% if(i < wristwatchList.size() - 1) { %>,<% } %><% } %>
				 ],
				 datasets: [{
					 label: 'M�dia',
					 data: [
					 	<% for(int i = 0; i < wristwatchList.size(); i+=1){ %><%= wristwatchList.get(i).getAvg() %><% if(i < wristwatchList.size() - 1) { %>, <% } %><% } %>
				 	 ],
			            backgroundColor: 'blue',
			            borderColor: 'black',
			            borderWidth: 1
				 }]
			},
			options: {
				scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        },
		        title: {
		        	display: true,
		        	text: 'M�dia de pre�os de rel�gios'
		        }
			}
		});
	</script>

</c:when>

<c:when test="${error != null && wristwatchList.size() == 0 }">

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
</c:when>

</c:choose>
<% request.getSession().removeAttribute("wristwatchList"); %>
<% request.getSession().setAttribute("error", null); %>
<%@include  file="home-close.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.List" %>
<%@ page import="model.Brand" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% List<Brand> brandList = (List<Brand>) request.getSession().getAttribute("brandList"); %>

<%@include  file="home-open.jsp" %>


<%@include  file="home-close.jsp" %>
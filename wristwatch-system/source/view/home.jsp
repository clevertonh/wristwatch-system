<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="home-open.jsp" %>

<form class="form-signin" action="" method="POST">
	<h2 class="form-signin-heading">Atualizar Perfil</h2>
	<label for="inputName" class="sr-only">Nome</label> <input type="text"
		id="inputName" class="form-control" placeholder="Nome" autofocus>
	<label for="inputEmail" class="sr-only">Email</label> <input
		type="email" id="inputEmail" class="form-control" placeholder="Email"
		autofocus> <label for="inputPassword1" class="sr-only">Senha</label>
	<input type="password" id="inputPassword1" class="form-control"
		placeholder="Senha"> <label for="inputPassword2"
		class="sr-only">Senha</label> <input type="password"
		id="inputPassword2" class="form-control" placeholder="Repita a Senha">
	<label for="picture" class="sr-only">Imagem</label> <input type="file"
		id="picture" class="form-control" placeholder="Foto">
	<button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
</form>

<%@include file="home-close.jsp" %>
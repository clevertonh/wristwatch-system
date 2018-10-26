<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Wristwatch System</title>
  <!-- Bootstrap core CSS -->
  <link href="./assets/bootstrap-4.1.1/css/bootstrap.min.css" rel="stylesheet">

  <!-- CSS for login -->
  <link href="./assets/css/index.css" rel="stylesheet">

</head>

<body>

  <div class="container">
    <div class="system-name">
      Wristwatch System
    </div>
    <form class="form-signin" action="${pageContext.servletContext.contextPath}/login" method="POST">
      <h2 class="form-signin-heading">Informe seus dados para iniciar a sessão</h2>
      <label for="inputEmail" class="sr-only">Email</label>
      <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email" required autofocus>
      <label for="inputPassword" class="sr-only">Senha</label>
      <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Senha" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
      <a href="./view/user/register.html">Cadastrar-se no sistema</a>
    </form>

  </div>
  <!-- /container -->

</body>

</html>
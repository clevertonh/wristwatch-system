<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wristwatch System</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/bootstrap-4.1.1/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS for login -->
    <link href="../assets/css/index.css" rel="stylesheet">

</head>

<body>

    <div class="container">
        <div class="system-name">
            <a href="home.jsp">Wristwatch System</a>
        </div>
        <form action="${pageContext.servletContext.contextPath}/user/create" method="POST">
            <h2 class="form-signin-heading">Informe seus dados cadastrais</h2>
             <div class="form-group">
			    <label for="inputName">Nome</label>
			    <input type="text" name="name" class="form-control" id="inputName" placeholder="Nome">
			 </div>

             <div class="form-group">
			    <label for="inputEmail">Email</label>
			    <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email">
			 </div>
			 
			 <div class="form-group">
			    <label for="inputPass">Senha</label>
			    <input type="password" name="password" class="form-control" id="inputPass" placeholder="Senha">
			 </div>
			 
			<button type="submit" class="btn btn-primary">Cadastrar</button>
			
        </form>

    </div>
    <!-- /container -->

</body>

</html>
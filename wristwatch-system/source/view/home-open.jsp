<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Wristwatch System</title>
	
	
    <!-- Bootstrap core CSS -->
    <link href="../assets/bootstrap-4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/interface-main-header.css" rel="stylesheet">
    <link href="../assets/css/interface-aside-menu.css" rel="stylesheet">
    <link href="../assets/css/interface-content.css" rel="stylesheet">
    <link href="../assets/css/interface.css" rel="stylesheet">
</head>

<body>

    <div class="wrapper">
        <header class="main-header">
            <!-- Logo -->
            <a href="${pageContext.servletContext.contextPath}/view/home.jsp" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini resize-lower">
                    <b>WS</b>
                </span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg resize-upper">
                    <b>Wristwatch System</b>
                </span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#">
                                <img src="../assets/images/user-profile.png" class="user-image" alt="User Image">
                                <span class="hidden-xs">Matheus</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <aside class="main-sidebar">
            <section class="sidebar">

                <!--INICIO DO MENU VERTICAL-->


                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header resize-upper">MENU PRINCIPAL</li>
                    <li class="header resize-lower">MP</li>
                    <li class="treeview active">
                        <a href="${pageContext.servletContext.contextPath}/view/home.jsp">
                            <i class="fa fa-dashboard"></i>
                            <span class="resize-upper">Home</span>
                            <span class="resize-lower">H</span>
                        </a>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            
                            <div class="dropdown">
                            	<div class="dropdown-toggle">
		                            <span class="resize-upper">Usuário</span>
		                            <span class="resize-lower">U</span>
	                            </div>
	                            <div class="dropdown-menu">
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/view/user-create">Criar</a>
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/view/home.jsp">Atualizar</a>
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/user/listAll">Listar</a>
							    </div>
                            </div>
                        </a>
                    </li>
                    
                    <li class="treeview">
                        <a href="#">
                            
                            <div class="dropdown">
                            	<div class="dropdown-toggle">
		                            <span class="resize-upper">Relógios</span>
		                            <span class="resize-lower">R</span>
	                            </div>
	                            <div class="dropdown-menu">
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/wristwatch/set-create">Criar</a>
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/wristwatch/listAll">Listar</a>
							    </div>
                            </div>
                        </a>
                    </li>
                    
                    <li class="treeview">
                        <a href="#">
                            
                            <div class="dropdown">
                            	<div class="dropdown-toggle">
		                            <span class="resize-upper">Marca</span>
		                            <span class="resize-lower">M</span>
	                            </div>
	                            <div class="dropdown-menu">
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/view/brand-create.jsp">Criar</a>
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/brand/listAll">Listar</a>
							    </div>
                            </div>
                        </a>
                    </li>
   
                       <li class="treeview">
                        <a href="#">
                            
                            <div class="dropdown">
                            	<div class="dropdown-toggle">
		                            <span class="resize-upper">Vendedor</span>
		                            <span class="resize-lower">V</span>
	                            </div>
	                            <div class="dropdown-menu">
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/view/salesman-create.jsp">Criar</a>
							        <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/salesman/listAll">Listar</a>
							    </div>
                            </div>
                        </a>
                    </li>                 
                    


                </ul>

                <!--FIM DO MENU VERTICAL-->


            </section>
            <!-- /.sidebar -->
        </aside>

        <div class="content-wrapper" style="min-height: 497px;">
            <section class="content">

               
<%-- 
    Document   : index
    Created on : 13/11/2017, 05:48:07 PM
    Author     : mauricio
--%>

<%@page import="Metodos.metodosUsuario"%>
<%@page import="entidades.usuario"%>
<%@page import="Metodos.metodoLogin"%>
<%@page import="entidades.articulo"%>
<%@page import="Metodos.metodosArticulo"%>
<%@page import="entidades.categoria"%>
<%@page import="java.util.List"%>
<%@page import="Metodos.metodosCategoria"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.baseDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SuperStore</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="style.css" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
                
                <!-- 
colore en los botones #09dbf9, #22e4ff, #0098ad,
-->

	<!-- Favicons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link href="assets/css/stilos.css" rel="stylesheet" type="text/css"/>
  </head>
<body>

<%
    
HttpSession sesion = request.getSession();
String username = request.getParameter("usuario");
String password = request.getParameter("pass");
    

metodoLogin intro  = new metodoLogin();



if (request.getParameter("btnLogin") != null) {
    if (intro.Login(username, password) == true) {
            out.println("<script>alert('Bienvenido ');</script>");
            response.sendRedirect("indexAdmin.jsp");
            session.setAttribute("usuario", username);
            
        }else{
        out.println("<script>alert('Usuario o cotraseña incorrecta');</script>");
    }

    
//    if (entrar.getUsuario()== username && entrar.getContrasena() == password) {
//            response.sendRedirect("indexAdmin.jsp");
//            sesion.setAttribute("usuario", username);
//            sesion.setAttribute("password", password);
//        }else{
//        out.println("<script>alert('Usuario o cotraseña incorrecta');</script>");
//        }
    }
%>
    
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="topNav">
		<div class="container">
			<div class="alignR">
				<div class="pull-left socialNw">
					<a href="#"><span class="icon-twitter"></span></a>
					<a href="#"><span class="icon-facebook"></span></a>
					<a href="#"><span class="icon-youtube"></span></a>
					<a href="#"><span class="icon-tumblr"></span></a>
				</div>
				
			</div>
		</div>
	</div>
</div>

<!--
NO BORRAR !!!!PELIGRO¡¡¡¡!!!!DANGER¡¡¡¡!!!!ATTENZIONE¡¡¡¡!!!!ACHTUNG¡¡¡
Lower Header Section 
-->

<div class="container">
<div id="gototop"> </div>
<header id="header">

</header>

<!--
Menu princpal 
-->
<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">
		  <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>
		  <div class="nav-collapse">
			<ul class="nav">
                            <li class="active"><a href="index.jsp">Inicio	</a></li>
			  <li class=""><a >Catalogo</a></li>
			  <li class=""><a >Quienes somos</a></li>
			  <li class=""><a >Ofertas</a></li>
			  <li class=""><a ></a></li>
			  <li class=""><a ></a></li>
			</ul>
			<form action="#" class="navbar-search pull-left">
			  <input type="text" placeholder="Estoy buscando..." class="search-query span2">
			</form>
			<ul class="nav pull-right">
                        <li>
                            <a href="altaUsuario.jsp">Registro <b></b></a>
				
			</li>
			<li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Login <b class="caret"></b></a>
				<div class="dropdown-menu">
                                    <form class="form-horizontal loginFrm">
				  <div class="control-group">
                                      <input type="text" class="span2" id="inputEmail" placeholder="Usuario" name="usuario">
				  </div>
				  <div class="control-group">
                                      <input type="password" class="span2" id="inputPassword" placeholder="Password" name="pass">
				  </div>
				  <div class="control-group">
                                      <button type="submit" class="shopBtn btn-block" name="btnLogin">Sign in</button>
				  </div>
				</form>
				</div>
			</li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>
<!-- 
Menu Lateral
-->
	<div class="row">
<div id="sidebar" class="span3">
    <div class="well well-small">
	<ul class="nav nav-list"><%
                    metodosCategoria nc = new metodosCategoria();
                    List<categoria> neocat = nc.obtenerCategoria();
                    
                    for (int i = 0; i < neocat.size(); i++){
                %><li><a><span class="icon-chevron-right"></span><% out.println(neocat.get(i).getNombre());%></a></li><%
                } %></a></li>
	</ul>
</div>
    
	</div>
            <!-- 
Slider Principal
-->
	<div class="span9">
	<div class="well np">
		<div id="myCarousel" class="carousel slide homCar">
            <div class="carousel-inner">
			  <div class="item">
                <img style="width:100%" src="assets/img/s.jpg" alt="bootstrap ecommerce templates">
                <div class="carousel-caption">
                      <h4>Tu casa Mas Limpia en cualquier momento</h4>
                      <p><span>con SuperStore</span></p>
                </div>
              </div>
			  <div class="item">
                <img style="width:100%" src="assets/img/s1.jpg" alt="bootstrap ecommerce templates">
                <div class="carousel-caption">
                      <h4>Todo lo que buscas en un solo lugar</h4>
                      <p><span>en SuperStore</span></p>
                </div>
              </div>
			  <div class="item active">
                <img style="width:100%" src="assets/img/s3.jpg" alt="bootstrap ecommerce templates">
                <div class="carousel-caption">
                      <h4>Momentos Felices en tu mercado</h4>
                      <p><span>Aqui en SuperStore</span></p>
                </div>
              </div>
              <div class="item">
                <img style="width:100%" src="assets/img/s4.jpg" alt="bootstrap templates">
                <div class="carousel-caption">
                      <h4>Tu eleccion de confianza siempre</h4>
                      <p><span>SuperStore</span></p>
                </div>
              </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
          </div>
        </div>
<!--
Slider Secundario
-->
	<div class="well well-small productos">
            <h3 class="centrado">Nuestros Productos</h3>
	<hr class="soften"/>
		<div class="row-fluid">
		
		  </div>
		<div class="row-fluid">
		  <ul class="thumbnails">
			
				 
				<%
                    metodosArticulo lp = new metodosArticulo();
                    List<articulo> neoProd = lp.obtenerArticulo();
                    
//                    
                        
                        for(int i = 0; i < neoProd.size(); i ++){
                            %><li class="span4">
			  <div class="thumbnail">
				<p><strong><%out.println(neocat.get(i).getNombre());%></strong></p>
				<a ><img src="assets/img/2.jpg" alt=""></a>
				<div class="caption cntr">
                                    <h3><%out.println(neoProd.get(i).getNombre());%></h3>
                                    <p><strong>$<%out.println(neoProd.get(i).getPrecio());%></strong></p>
					<h4><a class="shopBtn" href="#" title="add to cart"> Agregar a Carrito </a></h4>
					<div class="actionList">
						
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li><%
                        }
                        %>
                        
			<li class="span4">
			  <div class="thumbnail">
				
				<a ><img src="assets/img/2.jpg" alt=""></a>
				<div class="caption cntr">
					<p>Manicure & Pedicure</p>
					<p><strong> $22.00</strong></p>
					<h4><a class="shopBtn" href="#" title="add to cart"> Ver </a></h4>
					<div class="actionList">
						
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				
				<a ><img src="assets/img/3.jpg" alt=""></a>
				<div class="caption cntr">
					<p>Manicure & Pedicure</p>
					<p><strong> $22.00</strong></p>
					<h4><a class="shopBtn" href="#" title="add to cart"> Ver </a></h4>
					<div class="actionList">
						
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li>
		  </ul>
		</div>
	</div>
	<!--
	Segunda secion de targetas
	-->
		<div class="well well-small">
		  <h3><a class="btn btn-mini pull-right"  title="View more">VIew More<span class="icon-plus"></span></a> Featured Products  </h3>
		  <hr class="soften"/>
		  <div class="row-fluid">
		  <ul class="thumbnails">
			<li class="span4">
			  <div class="thumbnail">
				
				<a ><img src="assets/img/1.jpg" alt=""></a>
				<div class="caption">
				  <h5>Manicure & Pedicure</h5>
				  <h4>
					  
					  
				  </h4>
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				
				<a  ><img src="assets/img/2.jpg" alt=""></a>
				<div class="caption">
				  <h5>Manicure & Pedicure</h5>
				  <h4>
					 
				  </h4>
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				
				<a  ><img src="assets/img/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure & Pedicure</h5>
				  <h4>
					  
				  </h4>
				</div>
			  </div>
			</li>
		  </ul>	
	</div>
	</div>

        <!-- 
seciones no usadas
-->
	<div class="well well-small">
	
	</div>
	<hr>
	<div class="well well-small">
	
	</div>
	</div>
	</div>



<!--
Footer
-->
<footer class="footer">
<div class="row-fluid">
<div class="span2">
<h5>Your Account</h5>
<a href="#">YOUR ACCOUNT</a><br>
<a href="#">PERSONAL INFORMATION</a><br>
<a href="#">ADDRESSES</a><br>
<a href="#">DISCOUNT</a><br>
<a href="#">ORDER HISTORY</a><br>
 </div>
<h5>Iinformation</h5>
<a href="contact.html">CONTACT</a><br>
<a href="#">SITEMAP</a><br>
<a href="#">LEGAL NOTICE</a><br>
<a href="#">TERMS AND CONDITIONS</a><br>
<a href="#">ABOUT US</a><br>
 </div>
<div class="span2">
<h5>Our Offer</h5>
<a href="#">NEW PRODUCTS</a> <br>
<a href="#">TOP SELLERS</a><br>
<a href="#">SPECIALS</a><br>
<a href="#">MANUFACTURERS</a><br>
<a href="#">SUPPLIERS</a> <br/>
 </div>
 <div class="span6">
<h5>The standard chunk of Lorem</h5>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for
 those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et 
 Malorum" by Cicero are also reproduced in their exact original form, 
accompanied by English versions from the 1914 translation by H. Rackham.
 </div>
 </div>
</footer>
</div><!-- /container -->

<div class="copyright">
<div class="container">
	<p class="pull-right">
		<a href="#"><img src="assets/img/maestro.png" alt="payment"></a>
		<a href="#"><img src="assets/img/mc.png" alt="payment"></a>
		<a href="#"><img src="assets/img/pp.png" alt="payment"></a>
		<a href="#"><img src="assets/img/visa.png" alt="payment"></a>
		<a href="#"><img src="assets/img/disc.png" alt="payment"></a>
	</p>
	<span></span>
</div>
</div>

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>

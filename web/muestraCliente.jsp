<%-- 
    Document   : index
    Created on : 13/11/2017, 05:48:07 PM
    Author     : mauricio
--%>

<%@page import="entidades.cliente"%>
<%@page import="java.util.List"%>
<%@page import="Metodos.metodosCliente"%>
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
  </head>
<body>

<%

HttpSession sesion = request.getSession();
String username = request.getParameter("usuario");
String password = request.getParameter("pass");
    
if (request.getParameter("btnCerrarSesion") != null) {
    response.sendRedirect("/muck/index.jsp");
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("password");
}

if (request.getParameter("btnPerfil")!= null) {
        response.sendRedirect("perfil.jsp");
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
NO BORRAR !!!!PELIGRO¡¡¡¡ !!!!DANGER¡¡¡¡
Lower Header Section 
-->

<div class="container">
<div id="gototop"> </div>
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	
		<img src="assets/img/31.png" alt="">
	
</div>
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
			  <li class="active"><a >Inicio	</a></li>
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
	<div class="span12">
    
	<div class="well well-small">
		<h1>Usuarios <small class="pull-right"> X usuarios(s) </small></h1>
	<hr class="soften"/>
        <form action="#" class="navbar-search pull-left">
			  <input type="text" placeholder="Estoy buscando..." class="search-query span2">
                         
		 <input  type="submit" name="submitAccount" value="Buscar" class="exclusive shopBtn">
		
	</form>

	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>id</th>
                  <th>Usuario</th>
		  <th>Direcion</th>
                  <th>Telefono</th>
                  <th>Email</th>
                  <th>RFC</th>
                  <th>Descuento</th>
                  <th>cambios</th>
				</tr>
              </thead>
              
              <tbody>
                  <%
              metodosCliente clie = new metodosCliente();
              List <cliente> Cliente = clie.obtenerCliente();
              for(int i = 0; i < Cliente.size(); i++){
                  
              
                %>
                  <tr>
                  <td> <p><%out.println(Cliente.get(i).getIdCliente());%></p>     </td>
                  <td> <p><%out.println(Cliente.get(i).getNombre());%></p>     </td>
                  <td> <p><%out.println(Cliente.get(i).getDireccion());%></p>     </td>
                  <td> <p><%out.println(Cliente.get(i).getTelefono());%></p>     </td>
                  <td> <p><%out.println(Cliente.get(i).getEmail());%></p>     </td>
                  <td> <p><%out.println(Cliente.get(i).getRfc());%></p>     </td>
                  <td> <p><%out.println(Cliente.get(i).getDescuento());%></a>     </td>
                  <td><span class="shopBtn"><span class="icon-undo"></span></span> <span class="shopBtn"><span class="icon-ban-circle"></span></span>       </td>
                </tr>
                 <%
                }
                %>
                </tbody>
               
            </table><br/>
		
		
           
					
	<a href="index.jsp" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Volver a la pagina principal </a>
	<a href="" class="shopBtn btn-large pull-right">aceptar <span class="icon-arrow-right"></span></a>

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
<div class="span2">
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

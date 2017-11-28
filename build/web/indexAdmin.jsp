<%-- 
    Document   : index
    Created on : 13/11/2017, 05:48:07 PM
    Author     : mauricio
--%>

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
    response.sendRedirect("/proyectoF/index.jsp");
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("password");
}

if (request.getParameter("btnPerfil")!= null) {
        response.sendRedirect("perfil.jsp");
    }

if (request.getParameter("btnRegProd")!= null) {
        response.sendRedirect("altaProducto.jsp");
    }

if (request.getParameter("btnRegCat")!= null){
        response.sendRedirect("altaCategoria.jsp");
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
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">Agregar <b class="caret"></b></a>
				<div class="dropdown-menu">
                                    <form class="form-horizontal loginFrm">
                                        <div class="control-group">
                                            <button type="submit" class="shopBtn btn-block" name="btnRegProd">Producto</button>
                                        </div>
                                        <div class="control-group">
                                            <button type="submit" class="shopBtn btn-block" name="btnRegCat">Categoria</button>
                                        </div>
                                    </form>
				</div>
			</li>
			<li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#"><%out.println(sesion.getAttribute("usuario"));%> <b class="caret"></b></a>
				<div class="dropdown-menu">
                                    <form class="form-horizontal loginFrm">
                                        <div class="control-group">
                                            <button type="submit" class="shopBtn btn-block" name="btnPerfil">Mis datos</button>
                                        </div>
                                        <div class="control-group">
                                            <button type="submit" class="shopBtn btn-block" name="btnCerrarSesion">Cerrar Sesión</button>
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
	<ul class="nav nav-list">
		<li><a ><span class="icon-chevron-right"></span>Opcion 1</a></li>
		<li><a ><span class="icon-chevron-right"></span>Opcion 2</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 3</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 4</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 5</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 6</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 7</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 8</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 9</a></li>
		<li><a><span class="icon-chevron-right"></span>Opcion 10</a></li>

	</ul>
</div>
    
    <!-- 
    Anuncio lateral
-->

			  <div class="well well-small alert alert-warning cntr">
				  <h2>SuperStore </h2>
				  <p> 
					 Todos Los productos a tu mano <br><br><a class="defaultBtn" href="#">Ver mas </a>
				  </p>
			  </div>
			  <div class="well well-small" ><a href="#"><img src="assets/img/paypal.jpg" alt="payment method paypal"></a></div>
			
			
			<br>
			<br>
			<ul class="nav nav-list promowrapper">
			
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
                                <!-- 
                                icono de new
                                -->
				<a href="#" class="tag"></a>
				<img src="assets/img/5.jpg" alt="bootstrap template">
				<div class="caption">
                                     <p> 
					 Producto destacado
				  </p>
				  <h4><a class="defaultBtn" >ver</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
		  </ul>

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
	<div class="well well-small">
	<h3>New Products </h3>
	<hr class="soften"/>
		<div class="row-fluid">
		<div id="newProductCar" class="carousel slide">
            <div class="carousel-inner">
			<div class="item active">
			  <ul class="thumbnails">
				<li class="span3">
				<div class="thumbnail">
					
					<a href="#" class="tag"></a>
					<a ><img src="assets/img/1.jpg" alt="bootstrap-ring"></a>
				</div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					
					<a href="#" class="tag"></a>
					<a  ><img src="assets/img/2.jpg" alt=""></a>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					
					<a href="#" class="tag"></a>
					<a  ><img src="assets/img/3.jpg" alt=""></a>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					
					<a  ><img src="assets/img/4.jpg" alt=""></a>
				  </div>
				</li>
			  </ul>
			  </div>
		   <div class="item">
		  <ul class="thumbnails">
			<li class="span3">
			  <div class="thumbnail">
				
				<a  ><img src="assets/img/5.jpg" alt=""></a>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				
				<a ><img src="assets/img/6.jpg" alt=""></a>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				
				<a ><img src="assets/img/7.jpg" alt=""></a>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				
				<a  ><img src="assets/img/8.jpg" alt=""></a>
			  </div>
			</li>
		  </ul>
		  </div>
		   </div>
		  <a class="left carousel-control" href="#newProductCar" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#newProductCar" data-slide="next">&rsaquo;</a>
		  </div>
		  </div>
		<div class="row-fluid">
		  <ul class="thumbnails">
			<li class="span4">
			  <div class="thumbnail">
				 
<!-- 
Targetas siguentes 
-->				
				<a ><img src="assets/img/1.jpg" alt=""></a>
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

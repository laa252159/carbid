
<html>
<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<title>Login Page</title>


</head>
<body onload='document.loginForm.username.focus();'>

 	<link href=/Auctioner/resources/css/bootstrap.min.css rel="stylesheet" type="text/css">
<link href=/Auctioner/resources/css/bootstrap-lumen.css rel="stylesheet" type="text/css">
<link href=/Auctioner/resources/css/iconmoon.css rel="stylesheet" type="text/css">
<link href=/Auctioner/resources/css/jquery.mCustomScrollbar.min.css rel="stylesheet" type="text/css">
<link href=/Auctioner/resources/css/topnav.css rel="stylesheet" type="text/css">
<link href=/Auctioner/resources/css/style.css rel="stylesheet" type="text/css">



<div class="container-fluid container-full">
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-header">
    	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/Auctioner/"><span class="icon-travel-car"></span> Аукцион проверенных машин Саратова</a>
	</div>

	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">

            
            <li class="dropdown mega-dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Antiques & Art<span class="caret"></span></a>
   <ul class="dropdown-menu mega-dropdown-menu">
      <li class="col-sm-3">
         <ul>
            <li class="dropdown-header">Recent Auctions</li>
            <div id="recentAuctions" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="item active">
                     <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                     <h4><small>Summer dress floral prints</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                     <h4><small>Gold sandals with shiny touch</small></h4>
                     <button class="btn btn-primary" type="button">9,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                     <h4><small>Denin jacket stamped</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
               </div>
               <!-- End Carousel Inner -->
               <!-- Controls -->
               <a class="left carousel-control" href="#recentAuctions" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Предыдущий</span>
               </a>
               <a class="right carousel-control" href="#recentAuctions" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Следующий</span>
               </a>
            </div>
            <!-- /.carousel -->
            <li class="divider"></li>
            <li><a href="#">View all Auctions <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
         </ul>
      </li>
      <div class="col-9 pre-scrollable">
         <div class="row">
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Antiques</li>
                  <li><a href="#">Silver</a></li>
                  <li><a href="#">Decorative Arts</a></li>
               </ul>
            </li>
         </div>
      </div>
   </ul>
</li>
<li class="dropdown mega-dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Books<span class="caret"></span></a>
   <ul class="dropdown-menu mega-dropdown-menu">
      <li class="col-sm-3">
         <ul>
            <li class="dropdown-header">Recent Auctions</li>
            <div id="recentAuctions" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="item active">
                     <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                     <h4><small>Summer dress floral prints</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                     <h4><small>Gold sandals with shiny touch</small></h4>
                     <button class="btn btn-primary" type="button">9,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                     <h4><small>Denin jacket stamped</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
               </div>
               <!-- End Carousel Inner -->
               <!-- Controls -->
               <a class="left carousel-control" href="#recentAuctions" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Предыдущий</span>
               </a>
               <a class="right carousel-control" href="#recentAuctions" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Следующий</span>
               </a>
            </div>
            <!-- /.carousel -->
            <li class="divider"></li>
            <li><a href="#">View all Auctions <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
         </ul>
      </li>
      <div class="col-9 pre-scrollable">
         <div class="row">
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Nonfiction</li>
                  <li><a href="#">Military</a></li>
                  <li><a href="#">Religion</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Antiquarian, Rare</li>
                  <li><a href="#">Illustrated, Art</a></li>
               </ul>
            </li>
         </div>
      </div>
   </ul>
</li>
<li class="dropdown mega-dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Clothing & Accessories<span class="caret"></span></a>
   <ul class="dropdown-menu mega-dropdown-menu">
      <li class="col-sm-3">
         <ul>
            <li class="dropdown-header">Recent Auctions</li>
            <div id="recentAuctions" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="item active">
                     <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                     <h4><small>Summer dress floral prints</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                     <h4><small>Gold sandals with shiny touch</small></h4>
                     <button class="btn btn-primary" type="button">9,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                     <h4><small>Denin jacket stamped</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
               </div>
               <!-- End Carousel Inner -->
               <!-- Controls -->
               <a class="left carousel-control" href="#recentAuctions" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Предыдущий</span>
               </a>
               <a class="right carousel-control" href="#recentAuctions" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Следующий</span>
               </a>
            </div>
            <!-- /.carousel -->
            <li class="divider"></li>
            <li><a href="#">View all Auctions <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
         </ul>
      </li>
      <div class="col-9 pre-scrollable">
         <div class="row">
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Men</li>
                  <li><a href="#">Accessories</a></li>
                  <li><a href="#">Clothing: Regular</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Women</li>
                  <li><a href="#">Misses</a></li>
                  <li><a href="#">Petites</a></li>
                  <li><a href="#">Intimates</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Personal Care</li>
                  <li><a href="#">Makeup & Face Care</a></li>
                  <li><a href="#">Body Care</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Wedding Apparel</li>
                  <li><a href="#">Brides' Gowns</a></li>
               </ul>
            </li>
         </div>
      </div>
   </ul>
</li>
<li class="dropdown mega-dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Collectibles<span class="caret"></span></a>
   <ul class="dropdown-menu mega-dropdown-menu">
      <li class="col-sm-3">
         <ul>
            <li class="dropdown-header">Recent Auctions</li>
            <div id="recentAuctions" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="item active">
                     <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                     <h4><small>Summer dress floral prints</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                     <h4><small>Gold sandals with shiny touch</small></h4>
                     <button class="btn btn-primary" type="button">9,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                     <h4><small>Denin jacket stamped</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
               </div>
               <!-- End Carousel Inner -->
               <!-- Controls -->
               <a class="left carousel-control" href="#recentAuctions" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Предыдущий</span>
               </a>
               <a class="right carousel-control" href="#recentAuctions" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Следующий</span>
               </a>
            </div>
            <!-- /.carousel -->
            <li class="divider"></li>
            <li><a href="#">View all Auctions <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
         </ul>
      </li>
      <div class="col-9 pre-scrollable">
         <div class="row">
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Housewares & Kitchenware</li>
                  <li><a href="#">Textiles</a></li>
                  <li><a href="#">Kitchenware</a></li>
                  <li><a href="#">Barware</a></li>
                  <li><a href="#">Metalware</a></li>
                  <li><a href="#">Magnets</a></li>
                  <li><a href="#">Tableware</a></li>
                  <li><a href="#">Shaving</a></li>
                  <li><a href="#">Bottles: Modern (1900-Now)</a></li>
                  <li><a href="#">Bottles: Antique (Pre-1900)</a></li>
                  <li><a href="#">Irons</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Decorative & Holiday</li>
                  <li><a href="#">Decorative by Brand</a></li>
                  <li><a href="#">Holiday, Seasonal</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Pop Culture</li>
                  <li><a href="#">Pinbacks</a></li>
                  <li><a href="#">Comics</a></li>
                  <li><a href="#">Pez</a></li>
                  <li><a href="#">Trading Cards</a></li>
                  <li><a href="#">Science Fiction</a></li>
                  <li><a href="#">Nodders</a></li>
                  <li><a href="#">Lunchboxes, Thermoses</a></li>
                  <li><a href="#">Magic</a></li>
                  <li><a href="#">Promo Glasses</a></li>
                  <li><a href="#">Keychains</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Furnishings, Knives & Tools</li>
                  <li><a href="#">Tools</a></li>
                  <li><a href="#">Knives</a></li>
               </ul>
            </li>
            <div class="row">
               <li class="col-sm-3">
                  <ul>
                     <li class="dropdown-header">Autographs, Paper & Writing</li>
                     <li><a href="#">Paper</a></li>
                  </ul>
               </li>
            </div>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Transportation</li>
                  <li><a href="#">Railroadiana, Trains</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Advertising</li>
                  <li><a href="#">Tobacciana</a></li>
                  <li><a href="#">Distillery</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Historical Memorabilia</li>
                  <li><a href="#">Firefighting</a></li>
                  <li><a href="#">Flags</a></li>
               </ul>
            </li>
            <div class="row">
               <li class="col-sm-3">
                  <ul>
                     <li class="dropdown-header">Art, Animation & Photo Images</li>
                     <li><a href="#">Photographic Images</a></li>
                     <li><a href="#">Animation Characters</a></li>
                  </ul>
               </li>
            </div>
         </div>
      </div>
   </ul>
</li>
<li class="dropdown mega-dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Movies & Television<span class="caret"></span></a>
   <ul class="dropdown-menu mega-dropdown-menu">
      <li class="col-sm-3">
         <ul>
            <li class="dropdown-header">Recent Auctions</li>
            <div id="recentAuctions" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="item active">
                     <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                     <h4><small>Summer dress floral prints</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                     <h4><small>Gold sandals with shiny touch</small></h4>
                     <button class="btn btn-primary" type="button">9,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                     <h4><small>Denin jacket stamped</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
               </div>
               <!-- End Carousel Inner -->
               <!-- Controls -->
               <a class="left carousel-control" href="#recentAuctions" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Предыдущий</span>
               </a>
               <a class="right carousel-control" href="#recentAuctions" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Следующий</span>
               </a>
            </div>
            <!-- /.carousel -->
            <li class="divider"></li>
            <li><a href="#">View all Auctions <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
         </ul>
      </li>
      <div class="col-9 pre-scrollable">
         <div class="row">
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Memorabilia</li>
                  <li><a href="#">Movie</a></li>
                  <li><a href="#">Other Memorabilia</a></li>
                  <li><a href="#">Television</a></li>
                  <li><a href="#">Theater</a></li>
                  <li><a href="#">Hockey-NHL</a></li>
                  <li><a href="#">Baseball-Other</a></li>
               </ul>
            </li>
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Video, Film</li>
                  <li><a href="#">DVD</a></li>
                  <li><a href="#">VHS</a></li>
                  <li><a href="#">16mm</a></li>
                  <li><a href="#">Laserdisc</a></li>
                  <li><a href="#">8mm</a></li>
                  <li><a href="#">Beta</a></li>
               </ul>
            </li>
         </div>
      </div>
   </ul>
</li>
<li class="dropdown mega-dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Music<span class="caret"></span></a>
   <ul class="dropdown-menu mega-dropdown-menu">
      <li class="col-sm-3">
         <ul>
            <li class="dropdown-header">Recent Auctions</li>
            <div id="recentAuctions" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="item active">
                     <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                     <h4><small>Summer dress floral prints</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                     <h4><small>Gold sandals with shiny touch</small></h4>
                     <button class="btn btn-primary" type="button">9,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                     <h4><small>Denin jacket stamped</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
               </div>
               <!-- End Carousel Inner -->
               <!-- Controls -->
               <a class="left carousel-control" href="#recentAuctions" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Предыдущий</span>
               </a>
               <a class="right carousel-control" href="#recentAuctions" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Следующий</span>
               </a>
            </div>
            <!-- /.carousel -->
            <li class="divider"></li>
            <li><a href="#">View all Auctions <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
         </ul>
      </li>
      <div class="col-9 pre-scrollable">
         <div class="row">
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">CDs, Records, & Tapes</li>
                  <li><a href="#">Records</a></li>
                  <li><a href="#">CDs</a></li>
               </ul>
            </li>
         </div>
      </div>
   </ul>
</li>
<li class="dropdown mega-dropdown">
   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Toys & Hobbies<span class="caret"></span></a>
   <ul class="dropdown-menu mega-dropdown-menu">
      <li class="col-sm-3">
         <ul>
            <li class="dropdown-header">Recent Auctions</li>
            <div id="recentAuctions" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="item active">
                     <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                     <h4><small>Summer dress floral prints</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                     <h4><small>Gold sandals with shiny touch</small></h4>
                     <button class="btn btn-primary" type="button">9,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
                  <div class="item">
                     <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                     <h4><small>Denin jacket stamped</small></h4>
                     <button class="btn btn-primary" type="button">49,99 &euro;</button> <button href="#" class="btn btn-default" type="button">See more here</button>
                  </div>
                  <!-- End Item -->
               </div>
               <!-- End Carousel Inner -->
               <!-- Controls -->
               <a class="left carousel-control" href="#recentAuctions" role="button" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
               <span class="sr-only">Предыдущий</span>
               </a>
               <a class="right carousel-control" href="#recentAuctions" role="button" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
               <span class="sr-only">Следующий</span>
               </a>
            </div>
            <!-- /.carousel -->
            <li class="divider"></li>
            <li><a href="#">View all Auctions <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
         </ul>
      </li>
      <div class="col-9 pre-scrollable">
         <div class="row">
            <li class="col-sm-3">
               <ul>
                  <li class="dropdown-header">Diecast, Toy Vehicles</li>
                  <li><a href="#">Cars, Trucks-Diecast</a></li>
               </ul>
            </li>
         </div>
      </div>
   </ul>
</li>


		</ul>
        <div class="nav navbar-nav navbar-form navbar-right">
            <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                <li>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <a href="/Auctioner/admin-inbox" class="btn btn-default btn-sm btn-link">
                    </sec:authorize>
                    <sec:authorize ifNotGranted="ROLE_ADMIN">
                        <a href="/Auctioner/myprofile-inbox" class="btn btn-default btn-sm btn-link">
                    </sec:authorize>
                        <div class="notification-icon">
                            <span class="glyphicon glyphicon-envelope"></span>
                            <span id="msg-badge" class="badge" style="display: none"></span>
                        </div>
                    </a>
                </li>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    <li><a href="/Auctioner/admin" style="color:orange">Админка</a></li>
                    <li><a href="/Auctioner/j_spring_security_logout">Выйти</a></li>
                </sec:authorize>
                 <%--<sec:authorize ifAnyGranted="ROLE_BIDDER">--%>
                    <%--<li><a href="upgrade" style="color:orange">Become An Auctioner</a></li>--%>
                <%--</sec:authorize>--%>
                <sec:authorize ifNotGranted="ROLE_ADMIN">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href=
                        "#" id="account">Мой профиль (<sec:authentication property="name" />) <span class=
                        "caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/Auctioner/myprofile">Account Settings</a></li>
                            <sec:authorize ifAnyGranted="ROLE_ADMIN">
                            <%--<sec:authorize ifAnyGranted="ROLE_SELLER">--%>
                                <li><a href="myauctions">Мои лоты</a></li>
                            </sec:authorize>
                            <li class="divider"></li>
                            <li><a href="/Auctioner/j_spring_security_logout">Выйти</a></li>
                        </ul>
                    </li>
                </sec:authorize>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
                <a class="btn btn-primary" href="login">Вход</a>
                or
                <a class="btn btn-warning" href="registration">Регистрация</a>
            </sec:authorize>
        </div>
	</div><!-- /.nav-collapse -->
  </nav>
</div>

<sec:authorize ifNotGranted="ROLE_ANONYMOUS">

</sec:authorize>


	<div class="col-md-4 col-md-offset-4">
		
		
	</div>
	<br/>
	<br/>
	<div class="col-md-4 col-md-offset-4 well">
		<form name="loginForm" role="form" action="j_spring_security_check" method="POST">
			 <div class="form-group">
				 <label for="email">Логин:</label>
				 <input type="text" name='username' class="form-control" id="username">
			 </div>
			 <div class="form-group">
				  <label for="pwd">Пароль:</label>
				  <input type="password" name='password' class="form-control" id="pwd">
			 </div>
			 <div class="checkbox">
 			      <label><input type="checkbox"> Запомнить меня</label>
			 </div>
	  		 <button name="submit" type="submit"
					value="submit" class="btn btn-success">Вход</button>
		</form>
		<p>Нет логина? Зарегистрироваться <a href="registration">здесь</a><p>
	</div>

	<!-- Footer -->
	<div class="navbar navbar-default navbar-fixed-bottom" >
    <div class="container text-center">
        <p class="text-muted">&copy; <span class="icon-travel-car"></span> Аукцион проверенных автомобилей</p>
    </div>
</div>

<script src=/Auctioner/resources/js/jquery.min.js></script>
<script src=/Auctioner/resources/js/bootstrap.min.js></script>
<script src=/Auctioner/resources/js/jquery.mCustomScrollbar.concat.min.js></script>
<script src=/Auctioner/resources/js/style.js></script>



</body>
</html>

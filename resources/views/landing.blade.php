<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pension - Management</title>

    <!-- Bootstrap core CSS -->
    <link href="{{ asset('theme/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Animation CSS -->
    <link href="{{ asset('theme/css/animate.css') }}" rel="stylesheet">
    <link href="{{ asset('theme/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="{{ asset('theme/css/style.css') }}" rel="stylesheet">
</head>
<body id="page-top" class="landing-page no-skin-config">
<div class="navbar-wrapper">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">PENSION SOMETHING</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                   
                </div>
            </div>
        </nav>
</div>
<div id="inSlider" class="carousel carousel-fade" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#inSlider" data-slide-to="0" class="active"></li>
        <li data-target="#inSlider" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
                <div class="carousel-caption">
                   <h1>PENSION MANAGEMENT SYSTEM</h1>
                        
                        <ul class="list-inline intro-social-buttons">
                            <li>
                               <a class="btn btn-lg btn-primary" href="{{ url('/login') }}" role="button">LOGIN</a>
                            </li>
                            
                           
                        </ul>
                        
                        
                        
                    
                </div>
                
            </div>
            <!-- Set background for slide in css -->
            <div class="header-back one"></div>

        </div>

    </div>
    <a class="left carousel-control" href="#inSlider" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#inSlider" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>








<section id="contact" class="gray-section contact">
    <div class="container">
      
    
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center m-t-lg m-b-lg">
                <p><strong>&copy; <?PHP echo date("Y",time()) ;?> PRIORITY MOBILE</strong><br/> </p>
            </div>
        </div>
    </div>
</section>

<!-- Mainly scripts -->
<script src="{{ asset('theme/js/jquery-3.1.1.min.js') }}"></script>
<script src="{{ asset('theme/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('theme/js/plugins/metisMenu/jquery.metisMenu.js') }}"></script>
<script src="{{ asset('theme/js/plugins/slimscroll/jquery.slimscroll.min.js') }}"></script>

<!-- Custom and plugin javascript -->
<script src="{{ asset('theme/js/inspinia.js') }}"></script>
<script src="{{ asset('theme/js/plugins/pace/pace.min.js') }}"></script>
<script src="{{ asset('theme/js/plugins/wow/wow.min.js') }}"></script>


<script>

    $(document).ready(function () {

        $('body').scrollspy({
            target: '.navbar-fixed-top',
            offset: 80
        });

        // Page scrolling feature
        $('a.page-scroll').bind('click', function(event) {
            var link = $(this);
            $('html, body').stop().animate({
                scrollTop: $(link.attr('href')).offset().top - 50
            }, 500);
            event.preventDefault();
            $("#navbar").collapse('hide');
        });
    });

    var cbpAnimatedHeader = (function() {
        var docElem = document.documentElement,
                header = document.querySelector( '.navbar-default' ),
                didScroll = false,
                changeHeaderOn = 200;
        function init() {
            window.addEventListener( 'scroll', function( event ) {
                if( !didScroll ) {
                    didScroll = true;
                    setTimeout( scrollPage, 250 );
                }
            }, false );
        }
        function scrollPage() {
            var sy = scrollY();
            if ( sy >= changeHeaderOn ) {
                $(header).addClass('navbar-scroll')
            }
            else {
                $(header).removeClass('navbar-scroll')
            }
            didScroll = false;
        }
        function scrollY() {
            return window.pageYOffset || docElem.scrollTop;
        }
        init();

    })();

    // Activate WOW.js plugin for animation on scrol
    new WOW().init();

</script>

</body>
</html>

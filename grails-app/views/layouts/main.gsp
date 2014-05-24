<!DOCTYPE html>
<!--[if lt IE 7]>
    <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
    <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
    <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />

    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title><g:layoutTitle default="Home"/> - Invicta</title>
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<r:require modules="fontawesome,application"/>--}%
    %{--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>--}%

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Icons -->
    <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <asset:link rel="apple-touch-icon" href="apple-touch-icon.png"/>
    <asset:link rel="apple-touch-icon" sizes="57x57" href="apple-touch-icon-57x57.png" />
    <asset:link rel="apple-touch-icon" sizes="72x72" href="apple-touch-icon-72x72.png'" />
    <asset:link rel="apple-touch-icon" sizes="76x76" href="apple-touch-icon-76x76.png'" />
    <asset:link rel="apple-touch-icon" sizes="114x114" href="apple-touch-icon-114x114.png" />
    <asset:link rel="apple-touch-icon" sizes="120x120" href="apple-touch-icon-120x120.png" />
    <asset:link rel="apple-touch-icon" sizes="144x144" href="apple-touch-icon-144x144.png" />
    <asset:link rel="apple-touch-icon" sizes="152x152" href="apple-touch-icon-152x152.png" />

    <!-- dependsOn 'jquery' -->
    <!--[if lt IE 9]>
        <asset:javascript src="ie-fixes.js" />
    <![endif]-->

    <!--[if lt IE 9]>
        <asset:javascript src="_excanvas.compiled.js" />
    <![endif]-->

    <!--[if lt IE 9]>
        <asset:stylesheet href="ie-fixes.css" />
    <![endif]-->


    <!--[if lt IE 9]>
    <asset:javascript src="respond.js" />
    <![endif]-->

    <asset:stylesheet href="application.css" />
</head>
<body class="bgpattern-black-twill">

<div id="wrapper" class="boxed">
    <div class="top_wrapper">
        <header id="header">
            <div class="container">
                <div class="row header">
                    <div class="col-md-2 col-sm-4 col-xs-4 logo">
                        <g:link controller="site" action="index">
                            <img src="${resource(dir: 'images', file: 'logo.png')}" alt=""/>
                        </g:link>
                    </div>

                    <div class="col-md-10">
                        <div class="mobile-menu-button">
                            <i class="icon-reorder"></i>
                        </div>

                        <nav>
                            <ul class="navigation">
                                <li>
                                    <a href="/">
                                        <span class="label-nav">
                                            Home
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <g:link controller="forum" action="index">
                                        <span class="label-nav">Forums</span>
                                    </g:link>
                                </li>
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                    <li>
                                        <g:link controller="admin" action="index">
                                            <span class="label-nav">Admin</span>
                                        </g:link>
                                    </li>
                                </sec:ifAllGranted>
                            </ul>
                        </nav>

                        <!-- Mobile Nav. Container -->
                        <ul class="mobile-nav"></ul>
                        <!-- //Mobile Nav. Container// -->
                    </div>
                </div>
            </div>
        </header>

        <div class="top-title-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 page-info">
                        <h1 class="h1-page-title"><g:layoutTitle /></h1>

                        %{--<h2 class="h2-page-desc">--}%
                            %{--Know The Reasons Behind Our Success--}%
                        %{--</h2>--}%

                        <!-- BreadCrumb -->
                        %{--<div class="breadcrumb-container">--}%
                            %{--<ol class="breadcrumb">--}%
                                %{--<li>--}%
                                    %{--<a href="">--}%
                                        %{--<i class="icon-home"></i>--}%
                                        %{--Home--}%
                                    %{--</a>--}%
                                %{--</li>--}%
                                %{--<li>About Us</li>--}%
                            %{--</ol>--}%
                        %{--</div>--}%
                        <!-- BreadCrumb -->

                    </div>
                </div>
            </div>
        </div>
    </div><!--.top wrapper end -->

    <div class="content-wrapper hide-util-loading">
        <div class="body-wrapper">
            <div class="container">
                <g:if test="${flash?.message?.size()}">
                    <div class="row">
                        <div class="col-md-9 col-sm-9">
                            <div class="alert alert-${flash?.alert ?: 'info'}">
                                ${flash.message}
                            </div>
                        </div>
                    </div>
                </g:if>
                <div class="row">
                    <div class="col-md-9 col-sm-9">
                        <g:layoutBody/>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <g:render template="/panels/userPanel" />
                    </div>
                </div>
            </div>
        </div>
    </div>

<footer>
    <div class="footer">

        <div class="container">
            <div class="footer-wrapper">
                <div class="row">


                    <!-- Footer Col. -->
                    <div class="col-md-3 col-sm-3 footer-col">
                        <div class="footer-content">
                            <div class="footer-content-logo">
                                <img src="${resource(dir: 'images', file: 'logo.png')}" alt=""/>
                            </div>
                            <div class="footer-content-text">
                                <p>Lorem ipsum dolor sit amet nec, consectetuer adipiscing elit. Aenean commodo ligula eget
                                dolor.</p>
                                <p>Lorem ipsum dolor sit amet nec, consectetuer adipiscing elit. Aenean commodo ligula eget
                                dolor.</p>
                            </div>
                        </div>
                    </div>
                    <!-- //Footer Col.// -->

                    <!-- Footer Col. -->
                    <div class="col-md-3 col-sm-3 footer-col">
                        <div class="footer-title">
                            Recent Posts
                        </div>
                        <div class="footer-content">
                            <div class="footer-posts">
                                <ul class="posts-list">
                                    <li>
                                        <div class="posts-list-thumbnail">
                                            <a href="">
                                                <img src="${resource(dir: 'media', file: 'blog1-thumb.jpg')}" alt=""/>
                                            </a>
                                        </div>
                                        <div class="posts-list-content">
                                            <a href="" class="posts-list-title">Sidebar post example </a>
                                            <span class="posts-list-meta">
                                                July 30, 2013
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="posts-list-thumbnail">
                                            <a href="">
                                                <img src="${resource(dir: 'media', file: 'blog2-thumb.jpg')}" alt=""/>
                                            </a>
                                        </div>
                                        <div class="posts-list-content">
                                            <a href="" class="posts-list-title">Sidebar post example </a>
                                            <span class="posts-list-meta">
                                                July 30, 2013
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="posts-list-thumbnail">
                                            <a href="">
                                                <img src="${resource(dir: 'media', file: 'blog3-thumb.jpg')}" alt=""/>
                                            </a>
                                        </div>
                                        <div class="posts-list-content">
                                            <a href="" class="posts-list-title">Sidebar post example </a>
                                            <span class="posts-list-meta">
                                                July 30, 2013
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="posts-list-thumbnail">
                                            <a href="">
                                                <img src="${resource(dir: 'media', file: 'blog4-thumb.jpg')}" alt=""/>
                                            </a>
                                        </div>
                                        <div class="posts-list-content">
                                            <a href="" class="posts-list-title">Sidebar post example </a>
                                            <span class="posts-list-meta">
                                                July 30, 2013
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <!-- //Footer Col.// -->

                    <!-- Footer Col. -->
                    <div class="col-md-3 col-sm-3 footer-col">
                        <div class="footer-title">
                            Get In Touch
                        </div>
                        <div class="footer-content">
                            <ul class="contact-info">
                                <li>
                                    <div class="contact-title">
                                        <i class="icon-map-marker"></i>Address
                                    </div>
                                    <div class="contact-details">38222 California, Los Angeles 22</div>
                                </li>
                                <li>
                                    <div class="contact-title">
                                        <i class="icon-phone"></i>phone
                                    </div>
                                    <div class="contact-details">123-345-6666</div>
                                </li>
                                <li>
                                    <div class="contact-title">
                                        <i class="icon-envelope"></i>eMail
                                    </div>
                                    <div class="contact-details"><a href="mailto:info@company.com">info@companyname.com</a></div>
                                </li>
                                <li>
                                    <div class="contact-title">
                                        <i class="icon-globe"></i>Website
                                    </div>
                                    <div class="contact-details"><a href="#">www.companyname.com</a></div>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <!-- //Footer Col.// -->

                    <!-- Footer Col. -->
                    <div class="col-md-3 col-sm-3 footer-col">
                        <div class="footer-title">
                            Photostream
                        </div>
                        <div class="footer-content">
                            <div class="flickr_badge_wrapper">
                                <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=9&display=latest&size=s&layout=x&source=all_tag&tag=Sky,scrappers" id="flicker-images"></script>
                            </div>
                            <!-- //Footer Col.// -->

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="copyright-text">&copy; ${new Date().format('yyyy')} | <a href="http://invictaguild.net">Invicta</a> | v <g:meta name="app.version" /></div>
                    </div>
                    <div class="col-md-6 col-sm-6">


                        <div class="social-icons">

                            <ul>
                                <li>
                                    <a href="#" title="facebook" target="_blank" class="social-media-icon facebook-icon">facebook</a>
                                </li>
                                <li>
                                    <a href="#" title="twitter" target="_blank" class="social-media-icon twitter-icon">twitter</a>
                                </li>
                                <li>
                                    <a href="#" title="googleplus" target="_blank" class="social-media-icon googleplus-icon">googleplus</a>
                                </li>
                                <li>
                                    <a href="#" title="pininterest" target="_blank" class="social-media-icon pininterest-icon">pininterest</a>
                                </li>
                                <li>
                                    <a href="#" title="dribble" target="_blank" class="social-media-icon dribble-icon">dribble</a>
                                </li>

                            </ul>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</footer>

</div>

<g:if env="production">
    <asset:script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '${grailsApplication.config.google?.analytics?.account ?: ''}']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </asset:script>
</g:if>

<asset:javascript src="application.js" />
<asset:deferredScripts/>
</body>
</html>

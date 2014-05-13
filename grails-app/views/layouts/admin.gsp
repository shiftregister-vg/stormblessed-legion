<!DOCTYPE html>
<html lang="en-us">
<head>
    <meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

    <title> SmartAdmin </title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'admin/css', file: 'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'admin/css', file: 'font-awesome.min.css')}">

    <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'admin/css', file: 'smartadmin-production_unminified.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'admin/css', file: 'smartadmin-skins.css')}">

    <!-- SmartAdmin RTL Support is under construction
		<link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'admin/css', file: 'smartadmin-rtl.css')}"> -->

    <!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="/admin/css/your_style.css"> -->



    <!-- FAVICONS -->
    <link rel="icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon" />
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}" />
    <link rel="apple-touch-icon" sizes="57x57" href="${resource(dir: 'images', file: 'apple-touch-icon-57x57.png')}" />
    <link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}" />
    <link rel="apple-touch-icon" sizes="76x76" href="${resource(dir: 'images', file: 'apple-touch-icon-76x76.png')}" />
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}" />
    <link rel="apple-touch-icon" sizes="120x120" href="${resource(dir: 'images', file: 'apple-touch-icon-120x120.png')}" />
    <link rel="apple-touch-icon" sizes="144x144" href="${resource(dir: 'images', file: 'apple-touch-icon-144x144.png')}" />
    <link rel="apple-touch-icon" sizes="152x152" href="${resource(dir: 'images', file: 'apple-touch-icon-152x152.png')}" />

    <!-- GOOGLE FONT -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="${resource(dir: 'admin/img', file: 'ipad-landscape.png')}" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="${resource(dir: 'admin/img', file: 'ipad-portrait.png')}" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="${resource(dir: 'admin/img', file: 'iphone.png')}" media="screen and (max-device-width: 320px)">

</head>
<body class="smart-style-1">
<!-- POSSIBLE CLASSES: minified, fixed-ribbon, fixed-header, fixed-width
			 You can also add different skin classes such as "smart-skin-1", "smart-skin-2" etc...-->

<!-- HEADER -->
<g:render template="/layouts/admin/header" />
<!-- END HEADER -->

<g:render template="/layouts/admin/navigation" />
<!-- END NAVIGATION -->

<!-- MAIN PANEL -->
<div id="main" role="main">

    <!-- RIBBON -->
    <g:render template="/layouts/admin/ribbon" />
    <!-- END RIBBON -->

    <!-- MAIN CONTENT -->
    <div id="content">

    </div>
    <!-- END MAIN CONTENT -->

</div>
<!-- END MAIN PANEL -->

<!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
		Note: These tiles are completely responsive,
		you can add as many as you like
		-->
<g:render template="/layouts/admin/shortcuts" />
<!-- END SHORTCUT AREA -->

<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="${resource(dir: 'admin/js/plugin/pace', file: 'pace.min.js')}"></script>-->

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
    if (!window.jQuery) {
        document.write('<script src="${resource(dir: 'admin/js/libs', file: 'jquery-2.0.2.min.js')}"><\/script>');
    }
</script>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
    if (!window.jQuery.ui) {
        document.write('<script src="${resource(dir: 'admin/js/libs', file: 'jquery-ui-1.10.3.min.js')}"><\/script>');
    }
</script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events
		<script src="/admin/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

<!-- BOOTSTRAP JS -->
<script src="${resource(dir: 'admin/js/bootstrap', file: 'bootstrap.min.js')}"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="${resource(dir: 'admin/js/notification', file: 'SmartNotification.min.js')}"></script>

<!-- JARVIS WIDGETS -->
<script src="${resource(dir: 'admin/js/smartwidgets', file: 'jarvis.widget.min.js')}"></script>

<!-- EASY PIE CHARTS -->
<script src="${resource(dir: 'admin/js/plugin/easy-pie-chart', file: 'jquery.easy-pie-chart.min.js')}"></script>

<!-- SPARKLINES -->
<script src="${resource(dir: 'admin/js/plugin/sparkline', file: 'jquery.sparkline.min.js')}"></script>

<!-- JQUERY VALIDATE -->
<script src="${resource(dir: 'admin/js/plugin/jquery-validate', file: 'jquery.validate.min.js')}"></script>

<!-- JQUERY MASKED INPUT -->
<script src="${resource(dir: 'admin/js/plugin/masked-input', file: 'jquery.maskedinput.min.js')}"></script>

<!-- JQUERY SELECT2 INPUT -->
<script src="${resource(dir: 'admin/js/plugin/select2', file: 'select2.min.js')}"></script>

<!-- JQUERY UI + Bootstrap Slider -->
<script src="${resource(dir: 'admin/js/plugin/bootstrap-slider', file: 'bootstrap-slider.min.js')}"></script>

<!-- browser msie issue fix -->
<script src="${resource(dir: 'admin/js/plugin/msie-fix', file: 'jquery.mb.browser.min.js')}"></script>

<!-- FastClick: For mobile devices: you can disable this in app.js -->
<script src="${resource(dir: 'admin/js/plugin/fastclick', file: 'fastclick.js')}"></script>

<!--[if IE 7]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->

<!-- Demo purpose only -->
%{--<script src="${resource(dir: 'admin/js', file: 'demo.js')}"></script>--}%

<!-- MAIN APP JS FILE -->
<script src="${resource(dir: 'admin/js', file: 'app.js')}"></script>

<!-- Your GOOGLE ANALYTICS CODE Below -->
%{--<script type="text/javascript">--}%

    %{--var _gaq = _gaq || [];--}%
    %{--_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);--}%
    %{--_gaq.push(['_trackPageview']);--}%

    %{--(function() {--}%
        %{--var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;--}%
        %{--ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';--}%
        %{--var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);--}%
    %{--})();--}%

%{--</script>--}%

</body>

</html>

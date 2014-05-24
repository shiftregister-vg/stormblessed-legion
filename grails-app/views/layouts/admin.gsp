<!DOCTYPE html>
<html lang="en-us">
<head>
    <meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

    <title> SmartAdmin </title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">



    <!-- FAVICONS -->
    <link rel="icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon" />
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}" />
    <link rel="apple-touch-icon" sizes="57x57" href="${assetPath(src: 'apple-touch-icon-57x57.png')}" />
    <link rel="apple-touch-icon" sizes="72x72" href="${assetPath(src: 'apple-touch-icon-72x72.png')}" />
    <link rel="apple-touch-icon" sizes="76x76" href="${assetPath(src: 'apple-touch-icon-76x76.png')}" />
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-114x114.png')}" />
    <link rel="apple-touch-icon" sizes="120x120" href="${assetPath(src: 'apple-touch-icon-120x120.png')}" />
    <link rel="apple-touch-icon" sizes="144x144" href="${assetPath(src: 'apple-touch-icon-144x144.png')}" />
    <link rel="apple-touch-icon" sizes="152x152" href="${assetPath(src: 'apple-touch-icon-152x152.png')}" />

    <!-- GOOGLE FONT -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="${assetPath(src: 'admin/ipad-landscape.png')}" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="${assetPath(src: 'admin/ipad-portrait.png')}" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="${assetPath(src: 'admin/iphone.png')}" media="screen and (max-device-width: 320px)">

    <asset:stylesheet href="admin/admin.css" />
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


<!--[if IE 7]>
    <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
<![endif]-->

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

<asset:javascript src="admin/admin" />
<asset:deferredScripts/>

</body>

</html>

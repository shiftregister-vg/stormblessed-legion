modules = {

    fontawesome {
        resource url: 'css/font-awesome-ie7.css', bundle: 'fontawesome'
        resource url: 'css/font-awesome.css', bundle: 'fontawesome'
    }

    application {
        dependsOn 'jquery'
        resource url: 'js/ie-fixes.js', disposition: 'head', wrapper: { s ->
            "<!--[if lt IE 9]>$s<![endif]-->"
        }

        resource url: 'js/_excanvas.compiled.js', disposition: 'head', wrapper: { s ->
            "<!--[if lt IE 9]>$s<![endif]-->"
        }

        resource url: 'css/ie-fixes.css', wrapper: { s ->
            "<!--[if lt IE 9]>$s<![endif]-->"
        }

        resource url: 'css/revolution_settings.css'
        resource url: 'css/bootstrap.css'
        resource url: 'css/eislider.css'
        resource url: 'css/tipsy.css'
        resource url: 'css/prettyPhoto.css'
        resource url: 'css/isotop_animation.css'
        resource url: 'css/animate.css'
        resource url: 'css/flexslider.css'
        resource url: 'css/style.css'
        resource url: 'css/responsive.css'
        resource url: 'css/skins/red.css'

        resource url: 'js/respond.js', disposition: 'head', wrapper: { s ->
            "<!--[if lt IE 9]>$s<![endif]-->"
        }

        resource url: 'css/color-chooser.css'

        resource url: 'js/_jquery.placeholder.js'
        resource url: "js/activeaxon_menu.js"
        resource url: "js/animationEnigne.js"
        resource url: "js/bootstrap.js"
        resource url: "js/bootstrap.min.js"
        resource url: "js/easypiecharts.js"
        resource url: "js/ie-fixes.js"
        resource url: "js/jquery.base64.js"
        resource url: "js/jquery.carouFredSel-6.2.1-packed.js"
        resource url: "js/jquery.cycle.js"
        resource url: "js/jquery.cycle2.carousel.js"
        resource url: "js/jquery.easing.1.3.js"
        resource url: "js/jquery.easytabs.js"
        resource url: "js/jquery.eislideshow.js"
        resource url: "js/jquery.flexslider.js"
        resource url: "js/jquery.infinitescroll.js"
        resource url: "js/jquery.isotope.js"
        resource url: "js/jquery.parallax-1.1.3.js"
        resource url: "js/jquery.prettyPhoto.js"
        resource url: "js/jQuery.scrollPoint.js"
        resource url: "js/jquery.themepunch.plugins.min.js"
        resource url: "js/jquery.themepunch.revolution.js"
        resource url: "js/jquery.tipsy.js"
        resource url: "js/jquery.validate.js"
        resource url: "js/jQuery.XDomainRequest.js"
        resource url: "js/retina.js"
        resource url: "js/timeago.js"
        resource url: "js/tweetable.jquery.js"
        resource url: "js/zeina.js"

        resource url: 'js/application.js'
    }

    jquery2 {
        resource url: 'admin/js/libs/jquery-2.0.2.min.js'
    }

    jqueryUI1103 {
        dependsOn 'jquery2'
        resource url: 'admin/js/libs/jquery-ui-1.10.3.min.js'
    }

    flot {
        resource url: 'admin/js/plugin/flot/jquery.flot.cust.js'
        resource url: 'admin/js/plugin/flot/jquery.flot.resize.min.js'
        resource url: 'admin/js/plugin/flot/jquery.flot.tooltip.min.js'
    }

    vectormap {
        dependsOn 'jquery2'
        resource url: 'admin/js/plugin/vectormap/jquery-jvectormap-1.2.2.min.js'
        resource url: 'admin/js/plugin/vectormap/jquery-jvectormap-world-mill-en.js'
    }

    adminCalendar {
        dependsOn 'jquery2'
        resource url: 'admin/js/plugin/fullcalendar/jquery.fullcalendar.min.js'
    }

    admin {
        dependsOn 'jquery2,jqueryUI1103,flot,vectormap,adminCalendar'
        // css
        resource url: 'admin/css/bootstrap.min.css'
        resource url: 'admin/css/font-awesome.min.css'
        resource url: 'admin/css/smartadmin-production.css'
        resource url: 'admin/css/smartadmin-skins.css'
        resource url: 'admin/css/demo.css'

        // js
        resource url: 'admin/js/bootstrap/bootstrap.min.js'
        resource url: 'admin/js/notification/SmartNotification.min.js'
        resource url: 'admin/js/smartwidgets/jarvis.widget.min.js'
        resource url: 'admin/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js'
        resource url: 'admin/js/plugin/sparkline/jquery.sparkline.min.js'
        resource url: 'admin/js/plugin/jquery-validate/jquery.validate.min.js'
        resource url: 'admin/js/plugin/masked-input/jquery.maskedinput.min.js'
        resource url: 'admin/js/plugin/select2/select2.min.js'
        resource url: 'admin/js/plugin/bootstrap-slider/bootstrap-slider.min.js'
        resource url: 'admin/js/plugin/msie-fix/jquery.mb.browser.min.js'
        resource url: 'admin/js/plugin/fastclick/fastclick.js'
    }

    handlebars {
        defaultBundle 'handlebars'
        resource url: 'js/handlebars-v1.3.0.js'
    }
}

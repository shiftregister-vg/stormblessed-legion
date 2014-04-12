modules = {
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

        resource url: 'css/font-awesome-ie7.css'
        resource url: 'css/font-awesome.css'
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
    }
}

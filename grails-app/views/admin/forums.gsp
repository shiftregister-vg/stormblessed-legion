<%--
  User: steve
  Date: 5/26/14
  Time: 7:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forums</title>
    <meta name="layout" content="blank"/>
</head>
<body>

<section id="widget-grid" class=""></section>

<script id="forums-template" type="text/x-handlebars-template">
    {{#each forumGroups}}
    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget jarviswidget-color-darken jarviswidget-sortable" id="wid-id-12" data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false" role="widget">
                <!-- widget options:
                        usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                        data-widget-colorbutton="false"
                        data-widget-editbutton="false"
                        data-widget-togglebutton="false"
                        data-widget-deletebutton="false"
                        data-widget-fullscreenbutton="false"
                        data-widget-custombutton="false"
                        data-widget-collapsed="true"
                        data-widget-sortable="false"

                    -->
                <header role="heading">
                    <span class="widget-icon"> <i class="fa fa-comments-o"></i> </span>
                    <h2>{{name}}</h2>
                    <div class="widget-toolbar" role="menu">

                        <div class="btn-group">
                            <button class="btn dropdown-toggle btn-xs btn-default" data-toggle="dropdown">
                                <i class="fa fa-gear"></i> <i class="fa fa-caret-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a href="javascript:void(0);">Option 1</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">Option 2</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">Option 3</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span></header>

                <!-- widget div-->
                <div role="content">

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->
                    </div>
                    <!-- end widget edit box -->

                    <!-- widget content -->
                    <div class="widget-body">

                        <ul>
                            {{#each forums}}
                            <li>
                                <span class="fa fa-comments"></span> {{name}}
                            </li>
                            {{/each}}
                        </ul>

                    </div>
                    <!-- end widget content -->

                </div>
                <!-- end widget div -->

            </div>
        </article>
    </div>
    {{/each}}
</script>

<script type="text/javascript">
    var invicta = invicta || {};
    invicta.templates = {
        forumGroups: Handlebars.compile($('#forums-template').html())
    };

    (function($){
        $.getJSON('${createLink(controller: 'admin', action: 'ajaxListForums')}',{}, function(result){
            invicta.forumGroups = result;
            $('#widget-grid').html(invicta.templates.forumGroups(invicta));
        });
    })(jQuery);
</script>

</body>
</html>

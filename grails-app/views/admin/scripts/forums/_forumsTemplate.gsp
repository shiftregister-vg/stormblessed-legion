<script id="forums-template" type="text/x-handlebars-template">
{{#each forumGroups}}
<div class="row forumGroup">
    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget jarviswidget-color-blueDark jarviswidget-sortable" id="wid-id-12"
             data-widget-colorbutton="false" data-widget-togglebutton="false" data-widget-editbutton="false"
             data-widget-fullscreenbutton="false" data-widget-deletebutton="false" role="widget">

            <header role="heading">
                <span class="widget-icon"> <i class="fa fa-comments-o"></i> </span>
                <h2>{{name}}</h2>
                <div class="widget-toolbar" role="menu">
                    <div>
                        <button class="addForum btn btn-xs btn-primary" data-forum-group-id="{{id}}">
                            <i class="fa fa-plus"></i>
                        </button>

                        <button class="renameForumGroup btn btn-xs btn-primary" data-forum-group-id="{{id}}">
                            <i class="fa fa-edit"></i>
                        </button>

                        <button class="deleteForumGroup btn btn-xs btn-danger" data-forum-group-id="{{id}}">
                            <i class="fa fa-times"></i>
                        </button>
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

                    <ul class="list-group sortable-forums" data-groupid="{{id}}">
                        {{#each forums}}
                        <li class="list-group-item" data-id="{{id}}">
                            <div class="row">
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <span class="fa fa-comments"></span>
                                    <a class="forum" href="#" data-id="{{id}}" data-groupid="{{group.id}}">
                                        {{name}}
                                    </a>
                                </div>

                                <div class="col-sm-3 col-md-3 col-lg-3">
                                    <div class="btn-group pull-right">
                                        <button class="remove-forum btn btn-xs btn-danger" data-id="{{id}}" data-groupid="{{group.id}}">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
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

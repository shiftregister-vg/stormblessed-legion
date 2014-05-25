<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 5/10/2014
  Time: 2:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users</title>
    <meta name="layout" content="blank"/>
</head>

<body>

<div class="alert alert-success fade in" id="success-alert">
    <button class="close" data-dismiss="alert">x</button>
    <i class="fa-fw fa fa-check"></i>
    <strong id="username-alert"></strong> <span id="success-alert-message"></span>
</div>

<!-- widget grid -->
<section id="widget-grid" class="">

    <!-- row -->
    <div class="row">

        <!-- NEW WIDGET START -->
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <!-- Widget ID (each widget will need unique ID)-->
            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-sortable="false"
                 data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
                <header>
                    <span class="widget-icon"><i class="fa fa-user"></i></span>

                    <h2>Users</h2>
                </header>

                <!-- widget div-->
                <div>

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->

                    </div>
                    <!-- end widget edit box -->

                    <!-- widget content -->
                    <div class="widget-body no-padding">
                        <div class="widget-body-toolbar">

                        </div>

                        <table id="dt_basic" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Enabled</th>
                                <th>Account Expired</th>
                                <th>Password Expired</th>
                                <th>Account Locked</th>
                            </tr>
                            </thead>
                            <tbody id="users-tbody"></tbody>
                        </table>

                    </div>
                    <!-- end widget content -->

                </div>
                <!-- end widget div -->

            </div>
            <!-- end widget -->
        </article>
    </div>

    <div class="row">
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false"
                 data-widget-custombutton="false"
                 data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false"
                 data-widget-collapsed="true" data-widget-sortable="false">

                <header>
                    <span class="widget-icon"><i class="fa fa-edit"></i></span>

                    <h2>New User</h2>

                </header>

                <!-- widget div-->
                <div>

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->

                    </div>
                    <!-- end widget edit box -->

                    <!-- widget content -->
                    <div class="widget-body no-padding">

                        <form action="#" id="smart-form-register" class="smart-form">
                            <header>
                                Registration form
                            </header>

                            <fieldset>
                                <section>
                                    <label class="input"><i class="icon-append fa fa-user"></i>
                                        <input id="username" type="text" name="username" placeholder="Username">
                                        <b class="tooltip tooltip-bottom-right">Needed to enter the website</b></label>
                                </section>



                                <section>
                                    <label class="input"><i class="icon-append fa fa-envelope-o"></i>
                                        <input id="email" type="email" name="email" placeholder="Email address">
                                        <b class="tooltip tooltip-bottom-right">Needed to verify your account</b>
                                    </label>
                                </section>

                                <section>
                                    <label class="input"><i class="icon-append fa fa-lock"></i>
                                        <input type="password" name="password" placeholder="Password" id="password">
                                        <b class="tooltip tooltip-bottom-right">Don't forget your password</b></label>
                                </section>
                            </fieldset>


                            <footer>
                                <button id="submitUserFormButton" type="button" class="btn btn-primary">
                                    Add User
                                </button>
                            </footer>
                        </form>

                    </div>
                    <!-- end widget content -->

                </div>
                <!-- end widget div -->

            </div>
        </article>
    </div>

</section>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div id="edit-user-modal-content-wrapper" class="modal-content">Loading...</div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<g:render template="/admin/scripts/users" />

</body>
</html>
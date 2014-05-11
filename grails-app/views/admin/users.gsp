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
    <strong id="username-alert"></strong> has been added successfully!
</div>

<!-- widget grid -->
<section id="widget-grid" class="">

<div class="row">
    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-custombutton="false"
             data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false"
             data-widget-collapsed="true" data-widget-sortable="false">
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
            <header>
                <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
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
                                <label class="input"> <i class="icon-append fa fa-user"></i>
                                    <input id="username" type="text" name="username" placeholder="Username">
                                    <b class="tooltip tooltip-bottom-right">Needed to enter the website</b> </label>
                            </section>



                            <section>
                                <label class="input"> <i class="icon-append fa fa-envelope-o"></i>
                                    <input id="email" type="email" name="email" placeholder="Email address">
                                    <b class="tooltip tooltip-bottom-right">Needed to verify your account</b> </label>
                            </section>

                            <section>
                                <label class="input"> <i class="icon-append fa fa-lock"></i>
                                    <input type="password" name="password" placeholder="Password" id="password">
                                    <b class="tooltip tooltip-bottom-right">Don't forget your password</b> </label>
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
                    <tbody id="users-tbody">

                    <g:each in="${users}" var="user">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.enabled}</td>
                            <td>${user.accountExpired}</td>
                            <td>${user.passwordExpired}</td>
                            <td>${user.accountLocked}</td>
                        </tr>
                    </g:each>

                    </tbody>
                </table>

            </div>
            <!-- end widget content -->

        </div>
        <!-- end widget div -->

    </div>
    <!-- end widget -->

    <script type="text/javascript">

        var invicta = invicta || {};

        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();

        // PAGE RELATED SCRIPTS

        /* remove previous elems */

        if ($('.DTTT_dropdown.dropdown-menu').length) {
            $('.DTTT_dropdown.dropdown-menu').remove();
        }

        loadDataTableScripts();
        function loadDataTableScripts() {

            loadScript("${resource(dir: 'admin/js/plugin/datatables', file: 'jquery.dataTables-cust.min.js')}", dt_2);

            function dt_2() {
                loadScript("${resource(dir: 'admin/js/plugin/datatables', file: 'ColReorder.min.js')}", dt_3);
            }

            function dt_3() {
                loadScript("${resource(dir: 'admin/js/plugin/datatables', file: 'FixedColumns.min.js')}", dt_4);
            }

            function dt_4() {
                loadScript("${resource(dir: 'admin/js/plugin/datatables', file: 'ColVis.min.js')}", dt_5);
            }

            function dt_5() {
                loadScript("${resource(dir: 'admin/js/plugin/datatables', file: 'ZeroClipboard.js')}", dt_6);
            }

            function dt_6() {
                loadScript("${resource(dir: 'admin/js/plugin/datatables/media/js', file: 'TableTools.min.js')}", dt_7);
            }

            function dt_7() {
                loadScript("${resource(dir: 'admin/js/plugin/datatables', file: 'DT_bootstrap.js')}", runDataTables);
            }

        }

        function runDataTables() {

            /*
             * BASIC
             */
            invicta.userTable = $('#dt_basic').dataTable({
                "sPaginationType": "bootstrap_full"
            });

            /* END BASIC */

            /* Add the events etc before DataTables hides a column */
            $("#datatable_fixed_column thead input").keyup(function () {
                oTable.fnFilter(this.value, oTable.oApi._fnVisibleToColumnIndex(oTable.fnSettings(), $("thead input").index(this)));
            });

            $("#datatable_fixed_column thead input").each(function (i) {
                this.initVal = this.value;
            });
            $("#datatable_fixed_column thead input").focus(function () {
                if (this.className == "search_init") {
                    this.className = "";
                    this.value = "";
                }
            });
            $("#datatable_fixed_column thead input").blur(function (i) {
                if (this.value == "") {
                    this.className = "search_init";
                    this.value = this.initVal;
                }
            });


            var oTable = $('#datatable_fixed_column').dataTable({
                "sDom": "<'dt-top-row'><'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
                //"sDom" : "t<'row dt-wrapper'<'col-sm-6'i><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'>>",
                "oLanguage": {
                    "sSearch": "Search all columns:"
                },
                "bSortCellsTop": true
            });


            /*
             * COL ORDER
             */
            $('#datatable_col_reorder').dataTable({
                "sPaginationType": "bootstrap",
                "sDom": "R<'dt-top-row'Clf>r<'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
                "fnInitComplete": function (oSettings, json) {
                    $('.ColVis_Button').addClass('btn btn-default btn-sm').html('Columns <i class="icon-arrow-down"></i>');
                }
            });

            /* END COL ORDER */

            /* TABLE TOOLS */
            $('#datatable_tabletools').dataTable({
                "sDom": "<'dt-top-row'Tlf>r<'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",
                "oTableTools": {
                    "aButtons": ["copy", "print", {
                        "sExtends": "collection",
                        "sButtonText": 'Save <span class="caret" />',
                        "aButtons": ["csv", "xls", "pdf"]
                    }],
                    "sSwfPath": "js/plugin/datatables/media/swf/copy_csv_xls_pdf.swf"
                },
                "fnInitComplete": function (oSettings, json) {
                    $(this).closest('#dt_table_tools_wrapper').find('.DTTT.btn-group').addClass('table_tools_group').children('a.btn').each(function () {
                        $(this).addClass('btn-sm btn-default');
                    });
                }
            });

            /* END TABLE TOOLS */

        }

        $('#submitUserFormButton').on('click', function() {
            var url = '${createLink(controller: 'admin', action: 'ajaxSaveUser')}',
                params = {username: $('#username').val(), password: $('#password').val(), email: $('#email').val()};

            $.getJSON(url, params, function(result){
                $('#smart-form-register').find("input, textarea").val("");
                $('#username-alert').html(result.username);
                $('#success-alert').show('fast');
                invicta.userTable.fnAddData([result.username, result.email, result.enabled, result.accountExpired, result.passwordExpired, result.accountLocked]);
            });
        });

        $('#success-alert').hide();

    </script>

</body>
</html>
%{--
Included in /admin/users.gsp to provide scripts
--}%

<script id="usernameButton" type="text/x-handlebars-template">
    <button class="username-btn btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal"
            data-username="{{username}}" data-userEnabled="{{enabled}}" data-accountExpired="{{accountExpired}}"
            data-passwordExpired="{{passwordExpired}}" data-accountLocked="{{accountLocked}}">{{username}}</button>
</script>

<script id="editUserModalContent" type="text/x-handlebars-template">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">Edit <span id="username-title">{{username}}</span></h4>
</div>

<div class="modal-body">

    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <input type="text" id="username-input" class="form-control" placeholder="Username" required value="{{username}}"/>
            </div>

            <div class="form-group">
                <input type="password" id="password-input" class="form-control" placeholder="Password (leave blank to leave unchanged)" required/>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="category">Category</label>
                <select class="form-control" id="category">
                    <option>Articles</option>
                    <option>Tutorials</option>
                    <option>Freebies</option>
                </select>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label for="tags">Tags</label>
                <input type="text" class="form-control" id="tags" placeholder="Tags"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm well-primary">
                <form class="form form-inline " role="form">
                    <div class="form-group">
                        <input type="text" class="form-control" value="" placeholder="Date" required/>
                    </div>

                    <div class="form-group">
                        <select class="form-control">
                            <option>Draft</option>
                            <option>Published</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-sm">
                            <span class="glyphicon glyphicon-floppy-disk"></span> Save
                        </button>
                        <button type="button" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-eye-open"></span> Preview
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">
        Cancel
    </button>
    <button type="button" class="btn btn-primary">
        Save User
    </button>
</div>
</script>

<script type="text/javascript">

    var invicta = invicta || {};

    // DO NOT REMOVE : GLOBAL FUNCTIONS!
    pageSetUp();

    // PAGE RELATED SCRIPTS

    /* remove previous elems */

    if ($('.DTTT_dropdown.dropdown-menu').length) {
        $('.DTTT_dropdown.dropdown-menu').remove();
    }

    loadScript("${assetPath(src: 'handlebars-v1.3.0.js')}", initHandleBars);
    function initHandleBars() {
        invicta.usernameButtonTemplate = Handlebars.compile($('#usernameButton').html());
        invicta.editUserTemplate = Handlebars.compile($('#editUserModalContent').html());
        loadDataTableScripts();
    }
    function loadDataTableScripts() {

        loadScript("${assetPath(src: 'admin/plugin/datatables/jquery.dataTables-cust.min.js')}", dt_2);

        function dt_2() {
            loadScript("${assetPath(src: 'admin/plugin/datatables/ColReorder.min.js')}", dt_3);
        }

        function dt_3() {
            loadScript("${assetPath(src: 'admin/plugin/datatables/FixedColumns.min.js')}", dt_4);
        }

        function dt_4() {
            loadScript("${assetPath(src: 'admin/plugin/datatables/ColVis.min.js')}", dt_5);
        }

        function dt_5() {
            loadScript("${assetPath(src: 'admin/plugin/datatables/ZeroClipboard.js')}", dt_6);
        }

        function dt_6() {
            loadScript("${assetPath(src: 'admin/plugin/datatables/media/js/TableTools.min.js')}", dt_7);
        }

        function dt_7() {
            loadScript("${assetPath(src: 'admin/plugin/datatables/DT_bootstrap.js')}", runDataTables);
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
                "sSwfPath": "plugin/datatables/media/swf/copy_csv_xls_pdf.swf"
            },
            "fnInitComplete": function (oSettings, json) {
                $(this).closest('#dt_table_tools_wrapper').find('.DTTT.btn-group').addClass('table_tools_group').children('a.btn').each(function () {
                    $(this).addClass('btn-sm btn-default');
                });
            }
        });

        /* END TABLE TOOLS */

        $.getJSON("${createLink(controller: 'admin', action: 'ajaxLoadUsers')}").success(function(result){
            $.each(result, function(i){
                var user = result[i];
                console.log(user);
                console.log(invicta.usernameButtonTemplate(user));
                invicta.userTable.fnAddData([
                    invicta.usernameButtonTemplate(user),
                    user.email,
                    user.enabled,
                    user.accountExpired,
                    user.passwordExpired,
                    user.accountLocked
                ]);
            });
        });

    }

    $('#submitUserFormButton').on('click', function () {
        var url = '${createLink(controller: 'admin', action: 'ajaxSaveUser')}',
                params = {username: $('#username').val(), password: $('#password').val(), email: $('#email').val()};

        $.getJSON(url, params, function (result) {
            $('#smart-form-register').find("input, textarea").val("");
            $('#username-alert').html(result.username);
            $('#success-alert').show('fast');
            invicta.userTable.fnAddData([
                invicta.usernameButtonTemplate(result),
                result.email,
                result.enabled,
                result.accountExpired,
                result.passwordExpired,
                result.accountLocked
            ]);
        });
    });

    $('.username-btn').on('click', function(){
        invicta.selectedUsername = $(this).data('username');
        var userData = {
            username: invicta.selectedUsername,
            enabled: $(this).data('userEnabled'),
            accountExpired: $(this).data('accountExpired'),
            passwordExpired: $(this).data('passwordExpired'),
            accountLocked: $(this).data('accountLocked')
        };
        var html = invicta.editUserTemplate(userData);
        $('#edit-user-modal-content-wrapper').html(html);
    });

    $('#success-alert').hide();

</script>

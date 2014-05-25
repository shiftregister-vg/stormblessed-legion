%{--
Included in /admin/users.gsp to provide scripts
--}%

<script id="usernameButton" type="text/x-handlebars-template">
    <button class="username-btn btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal"
            data-username="{{username}}" data-userEnabled="{{enabled}}" data-accountExpired="{{accountExpired}}"
            data-passwordExpired="{{passwordExpired}}" data-accountLocked="{{accountLocked}}"
            data-email="{{email}}" data-id="{{id}}">{{username}}</button>
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
                <input type="email" id="email-input" class="form-control" placeholder="Email" value="{{email}}" required/>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label for="enabled">
                    <input type="checkbox" id="enabled" name="enabled" {{#if enabled}}checked="true"{{/if}} />
                    <small>Enabled</small>
                </label>
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                <label for="accountExpired">
                    <input type="checkbox" id="accountExpired" name="accountExpired" {{#if accountExpired}}checked="true"{{/if}} />
                <small>Account Expired</small>
                </label>
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                <label for="passwordExpired">
                    <input type="checkbox" id="passwordExpired" name="passwordExpired" {{#if passwordExpired}}checked="true"{{/if}} />
                <small>Password Expired</small>
                </label>
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                <label for="accountLocked">
                    <input type="checkbox" id="accountLocked" name="accountLocked" {{#if accountLocked}}checked="true"{{/if}} />
                <small>Account Locked</small>
                </label>
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">
        Cancel
    </button>
    <button id="saveUserEditButton" type="button" class="btn btn-primary">
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
            $.each(result, function(i, user){
                invicta.addUserToDT(user);
            });
            invicta.reapplyHandler('.username-btn', 'click', invicta.usernameBtnClickHandler);
        });

    }

    $('#submitUserFormButton').on('click', function () {
        var url = '${createLink(controller: 'admin', action: 'ajaxSaveUser')}',
                params = {username: $('#username').val(), password: $('#password').val(), email: $('#email').val()};

        $.getJSON(url, params, function (result) {
            $('#smart-form-register').find("input, textarea").val("");
            $('#username-alert').html(result.username);
            $('#success-alert-message').text('has been added successfully!');
            $('#success-alert').show('fast');
            invicta.addUserToDT(result);
            invicta.reapplyHandler('.username-btn', 'click', invicta.usernameBtnClickHandler);
        });
    });

    invicta.addUserToDT = function(user) {
        console.log(user);
        invicta.userTable.fnAddData([
            invicta.usernameButtonTemplate(user),
            user.email,
            user.enabled,
            user.accountExpired,
            user.passwordExpired,
            user.accountLocked,
            user.id
        ]);
    };

    invicta.usernameBtnClickHandler = function(){
        invicta.selectedUsername = $(this).data('username');
        invicta.selectedUserData = {
            username: invicta.selectedUsername,
            enabled: $(this).data('userenabled'),
            accountExpired: $(this).data('accountexpired'),
            passwordExpired: $(this).data('passwordexpired'),
            accountLocked: $(this).data('accountlocked'),
            email: $(this).data('email'),
            id: $(this).data('id')
        };
        var html = invicta.editUserTemplate(invicta.selectedUserData);
        $('#edit-user-modal-content-wrapper').html(html);
        invicta.reapplyHandler('#saveUserEditButton', 'click', invicta.saveUserEditButtonClickHandler);
    };

    invicta.saveUserEditButtonClickHandler = function() {
        // save all of the user info
        invicta.selectedUserData.username = $('#username-input:visible').val();
        invicta.selectedUserData.email = $('input#email-input:visible').val().trim();
        invicta.selectedUserData.enabled = $('input#enabled:visible').prop('checked');
        invicta.selectedUserData.accountExpired = $('input#accountExpired:visible').prop('checked');
        invicta.selectedUserData.passwordExpired = $('input#passwordExpired:visible').prop('checked');
        invicta.selectedUserData.accountLocked = $('input#accountLocked:visible').prop('checked');

        $.each(invicta.userTable.fnGetData(), function(i, it){
            if (it[6] === invicta.selectedUserData.id) {
                invicta.userTable.fnUpdate([
                    invicta.usernameButtonTemplate(invicta.selectedUserData),
                    invicta.selectedUserData.email,
                    invicta.selectedUserData.enabled,
                    invicta.selectedUserData.accountExpired,
                    invicta.selectedUserData.passwordExpired,
                    invicta.selectedUserData.accountLocked,
                    invicta.selectedUserData.id
                ], i);
            }
        });

        $.getJSON('${createLink(controller: 'admin', action: 'ajaxUpdateUser')}', invicta.selectedUserData, function(result){
            // close the modal
            $('#username-alert').html(invicta.selectedUserData.username);
            $('#success-alert-message').text('has been updated successfully!');
            $('#success-alert').show('fast');
            $('#myModal').modal('hide');
        });
    };

    invicta.reapplyHandler = function(selector, event, handler) {
        $(selector).off(event, handler);
        $(selector).on(event, handler);
    };

    $('.username-btn').on('click', invicta.usernameBtnClickHandler);
    $('#success-alert').hide();

</script>

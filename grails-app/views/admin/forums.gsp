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

<div class="row">
    <div class="col-sm-12">
        <div class="btn-group pull-right">
            <button id="createForumGroupBtn" class="btn btn-success"><i class="fa fa-plus"></i></button>
            <button id="refreshForumGroupsBtn" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
        </div>
    </div>
</div>

<br/>

<section id="widget-grid" class=""></section>

<g:render template="scripts/forums/forumsTemplate" />
<g:render template="scripts/forums/createForumGroupTemplate" />
<g:render template="scripts/forums/editForumGroupModalTemplate" />
<g:render template="scripts/forums/createForumModalTemplate" />
<g:render template="scripts/forums/deleteForumGroupModalTemplate" />
<g:render template="scripts/forums/deleteForumModalTemplate" />
<g:render template="scripts/forums/editForumModalTemplate" />


<script type="text/javascript">
    var stormblessed = stormblessed || {};

    (function($){
        stormblessed = $.extend({}, stormblessed, {
            templates: $.extend({}, (stormblessed.templates || {}), {
                forumGroups: Handlebars.compile($('#forums-template').html()),
                editForumGroupModal: Handlebars.compile($('#editForumGroupModalTemplate').html()),
                deleteForumGroupModal: Handlebars.compile($('#deleteForumGroupModalTemplate').html()),
                deleteForumModal: Handlebars.compile($('#deleteForumModalTemplate').html()),
                createForumModal: Handlebars.compile($('#createForumModalTemplate').html()),
                createForumGroupModal: Handlebars.compile($('#createForumGroupTemplate').html()),
                editForumModal: Handlebars.compile($('#editForumModalTemplate').html())
            }),
            getForumGroup: function(id) {
                var forumGroup;
                $.each(stormblessed.forumGroups, function(i, fg){
                    if (fg.id == id) {
                        forumGroup = fg;
                    }
                });
                return forumGroup;
            },
            getForum: function(id, group) {
                var forum;
                $.each(group.forums, function(i, f){
                    if (f.id === id) {
                        forum = f;
                    }
                });
                return forum;
            },
            initButtonHandlers: function() {
                // init all the click handlers for the buttons
                $('button.addForum').on('click', stormblessed.addForumClickHandler);
                $('button.renameForumGroup').on('click', stormblessed.editForumGroupClickHandler);
                $('button.deleteForumGroup').on('click', stormblessed.deleteForumGroupClickHandler);
                $('a.forum').on('click', stormblessed.editForumClickHandler);
                $('button.remove-forum').on('click', stormblessed.removeForumClickHandler);

                $('.sortable-forums').sortable({
                    placeholder: "ui-state-highlight",
                    stop: stormblessed.forumsSortHandler
                });
            },
            addForumClickHandler: function() {
                var $this = $(this),
                    forumGroup = stormblessed.getForumGroup($this.data('forum-group-id')),
                    html = stormblessed.templates.createForumModal(forumGroup);

                $('body').append(html);
                $('#createForumModal').modal({show: true, keyboard: true}).on('hidden.bs.modal', function(){
                    $(this).remove();
                }).on('shown.bs.modal', function(){
                    var $modal = $(this);
                    $('#createForumSaveButton').on('click', function(){
                        var params = {id: forumGroup.id, name: $('#forum-name-input').val()};
                        $.getJSON('${createLink(controller: 'admin', action: 'ajaxAddForumToGroup')}', params, function(result){
                            $modal.modal('hide');
                            stormblessed.listForums();
                        });
                    });
                });
            },
            editForumGroupClickHandler: function() {
                var $this = $(this),
                    forumGroup = stormblessed.getForumGroup($this.data('forum-group-id')),
                    html = stormblessed.templates.editForumGroupModal(forumGroup);

                $('body').append(html);
                $('#editForumGroupModal').modal({show: true, keyboard: true}).on('hidden.bs.modal', function(){
                    $(this).remove();
                }).on('shown.bs.modal', function(){
                    var $modal = $(this);

                    $('#editForumGroupSaveButton').on('click', function(){
                        forumGroup.name = $('#forumgroup-name-input').val().trim();
                        $.getJSON('${createLink(controller: 'admin', action: 'ajaxUpdateForumGroup')}',
                            {id: forumGroup.id, name: forumGroup.name},
                            function(result){
                                console.log(result);
                                $this.parents('header').children('h2').text(forumGroup.name);
                                $modal.modal('hide');
                            }
                        );
                    });
                });
            },
            deleteForumGroupClickHandler: function() {
                var $this = $(this);
                $this.children('.fa').addClass('fa-spin');

                var html = stormblessed.templates.deleteForumGroupModal(stormblessed.getForumGroup($this.data('forum-group-id')));
                $('body').append(html);
                $('#deleteForumGroupModal').modal({show: true, keyboard: true}).on('hidden.bs.modal', function(){
                    $(this).remove();
                    $this.children('.fa-spin').removeClass('fa-spin');
                }).on('shown.bs.modal', function(){
                    var $modal = $(this),
                            success = function(){
                                var $btn = $(this);
                                $.getJSON('${createLink(controller: 'admin', action: 'ajaxDeleteForumGroup')}',
                                    {id: $this.data('forum-group-id')},
                                    function(result){
                                        $btn.off('click', success);
                                        $this.parents('.forumGroup').remove();
                                        $modal.modal('hide');
                                    }
                                );
                            };
                    $('#editForumGroupSaveButton').on('click', success);
                });
            },
            listForums: function(opts) {
                $.getJSON('${createLink(controller: 'admin', action: 'ajaxListForums')}',{}, function(result){
                    stormblessed.forumGroups = result;
                    $('#widget-grid').html(stormblessed.templates.forumGroups(stormblessed));
                    stormblessed.initButtonHandlers();
                    if (opts !== undefined) {
                        opts.success();
                    }
                });
            },
            createForumGroup: function() {
                var html = stormblessed.templates.createForumGroupModal();
                $('body').append(html);
                $('#createForumGroupModal').modal({show: true, keyboard: true}).on('hidden.bs.modal', function(){
                    $(this).remove();
                }).on('shown.bs.modal', function(){
                    var $modal = $(this),
                        $nameField = $('#create-forumgroup-name-input');
                    $('#createForumGroupSaveButton').on('click', function(){
                        $.getJSON('${createLink(controller: 'admin', action: 'ajaxForumGroupIsUnique')}',{name: $nameField.val()}, function(result){
                            if (!result.isUnique) {
                                alert('Forum Group name [' + $nameField.val() + '] is NOT unique!');
                            } else {
                                // save the forum group
                                $.getJSON('${createLink(controller: 'admin', action: 'ajaxCreateForumGroup')}', {name: $nameField.val()}, function(reuslt){
                                    // redraw the page using the forum group data
                                    stormblessed.listForums({
                                        success: function() {
                                            // close the modal
                                            $modal.modal('hide');
                                        }
                                    });
                                });
                            }
                        });
                    });
                });
            },

            refreshForumGroups: function() {
                var $this = $(this);
                $this.children('.fa').addClass('fa-spin');
                stormblessed.listForums({
                    success: function() {
                        $this.children('.fa').removeClass('fa-spin');
                    }
                });
            },

            editForumClickHandler: function(event) {
                event.preventDefault();
                event.stopPropagation();
                var $this = $(this),
                    forum = stormblessed.getForum($this.data('id'), stormblessed.getForumGroup($this.data('groupid'))),
                    html = stormblessed.templates.editForumModal(forum);

                $('body').append(html);
                var $modal = $('#editForumModal');
                $modal.modal({show: true, keyboard: true}).on('hidden.bs.modal', function(){
                    $modal.remove();
                });
                $('#edit-forum-submit').on('click', stormblessed.updateForum);
            },

            updateForum: function() {
                var $this = $(this),
                    forum = stormblessed.getForum($this.data('id'), stormblessed.getForumGroup($this.data('groupid')))
                    nameVal = $('#edit-forum-name').val().trim();

                if (nameVal.length) {
                    // TODO: submit the data back to the server to be saved
                    $.getJSON('${createLink(controller: 'admin', action: 'ajaxEditForum')}',{id: $this.data('id'), name: nameVal}, function(resp){
                        $('#editForumModal').modal('hide');
                        stormblessed.listForums();
                    });
                } else {
                    alert('Name is a required field');
                }
            },

            removeForumClickHandler: function() {
                var $this = $(this),
                    forum = stormblessed.getForum($this.data('id'), stormblessed.getForumGroup($this.data('groupid'))),
                    html = stormblessed.templates.deleteForumModal(forum);

                $('body').append(html);
                var $modal = $('#deleteForumModal');
                $modal.modal({show: true, keyboard: true}).on('hidden.bs.modal', function(){
                    $modal.remove();
                });

                $('#deleteForumButton').on('click', stormblessed.deleteForum);
            },

            deleteForum: function() {
                var $this = $(this),
                    forum = stormblessed.getForum($this.data('id'), stormblessed.getForumGroup($this.data('groupid'))),
                    $modal = $('#deleteForumModal');

                $.getJSON('${createLink(controller: 'admin', action: 'ajaxDeleteForum')}', {id: forum.id}, function(resp){
                    stormblessed.listForums();
                    $modal.modal('hide');
                });
            },

            forumsSortHandler: function() {
                var $this = $(this),
                    group = stormblessed.getForumGroup($this.data('groupid')),
                    forumIDs = $this.sortable('toArray', {attribute: 'data-id'}),
                    data = {id: group.id, forums: forumIDs.join()};

                $.getJSON('${createLink(controller: 'admin', action: 'ajaxSortForumsInGroup')}', data, function(resp){
                    // do nothing since the list items are already sorted
                });
            }
        });

        stormblessed.listForums();
        $('#createForumGroupBtn').on('click', stormblessed.createForumGroup);
        $('#refreshForumGroupsBtn').on('click', stormblessed.refreshForumGroups);
    })(jQuery);
</script>

</body>
</html>

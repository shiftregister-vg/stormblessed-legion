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

<g:render template="scripts/forums/forumsTemplate" />
<g:render template="scripts/forums/editForumGroupModalTemplate" />
<g:render template="scripts/forums/createForumModalTemplate" />
<g:render template="scripts/forums/deleteForumGroupModalTemplate" />

<script type="text/javascript">
    var stormblessed = stormblessed || {};

    (function($){
        stormblessed = $.extend({}, stormblessed, {
            templates: $.extend({}, (stormblessed.templates || {}), {
                forumGroups: Handlebars.compile($('#forums-template').html()),
                editForumGroupModal: Handlebars.compile($('#editForumGroupModalTemplate').html()),
                deleteForumGroupModal: Handlebars.compile($('#deleteForumGroupModalTemplate').html()),
                createForumModal: Handlebars.compile($('#createForumModalTemplate').html())
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
            initButtonHandlers: function() {
                // init all the click handlers for the buttons
                $('button.addForum').on('click', stormblessed.addForumClickHandler);
                $('button.renameForumGroup').on('click', stormblessed.editForumGroupClickHandler);
                $('button.deleteForumGroup').on('click', stormblessed.deleteForumGroupClickHandler);
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
            listForums: function() {
                $.getJSON('${createLink(controller: 'admin', action: 'ajaxListForums')}',{}, function(result){
                    stormblessed.forumGroups = result;
                    $('#widget-grid').html(stormblessed.templates.forumGroups(stormblessed));
                    stormblessed.initButtonHandlers();
                });
            }
        });

        stormblessed.listForums();
    })(jQuery);
</script>

</body>
</html>

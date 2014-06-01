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
<g:render template="scripts/forums/deleteForumGroupModalTemplate" />

<script type="text/javascript">
    var stormblessed = stormblessed || {};

    (function($){
        stormblessed.templates = {
            forumGroups: Handlebars.compile($('#forums-template').html()),
            editForumGroupModal: Handlebars.compile($('#editForumGroupModalTemplate').html()),
            deleteForumGroupModal: Handlebars.compile($('#deleteForumGroupModalTemplate').html())
        };

        stormblessed.getForumGroup = function(id) {
            var forumGroup;
            $.each(stormblessed.forumGroups, function(i, fg){
                if (fg.id == id) {
                    forumGroup = fg;
                }
            });
            return forumGroup;
        };

        stormblessed.initButtonHandlers = function() {
            // init all the click handlers for the buttons
            $('button.addForum').on('click', stormblessed.addForumClickHandler);
            $('button.renameForumGroup').on('click', stormblessed.editForumGroupClickHandler);
            $('button.deleteForumGroup').on('click', stormblessed.deleteForumGroupClickHandler);
        };

        stormblessed.addForumClickHandler = function() {
            console.log('Add forum to ' + $(this).data('forum-group-id'));
        };

        stormblessed.editForumGroupClickHandler = function() {
            var html = stormblessed.templates.editForumGroupModal(stormblessed.getForumGroup($(this).data('forum-group-id')));
            $('body').prepend(html);
            $('#editForumGroupModal').modal({show: true, keyboard: true}).on('hidden.bs.modal', function(){
                $(this).remove();
            });
        };

        stormblessed.deleteForumGroupClickHandler = function() {
            var $this = $(this);
            $this.children('.fa').addClass('fa-spin');


            var html = stormblessed.templates.deleteForumGroupModal(stormblessed.getForumGroup($this.data('forum-group-id')));
            $('body').prepend(html);
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
        };

        $.getJSON('${createLink(controller: 'admin', action: 'ajaxListForums')}',{}, function(result){
            stormblessed.forumGroups = result;
            $('#widget-grid').html(stormblessed.templates.forumGroups(stormblessed));
            stormblessed.initButtonHandlers();
        });
    })(jQuery);
</script>

</body>
</html>

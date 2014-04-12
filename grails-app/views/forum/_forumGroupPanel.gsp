<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            ${group.name}
        </h4>
    </div>
    <div class="panel-body">
        <g:each in="${group.forums}" var="forum">
            <div class="row">
                <div class="col-lg-12">
                    <div class="forum-box">
                        <g:link controller="forum" action="viewForum" params="${[forumSlug: forum.slug]}">${forum.name}</g:link>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>

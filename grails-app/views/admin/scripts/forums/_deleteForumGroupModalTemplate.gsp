<script id="deleteForumGroupModalTemplate" type="text/x-handlebars-template">
<!-- Modal -->
<div class="modal fade" id="deleteForumGroupModal" tabindex="-1" role="dialog"
     aria-labelledby="deleteForumGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="deleteForumGroupModalLabel">Delete <span>{{name}}</span></h4>
            </div>

            <div class="modal-body">

                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-danger">
                            <p>Are you sure you want to delete {{name}}?  Doing this cannot be undone and will delete all forums and threads contained within.</p>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        NO!  I want to keep {{name}}!
                    </button>
                    <button id="editForumGroupSaveButton" type="button" class="btn btn-danger">
                        Yes, delete {{name}}
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</script>
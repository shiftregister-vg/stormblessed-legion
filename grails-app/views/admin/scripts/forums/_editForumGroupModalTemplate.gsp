<script id="editForumGroupModalTemplate" type="text/x-handlebars-template">
<!-- Modal -->
<div class="modal fade" id="editForumGroupModal" tabindex="-1" role="dialog"
     aria-labelledby="editForumGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editForumGroupModalLabel">Edit <span>{{name}}</span></h4>
            </div>

            <div class="modal-body">

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="text" id="forumgroup-name-input" class="form-control" placeholder="Name" required value="{{name}}"/>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Cancel
                </button>
                <button id="editForumGroupSaveButton" type="button" class="btn btn-primary">
                    Save Forum Group
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</script>
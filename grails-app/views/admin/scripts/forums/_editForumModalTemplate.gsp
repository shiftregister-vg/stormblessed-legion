<script id="editForumModalTemplate" type="text/x-handlebars-template">
<div id="editForumModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">

            %{-- header --}%
            <div class="modal-header">
                <b class="close" data-dismiss="modal">&times;</b>

                <h3 class="modal-title">Edit Forum: {{name}}</h3>
            </div>

            %{-- body --}%
            <div class="modal-body">

                <div class="form-group">
                    <label class="control-label" for="edit-forum-name">Name</label>
                    <g:textField name="edit-forum-name" value="{{name}}" class="form-control" />
                </div>

            </div>

            %{-- footer --}%
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button id="edit-forum-submit" class="btn btn-primary" data-id="{{id}}" data-groupid="{{group.id}}">Update</button>
            </div>

        </div>
    </div>
</div>
</script>
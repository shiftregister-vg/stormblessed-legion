package net.invictaguild.content

class ForumController {

    def forumService
    def forumGroupService

    def index() {
        [forumGroups: forumGroupService.list()]
    }

    def viewForum() {
        [forum: forumService.getForumBySlug(params.forumSlug)]
    }

    def viewThread() {
        Forum forum = forumService.getForumBySlug(params.forumSlug)
        [thread: forumService.getThreadByForumAndSlug(forum, params.threadSlug)]
    }
}

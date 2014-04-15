package net.invictaguild.content

import net.invictaguild.sec.User

class ForumController {

    def forumService
    def forumGroupService
    def postService
    def springSecurityService
    def threadService

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

    def createThread() {
        Forum forum = forumService.getForumBySlug(params.forumSlug)
        Thread thread = new Thread(forum: forum)
        Post post = new Post(thread: thread)
        [thread: thread, post: post]
    }

    def saveThread() {
        User author = User.findByUsername(springSecurityService.principal.username)
        Forum forum = forumService.getForumBySlug(params.forumSlug)
        Thread thread = threadService.createThread(forum, params.threadName, false, false)
        postService.createPost(thread, params.postMarkdown, author, false, false)

        redirect action: 'viewThread', params: [forumSlug: forum.slug, threadSlug: thread.slug]
        return
    }

    def addPostToThread() {
        User author = User.findByUsername(springSecurityService.principal.username)
        Forum forum = forumService.getForumBySlug(params.forumSlug)
        Thread thread = threadService.getThreadByForumAndSlug(forum, params.threadSlug)

        postService.createPost(thread, params.postMarkdown, author, false, false)
        redirect action: 'viewThread', params: [forumSlug: forum.slug, threadSlug: thread.slug]
        return
    }
}

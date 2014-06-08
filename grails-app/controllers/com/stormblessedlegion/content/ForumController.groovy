package com.stormblessedlegion.content

import com.stormblessedlegion.sec.User

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
        [forum: forumService.getForumBySlugAndGroup(params.forumSlug, params.groupSlug)]
    }

    def viewThread() {
        Forum forum = forumService.getForumBySlugAndGroup(params.forumSlug, params.groupSlug)
        [thread: forumService.getThreadByForumAndSlug(forum, params.threadSlug)]
    }

    def createThread() {
        Forum forum = forumService.getForumBySlugAndGroup(params.forumSlug, params.groupSlug)
        Thread thread = new Thread(forum: forum)
        Post post = new Post(thread: thread)
        [thread: thread, post: post]
    }

    def saveThread() {
        User author = User.findByUsername(springSecurityService.principal.username)
        Forum forum = forumService.getForumBySlugAndGroup(params.forumSlug, params.groupSlug)
        Thread thread = threadService.createThread(forum, params.threadName, false, false)
        postService.createPost(thread, params.postMarkdown, author, false, false)

        redirect action: 'viewThread', params: [forumSlug: forum.slug, threadSlug: thread.slug, groupSlug: params.groupSlug]
        return
    }

    def addPostToThread() {
        User author = User.findByUsername(springSecurityService.principal.username)
        Forum forum = forumService.getForumBySlugAndGroup(params.forumSlug, params.groupSlug)
        Thread thread = threadService.getThreadByForumAndSlug(forum, params.threadSlug)

        postService.createPost(thread, params.postMarkdown, author, false, false)
        redirect action: 'viewThread', params: [forumSlug: forum.slug, threadSlug: thread.slug]
        return
    }
}

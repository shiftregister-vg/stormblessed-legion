package net.invictaguild.content

import grails.transaction.Transactional

@Transactional
class ForumService {

    def listForums() {
        Forum.list(sort: 'sortPosition', order: 'asc')
    }

    def getForumBySlug(String slug) {
        Forum.findBySlug(slug)
    }

    def getThreadByForumAndSlug(Forum forum, String slug) {
        Thread.findByForumAndSlug(forum, slug)
    }

    def createForum(ForumGroup group, String name, boolean flush = false, boolean failOnError = false) {
        def lastForum = Forum.findAllByGroup(group, [sort: 'sortPosition', order: 'desc', max: 1])?.getAt(0)
        def nextPos = lastForum ? lastForum.sortPosition+1 : 0
        def forum = Forum.findOrCreateByNameAndGroup(name, group)
        if (!forum.id)
            forum.sortPosition = nextPos
        forum.save(flush: flush, failOnError: failOnError)
    }

    def updateForum(Forum forum, String name) {
        forum.name = name
        forum.save()
    }

    def deleteForum(Forum forum) {
        forum.threads*.posts*.delete()
        forum.threads*.delete()
        forum.delete()
    }

    def moveForum(ForumGroup destinationGroup, Forum forum) {
        forum.group = destinationGroup
        forum.save()
    }

}

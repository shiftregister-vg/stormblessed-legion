package net.invictaguild.content

import grails.transaction.Transactional

@Transactional
class ForumService {

    def listForums() {
        Forum.list()
    }

    def getForumBySlug(String slug) {
        Forum.findBySlug(slug)
    }

    def getThreadByForumAndSlug(Forum forum, String slug) {
        Thread.findByForumAndSlug(forum, slug)
    }

    def createForum(ForumGroup group, String name) {
        Forum.findOrCreateByNameAndGroup(name, group).save()
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

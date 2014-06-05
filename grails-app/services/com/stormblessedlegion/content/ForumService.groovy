package com.stormblessedlegion.content

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
        def forum = Forum.findOrCreateByNameAndGroup(name, group)
        forum.save(flush: flush, failOnError: failOnError)
        forum
    }

    def updateForum(Forum forum, String name, boolean flush = false, boolean failOnError = false) {
        forum.name = name
        forum.save(flush: flush, failOnError: failOnError)
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

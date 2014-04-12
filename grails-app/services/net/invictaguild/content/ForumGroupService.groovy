package net.invictaguild.content

import grails.transaction.Transactional

@Transactional
class ForumGroupService {

    def list() {
        ForumGroup.list(sort: 'sortPosition', order: 'asc')
    }

    def create(String name, boolean flush = false, boolean failOnError = false) {
        def lastGrp = ForumGroup.list(sort: 'sortPosition', order: 'desc', max: 1)?.getAt(0)
        def nextPos = lastGrp ? lastGrp.sortPosition+1 : 0
        new ForumGroup(name: name, sortPosition: nextPos).save(flush: flush, failOnError: failOnError)
    }

    def update(String name, ForumGroup group) {
        group.name = name
        group.save()
    }
}

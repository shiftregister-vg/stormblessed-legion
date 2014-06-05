package com.stormblessedlegion.content

import grails.transaction.Transactional

@Transactional
class ForumGroupService {

    def list() {
        ForumGroup.list(sort: 'sortPosition', order: 'asc')
    }

    def create(String name, boolean flush = false, boolean failOnError = false) {
        new ForumGroup(name: name).save(flush: flush, failOnError: failOnError)
    }

    def update(String name, ForumGroup group, boolean flush = false, boolean failOnError = false) {
        group.name = name
        group.save(flush: flush, failOnError: failOnError)
        group
    }
}

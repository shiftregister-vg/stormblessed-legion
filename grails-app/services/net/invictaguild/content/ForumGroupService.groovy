package net.invictaguild.content

import grails.transaction.Transactional

@Transactional
class ForumGroupService {

    def list() {
        ForumGroup.list()
    }

    def create(String name) {
        new ForumGroup(name: name).save()
    }

    def update(String name, ForumGroup group) {
        group.name = name
        group.save()
    }
}

package net.invictaguild.content

import grails.transaction.Transactional

@Transactional
class ThreadService {

    def createThread(Forum forum, String name, boolean flush = false, boolean failOnError = false) {
        new Thread(forum: forum, name: name).save(flush: flush, failOnError: failOnError)
    }

}

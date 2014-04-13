package net.invictaguild.content

import grails.transaction.Transactional
import net.invictaguild.sec.User

@Transactional
class PostService {

    def createPost(Thread thread, String markdown, User author, boolean flush = false, boolean failOnError = false) {
        new Post(thread: thread, markdown: markdown, author: author).save(flush: flush, failOnError: failOnError)
    }
}

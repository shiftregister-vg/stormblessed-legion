package com.stormblessedlegion.content

import com.stormblessedlegion.sec.User
import grails.transaction.Transactional

@Transactional
class PostService {

    def createPost(Thread thread, String markdown, User author, boolean flush = false, boolean failOnError = false) {
        new Post(thread: thread, markdown: markdown, author: author).save(flush: flush, failOnError: failOnError)
    }
}

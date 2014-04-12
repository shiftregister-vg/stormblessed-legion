package net.invictaguild.content

import net.invictaguild.sec.User

class Post {

    static transients = ['markdownService']

    def markdownService

    Date dateCreated
    Date lastUpdated

    String markdown
    String markup

    static belongsTo = [author:User, thread:Thread]

    static constraints = {
        markdown blank: false
        markup nullable: true
    }

    def beforeInsert() {
        markup = markdownService.markdown(markdown)
    }

    def beforeUpdate() {
        if (isDirty('markdown'))
            markup = markdownService.markdown(markdown)
    }
}

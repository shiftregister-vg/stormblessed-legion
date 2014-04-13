package net.invictaguild.content

import groovy.xml.MarkupBuilder

class ForumTagLib {
    static namespace = 'forum'

    static defaultEncodeAs = 'raw'
    //static encodeAsForTags = [tagName: 'raw']

    def post = { attrs ->
        Post post = attrs.post
        def writer = new StringWriter()
        def markupBuilder = new MarkupBuilder(writer)
        markupBuilder.div(class: 'testimonial-vertical') {
            div(class: 'testimonial-vertical-pics') {
                ul {
                    li {
                        a(href: "#accord-${post.id}") {
                            delegate.img(src: resource(dir: 'media', file: 'testimonial-placeholder.jpg'), alt: "${post.author.username}")
                        }
                    }
                }
            }

            div(class: 'testimonial-vertical-arrow','')

            div(class: 'testimonial-vertical-content') {
                div(class: 'testimonial-vertical-text', id: "accord-${post.id}") {
                    div {
                        mkp.yieldUnescaped post.markup
                    }
                    div(class: 'testimonial-vertical-author', post.author.username)
                    div(class: 'testimonial-vertical-author-position', "Posted ${post.dateCreated.format('M/d/yyyy')}")
                }
            }
        }
        out << writer.toString()
    }
}

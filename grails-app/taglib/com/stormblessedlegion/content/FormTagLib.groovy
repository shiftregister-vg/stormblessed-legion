package com.stormblessedlegion.content

import groovy.xml.MarkupBuilder

class FormTagLib {
    static namespace = 'form'
    static defaultEncodeAs = 'raw'
    //static encodeAsForTags = [tagName: 'raw']

    def textField = { attrs ->
        def name = attrs.name
        def lbl = attrs.label
        def id = attrs.id ?: name
        def value = attrs.value ?: ''
        def password = attrs.password ?: false
        def props = [name: name, id: id, value: value, class: 'form-control']

        def writer = new StringWriter()
        def builder = new MarkupBuilder(writer)
        builder.div(class: 'form-group') {
            label(for: id, class: 'col-sm-2 control-label', "${lbl}")
            div(class: 'col-sm-10') {
                if (password) {
                    mkp.yieldUnescaped g.passwordField(props)
                } else {
                    mkp.yieldUnescaped g.textField(props)
                }
            }
        }

        out << writer.toString()
    }

    def passwordField = { attrs ->
        attrs.password = true
        out << textField(attrs)
    }
}

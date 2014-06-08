package com.stormblessedlegion.content

import com.stormblessedlegion.serializable.MapSerializable

class ForumGroup implements MapSerializable {

    Date dateCreated
    Date lastUpdated

    String name
    String slug
    int sortPosition

    static hasMany = [forums:Forum]

    static constraints = {
        slug nullable: true, blank: false
    }

    static mapping = {
        sort 'sortPosition'
        forums sort: 'sortPosition'
    }

    def beforeInsert() {
        sortPosition = ForumGroup.count()
        slug = name.slugify()
    }

    def beforeUpdate() {
        if (isDirty('name'))
            slug = name.slugify()
    }
}

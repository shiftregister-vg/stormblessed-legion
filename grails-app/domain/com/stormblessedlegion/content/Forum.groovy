package com.stormblessedlegion.content

import com.stormblessedlegion.serializable.MapSerializable

class Forum implements MapSerializable {

    Date dateCreated
    Date lastUpdated

    String name
    String slug
    int sortPosition

    static belongsTo = [group:ForumGroup]
    static hasMany = [threads:Thread]

    static constraints = {
        name blank: false, unique: ['group']
        slug nullable: true, blank: false
    }

    static mapping = {
        sort "sortPosition"
    }

    def beforeInsert() {
        slug = name.slugify()
    }

    def beforeUpdate() {
        if (isDirty( 'name' ))
            slug = name.slugify()
    }
}

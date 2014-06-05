package com.stormblessedlegion.content

import com.stormblessedlegion.serializable.MapSerializable

class ForumGroup implements MapSerializable {

    Date dateCreated
    Date lastUpdated

    String name
    int sortPosition

    static hasMany = [forums:Forum]

    static constraints = {
    }

    static mapping = {
        sort 'sortPosition'
        forums sort: 'sortPosition'
    }

    def beforeInsert() {
        sortPosition = ForumGroup.count()
    }
}

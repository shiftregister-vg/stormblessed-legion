package net.invictaguild.content

import net.invictaguild.serializable.MapSerializable

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
}

package net.invictaguild.content

class ForumGroup {

    Date dateCreated
    Date lastUpdated

    String name

    static hasMany = [forums:Forum]

    static constraints = {
    }
}

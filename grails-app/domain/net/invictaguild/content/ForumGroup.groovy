package net.invictaguild.content

class ForumGroup {

    Date dateCreated
    Date lastUpdated

    String name
    int sortPosition

    static hasMany = [forums:Forum]

    static constraints = {
    }
}

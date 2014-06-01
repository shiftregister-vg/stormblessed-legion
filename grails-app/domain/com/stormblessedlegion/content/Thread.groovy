package com.stormblessedlegion.content

class Thread {

    Date dateCreated
    Date lastUpdated

    String name
    String slug

    static belongsTo = [forum:Forum]
    static hasMany = [posts:Post]

    static constraints = {
        name blank: false
        slug nullable: true, unique: ['forum']
    }

    def beforeInsert() {
        slug = nameToSlug()
    }

    def beforeUpdate() {
        if (isDirty('name'))
            slug = nameToSlug()
    }

    private String nameToSlug() {
        "${name.slugify()}-${new Date().time}"
    }
}

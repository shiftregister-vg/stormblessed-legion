package net.invictaguild.sec

class UserRegistration {

    static transients = ['springSecurityService']

    def springSecurityService

    Date dateCreated
    Date lastUpdated

    User user
    String token
    boolean verified = false

    static constraints = {
        token nullable: true, blank: true
    }

    def beforeInsert() {
        token = springSecurityService.encodePassword("${new Date().time}${user.username}")
    }
}

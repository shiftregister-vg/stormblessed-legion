package net.invictaguild.sec

import spock.lang.Specification

/**
 *
 */
class UserServiceSpec extends Specification {

    def userService
    def springSecurityService

    def setup() {
    }

    def cleanup() {
        User.list()*.delete()
    }

    void "test userService.createUser"() {
        given:
        String username = 'test'
        String password = 'test'
        String email = 'test@test.com'
//        String hashedPassword = springSecurityService.encodePassword(password)

        when:
        def user = userService.createUser(username, password, email)

        then:
        assert user.username == username
        assert user.email == email
//        assert user.password == hashedPassword
    }
}

package net.invictaguild.sec

import grails.transaction.Transactional

@Transactional
class UserService {

    User createUser(String username, String password, String email, boolean enabled = false) {
        User user = User.findByUsername username

        if (!user)
            user = new User(username: username, password: password, email: email, enabled: enabled).save()

        user
    }

    UserRegistration registerUser(User user) {
        UserRegistration registration = UserRegistration.findByUser(user)
        if (!registration)
            registration = new UserRegistration(user: user).save()

        registration
    }

    User updateUser(long id, String username, String email, Boolean enabled, Boolean accountExpired, Boolean passwordExpired, Boolean accountLocked) {
        User user = User.get(id)
        user.username = username
        user.email = email
        user.enabled = enabled
        user.accountExpired = accountExpired
        user.passwordExpired = passwordExpired
        user.accountLocked = accountLocked
        user.save(flush: true, failOnError: true)
    }
}

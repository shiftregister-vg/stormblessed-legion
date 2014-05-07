package net.invictaguild.sec

class UserController {

    def asynchronousMailService
    def userService

    def register() {

    }

    def saveRegistration() {
        def user = userService.createUser(params.username, params.password, params.email)
        if (!user.enabled) {
            def registration = userService.registerUser(user)
            asynchronousMailService.sendMail {
                to user.email
                subject 'Verify your email address'
                html g.render(template: '/mail/registration', model: [registration: registration])
            }
            flash.regToken = registration.token
            redirect action: 'confirmRegistration'
        } else {
            redirect action: 'alreadyRegistered', params: [username: user.username]
        }
    }

    def confirmRegistration() {
        def registration = UserRegistration.findByToken(flash.regToken)
        if (!registration) {
            flash.message = 'Please check your email for registration verification.'
            redirect controller: 'login', action: 'auth'
            return
        }
        [registration: registration]
    }

    def verifyRegistration() {
        def registration = UserRegistration.findByToken(params.token)
        if (registration && !registration.verified) {
            registration.verified = true
            registration.save()
            registration.user.enabled = true
            registration.user.save()
            flash.message = 'Registration complete! You may now login.'
            redirect controller: 'login', action: 'auth', params: [username: registration.user.username]
        } else if (registration?.verified) {
            flash.message = 'Registration was already complete.  Please login.'
            redirect controller: 'login', action: 'auth', params: [username: registration.user.username]
        } else {
            flash.message = 'No registration found for that token, please register again.'
            redirect action: 'register'
        }
    }

    def alreadyRegistered() {
        [user: User.findByUsername(params.username)]
    }
}

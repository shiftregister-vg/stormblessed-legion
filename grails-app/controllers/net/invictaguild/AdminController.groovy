package net.invictaguild

import grails.converters.JSON
import net.invictaguild.sec.User

class AdminController {

    def userService

    def index() {}

    def dashboard() {}

    def users() {
        def userList = User.list(sort: 'username', order: 'ascending')
        [users: userList]
    }

    def ajaxSaveUser() {
        def user = userService.createUser(params.username, params.password, params.email)
        render user as JSON
    }
}

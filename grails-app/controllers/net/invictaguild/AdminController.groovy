package net.invictaguild

import grails.converters.JSON
import net.invictaguild.sec.User

class AdminController {

    def ts3Service
    def userService

    def index() {}

    def dashboard() {}

    def users() {
        def userList = User.list(sort: 'username', order: 'ascending')
        [users: userList]
    }

    def teamSpeak() {

    }

    def ajaxRestartTS3ChatBot() {
        ts3Service.restartChatBot()
        def result = [success: true]
        render result as JSON
    }

    def ajaxSaveUser() {
        def user = userService.createUser(params.username, params.password, params.email)
        render user as JSON
    }
}

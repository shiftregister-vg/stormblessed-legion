package com.stormblessedlegion

import com.stormblessedlegion.content.Forum
import com.stormblessedlegion.content.ForumGroup
import com.stormblessedlegion.sec.User
import grails.converters.JSON

class AdminController {

    def forumService
    def forumGroupService
    def ts3Service
    def userService

    def index() {}

    def dashboard() {}

    def users() {}

    def forums() {}

    def teamSpeak() {}

    def ajaxLoadUsers() {
        def userList = []
        User.list(sort: 'username', order: 'ascending').each { User user ->
            def userMap = [:]
            user.properties.each {k, v ->
                if (!(k in ['class', 'password', 'springSecurityService'])) {
                    userMap."$k" = v
                }
            }
            userMap.id = user.id
            userList << userMap
        }
        render userList as JSON
    }

    def ajaxUpdateUser() {
        def user = userService.updateUser(
            params.id as long,
            params.username as String,
            params.email as String,
            params.boolean('enabled'),
            params.boolean('accountExpired'),
            params.boolean('passwordExpired'),
            params.boolean('accountLocked')
        )
        def result = [success: (user != null)]
        render result as JSON
    }

    def ajaxStartTS3ChatBot() {
        ts3Service.connect()
        ts3Service.initChatBot()
        ts3Service.initJoinHandler()
        def result = [success: true]
        render result as JSON
    }

    def ajaxStopTS3ChatBot() {
        ts3Service.disconnect()
        def result = [success: true]
        render result as JSON
    }

    def ajaxRestartTS3ChatBot() {
        ts3Service.disconnect()
        ts3Service.connect()
        ts3Service.initChatBot()
        ts3Service.initJoinHandler()
        def result = [success: true]
        render result as JSON
    }

    def ajaxSaveUser() {
        def user = userService.createUser(params.username, params.password, params.email)
        render user as JSON
    }

    def ajaxListForums() {
        def forumGroups = ForumGroup.list().sort { it.sortPosition }*.toMap()
        render forumGroups as JSON
    }

    def ajaxUpdateForumGroup() {
        def forumGroup = forumGroupService.update(params.name, ForumGroup.get(params.id), true)
        render([success: !forumGroup.hasErrors()] as JSON)
    }

    def ajaxDeleteForumGroup() {
        def forumGroup = ForumGroup.get(params.id)
        forumGroup.delete(flush: true)
        def result = [success: (ForumGroup.countById(params.id) == 0)]
        render result as JSON
    }

    def ajaxAddForumToGroup() {
        def forumGroup = ForumGroup.get(params.id)
        def forum = forumService.createForum(forumGroup, params.name, true)
        render(forum.toMap() as JSON)
    }

    def ajaxForumGroupIsUnique() {
        render([isUnique: forumGroupService.nameIsUnique(params.name)] as JSON)
    }

    def ajaxCreateForumGroup() {
        def forumGroup = forumGroupService.create(params.name.trim(), true)
        def dataMap = forumGroup.toMap()
        render dataMap as JSON
    }

    def ajaxEditForum() {
        def forum = Forum.get(params.id)
        forumService.updateForum(forum, params.name)
        render(forum.toMap() as JSON)
    }

    def ajaxDeleteForum() {
        def forum = Forum.get(params.id)
        forumService.deleteForum(forum)
        render([success: (Forum.countById(params.id) == 0)] as JSON)
    }

    def ajaxSortForumsInGroup() {
        params.forums?.split(',')?.eachWithIndex { id, i ->
            forumService.setForumPostion(Forum.get(id), i)
        }
        render([success: true] as JSON)
    }

}

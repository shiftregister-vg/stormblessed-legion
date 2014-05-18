package net.invictaguild.voip

import com.github.theholywaffle.teamspeak3.api.event.ClientJoinEvent
import com.github.theholywaffle.teamspeak3.api.event.TextMessageEvent
import grails.transaction.Transactional

import java.security.MessageDigest

@Transactional
class Ts3Service {

    def grailsApplication
    def grailsLinkGenerator
    def springSecurityService
    def teamSpeakService

    def initChatBot() {
        String nick = grailsApplication.config.grails.plugin.teamspeak3.nick
        teamSpeakService.initChatBot { TextMessageEvent event ->
            if (event.invokerName != nick && !event.invokerName.contains(nick) && !nick.contains(event.invokerName)) {
                if (event.message.startsWith('!')) {
                    if (event.message.toLowerCase() == '!hello') {
                        String timeOfDay = 'day'
                        Date now = new Date()
                        if (now.hours < 12) {
                            timeOfDay = 'morning'
                        } else if (now.hours >= 12 && now.hours < 17) {
                            timeOfDay = 'afternoon'
                        } else if (now.hours >= 17 && now.hours < 20) {
                            timeOfDay = 'evening'
                        } else {
                            timeOfDay = 'night'
                        }
                        sendPrivateMessage event.invokerId, "Hello ${event.invokerName}, I hope you are having a pleasant $timeOfDay!"
                    } else if (event.message.toLowerCase() == '!login') {
                        def hash = springSecurityService.encodePassword("${event.invokerName}${new Date().time}").replaceAll(/\W/,'')

                        TS3AuthToken.withTransaction {
                            def ts3AuthToken = TS3AuthToken.findOrCreateByClientId(event.invokerId)
                            ts3AuthToken.token = hash
                            ts3AuthToken.expired = false
                            ts3AuthToken.save()
                        }

                        def link = grailsLinkGenerator.link(controller: 'ts', action: 'login', absolute: true, params: [token: hash])

                        sendPrivateMessage event.invokerId, 'Use the following link to verify your account'
                        sendPrivateMessage event.invokerId, link
                    }
                } else if (event.message.contains(nick)) {
                    sendMessage "${event.invokerName}, I heard that... I'm always listening... Always..."
                }
            }
        }

        teamSpeakService.sendServerMessage "$nick is now online!"
    }

    def initJoinHandler() {
        teamSpeakService.onServerJoin { ClientJoinEvent event ->
            println "${event.clientNickname} joined (${event.clientType})"
            if (event.clientType == 0) {
                sendPrivateMessage(event.clientId, "Hey there ${event.clientNickname}, if you want to login and have your privileges set just type !login in this window. This will require that you already have a valid login on invictaguild.net.")
            }
        }
    }

    def setGroupsAndPrivileges(int clientId, def groups, def privileges) {
        // TODO: set the groups and privs for the supplied clientId
    }

    def restartChatBot() {
        teamSpeakService.exit()
        teamSpeakService.connect()
        initChatBot()
        initJoinHandler()
    }
}

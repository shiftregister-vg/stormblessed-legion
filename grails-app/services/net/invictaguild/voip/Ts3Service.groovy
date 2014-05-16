package net.invictaguild.voip

import com.github.theholywaffle.teamspeak3.api.event.TextMessageEvent
import grails.transaction.Transactional

@Transactional
class Ts3Service {

    def grailsApplication
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
                        ts3Api.sendPrivateMessage event.invokerId, "Hello ${event.invokerName}, I hope you are having a pleasant $timeOfDay!"
                    }
                } else if (event.message.contains(nick)) {
                    sendMessage "${event.invokerName}, I heard that... I'm always listening... Always..."
                }
            }
        }

        teamSpeakService.sendMessage "$nick is now online!"
    }
}

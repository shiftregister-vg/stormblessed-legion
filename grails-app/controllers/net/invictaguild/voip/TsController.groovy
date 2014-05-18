package net.invictaguild.voip

class TsController {

    def ts3Service

    def login() {
        def ts3AuthToken = TS3AuthToken.findByTokenAndExpired params.token, false
        if (!ts3AuthToken) {
            flash.message = 'Sorry, that\'s an invalid token'
            flash.alert = 'error'
        } else {
            ts3Service.setGroupsAndPrivileges(ts3AuthToken.clientId, [], [])
            ts3AuthToken.expired = true
            ts3AuthToken.save()

            flash.message = 'Successfully logged in!'
            flash.alert = 'success'

            ts3Service.teamSpeakService.sendPrivateMessage ts3AuthToken.clientId, 'You are now logged in!'
        }

        redirect controller: 'site', action: 'index'
        return
    }
}

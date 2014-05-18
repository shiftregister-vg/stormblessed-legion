package net.invictaguild.voip

import net.invictaguild.sec.User

class TS3AuthToken {

    Date dateCreated
    Date lastUpdated

    String token
    int clientId
    boolean expired = false

    static constraints = {
        token blank: false
        clientId unique: true
    }
}

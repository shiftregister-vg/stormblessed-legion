package com.stormblessedlegion.voip

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

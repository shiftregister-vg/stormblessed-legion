package net.invictaguild.voip



class TS3AuthTokenManagementJob {
    static triggers = {
      simple repeatInterval: 300000l // execute job once every 5 minutes
    }

    def execute() {
        // execute job
        Date dt = new Date()
        dt.minutes -= 10
        def authTokens = TS3AuthToken.findAllByExpiredAndLastUpdatedLessThan(false, dt)

        println "Expiring ${authTokens.size()} TS3AuthTokens"
        authTokens*.expired = true
        authTokens*.save()
    }
}

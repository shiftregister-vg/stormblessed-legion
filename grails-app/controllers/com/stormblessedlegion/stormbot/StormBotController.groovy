package com.stormblessedlegion.stormbot

/**
 * Created by Steve on 6/28/2014.
 */
class StormBotController {

    def authorize() {
        [code: params.code]
    }

}

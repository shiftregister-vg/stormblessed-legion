package net.invictaguild.serializable

import groovy.transform.TailRecursive

/**
 * Created by Steve on 5/29/2014.
 */
trait MapSerializable {
    @TailRecursive
    Map toMap() {
        def m = [:]
        properties.each { k, v ->
            if (v instanceof MapSerializable) {
                m[k] = v?.toMap()
            } else {
                m[k] = v
            }
        }
        if (id && !m.hasProperty('id')) {
            m.id = id
        }
        m
    }
}

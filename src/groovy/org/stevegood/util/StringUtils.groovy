package org.stevegood.util

/**
 * Created by steve on 4/10/14.
 */
class StringUtils {

    static String slugify( String input ) {
        String output = input.toLowerCase()
        def pattern1 = ~/[^\w ]/
        def pattern2 = ~/ +/
        def pattern3 = ~/--+/
        return output.replaceAll(pattern1, '').replaceAll(pattern2, '-').replaceAll(pattern3, '-')
    }

}

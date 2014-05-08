package net.invictaguild.content

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import org.stevegood.util.StringUtils
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(ForumController)
@Mock([ForumGroup, Forum, Thread, Post, ForumGroupService])
class ForumControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test index action"() {
        given:
        def forumGroupServiceMock = mockFor(ForumGroupService)
        forumGroupServiceMock.demandExplicit.list() { -> }
        controller.forumGroupService = forumGroupServiceMock.createMock()
        new ForumGroup(name: 'testing 1', sortPosition: 0).save()
        new ForumGroup(name: 'testing 2', sortPosition: 1).save()

        when:
        def model = controller.index()

        then:
        model.forumGroups.size() == 2
        model.forumGroups[0].name == 'testing 1'
        model.forumGroups[1].name == 'testing 2'
    }

//    void "test view thread action"() {
//        given:
//        def group = new ForumGroup(name:'testing 1', sortPosition: 0).save()
//        def forum = new Forum(name: 'Test Forum', group: group).save()
//        forum.slug = StringUtils.slugify(forum.name)
//        def thread = new Thread(name: 'Testing', forum: forum).save()
//        thread.slug = StringUtils.slugify(thread.name)
//
//        params.forumSlug = forum.slug
//        params.threadSlug = thread.slug
//
//        when:
//        def model = controller.viewThread()
//
//        then:
//        model.thread.name == thread.name
//        model.thread.forum.name == forum.name
//    }
}

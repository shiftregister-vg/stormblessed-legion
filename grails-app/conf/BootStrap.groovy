import net.invictaguild.content.ForumGroup
import org.stevegood.util.StringUtils

class BootStrap {

    def forumService
    def forumGroupService

    def init = { servletContext ->
        String.metaClass.slugify = {->
            StringUtils.slugify( delegate )
        }

        environments {
            development {
                ['Invicta','Website','Community'].each { groupName ->
                    ForumGroup group = forumGroupService.create(groupName)
                    ['General', 'Rift', 'ESO', 'Private'].each { forumName ->
                        forumService.createForum(group, forumName)
                    }
                }
            }
        }
    }
    def destroy = {
    }
}

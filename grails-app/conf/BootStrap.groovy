import net.invictaguild.content.ForumGroup
import org.stevegood.util.StringUtils

class BootStrap {

    def forumService
    def forumGroupService

    def init = { servletContext ->
        String.metaClass.slugify = {->
            StringUtils.slugify( delegate )
        }

        if (!ForumGroup.count()) {
            [
                [name: 'Invicta', forums:['Welcome to Invicta', 'Crafting', 'Events']],
                [name: 'Website', forums:['News & Announcements', 'Site Suggestions']],
                [name: 'Community', forums:['General Discussion', 'Dungeons', 'Raiding', 'Guild Meetings', 'Off Topic', 'Other Games']],
                [name: 'Class Discussion', forums:['Cleric Discussion', 'Mage Discussion', 'Rogue Discussion', 'Warrior Discussion']]
            ].each { grp ->
                def group = forumGroupService.create(grp.name, false, true)
                grp.forums.each { frm ->
                    forumService.createForum(group, frm, false, true)
                }
            }
        }
    }
    def destroy = {
    }
}

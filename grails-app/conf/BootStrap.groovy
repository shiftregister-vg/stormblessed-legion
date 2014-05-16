import net.invictaguild.content.ForumGroup
import net.invictaguild.sec.Role
import net.invictaguild.sec.User
import net.invictaguild.sec.UserRole
import org.stevegood.util.StringUtils

class BootStrap {

    def forumService
    def forumGroupService
    def ts3Service

    def init = { servletContext ->
        String.metaClass.slugify = {->
            StringUtils.slugify( delegate )
        }

        // create default roles
        Role adminRole = Role.findOrCreateByAuthority('ROLE_ADMIN').save(flush: true, failOnError: true)
        Role memberRole = Role.findOrCreateByAuthority('ROLE_MEMBER').save(flush: true, failOnError: true)

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

        if (!User.count()) {
            User adminUser = new User(username: 'admin', password: 'admin', email: 'admin@localhost.com', enabled: true).save(flush: true)
            UserRole.create(adminUser, adminRole)
            UserRole.create(adminUser, memberRole)
        }

        ts3Service.initChatBot()
    }
    def destroy = {
    }
}

import com.stormblessedlegion.content.ForumGroup
import com.stormblessedlegion.sec.Role
import com.stormblessedlegion.sec.User
import com.stormblessedlegion.sec.UserRole
import org.stevegood.util.StringUtils

class BootStrap {

    def forumService
    def forumGroupService
    def grailsApplication
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
                [name: 'Stormblessed Legion', forums:['Welcome to the Stormblessed Legion','Community Events']]
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

        environments {
            production {
                if (grailsApplication.config.grails.plugin.teamspeak3.autoconnect) {
                    ts3Service.initChatBot()
                    ts3Service.initJoinHandler()
                }
            }
        }
    }
    def destroy = {
        ts3Service.teamSpeakService.ts3Api.exit()
    }
}

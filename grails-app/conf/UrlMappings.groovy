class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "/forums/$forumSlug?/$threadSlug?"(controller: 'forum', action: 'viewThread')
        "/forums/$forumSlug?/newThread"(controller: 'forum', action: 'createThread')
        "/forums/$forumSlug?/saveThread"(controller: 'forum', action: 'saveThread')
        "/forums/$forumSlug?"(controller: 'forum', action: 'viewForum')
        "/forums"(controller: 'forum', action: 'index')
	}
}

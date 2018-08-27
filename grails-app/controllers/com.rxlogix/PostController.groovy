package com.rxlogix

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class PostController {

    PostService postService

    def index() {
        render(view: 'index')
    }

    def showCount() {
        render(view: "showCount", model: [postService: postService])
    }

    def ajaxCount() {
        render postService.updatePostCount()
    }

    def testActionInMaster(){
        render "how about creating another merge conflict"
    }
}

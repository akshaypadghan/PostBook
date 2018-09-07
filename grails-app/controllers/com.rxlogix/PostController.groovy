package com.rxlogix

import grails.converters.JSON
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

    def testActionInSample(){
            render "this is test action in sampleBranch"
    }

    def ajaxShowTable(){
        render postService.ajaxPosts() as JSON
    }
    def postTable(){
       render  (view: 'postTable')
    }
}

package com.rxlogix

import grails.plugin.springsecurity.annotation.Secured
@Secured('permitAll')

class PostController {

    PostService postService

    def index() {
      render(view: 'index')
     }

    def showCount(){
        int postCount = postService.showPostCount()
        int latestCount = postService.updatePostCount()
        render (view: "showCount", model:[postCount: postCount, latestCount: latestCount])
    }
}

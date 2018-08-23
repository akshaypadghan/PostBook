package com.rxlogix

import grails.transaction.Transactional

@Transactional
class PostService {

    static int postCount

    def serviceMethod() {

    }

    int showPostCount() {
        return postCount
    }

    int updatePostCount() {

        Date date = new Date(System.currentTimeMillis() - 3600 * 2000)
        int latestPostCount = Post.countByPostCreatedOnBetween(date, new Date())
        return latestPostCount

    }

}

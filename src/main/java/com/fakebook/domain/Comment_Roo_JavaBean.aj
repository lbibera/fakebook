// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fakebook.domain;

import com.fakebook.domain.Comment;
import com.fakebook.domain.Fakebooker;
import com.fakebook.domain.Post;

privileged aspect Comment_Roo_JavaBean {
    
    public String Comment.getMessage() {
        return this.message;
    }
    
    public void Comment.setMessage(String message) {
        this.message = message;
    }
    
    public Post Comment.getPost() {
        return this.post;
    }
    
    public void Comment.setPost(Post post) {
        this.post = post;
    }
    
    public Fakebooker Comment.getOwner() {
        return this.owner;
    }
    
    public void Comment.setOwner(Fakebooker owner) {
        this.owner = owner;
    }
    
}

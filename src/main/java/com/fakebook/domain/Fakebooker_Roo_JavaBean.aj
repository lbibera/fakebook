// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fakebook.domain;

import com.fakebook.domain.Fakebooker;
import com.fakebook.domain.Post;
import java.util.Date;
import java.util.Set;

privileged aspect Fakebooker_Roo_JavaBean {
    
    public String Fakebooker.getEmail() {
        return this.email;
    }
    
    public void Fakebooker.setEmail(String email) {
        this.email = email;
    }
    
    public String Fakebooker.getFirstName() {
        return this.firstName;
    }
    
    public void Fakebooker.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Fakebooker.getMiddleName() {
        return this.middleName;
    }
    
    public void Fakebooker.setMiddleName(String middleName) {
        this.middleName = middleName;
    }
    
    public String Fakebooker.getLastName() {
        return this.lastName;
    }
    
    public void Fakebooker.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public Date Fakebooker.getBirthDate() {
        return this.birthDate;
    }
    
    public void Fakebooker.setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
    
    public String Fakebooker.getPassword() {
        return this.password;
    }
    
    public void Fakebooker.setPassword(String password) {
        this.password = password;
    }
    
    public Set<Post> Fakebooker.getPosts() {
        return this.posts;
    }
    
    public void Fakebooker.setPosts(Set<Post> posts) {
        this.posts = posts;
    }
    
}

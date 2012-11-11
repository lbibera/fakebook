package com.fakebook.domain;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Comment {

    @NotNull
    @Size(min = 1)
    private String message;

    @NotNull
    @ManyToOne
    private Post post;

    @NotNull
    @ManyToOne
    private Fakebooker owner;
}

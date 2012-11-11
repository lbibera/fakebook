package com.fakebook.web;

import com.fakebook.domain.Comment;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Comment.class)
@Controller
@RequestMapping("/comments")
@RooWebScaffold(path = "comments", formBackingObject = Comment.class)
public class CommentController {
}

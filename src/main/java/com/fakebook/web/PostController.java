package com.fakebook.web;

import com.fakebook.domain.Post;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Post.class)
@Controller
@RequestMapping("/posts")
@RooWebScaffold(path = "posts", formBackingObject = Post.class)
public class PostController {
}

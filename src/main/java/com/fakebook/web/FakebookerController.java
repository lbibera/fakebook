package com.fakebook.web;

import com.fakebook.domain.Fakebooker;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Fakebooker.class)
@Controller
@RequestMapping("/fakebookers")
@RooWebScaffold(path = "fakebookers", formBackingObject = Fakebooker.class)
public class FakebookerController {
}

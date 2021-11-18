package com.ci2.ppw.controller.intranet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/intranet")
public class LoginController {
    
    @RequestMapping("/login")
    public String login() {
        return "intranet/loginView";
    }

}


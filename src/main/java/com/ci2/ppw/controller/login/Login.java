package com.ci2.ppw.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Login {
    
    @RequestMapping("/login")
    public String login() {
        return "intranet/inicioView2";
    }
    
}


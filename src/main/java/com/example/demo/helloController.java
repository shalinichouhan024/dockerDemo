package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloController {

    @GetMapping("/")
    public String greet(){
        return "Hello from Cloud Run via GitHub Actions!!!";
    }
}

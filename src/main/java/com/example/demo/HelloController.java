package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class HelloController {

    private final PersonRepository personRepository;

    public HelloController(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    @GetMapping("/")
    public String greet(){
        return "Hello Shalini from Cloud Run via GitHub Actions!!!";
    }

    @GetMapping("/api/data")
    public List<Person> getData() {
        return personRepository.findAll();
    }
}

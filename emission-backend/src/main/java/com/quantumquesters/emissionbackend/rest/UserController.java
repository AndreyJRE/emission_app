package com.quantumquesters.emissionbackend.rest;

import com.quantumquesters.emissionbackend.service.UserService;
import com.quantumquesters.emissionbackend.service.dtos.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/api/users")
@AllArgsConstructor
public class UserController {


    private final UserService userService;

    @PostMapping("/add")
    public ResponseEntity<UserDto> addUser(@RequestParam
                                           String username) {
        return new ResponseEntity<>(userService.addUser(username), HttpStatus.CREATED);
    }

    @PostMapping("/addFriend")
    public ResponseEntity<Void> addFriend(@RequestParam String username,
                                          @RequestParam String friendUsername) {
        userService.addFriend(username, friendUsername);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}

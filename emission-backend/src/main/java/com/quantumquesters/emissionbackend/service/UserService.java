package com.quantumquesters.emissionbackend.service;

import com.quantumquesters.emissionbackend.models.User;
import com.quantumquesters.emissionbackend.repository.UserRepository;
import com.quantumquesters.emissionbackend.service.dtos.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public UserDto addUser(String username) {
        User user = new User();
        user.setUsername(username);
        User saved = userRepository.save(user);
        return new UserDto(saved.getUserId(), saved.getUsername());
    }


    public void addFriend(String username, String friendUsername) {
        User user = userRepository.findUserByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
        User friend = userRepository.findUserByUsername(friendUsername)
                .orElseThrow(() -> new RuntimeException("Friend not found"));
        user.getFriends().add(friend);
        userRepository.save(user);

    }


    public UserDto getUserByUsername(String username) {
        User user = userRepository.findUserByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return new UserDto(user.getUserId(), user.getUsername());
    }

    public List<UserDto> getAllUsers() {
        return userRepository.findAll().stream()
                .map(user -> new UserDto(user.getUserId(), user.getUsername()))
                .collect(Collectors.toList());
    }

    public List<UserDto> getFriendsByUsername(String username) {
        User user = userRepository.findUserByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return user.getFriends().stream()
                .map(friend -> new UserDto(friend.getUserId(), friend.getUsername()))
                .collect(Collectors.toList());
    }
}

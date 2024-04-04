package com.quantumquesters.emissionbackend.service;


import com.quantumquesters.emissionbackend.models.Activity;
import com.quantumquesters.emissionbackend.models.User;
import com.quantumquesters.emissionbackend.repository.ActivityRepository;
import com.quantumquesters.emissionbackend.repository.UserRepository;
import com.quantumquesters.emissionbackend.service.dtos.activity.ActivityDto;
import com.quantumquesters.emissionbackend.service.dtos.activity.AddActivityDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class ActivityService {

    private final ActivityRepository activityRepository;

    private final UserRepository userRepository;

    public ActivityDto addActivity(AddActivityDto addActivityDto) {
        User user = userRepository.findUserByUsername(addActivityDto.username()).orElseThrow(() -> new RuntimeException("User not found"));
        System.out.println("User found: " + user.getUsername() + " " + user.getUserId());
        Activity activity = new Activity();
        activity.setActivityType(addActivityDto.activityType());
        activity.setDistance(addActivityDto.distance());
        activity.setCo2InKg(addActivityDto.co2());
        activity.setUser(user);
        Activity saved = activityRepository.save(activity);
        System.out.println("Activity saved: " + saved.getUser().getUsername());
        return new ActivityDto(saved.getId(), saved.getActivityType(), saved.getCreatedAt(), saved.getDistance(), saved.getCo2InKg());

    }

    public List<ActivityDto> getActivitiesByUsername(String username, Optional<LocalDate> dateOfActivity) {
        List<Activity> activities;
        if (dateOfActivity.isPresent()) {
            activities = activityRepository.findActivitiesByUsernameAndDate(username, dateOfActivity.get());
        } else {
            activities = activityRepository.findActivitiesByUsername(username);

        }
        return activities.stream()
                .map(activity -> new ActivityDto(activity.getId(), activity.getActivityType(),
                        activity.getCreatedAt(), activity.getDistance(), activity.getCo2InKg()))
                .toList();

    }
}

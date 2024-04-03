package com.quantumquesters.emissionbackend.service;


import com.quantumquesters.emissionbackend.models.Activity;
import com.quantumquesters.emissionbackend.repository.ActivityRepository;
import com.quantumquesters.emissionbackend.service.dtos.activity.ActivityDto;
import com.quantumquesters.emissionbackend.service.dtos.activity.AddActivityDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ActivityService {

    private final ActivityRepository activityRepository;

    public ActivityDto addActivity(AddActivityDto addActivityDto) {
        Activity activity = new Activity();
        activity.setActivityType(addActivityDto.activityType());
        activity.setDistance(addActivityDto.distance());
        activity.setCo2InKg(addActivityDto.co2());
        Activity saved = activityRepository.save(activity);
        return new ActivityDto(saved.getId(), saved.getActivityType(), saved.getCreatedAt(), saved.getDistance(), saved.getCo2InKg());

    }

    public List<ActivityDto> getActivitiesByUsername(String username) {
        List<Activity> activities = activityRepository.findActivitiesByUsername(username);
        return activities.stream()
                .map(activity -> new ActivityDto(activity.getId(), activity.getActivityType(),
                        activity.getCreatedAt(), activity.getDistance(), activity.getCo2InKg()))
                .toList();

    }
}

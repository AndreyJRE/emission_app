package com.quantumquesters.emissionbackend.rest;

import com.quantumquesters.emissionbackend.service.ActivityService;
import com.quantumquesters.emissionbackend.service.dtos.activity.ActivityDto;
import com.quantumquesters.emissionbackend.service.dtos.activity.AddActivityDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/api/activities")
public class ActivityController {
    private final ActivityService activityService;

    public ActivityController(ActivityService activityService) {
        this.activityService = activityService;
    }

    @PostMapping("/add")
    public ResponseEntity<ActivityDto> addActivity(@RequestBody AddActivityDto addActivityDto) {
        return ResponseEntity.ok(activityService.addActivity(addActivityDto));
    }

    @GetMapping
    public ResponseEntity<List<ActivityDto>> getActivitiesByUsername(@RequestParam String username) {
        return ResponseEntity.ok(activityService.getActivitiesByUsername(username));
    }
}


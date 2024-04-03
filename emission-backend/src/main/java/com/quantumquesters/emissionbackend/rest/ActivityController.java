package com.quantumquesters.emissionbackend.rest;

import com.quantumquesters.emissionbackend.service.ActivityService;
import com.quantumquesters.emissionbackend.service.dtos.activity.ActivityDto;
import com.quantumquesters.emissionbackend.service.dtos.activity.AddActivityDto;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

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
    public ResponseEntity<List<ActivityDto>> getActivitiesByUsername(@RequestParam String username,
                                                                     @RequestParam(required = false)
                                                                     @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
                                                                     Optional<LocalDate> dateOfActivity) {
        return ResponseEntity.ok(activityService.getActivitiesByUsername(username, dateOfActivity));
    }
}


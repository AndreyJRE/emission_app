package com.quantumquesters.emissionbackend.service.dtos.activity;

import com.quantumquesters.emissionbackend.models.ActivityType;

public record AddActivityDto(ActivityType activityType, long duration, Double co2) {
}

package com.quantumquesters.emissionbackend.service.dtos.activity;

import com.quantumquesters.emissionbackend.models.ActivityType;

public record AddActivityDto(ActivityType activityType, Double distance, Double co2) {
}

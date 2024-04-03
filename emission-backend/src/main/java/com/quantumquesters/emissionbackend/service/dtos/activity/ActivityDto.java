package com.quantumquesters.emissionbackend.service.dtos.activity;

import com.quantumquesters.emissionbackend.models.ActivityType;

import java.time.LocalDateTime;

public record ActivityDto(Long id, ActivityType activityType, LocalDateTime createdAt, long duration, Double co2) {
}

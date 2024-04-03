package com.quantumquesters.emissionbackend.service.dtos;

import com.quantumquesters.emissionbackend.models.ActivityType;

public record CompanionRequestDto(ActivityType activityType,
                                  double distance,
                                  long occupancy) {
}

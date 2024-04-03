package com.quantumquesters.emissionbackend.service.dtos.companion;

import com.quantumquesters.emissionbackend.models.ActivityType;

public record CompanionRequestDto(ActivityType activityType,
                                  Double distance,
                                  Long occupancy) {
}

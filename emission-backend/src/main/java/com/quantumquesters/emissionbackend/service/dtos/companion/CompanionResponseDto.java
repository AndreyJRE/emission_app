package com.quantumquesters.emissionbackend.service.dtos.companion;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.quantumquesters.emissionbackend.models.ActivityType;

public record CompanionResponseDto(@JsonProperty("CO2 emission (in g)") long cO2_emission,
                                   @JsonProperty("Vehicle type") ActivityType activityType,
                                   @JsonProperty("Distance (km)") double distance,
                                   @JsonProperty("Occupancy") long occupancy,
                                   @JsonProperty("Note") String note) {

}

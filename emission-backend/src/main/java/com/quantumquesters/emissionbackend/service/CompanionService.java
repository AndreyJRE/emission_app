package com.quantumquesters.emissionbackend.service;


import com.quantumquesters.emissionbackend.service.dtos.companion.CompanionRequestDto;
import com.quantumquesters.emissionbackend.service.dtos.companion.CompanionResponseDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
@AllArgsConstructor
public class CompanionService {


    private final WebClient webClient;


    public CompanionResponseDto calculateEmission(CompanionRequestDto requestDto) {
        return webClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/carbon/api/basic")
                        .queryParam("km", requestDto.distance())
                        .queryParam("vehicle_type", requestDto.activityType())
                        .queryParam("occupancy", requestDto.occupancy())
                        .build())
                .retrieve()
                .bodyToMono(CompanionResponseDto.class)
                .block();
    }


}

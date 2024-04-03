package com.quantumquesters.emissionbackend.rest;


import com.quantumquesters.emissionbackend.service.CompanionService;
import com.quantumquesters.emissionbackend.service.dtos.companion.CompanionRequestDto;
import com.quantumquesters.emissionbackend.service.dtos.companion.CompanionResponseDto;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/api/emissions")
@AllArgsConstructor
public class EmissionController {


    private final CompanionService companionService;


    @PostMapping("/calculate")
    public ResponseEntity<Long> calculateEmission(@RequestBody CompanionRequestDto companionRequestDto) {
        CompanionResponseDto companionResponseDto = companionService.calculateEmission(companionRequestDto);
        return ResponseEntity.ok(companionResponseDto.cO2_emission());
    }


}

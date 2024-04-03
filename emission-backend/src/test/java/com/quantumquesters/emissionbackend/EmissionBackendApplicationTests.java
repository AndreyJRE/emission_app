package com.quantumquesters.emissionbackend;

import com.quantumquesters.emissionbackend.models.ActivityType;
import com.quantumquesters.emissionbackend.service.CompanionService;
import com.quantumquesters.emissionbackend.service.dtos.CompanionRequestDto;
import com.quantumquesters.emissionbackend.service.dtos.CompanionResponseDto;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@ExtendWith(MockitoExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Transactional
class EmissionBackendApplicationTests {

	@Autowired
	private CompanionService companionService;

	private CompanionRequestDto companionRequestDto;


	@BeforeEach
	void setUp() {
		companionRequestDto = new CompanionRequestDto(ActivityType.CAR_DIESEL, 100, 1);

	}

	@Test
	void testGetAmountOfEmission() {
		CompanionResponseDto companionResponseDto = companionService.getAmountOfEmission(companionRequestDto);
		assertThat(companionResponseDto.cO2_emission()).isEqualTo(17300);
	}
}

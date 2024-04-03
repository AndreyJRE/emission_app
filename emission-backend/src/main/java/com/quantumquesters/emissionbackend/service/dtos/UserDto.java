package com.quantumquesters.emissionbackend.service.dtos;

public record UserDto(Long id, String username, double totalEmission, double totalDistance) {}

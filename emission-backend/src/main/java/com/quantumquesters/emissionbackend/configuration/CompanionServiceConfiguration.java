package com.quantumquesters.emissionbackend.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.netty.http.client.HttpClient;

@Configuration
public class CompanionServiceConfiguration {

    private static final String BASE_URL = "https://companion-backend.azurewebsites.net";

    @Bean
    public WebClient createWebClient() {
        HttpClient httpClient = HttpClient.create().followRedirect(true);
        ReactorClientHttpConnector connector = new ReactorClientHttpConnector(httpClient);
        return WebClient.builder().clientConnector(connector).baseUrl(BASE_URL).build();
    }
}

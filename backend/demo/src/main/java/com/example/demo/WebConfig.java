package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Web configuration class for the Spring Boot application.
 * This class implements the WebMvcConfigurer interface to customize the web configuration.
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    /**
     * Configures CORS settings for the application.
     * 
     * @return a WebMvcConfigurer instance with custom CORS configuration
     */
    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            /**
             * Adds CORS mappings to allow cross-origin requests.
             *
             * @param registry the CorsRegistry to add the mappings to
             */
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                // Add CORS mappings for all endpoints
                registry.addMapping("/**")
                        // Allow requests from any origin
                        .allowedOrigins("*")
                        // Allow specified HTTP methods
                        .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                        // Allow all headers
                        .allowedHeaders("*");
            }
        };
    }
}

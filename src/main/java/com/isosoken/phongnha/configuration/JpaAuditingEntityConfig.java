package com.isosoken.phongnha.configuration;

import com.isosoken.phongnha.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorAware")
public class JpaAuditingEntityConfig {
    @Autowired
    public SecurityService securityService;

    @Bean
    public AuditorAware<String> auditorAware() {
        return new CustomAuditAware(securityService);
    }
}
package com.isosoken.phongnha.configuration;

import com.isosoken.phongnha.service.SecurityService;
import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

public class CustomAuditAware implements AuditorAware<String> {

    private SecurityService securityService;

    public CustomAuditAware(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    public Optional<String> getCurrentAuditor() {
        return Optional.of(securityService.getCurrentUsername());
    }
}
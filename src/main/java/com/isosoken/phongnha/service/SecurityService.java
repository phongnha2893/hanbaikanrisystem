package com.isosoken.phongnha.service;

import java.util.Set;

public interface SecurityService {
    String getCurrentUsername();

    Set<String> getCurrentUserRoles();

    void login(String userName, String password);
}

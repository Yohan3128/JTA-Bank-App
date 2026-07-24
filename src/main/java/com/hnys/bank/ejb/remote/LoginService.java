package com.hnys.bank.ejb.remote;

import com.hnys.bank.entity.User;
import jakarta.ejb.Local;

@Local
public interface LoginService {
    boolean login(String email, String password);
    User findByEmail(String email);
}

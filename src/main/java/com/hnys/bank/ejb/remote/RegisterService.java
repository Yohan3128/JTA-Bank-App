package com.hnys.bank.ejb.remote;

import com.hnys.bank.exception.DuplicateEmailException;
import jakarta.ejb.Local;

import java.math.BigDecimal;
import java.rmi.RemoteException;

@Local
public interface RegisterService {
    void registerUser(String name, String email, String password, BigDecimal openingBalance) throws DuplicateEmailException;
}

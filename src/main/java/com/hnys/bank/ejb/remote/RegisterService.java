package com.hnys.bank.ejb.remote;

import jakarta.ejb.Local;

import java.rmi.RemoteException;

@Local
public interface RegisterService {
    void registerUser(String name,String email, String password) throws RemoteException;
}

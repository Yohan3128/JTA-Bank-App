package com.hnys.bank.ejb;

import com.hnys.bank.ejb.remote.RegisterService;
import com.hnys.bank.entity.User;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.rmi.RemoteException;

@Stateless
public class RegisterServiceBean implements RegisterService {

    @PersistenceContext(unitName = "BANK-PU")
    private EntityManager em;

    @Override
    public void registerUser(String name, String email, String password) throws RemoteException {
        long existing = em.createNamedQuery("User.findByEmail", User.class)
                .setParameter("email", email)
                .getResultList()
                .size();
        if (existing > 0) {
            throw new RemoteException("User already exists");
        }

        User user = new User(name, email, password);
        em.persist(user);
        em.flush();
    }
}

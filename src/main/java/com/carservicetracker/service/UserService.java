package com.carservicetracker.service;

import com.carservicetracker.model.User;
import org.springframework.http.ResponseEntity;

import java.util.List;

/**
 * Created by simple-task on 23.12.17..
 */
public interface UserService {
    ResponseEntity<User> findById (Long id);
    ResponseEntity<List<User>> findAll();
    ResponseEntity<User> create (User user);
    ResponseEntity<User> update (User user);
    boolean delete (Long id);
}

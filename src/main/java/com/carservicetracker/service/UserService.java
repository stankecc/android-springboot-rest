package com.carservicetracker.service;

import com.carservicetracker.model.User;

/**
 * Created by simple-task on 23.12.17..
 */
public interface UserService {
	User findById(Long id);
}

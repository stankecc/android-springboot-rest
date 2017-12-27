package com.carservicetracker.service.impl;

import com.carservicetracker.model.User;
import com.carservicetracker.repository.UserRepository;
import com.carservicetracker.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by simple-task on 23.12.17..
 */
@Service
public class UserServiceImpl implements UserService {
	@Resource UserRepository userRepository;

	@Override @Transactional public User findById(Long id) {
		return userRepository.findOne(id);
	}
}

package com.carservicetracker.service.impl;

import com.carservicetracker.exception.UserMissingInformationException;
import com.carservicetracker.exception.UserNotFoundException;
import com.carservicetracker.model.User;
import com.carservicetracker.repository.UserRepository;
import com.carservicetracker.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by simple-task on 23.12.17..
 */
@Service
public class UserServiceImpl implements UserService {
	@Resource UserRepository userRepository;

	@Override
	@Transactional
	public ResponseEntity<User> findById(Long id) {
		User user = findUserIfExists(id);
		return new ResponseEntity<>(user, HttpStatus.OK);
	}

	@Override
	@Transactional
	public ResponseEntity<List<User>> findAll() {
		List<User> users = userRepository.findAll();
		return new ResponseEntity<>(users, HttpStatus.OK);
	}

	@Override
	@Transactional
	public ResponseEntity<User> create(User user) {
		if (user.getEmail() != null && user.getEmail().length() > 0) {
			User newUser = userRepository.saveAndFlush(user);
			if (newUser == null)
				throw new UserNotFoundException();
			return new ResponseEntity<>(newUser, HttpStatus.CREATED);
		} else {
			throw new UserMissingInformationException();
		}
	}

	@Override
	@Transactional
	public ResponseEntity<User> update(User user) {
		return null;
	}

	@Override
	@Transactional
	public boolean delete(Long id) {
		return false;
	}

	/*
	* Private methods
	*  */
	private User findUserIfExists(Long id) {
		User existingUser = userRepository.findOne(id);

		if(null != existingUser) {
			return existingUser;
		} else {
			throw new UserNotFoundException();
		}
	}
}

package com.carservicetracker.controller;

import com.carservicetracker.model.User;
import com.carservicetracker.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by simple-task on 23.12.17..
 */
@RestController
@RequestMapping(value = "/car-service")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/sayHello", method = RequestMethod.GET)
	public String sayHello() {
		return "SpringBoot";
	}

	@RequestMapping(value = "/sayHello", method = RequestMethod.POST)
	public ResponseEntity<User> register(@RequestBody User user) throws Throwable {
		return userService.create(user);
	}

//	@RequestMapping(value ="/users", method = RequestMethod.GET)
//	@PreAuthorize("hasAuthority('ADMIN_USER')")
//	public List<User> getUsers(){
//		return genericService.findAll();
//	}
}

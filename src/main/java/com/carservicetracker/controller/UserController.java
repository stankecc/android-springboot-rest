package com.carservicetracker.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by simple-task on 23.12.17..
 */
@RestController
public class UserController {

	@RequestMapping(value = "/sayHello", method = RequestMethod.GET)
	public String sayHello() {
		return "SpringBoot";
	}
}

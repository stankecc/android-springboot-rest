package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the USER database table.
 * 
 */
@Entity
@Table(name="USER")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id")
	private Long userId;

	private String email;

	@Column(name="first_name")
	private String firstName;

	@Column(name="last_name")
	private String lastName;

	private String password;

	//bi-directional many-to-one association to Service
	@OneToMany(mappedBy="user")
	private List<Service> services;

	//bi-directional many-to-one association to UserVehicle
	@OneToMany(mappedBy="user")
	private List<UserVehicle> userVehicles;

	public User() {
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Service> getServices() {
		return this.services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	public Service addService(Service service) {
		getServices().add(service);
		service.setUser(this);

		return service;
	}

	public Service removeService(Service service) {
		getServices().remove(service);
		service.setUser(null);

		return service;
	}

	public List<UserVehicle> getUserVehicles() {
		return this.userVehicles;
	}

	public void setUserVehicles(List<UserVehicle> userVehicles) {
		this.userVehicles = userVehicles;
	}

	public UserVehicle addUserVehicle(UserVehicle userVehicle) {
		getUserVehicles().add(userVehicle);
		userVehicle.setUser(this);

		return userVehicle;
	}

	public UserVehicle removeUserVehicle(UserVehicle userVehicle) {
		getUserVehicles().remove(userVehicle);
		userVehicle.setUser(null);

		return userVehicle;
	}

}
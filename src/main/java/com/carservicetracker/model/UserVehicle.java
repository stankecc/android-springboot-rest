package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the user_vehicle database table.
 * 
 */
@Entity
@Table(name="user_vehicle")
@NamedQuery(name="UserVehicle.findAll", query="SELECT u FROM UserVehicle u")
public class UserVehicle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="USER_VEHICLE_ID")
	private Long userVehicleId;

	private byte active;

	//bi-directional many-to-one association to Service
	@OneToMany(mappedBy="userVehicle")
	private List<Service> services;

	//bi-directional many-to-one association to Vehicle
	@ManyToOne
	@JoinColumn(name="VEHICLE_ID")
	private Vehicle vehicle;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private User user;

	public UserVehicle() {
	}

	public Long getUserVehicleId() {
		return this.userVehicleId;
	}

	public void setUserVehicleId(Long userVehicleId) {
		this.userVehicleId = userVehicleId;
	}

	public byte getActive() {
		return this.active;
	}

	public void setActive(byte active) {
		this.active = active;
	}

	public List<Service> getServices() {
		return this.services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	public Service addService(Service service) {
		getServices().add(service);
		service.setUserVehicle(this);

		return service;
	}

	public Service removeService(Service service) {
		getServices().remove(service);
		service.setUserVehicle(null);

		return service;
	}

	public Vehicle getVehicle() {
		return this.vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
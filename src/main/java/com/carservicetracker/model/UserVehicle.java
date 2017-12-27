package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the USER_VEHICLE database table.
 * 
 */
@Entity
@Table(name="USER_VEHICLE")
@NamedQuery(name="UserVehicle.findAll", query="SELECT u FROM UserVehicle u")
public class UserVehicle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_vehicle_id")
	private Long userVehicleId;

	private byte active;

	//bi-directional many-to-one association to Service
	@OneToMany(mappedBy="userVehicle")
	private List<Service> services;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	//bi-directional many-to-one association to Vehicle
	@ManyToOne
	@JoinColumn(name="vehicle_id")
	private Vehicle vehicle;

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

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Vehicle getVehicle() {
		return this.vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

}
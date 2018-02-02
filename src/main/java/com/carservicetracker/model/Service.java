package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the service database table.
 * 
 */
@Entity
@NamedQuery(name="Service.findAll", query="SELECT s FROM Service s")
public class Service implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SERVICE_ID")
	private Long serviceId;

	@Column(name="DATE_PERFORMED")
	private String datePerformed;

	@Column(name="DISTANCE_PASSED")
	private BigDecimal distancePassed;

	private BigDecimal price;

	//bi-directional many-to-one association to Vehicle
	@ManyToOne
	@JoinColumn(name="VEHICLE_ID")
	private Vehicle vehicle;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private User user;

	//bi-directional many-to-one association to UserVehicle
	@ManyToOne
	@JoinColumn(name="USER_VEHICLE_ID")
	private UserVehicle userVehicle;

	//bi-directional many-to-one association to ServiceType
	@ManyToOne
	@JoinColumn(name="SERVICE_TYPE_ID")
	private ServiceType serviceType;

	public Service() {
	}

	public Long getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public String getDatePerformed() {
		return this.datePerformed;
	}

	public void setDatePerformed(String datePerformed) {
		this.datePerformed = datePerformed;
	}

	public BigDecimal getDistancePassed() {
		return this.distancePassed;
	}

	public void setDistancePassed(BigDecimal distancePassed) {
		this.distancePassed = distancePassed;
	}

	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
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

	public UserVehicle getUserVehicle() {
		return this.userVehicle;
	}

	public void setUserVehicle(UserVehicle userVehicle) {
		this.userVehicle = userVehicle;
	}

	public ServiceType getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(ServiceType serviceType) {
		this.serviceType = serviceType;
	}

}
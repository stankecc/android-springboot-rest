package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the SERVICE database table.
 * 
 */
@Entity
@Table(name="SERVICE")
@NamedQuery(name="Service.findAll", query="SELECT s FROM Service s")
public class Service implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="service_id")
	private Long serviceId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="date_performed")
	private Date datePerformed;

	@Column(name="distance_passed")
	private BigDecimal distancePassed;

	private BigDecimal price;

	//bi-directional many-to-one association to ServiceType
	@ManyToOne
	@JoinColumn(name="service_type_id")
	private ServiceType serviceType;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	//bi-directional many-to-one association to UserVehicle
	@ManyToOne
	@JoinColumn(name="user_vehicle_id")
	private UserVehicle userVehicle;

	public Service() {
	}

	public Long getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public Date getDatePerformed() {
		return this.datePerformed;
	}

	public void setDatePerformed(Date datePerformed) {
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

	public ServiceType getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(ServiceType serviceType) {
		this.serviceType = serviceType;
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

}
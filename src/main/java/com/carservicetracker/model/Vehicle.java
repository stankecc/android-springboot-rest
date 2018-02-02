package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the vehicle database table.
 * 
 */
@Entity
@NamedQuery(name="Vehicle.findAll", query="SELECT v FROM Vehicle v")
public class Vehicle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="VEHICLE_ID")
	private Long vehicleId;

	@Column(name="AVERAGE_FUEL_CONSUMPTION")
	private BigDecimal averageFuelConsumption;

	@Column(name="DISTANCE_DRIVEN")
	private BigDecimal distanceDriven;

	@Column(name="ENGINE_POWER")
	private int enginePower;

	@Column(name="ENGINE_SIZE")
	private BigDecimal engineSize;

	@Column(name="PRODUCTION_YEAR")
	private String productionYear;

	private String registration;

	//bi-directional many-to-one association to Service
	@OneToMany(mappedBy="vehicle")
	private List<Service> services;

	//bi-directional many-to-one association to UserVehicle
	@OneToMany(mappedBy="vehicle")
	private List<UserVehicle> userVehicles;

	//bi-directional many-to-one association to VehicleModel
	@ManyToOne
	@JoinColumn(name="VEHICLE_MODEL_ID")
	private VehicleModel vehicleModel;

	//bi-directional many-to-one association to FuelType
	@ManyToOne
	@JoinColumn(name="FUEL_TYPE_ID")
	private FuelType fuelType;

	public Vehicle() {
	}

	public Long getVehicleId() {
		return this.vehicleId;
	}

	public void setVehicleId(Long vehicleId) {
		this.vehicleId = vehicleId;
	}

	public BigDecimal getAverageFuelConsumption() {
		return this.averageFuelConsumption;
	}

	public void setAverageFuelConsumption(BigDecimal averageFuelConsumption) {
		this.averageFuelConsumption = averageFuelConsumption;
	}

	public BigDecimal getDistanceDriven() {
		return this.distanceDriven;
	}

	public void setDistanceDriven(BigDecimal distanceDriven) {
		this.distanceDriven = distanceDriven;
	}

	public int getEnginePower() {
		return this.enginePower;
	}

	public void setEnginePower(int enginePower) {
		this.enginePower = enginePower;
	}

	public BigDecimal getEngineSize() {
		return this.engineSize;
	}

	public void setEngineSize(BigDecimal engineSize) {
		this.engineSize = engineSize;
	}

	public String getProductionYear() {
		return this.productionYear;
	}

	public void setProductionYear(String productionYear) {
		this.productionYear = productionYear;
	}

	public String getRegistration() {
		return this.registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public List<Service> getServices() {
		return this.services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	public Service addService(Service service) {
		getServices().add(service);
		service.setVehicle(this);

		return service;
	}

	public Service removeService(Service service) {
		getServices().remove(service);
		service.setVehicle(null);

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
		userVehicle.setVehicle(this);

		return userVehicle;
	}

	public UserVehicle removeUserVehicle(UserVehicle userVehicle) {
		getUserVehicles().remove(userVehicle);
		userVehicle.setVehicle(null);

		return userVehicle;
	}

	public VehicleModel getVehicleModel() {
		return this.vehicleModel;
	}

	public void setVehicleModel(VehicleModel vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

	public FuelType getFuelType() {
		return this.fuelType;
	}

	public void setFuelType(FuelType fuelType) {
		this.fuelType = fuelType;
	}

}
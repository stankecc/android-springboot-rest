package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the VEHICLE database table.
 * 
 */
@Entity
@Table(name="VEHICLE")
@NamedQuery(name="Vehicle.findAll", query="SELECT v FROM Vehicle v")
public class Vehicle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="vehicle_id")
	private Long vehicleId;

	@Column(name="average_fuel_consumption")
	private String averageFuelConsumption;

	@Column(name="distance_driven")
	private BigDecimal distanceDriven;

	@Column(name="engine_power")
	private int enginePower;

	@Column(name="engine_size")
	private String engineSize;

	@Column(name="production_year")
	private String productionYear;

	private String registration;

	//bi-directional many-to-one association to UserVehicle
	@OneToMany(mappedBy="vehicle")
	private List<UserVehicle> userVehicles;

	//bi-directional many-to-one association to FuelType
	@ManyToOne
	@JoinColumn(name="fuel_type_id")
	private FuelType fuelType;

	//bi-directional many-to-one association to VehicleModel
	@ManyToOne
	@JoinColumn(name="vehicle_model_id")
	private VehicleModel vehicleModel;

	public Vehicle() {
	}

	public Long getVehicleId() {
		return this.vehicleId;
	}

	public void setVehicleId(Long vehicleId) {
		this.vehicleId = vehicleId;
	}

	public String getAverageFuelConsumption() {
		return this.averageFuelConsumption;
	}

	public void setAverageFuelConsumption(String averageFuelConsumption) {
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

	public String getEngineSize() {
		return this.engineSize;
	}

	public void setEngineSize(String engineSize) {
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

	public FuelType getFuelType() {
		return this.fuelType;
	}

	public void setFuelType(FuelType fuelType) {
		this.fuelType = fuelType;
	}

	public VehicleModel getVehicleModel() {
		return this.vehicleModel;
	}

	public void setVehicleModel(VehicleModel vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

}
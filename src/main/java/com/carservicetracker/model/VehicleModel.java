package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the VEHICLE_MODEL database table.
 * 
 */
@Entity
@Table(name="VEHICLE_MODEL")
@NamedQuery(name="VehicleModel.findAll", query="SELECT v FROM VehicleModel v")
public class VehicleModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="vehicle_model_id")
	private Long vehicleModelId;

	@Column(name="model_name")
	private String modelName;

	//bi-directional many-to-one association to Vehicle
	@OneToMany(mappedBy="vehicleModel")
	private List<Vehicle> vehicles;

	//bi-directional many-to-one association to VehicleBrand
	@ManyToOne
	@JoinColumn(name="vehicle_brand_id")
	private VehicleBrand vehicleBrand;

	//bi-directional many-to-one association to VehicleType
	@ManyToOne
	@JoinColumn(name="vehicle_type_id")
	private VehicleType vehicleType;

	public VehicleModel() {
	}

	public Long getVehicleModelId() {
		return this.vehicleModelId;
	}

	public void setVehicleModelId(Long vehicleModelId) {
		this.vehicleModelId = vehicleModelId;
	}

	public String getModelName() {
		return this.modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public List<Vehicle> getVehicles() {
		return this.vehicles;
	}

	public void setVehicles(List<Vehicle> vehicles) {
		this.vehicles = vehicles;
	}

	public Vehicle addVehicle(Vehicle vehicle) {
		getVehicles().add(vehicle);
		vehicle.setVehicleModel(this);

		return vehicle;
	}

	public Vehicle removeVehicle(Vehicle vehicle) {
		getVehicles().remove(vehicle);
		vehicle.setVehicleModel(null);

		return vehicle;
	}

	public VehicleBrand getVehicleBrand() {
		return this.vehicleBrand;
	}

	public void setVehicleBrand(VehicleBrand vehicleBrand) {
		this.vehicleBrand = vehicleBrand;
	}

	public VehicleType getVehicleType() {
		return this.vehicleType;
	}

	public void setVehicleType(VehicleType vehicleType) {
		this.vehicleType = vehicleType;
	}

}
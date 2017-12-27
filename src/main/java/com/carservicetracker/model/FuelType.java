package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the FUEL_TYPE database table.
 * 
 */
@Entity
@Table(name="FUEL_TYPE")
@NamedQuery(name="FuelType.findAll", query="SELECT f FROM FuelType f")
public class FuelType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="fuel_type_id")
	private Long fuelTypeId;

	@Column(name="fuel_type_name")
	private String fuelTypeName;

	//bi-directional many-to-one association to Vehicle
	@OneToMany(mappedBy="fuelType")
	private List<Vehicle> vehicles;

	public FuelType() {
	}

	public Long getFuelTypeId() {
		return this.fuelTypeId;
	}

	public void setFuelTypeId(Long fuelTypeId) {
		this.fuelTypeId = fuelTypeId;
	}

	public String getFuelTypeName() {
		return this.fuelTypeName;
	}

	public void setFuelTypeName(String fuelTypeName) {
		this.fuelTypeName = fuelTypeName;
	}

	public List<Vehicle> getVehicles() {
		return this.vehicles;
	}

	public void setVehicles(List<Vehicle> vehicles) {
		this.vehicles = vehicles;
	}

	public Vehicle addVehicle(Vehicle vehicle) {
		getVehicles().add(vehicle);
		vehicle.setFuelType(this);

		return vehicle;
	}

	public Vehicle removeVehicle(Vehicle vehicle) {
		getVehicles().remove(vehicle);
		vehicle.setFuelType(null);

		return vehicle;
	}

}
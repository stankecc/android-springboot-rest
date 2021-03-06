package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the vehicle_type database table.
 * 
 */
@Entity
@Table(name="vehicle_type")
@NamedQuery(name="VehicleType.findAll", query="SELECT v FROM VehicleType v")
public class VehicleType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="VEHICLE_TYPE_ID")
	private Long vehicleTypeId;

	@Column(name="VEHICLE_TYPE_NAME")
	private String vehicleTypeName;

	//bi-directional many-to-one association to VehicleModel
	@OneToMany(mappedBy="vehicleType")
	private List<VehicleModel> vehicleModels;

	public VehicleType() {
	}

	public Long getVehicleTypeId() {
		return this.vehicleTypeId;
	}

	public void setVehicleTypeId(Long vehicleTypeId) {
		this.vehicleTypeId = vehicleTypeId;
	}

	public String getVehicleTypeName() {
		return this.vehicleTypeName;
	}

	public void setVehicleTypeName(String vehicleTypeName) {
		this.vehicleTypeName = vehicleTypeName;
	}

	public List<VehicleModel> getVehicleModels() {
		return this.vehicleModels;
	}

	public void setVehicleModels(List<VehicleModel> vehicleModels) {
		this.vehicleModels = vehicleModels;
	}

	public VehicleModel addVehicleModel(VehicleModel vehicleModel) {
		getVehicleModels().add(vehicleModel);
		vehicleModel.setVehicleType(this);

		return vehicleModel;
	}

	public VehicleModel removeVehicleModel(VehicleModel vehicleModel) {
		getVehicleModels().remove(vehicleModel);
		vehicleModel.setVehicleType(null);

		return vehicleModel;
	}

}
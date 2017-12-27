package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the VEHICLE_BRAND database table.
 * 
 */
@Entity
@Table(name="VEHICLE_BRAND")
@NamedQuery(name="VehicleBrand.findAll", query="SELECT v FROM VehicleBrand v")
public class VehicleBrand implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="vehicle_brand_id")
	private Long vehicleBrandId;

	@Column(name="brand_name")
	private String brandName;

	//bi-directional many-to-one association to VehicleModel
	@OneToMany(mappedBy="vehicleBrand")
	private List<VehicleModel> vehicleModels;

	public VehicleBrand() {
	}

	public Long getVehicleBrandId() {
		return this.vehicleBrandId;
	}

	public void setVehicleBrandId(Long vehicleBrandId) {
		this.vehicleBrandId = vehicleBrandId;
	}

	public String getBrandName() {
		return this.brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public List<VehicleModel> getVehicleModels() {
		return this.vehicleModels;
	}

	public void setVehicleModels(List<VehicleModel> vehicleModels) {
		this.vehicleModels = vehicleModels;
	}

	public VehicleModel addVehicleModel(VehicleModel vehicleModel) {
		getVehicleModels().add(vehicleModel);
		vehicleModel.setVehicleBrand(this);

		return vehicleModel;
	}

	public VehicleModel removeVehicleModel(VehicleModel vehicleModel) {
		getVehicleModels().remove(vehicleModel);
		vehicleModel.setVehicleBrand(null);

		return vehicleModel;
	}

}
package com.carservicetracker.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the vehicle_brand database table.
 * 
 */
@Entity
@Table(name="vehicle_brand")
@NamedQuery(name="VehicleBrand.findAll", query="SELECT v FROM VehicleBrand v")
public class VehicleBrand implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="VEHICLE_BRAND_ID")
	private Long vehicleBrandId;

	@Column(name="BRAND_NAME")
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
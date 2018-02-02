package com.carservicetracker.service.impl;

import com.carservicetracker.model.FuelType;
import com.carservicetracker.repository.FuelTypeRepository;
import com.carservicetracker.service.FuelTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FuelTypeServiceImpl implements FuelTypeService {
    @Resource
    FuelTypeRepository fuelTypeRepository;
}

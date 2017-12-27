package com.carservicetracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * Created by simple-task on 23.12.17..
 */
@NoRepositoryBean
public interface GenericRepository<T, ID extends Long> extends JpaRepository<T, ID> {
}

package com.pjb.springbootsearchhouse.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pjb.springbootsearchhouse.entity.SubwayStation;


public interface SubwayStationRepository extends CrudRepository<SubwayStation, Long> {
    List<SubwayStation> findAllBySubwayId(Long subwayId);
}

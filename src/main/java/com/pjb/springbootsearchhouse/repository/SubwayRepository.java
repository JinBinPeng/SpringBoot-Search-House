package com.pjb.springbootsearchhouse.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pjb.springbootsearchhouse.entity.Subway;


public interface SubwayRepository extends CrudRepository<Subway, Long>{
    List<Subway> findAllByCityEnName(String cityEnName);
}

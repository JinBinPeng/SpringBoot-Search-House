package com.pjb.springbootsearchhouse.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pjb.springbootsearchhouse.entity.HouseDetail;


public interface HouseDetailRepository extends CrudRepository<HouseDetail, Long>{
    HouseDetail findByHouseId(Long houseId);

    List<HouseDetail> findAllByHouseIdIn(List<Long> houseIds);
}

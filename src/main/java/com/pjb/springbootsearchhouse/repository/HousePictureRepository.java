package com.pjb.springbootsearchhouse.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pjb.springbootsearchhouse.entity.HousePicture;


public interface HousePictureRepository extends CrudRepository<HousePicture, Long> {
    List<HousePicture> findAllByHouseId(Long id);
}

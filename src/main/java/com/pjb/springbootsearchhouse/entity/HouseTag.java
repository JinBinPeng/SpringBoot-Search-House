package com.pjb.springbootsearchhouse.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 房子标记
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "house_tag")
public class HouseTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "house_id")
    private Long houseId;
    private String name;
    public HouseTag(Long houseId, String name) {
        this.houseId = houseId;
        this.name = name;
    }
}

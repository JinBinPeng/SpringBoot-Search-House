package com.pjb.springbootsearchhouse.web.dto;

import lombok.Data;


@Data
public class SubwayStationDTO {
    private Long id;
    private Long subwayId;
    private String name;
}

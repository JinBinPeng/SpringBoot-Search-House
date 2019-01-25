package com.pjb.springbootsearchhouse.web.dto;

import lombok.Data;

@Data
public class HouseDetailDTO {
    private String description;
    private String layoutDesc;
    private String traffic;
    private String roundService;
    private int rentWay;
    private Long adminId;
    private String address;
    private Long subwayLineId;
    private Long subwayStationId;
    private String subwayLineName;
    private String subwayStationName;
}

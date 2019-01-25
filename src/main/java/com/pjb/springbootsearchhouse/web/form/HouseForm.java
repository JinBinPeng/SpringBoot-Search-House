package com.pjb.springbootsearchhouse.web.form;

import lombok.Data;

import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
public class HouseForm {
    private Long id;
    @NotNull(message = "大标题不允许为空!")
    @Size(min = 1, max = 30, message = "标题长度必须在1~30之间")
    private String title;

    @NotNull(message = "必须选中一个城市")
    @Size(min = 1, message = "非法的城市")
    private String cityEnName;
    @NotNull(message = "必须选中一个地区")
    @Size(min = 1, message = "非法的地区")
    private String regionEnName;
    @NotNull(message = "必须填写街道")
    @Size(min = 1, message = "非法的街道")
    private String street;
    @NotNull(message = "必须填写小区")
    private String district;
    @NotNull(message = "详细地址不允许为空!")
    @Size(min = 1, max = 30, message = "详细地址长度必须在1~30之间")
    private String detailAddress;
    @NotNull(message = "必须填写卧室数量")
    @Min(value = 1, message = "非法的卧室数量")
    private Integer room;
    private int parlour;
    @NotNull(message = "必须填写所属楼层")
    private Integer floor;

    @NotNull(message = "必须填写总楼层")
    private Integer totalFloor;

    @NotNull(message = "必须填写房屋朝向")
    private Integer direction;

    @NotNull(message = "必须填写建筑起始时间")
    @Min(value = 1900, message = "非法的建筑起始时间")
    private Integer buildYear;

    @NotNull(message = "必须填写面积")
    @Min(value = 1)
    private Integer area;

    @NotNull(message = "必须填写租赁价格")
    @Min(value = 1)
    private Integer price;

    @NotNull(message = "必须选中一个租赁方式")
    @Min(value = 0)
    @Max(value = 1)
    private Integer rentWay;
    private Long subwayLineId;
    private Long subwayStationId;
    private int distanceToSubway = -1;
    private String layoutDesc;
    private String roundService;
    private String traffic;
    @Size(max = 255)
    private String description;
    private String cover;
    private List<String> tags;
    private List<PhotoForm> photos;
}

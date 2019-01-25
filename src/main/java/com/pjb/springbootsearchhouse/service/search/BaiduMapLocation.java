package com.pjb.springbootsearchhouse.service.search;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * 百度位置信息
 */
@Data
public class BaiduMapLocation {
    // 经度
    @JsonProperty("lon")
    private double longitude;
    // 纬度
    @JsonProperty("lat")
    private double latitude;

}

package com.pjb.springbootsearchhouse.web.dto;

import lombok.Data;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 预约看房实体类
 * Created by 瓦力.
 */
@Data
public class HouseSubscribeDTO {
    private Long id;
    private Long houseId;
    private Long userId;
    private Long adminId;
    // 预约状态 1-加入待看清单 2-已预约看房时间 3-看房完成
    private int status;
    private Date createTime;
    private Date lastUpdateTime;
    private Date orderTime;
    private String telephone;
    private String desc;
}

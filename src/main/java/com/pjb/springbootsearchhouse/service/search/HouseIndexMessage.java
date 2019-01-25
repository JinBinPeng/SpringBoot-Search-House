package com.pjb.springbootsearchhouse.service.search;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class HouseIndexMessage {
    public static final String INDEX = "index";
    public static final String REMOVE = "remove";
    public static final int MAX_RETRY = 3;
    private Long houseId;
    private String operation;
    private int retry = 0;
}

package com.pjb.springbootsearchhouse.service.search;

import lombok.Data;


@Data
class HouseSuggest {
    private String input;
    private int weight = 10; // 默认权重
}

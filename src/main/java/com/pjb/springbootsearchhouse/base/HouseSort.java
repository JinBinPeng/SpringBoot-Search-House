package com.pjb.springbootsearchhouse.base;

import java.util.Set;

import org.springframework.data.domain.Sort;

import com.google.common.collect.Sets;

/**
 * 排序生成器
 */
public class HouseSort {
    private HouseSort(){

    }
    private static final String DEFAULT_SORT_KEY = "lastUpdateTime";
    public static final String DISTANCE_TO_SUBWAY_KEY = "distanceToSubway";
    private static final Set<String> SORT_KEYS = Sets.newHashSet(DEFAULT_SORT_KEY, "createTime", "price", "area", DISTANCE_TO_SUBWAY_KEY);

    public static Sort generateSort(String key, String directionKey) {
        key = getSortKey(key);
        Sort.Direction direction = Sort.Direction.fromString(directionKey);
        return new Sort(direction, key);
    }

    public static String getSortKey(String key) {
        if (!SORT_KEYS.contains(key)) {
            key = DEFAULT_SORT_KEY;
        }
        return key;
    }
}

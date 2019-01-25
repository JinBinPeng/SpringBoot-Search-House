package com.pjb.springbootsearchhouse.service.search;

import java.util.List;


import com.pjb.springbootsearchhouse.service.ServiceResult;
import com.pjb.springbootsearchhouse.web.form.MapSearch;
import com.pjb.springbootsearchhouse.web.form.RentSearch;
import com.pjb.springbootsearchhouse.service.ServiceMultiResult;

/**
 * 检索接口
 */
public interface ISearchService {
    /**
     * 索引目标房源
     */
    void index(Long houseId);

    /**
     * 移除房源索引
     */
    void remove(Long houseId);

    /**
     * 查询房源接口
     */
    ServiceMultiResult<Long> query(RentSearch rentSearch);

    /**
     * 获取补全建议关键词
     */
    ServiceResult<List<String>> suggest(String prefix);

    /**
     * 聚合特定小区的房间数
     */
    ServiceResult<Long> aggregateDistrictHouse(String cityEnName, String regionEnName, String district);

    /**
     * 聚合城市数据
     */
    ServiceMultiResult<HouseBucketDTO> mapAggregate(String cityEnName);

    /**
     * 城市级别查询
     */
    ServiceMultiResult<Long> mapQuery(String cityEnName, String orderBy, String orderDirection, int start, int size);
    /**
     * 精确范围数据查询
     */
    ServiceMultiResult<Long> mapQuery(MapSearch mapSearch);
}

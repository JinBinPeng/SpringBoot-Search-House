package com.pjb.springbootsearchhouse.service.house;

import com.pjb.springbootsearchhouse.base.HouseSubscribeStatus;
import com.pjb.springbootsearchhouse.service.ServiceMultiResult;
import com.pjb.springbootsearchhouse.service.ServiceResult;
import com.pjb.springbootsearchhouse.web.dto.HouseDTO;
import com.pjb.springbootsearchhouse.web.dto.HouseSubscribeDTO;
import com.pjb.springbootsearchhouse.web.form.DatatableSearch;
import com.pjb.springbootsearchhouse.web.form.HouseForm;
import com.pjb.springbootsearchhouse.web.form.MapSearch;
import com.pjb.springbootsearchhouse.web.form.RentSearch;
import org.springframework.data.util.Pair;

import java.util.Date;

/**
 * 房屋管理服务接口
 */
public interface IHouseService {
    /**
     * 新增
     */
    ServiceResult<HouseDTO> save(HouseForm houseForm);

    ServiceResult update(HouseForm houseForm);

    ServiceMultiResult<HouseDTO> adminQuery(DatatableSearch searchBody);

    /**
     * 查询完整房源信息
     */
    ServiceResult<HouseDTO> findCompleteOne(Long id);

    /**
     * 移除图片
     */
    ServiceResult removePhoto(Long id);

    /**
     * 更新封面
     */
    ServiceResult updateCover(Long coverId, Long targetId);

    /**
     * 新增标签
     */
    ServiceResult addTag(Long houseId, String tag);

    /**
     * 移除标签
     */
    ServiceResult removeTag(Long houseId, String tag);

    /**
     * 更新房源状态
     */
    ServiceResult updateStatus(Long id, int status);

    /**
     * 查询房源信息集
     */
    ServiceMultiResult<HouseDTO> query(RentSearch rentSearch);

    /**
     * 全地图查询
     */
    ServiceMultiResult<HouseDTO> wholeMapQuery(MapSearch mapSearch);

    /**
     * 精确范围数据查询
     */
    ServiceMultiResult<HouseDTO> boundMapQuery(MapSearch mapSearch);

    /**
     * 加入预约清单
     */
    ServiceResult addSubscribeOrder(Long houseId);

    /**
     * 获取对应状态的预约列表
     */
    ServiceMultiResult<Pair<HouseDTO, HouseSubscribeDTO>> querySubscribeList(HouseSubscribeStatus status, int start, int size);

    /**
     * 预约看房时间
     */
    ServiceResult subscribe(Long houseId, Date orderTime, String telephone, String desc);

    /**
     * 取消预约
     */
    ServiceResult cancelSubscribe(Long houseId);

    /**
     * 管理员查询预约信息接口
     */
    ServiceMultiResult<Pair<HouseDTO, HouseSubscribeDTO>> findSubscribeList(int start, int size);

    /**
     * 完成预约
     */
    ServiceResult finishSubscribe(Long houseId);
}

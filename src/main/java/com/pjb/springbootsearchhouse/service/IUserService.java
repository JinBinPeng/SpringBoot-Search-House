package com.pjb.springbootsearchhouse.service;

import com.pjb.springbootsearchhouse.entity.User;
import com.pjb.springbootsearchhouse.web.dto.UserDTO;

/**
 * 用户服务
 */
public interface IUserService {
    /**
     * 根据用户名寻找用户
     */
    User findUserByName(String userName);

    ServiceResult<UserDTO> findById(Long userId);

    /**
     * 根据电话号码寻找用户
     */
    User findUserByTelephone(String telephone);

    /**
     * 通过手机号注册用户
     */
    User addUserByPhone(String telehone);

    /**
     * 修改指定属性值
     */
    ServiceResult modifyUserProfile(String profile, String value);
}

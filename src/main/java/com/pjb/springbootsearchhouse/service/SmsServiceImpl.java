package com.pjb.springbootsearchhouse.service;

import java.util.Random;
import java.util.concurrent.TimeUnit;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

/**
 * InitializingBean接口为bean提供了初始化方法的方式，它只包括afterPropertiesSet方法，凡是继承该接口的类，在初始化bean的时候会执行该方法。
 */
@Slf4j
@Service
public class SmsServiceImpl implements ISmsService, InitializingBean {
    @Value("${aliyun.sms.accessKey}")
    private String accessKey;
    @Value("${aliyun.sms.accessKeySecret}")
    private String secertKey;
    @Value("${aliyun.sms.template.code}")
    private String templateCode;
    private IAcsClient acsClient;
    private static final String SMS_CODE_CONTENT_PREFIX = "SMS::CODE::CONTENT";
    private static final String[] NUMS = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
    private static final Random random = new Random();
    private final RedisTemplate<String, String> redisTemplate;

    @Autowired
    public SmsServiceImpl(RedisTemplate<String, String> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @Override
    public ServiceResult<String> sendSms(String telephone) {
        String gapKey = "SMS::CODE::INTERVAL::" + telephone;
        //根据key获取缓存
        String result = redisTemplate.opsForValue().get(gapKey);
        if (result != null) {
            return new ServiceResult<>(false, "请求次数太频繁");
        }
        // 组装请求对象
        SendSmsRequest request = new SendSmsRequest();

        // 使用post提交
        request.setMethod(MethodType.POST);
        //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
        request.setPhoneNumbers(telephone);
        //必填:短信模板-可在短信控制台中找到
        request.setTemplateCode(templateCode);
        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
        //生成几位的验证码
        String code = generateRandomSmsCode();
        String templateParam = String.format("{\"code\": \"%s\"}", code);
        request.setTemplateParam(templateParam);
        //必填:短信签名-可在短信控制台中找到
        request.setSignName("寻屋");

        boolean success = false;
        try {
            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
            //请求成功
            if ("OK".equals(sendSmsResponse.getCode())) {
                success = true;
            }
        } catch (ClientException e) {
            //请求失败这里会抛ClientException异常
            log.warn(e.toString());
        }
        if (success) {
            //写入缓存
            redisTemplate.opsForValue().set(gapKey, code, 60, TimeUnit.SECONDS);
            redisTemplate.opsForValue().set(SMS_CODE_CONTENT_PREFIX + telephone, code, 10, TimeUnit.MINUTES);
            return ServiceResult.of(code);
        } else {
            return new ServiceResult<>(false, "服务忙，请稍后重试");
        }
    }

    @Override
    public String getSmsCode(String telephone) {
        return this.redisTemplate.opsForValue().get(SMS_CODE_CONTENT_PREFIX + telephone);
    }

    @Override
    public void remove(String telephone) {
        this.redisTemplate.delete(SMS_CODE_CONTENT_PREFIX + telephone);
    }

    @Override
    public void afterPropertiesSet() {
        // 设置超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        //初始化ascClient,暂时不支持多region（请勿修改）
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKey, secertKey);
        //短信API产品名称（短信产品名固定，无需修改）
        String product = "Dysmsapi";
        //短信API产品域名（接口地址固定，无需修改）
        String domain = "dysmsapi.aliyuncs.com";
        // 增加服务结点
        DefaultProfile.addEndpoint("cn-hangzhou", product, domain);
        // 初始化AcsClient用于发起请求
        this.acsClient = new DefaultAcsClient(profile);
    }

    /**
     * 6位验证码生成器
     */
    private static String generateRandomSmsCode() {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            int index = random.nextInt(10);
            stringBuilder.append(NUMS[index]);
        }
        return stringBuilder.toString();
    }
}

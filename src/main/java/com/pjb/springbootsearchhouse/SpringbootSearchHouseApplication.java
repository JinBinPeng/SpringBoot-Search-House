package com.pjb.springbootsearchhouse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableGlobalMethodSecurity(securedEnabled = true)
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 86400)//spring在多长时间后强制使redis中的session失效,默认是1800.(单位/秒)
public class SpringbootSearchHouseApplication {

    public static void main(String[] args) {
        //防止netty与初始化Elasticsearch client冲突时的异常
        System.setProperty("es.set.netty.runtime.available.processors", "false");
        SpringApplication.run(SpringbootSearchHouseApplication.class, args);
    }
}


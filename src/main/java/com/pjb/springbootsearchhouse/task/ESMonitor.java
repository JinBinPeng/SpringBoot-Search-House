package com.pjb.springbootsearchhouse.task;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Slf4j
@Component
public class ESMonitor {
    private static final String HEALTH_CHECK_API = "http://127.0.0.1:8888/_cluster/health";
    private static final String GREEN = "green";
    private static final String YELLOW = "yellow";
    private static final String RED = "red";

    private final ObjectMapper objectMapper;
    private final JavaMailSender mailSender;

    @Autowired
    public ESMonitor(ObjectMapper objectMapper, JavaMailSender mailSender) {
        this.objectMapper = objectMapper;
        this.mailSender = mailSender;
    }

    //@Scheduled(fixedDelay = 60 * 1000)
    public void healthCheck() {
        HttpClient httpClient = HttpClients.createDefault();

        HttpGet get = new HttpGet(HEALTH_CHECK_API);

        try {
            HttpResponse response = httpClient.execute(get);
            if (response.getStatusLine().getStatusCode() != HttpServletResponse.SC_OK) {
                log.info("Can not access ES Service normally! Please check the server.");
            } else {
                String body = EntityUtils.toString(response.getEntity(), "UTF-8");
                JsonNode result = objectMapper.readTree(body);
                String status = result.get("status").asText();

                String message;
                boolean isNormal = false;
                switch (status) {
                    case GREEN:
                        message = "ES server run normally.";
                        isNormal = true;
                        break;
                    case YELLOW:
                        message = "ES server gets status yellow! Please check the ES server!";
                        break;
                    case RED:
                        message = "ES ser get status RED!!! Must Check ES Server!!!";
                        break;
                    default:
                        message = "Unknown ES status from server for: " + status + ". Please check it.";
                        break;
                }

                if (!isNormal) {
                    sendAlertMessage(message);
                }

                // 获取集群节点
                int totalNodes = result.get("number_of_nodes").asInt();
                if (totalNodes < 5) {
                    sendAlertMessage("我们的瓦力节点丢了！");
                }
            }
        } catch (IOException e) {
            log.warn(e.toString());
        }
    }

    private void sendAlertMessage(String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("flyzfq@163.com");
        mailMessage.setTo("flyvali@163.com");
        mailMessage.setSubject("【警告】ES服务监控");
        mailMessage.setText(message);
        mailSender.send(mailMessage);
    }
}

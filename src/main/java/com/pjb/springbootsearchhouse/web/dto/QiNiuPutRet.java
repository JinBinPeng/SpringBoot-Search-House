package com.pjb.springbootsearchhouse.web.dto;

import lombok.Data;

@Data
public final class QiNiuPutRet {
    String key;
    String hash;
    String bucket;
    int width;
    int height;
}

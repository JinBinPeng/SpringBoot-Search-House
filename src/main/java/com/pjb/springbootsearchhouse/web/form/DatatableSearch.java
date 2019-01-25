package com.pjb.springbootsearchhouse.web.form;

import java.util.Date;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class DatatableSearch {
    /**
     * Datatables要求回显字段
     */
    private int draw;
    /**
     * Datatables规定分页字段
     */
    private int start;
    private int length;
    private Integer status;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTimeMin;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTimeMax;
    private String city;
    private String title;
    private String direction;
    private String orderBy;
}

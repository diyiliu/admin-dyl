package com.dyl.admin.support.model;

import lombok.Data;

/**
 * Description: RespBody
 * Author: DIYILIU
 * Update: 2018-10-31 14:06
 */

@Data
public class RespBody {

    /** 0: 失败; 1: 成功; **/
    private int status;

    private String msg;
}

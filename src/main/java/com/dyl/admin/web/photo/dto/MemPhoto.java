package com.dyl.admin.web.photo.dto;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import javax.persistence.*;
import java.io.File;

/**
 * Description: MemPhoto
 * Author: DIYILIU
 * Update: 2018-09-20 14:24
 */

@Data
@Entity
@Table(name = "mem_photo")
public class MemPhoto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String note;

    private String full;

    private String thumb;

    /**
     * 1-3 随机数
     *
     * @return
     */
    public int getLuckyNo() {

        return Double.valueOf(Math.random() * 3 + 1).intValue();
    }

    @Transient
    private String originalName;
}

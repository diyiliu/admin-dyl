package com.dyl.admin.web.blog.dto;

import com.dyl.admin.web.sys.dto.SysUser;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Description: Article
 * Author: DIYILIU
 * Update: 2018-10-30 16:37
 */

@Data
@Entity
@Table(name = "blog_article")
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private SysUser sysUser;

    private String title;

    private String content;

    private Integer type;

    private Integer classify;

    private String tags;

    private Integer own;

    private Date createTime;

    private Date updateTime;

    private Integer sort;

    private Integer status;
}

package com.dyl.admin.web.blog.facade;

import com.dyl.admin.web.blog.dto.Article;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Description: ArticleJpa
 * Author: DIYILIU
 * Update: 2018-10-30 16:49
 */
public interface ArticleJpa extends JpaRepository<Article, Long> {


}

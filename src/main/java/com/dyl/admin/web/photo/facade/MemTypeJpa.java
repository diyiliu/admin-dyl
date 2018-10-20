package com.dyl.admin.web.photo.facade;

import com.dyl.admin.web.photo.dto.MemType;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Description: MemTypeJpa
 * Author: DIYILIU
 * Update: 2018-09-20 16:04
 */
public interface MemTypeJpa extends JpaRepository<MemType, Long> {

    MemType findByName(String name);
}

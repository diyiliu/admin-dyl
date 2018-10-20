package com.dyl.admin.web.photo.facade;

import com.dyl.admin.web.photo.dto.MemBody;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Description: MemBodyJpa
 * Author: DIYILIU
 * Update: 2018-09-20 14:42
 */
public interface MemBodyJpa extends JpaRepository<MemBody, Long>, JpaSpecificationExecutor<MemBody> {


    Page<MemBody> findAllByPhotosIsNotNull(Pageable pageable);
}

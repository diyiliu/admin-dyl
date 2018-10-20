package com.dyl.admin.web.devops.facade;

import com.dyl.admin.web.devops.dto.Manifest;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Description: ManifestJpa
 * Author: DIYILIU
 * Update: 2018-09-12 15:56
 */
public interface ManifestJpa extends JpaRepository<Manifest, Long> {

}

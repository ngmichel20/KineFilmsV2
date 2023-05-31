package com.ngmichel.kinefilmsv2.repository;

import com.ngmichel.kinefilmsv2.model.Director;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DirectorRepository extends JpaRepository<Director, Long> {
}

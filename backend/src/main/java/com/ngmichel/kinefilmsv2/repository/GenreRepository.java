package com.ngmichel.kinefilmsv2.repository;

import com.ngmichel.kinefilmsv2.model.Genre;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenreRepository extends JpaRepository<Genre, Long> {
}

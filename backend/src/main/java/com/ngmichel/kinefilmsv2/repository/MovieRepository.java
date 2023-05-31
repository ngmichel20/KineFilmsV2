package com.ngmichel.kinefilmsv2.repository;

import com.ngmichel.kinefilmsv2.model.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieRepository extends JpaRepository<Movie, Long> {
}

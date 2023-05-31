package com.ngmichel.kinefilmsv2.service.movie;

import com.ngmichel.kinefilmsv2.model.Movie;
import com.ngmichel.kinefilmsv2.repository.MovieRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieImpl implements MovieService{

    private final MovieRepository movieRepository;

    public MovieImpl(MovieRepository movieRepository) {
        this.movieRepository = movieRepository;
    }

    @Override
    public List<Movie> getAllMovies() {
        return movieRepository.findAll();
    }
}

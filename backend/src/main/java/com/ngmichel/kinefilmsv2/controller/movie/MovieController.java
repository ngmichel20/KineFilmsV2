package com.ngmichel.kinefilmsv2.controller.movie;

import com.ngmichel.kinefilmsv2.model.Movie;
import com.ngmichel.kinefilmsv2.service.movie.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/movies")
@CrossOrigin(origins = "http://localhost:4200")
public class MovieController {

    @Autowired
    private MovieService movieService;

    @GetMapping
    public ResponseEntity<List<Movie>> getAllMovies(){
        return ResponseEntity.ok(movieService.getAllMovies());
    }

    @GetMapping("/{title}/poster")
    public ResponseEntity<byte[]> getMoviePoster(@PathVariable String title) throws IOException {
        // Assuming the movie posters are stored in the "assets" folder within the resources directory
        String posterPath = String.format("assets/%s_poster.jpg", title.replaceAll(" ", "_"));

        Resource resource = new ClassPathResource(posterPath);
        byte[] posterBytes = StreamUtils.copyToByteArray(resource.getInputStream());

        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_JPEG)
                .body(posterBytes);
    }

}

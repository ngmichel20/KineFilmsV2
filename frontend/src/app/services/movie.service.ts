import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {map, Observable} from "rxjs";
import {Movie} from "../models/movie";

@Injectable({
  providedIn: 'root'
})
export class MovieService {
  private apiUrl = 'http://localhost:8080';

  constructor(private http: HttpClient) {
  }

  // getAllMovies(): Observable<Movie[]> {
  //   return this.http.get<Movie[]>(`${this.apiUrl}/movies`);
  // }

  getAllMovies(): Observable<Movie[]> {
    return this.http.get<Movie[]>(`${this.apiUrl}/movies`).pipe(
      map((movies: Movie[]) => {
        return movies.map((movie: Movie) => {
          movie.posterUrl = this.getMoviePosterUrl(movie); // Append the poster URL to the movie object
          return movie;
        });
      })
    );
  }

  private getMoviePosterUrl(movie: Movie): string {
    // Construct the URL based on your backend's API endpoint for movie posters
    return `http://localhost:8080/movies/${encodeURIComponent(movie.title)}/poster`;
  }
}

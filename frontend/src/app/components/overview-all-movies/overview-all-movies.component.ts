import {Component, OnInit} from '@angular/core';
import {Movie} from "../../models/movie";
import {MovieService} from "../../services/movie.service";

@Component({
  selector: 'app-overview-all-movies',
  templateUrl: './overview-all-movies.component.html',
  styleUrls: ['./overview-all-movies.component.css']
})
export class OverviewAllMoviesComponent implements OnInit {
  movies: Movie[] = [];

  constructor(private movieService: MovieService) {}

  ngOnInit(): void {
    this.getAllMovies();
  }

  getAllMovies(): void {
    this.movieService.getAllMovies().subscribe(
      (movies: Movie[]) => {
        this.movies = movies;
      },
      (error: any) => {
        console.error('Error retrieving movies:', error);
      }
    );
  }

  onMouseEnter() {
    const buttons = document.querySelectorAll('.order-button, .details-button');
    // @ts-ignore
    buttons.forEach((button: HTMLElement) => {
      button.classList.add('hovered');
    });
  }

  onMouseLeave() {
    const buttons = document.querySelectorAll('.order-button, .details-button');
    // @ts-ignore
    buttons.forEach((button: HTMLElement) => {
      button.classList.remove('hovered');
    });
  }


}

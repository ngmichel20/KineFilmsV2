import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OverviewAllMoviesComponent } from './components/overview-all-movies/overview-all-movies.component';
import {RouterModule, Routes} from "@angular/router";

const routes: Routes = [
  { path: '', component: OverviewAllMoviesComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule { }

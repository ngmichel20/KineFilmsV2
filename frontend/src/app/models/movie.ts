import { Genre } from './genre';
import { Director } from './director';
import { CastMember } from './cast-member';

export interface Movie {
  id: number;
  title: string;
  description: string;
  releaseDate: Date;
  genre: Genre;
  director: Director;
  cast: CastMember[];
  duration: number;
  rating: number;
  country: string;
  language: string;
  production_company: string;
  posterUrl: string;
}

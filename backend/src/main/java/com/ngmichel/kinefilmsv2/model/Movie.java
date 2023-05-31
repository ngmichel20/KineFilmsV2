package com.ngmichel.kinefilmsv2.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Entity
@Data
public class Movie {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String title;
  private String description;
  private LocalDate releaseDate;

  @ManyToOne
  private Genre genre;

  @ManyToOne
  private Director director;

  @ManyToMany
  private List<CastMember> cast;
  private double duration;
  private double rating;
  private String country;
  private String language;
  private String production_company;
  //  private String poster_url;
//  private String trailer_url;
}

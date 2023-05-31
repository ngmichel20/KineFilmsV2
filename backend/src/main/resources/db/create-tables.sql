CREATE TABLE public.genre
(
    id         SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE public.director
(
    id         SERIAL PRIMARY KEY,
    last_name  VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    biography  TEXT,
    CONSTRAINT uk_director_name UNIQUE (last_name, first_name)
);

CREATE TABLE public.cast_member
(
    id         SERIAL PRIMARY KEY,
    last_name  VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    biography  TEXT,
    CONSTRAINT uk_cast_member_name UNIQUE (last_name, first_name)
);

CREATE TABLE public.movie
(
    id                 SERIAL PRIMARY KEY,
    title              VARCHAR(255) NOT NULL,
    description        TEXT,
    release_date       DATE,
    genre_id           BIGINT,
    director_id        BIGINT,
    duration           DOUBLE PRECISION,
    rating             DOUBLE PRECISION,
    country            VARCHAR(255),
    language           VARCHAR(255),
    production_company VARCHAR(255),
    CONSTRAINT fk_movie_genre FOREIGN KEY (genre_id) REFERENCES public.genre (id) ON DELETE CASCADE,
    CONSTRAINT fk_movie_director FOREIGN KEY (director_id) REFERENCES public.director (id) ON DELETE CASCADE
);

CREATE TABLE public.movie_cast
(
    movie_id BIGINT NOT NULL,
    cast_id  BIGINT NOT NULL,
    CONSTRAINT fk_movie_cast_movie FOREIGN KEY (movie_id) REFERENCES public.movie (id) ON DELETE CASCADE,
    CONSTRAINT fk_movie_cast_cast_member FOREIGN KEY (cast_id) REFERENCES public.cast_member (id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, cast_id),
    CONSTRAINT uk_movie_cast UNIQUE (movie_id, cast_id)
);

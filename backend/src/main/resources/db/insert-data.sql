INSERT INTO public.genre (genre_name)
VALUES ('Action'),
       ('Comedy'),
       ('Drama');

INSERT INTO public.director (last_name, first_name, biography)
VALUES ('Nolan', 'Christopher',
        'Acclaimed director known for his work on films like "Inception" and "The Dark Knight"'),
       ('Tarantino', 'Quentin', 'Renowned director known for his unique storytelling and stylized violence');

INSERT INTO public.cast_member (last_name, first_name, biography)
VALUES ('DiCaprio', 'Leonardo', 'Oscar-winning actor known for his roles in "Titanic" and "The Revenant"'),
       ('Pitt', 'Brad',
        'Versatile actor known for his performances in "Fight Club" and "Once Upon a Time in Hollywood"');

INSERT INTO public.movie (title, description, release_date, genre_id, director_id, duration, rating, country, language,
                          production_company)
VALUES ('Inception', 'A mind-bending thriller about stealing information from dreams', '2010-07-16', 1, 1, 148.5, 8.8,
        'United States', 'English', 'Warner Bros.'),
       ('Pulp Fiction', 'A nonlinear crime film intertwining multiple storylines', '1994-10-14', 2, 2, 154.0, 8.9,
        'United States', 'English', 'Miramax Films');

-- Inserting to associative table
WITH movie_data AS (SELECT id
                    FROM public.movie
                    WHERE title = 'Inception'),
     cast_member_ids AS (
INSERT
INTO public.cast_member (last_name, first_name, biography)
VALUES
    ('DiCaprio', 'Leonardo', 'Oscar-winning actor known for his roles in "Titanic" and "The Revenant"'), ('Gordon-Levitt', 'Joseph', 'Versatile actor known for his performances in "Inception" and "500 Days of Summer"')
ON CONFLICT (last_name, first_name) DO
UPDATE SET biography = EXCLUDED.biography
    RETURNING id
    )
INSERT
INTO public.movie_cast (movie_id, cast_id)
SELECT movie_data.id, cast_member_ids.id
FROM movie_data,
     cast_member_ids;

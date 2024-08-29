-- DROP TABLE IF EXISTS Movies;
-- CREATE TABLE if Not EXISTS Movies (
--     id INTEGER PRIMARY KEY,
--     title TEXT NOT NULL,
--     image TEXT,
--     production_year INTEGER,
--     image_url TEXT,
--     meta_score INTEGER,
--     description TEXT,
--     duration TEXT,
--     categories TEXT, -- This will store an array of categories
--     actors TEXT,     -- This will store an array of actors
--     director TEXT,
--     is_saved BOOLEAN DEFAULT false
-- );
-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (1, 'The Godfather', 'godfather.jpg', 1972, 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg', 100, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', '175 minutes', '["Crime", "Drama"]', '["Marlon Brando", "Al Pacino", "James Caan"]', 'Francis Ford Coppola');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (2, 'Pulp Fiction', 'pulp_fiction.jpg', 1994, 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 94, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', '154 minutes', '["Crime", "Drama"]', '["John Travolta", "Uma Thurman", "Samuel L. Jackson"]', 'Quentin Tarantino');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (3, 'The Dark Knight', 'dark_knight.jpg', 2008, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg', 94, 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', '152 minutes', '["Action", "Crime", "Drama"]', '["Christian Bale", "Heath Ledger", "Aaron Eckhart"]', 'Christopher Nolan');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (4, 'Forrest Gump', 'forrest_gump.jpg', 1994, 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg', 82, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.', '142 minutes', '["Drama", "Romance"]', '["Tom Hanks", "Robin Wright", "Gary Sinise"]', 'Robert Zemeckis');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (5, 'Inception', 'inception.jpg', 2010, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg', 87, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', '148 minutes', '["Action", "Adventure", "Sci-Fi"]', '["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page"]', 'Christopher Nolan');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (6, 'Fight Club', 'fight_club.jpg', 1999, 'https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_.jpg', 66, 'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into something much more.', '139 minutes', '["Drama"]', '["Brad Pitt", "Edward Norton", "Helena Bonham Carter"]', 'David Fincher');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (7, 'The Matrix', 'matrix.jpg', 1999, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 73, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', '136 minutes', '["Action", "Sci-Fi"]', '["Keanu Reeves", "Laurence Fishburne", "Carrie-Anne Moss"]', 'Lana Wachowski, Lilly Wachowski');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (8, 'Goodfellas', 'goodfellas.jpg', 1990, 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 90, 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners.', '146 minutes', '["Biography", "Crime", "Drama"]', '["Robert De Niro", "Ray Liotta", "Joe Pesci"]', 'Martin Scorsese');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (9, 'Gladiator', 'gladiator.jpg', 2000, 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 67, 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', '155 minutes', '["Action", "Adventure", "Drama"]', '["Russell Crowe", "Joaquin Phoenix", "Connie Nielsen"]', 'Ridley Scott');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (10, 'Interstellar', 'interstellar.jpg', 2014, 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg', 74, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity survival.', '169 minutes', '["Adventure", "Drama", "Sci-Fi"]', '["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain"]', 'Christopher Nolan');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (11, 'Schindlers List', 'schindlers_list.jpg', 1993, 'https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg', 94, 'In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', '195 minutes', '["Biography", "Drama", "History"]', '["Liam Neeson", "Ralph Fiennes", "Ben Kingsley"]', 'Steven Spielberg');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (12, 'Braveheart', 'braveheart.jpg', 1995, 'https://m.media-amazon.com/images/M/MV5BMzkzMmU0YTYtOWM3My00YzBmLWI0YzctOGYyNTkwMWE5MTJkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg', 68, 'Scottish warrior William Wallace leads his countrymen in a rebellion to free his homeland from the tyranny of King Edward I of England.', '178 minutes', '["Biography", "Drama", "History"]', '["Mel Gibson", "Sophie Marceau", "Patrick McGoohan"]', 'Mel Gibson');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (13, 'The Lord of the Rings: The Fellowship of the Ring', 'lotr_fellowship.jpg', 2001, 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg', 92, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', '178 minutes', '["Action", "Adventure", "Drama"]', '["Elijah Wood", "Ian McKellen", "Orlando Bloom"]', 'Peter Jackson');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (14, 'The Silence of the Lambs', 'silence_of_the_lambs.jpg', 1991, 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 84, 'A young F.B.I. cadet must confide in an incarcerated and manipulative cannibal killer to receive his help in catching another serial killer.', '118 minutes', '["Crime", "Drama", "Thriller"]', '["Jodie Foster", "Anthony Hopkins", "Lawrence A. Bonney"]', 'Jonathan Demme');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (15, 'The Shawshank Redemption', 'shawshank_redemption.jpg', 1994, 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg', 80, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '142 minutes', '["Drama"]', '["Tim Robbins", "Morgan Freeman", "Bob Gunton"]', 'Frank Darabont');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (16, 'Se7en', 'se7en.jpg', 1995, 'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 65, 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', '127 minutes', '["Crime", "Drama", "Mystery"]', '["Morgan Freeman", "Brad Pitt", "Kevin Spacey"]', 'David Fincher');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (17, 'Star Wars: Episode V - The Empire Strikes Back', 'empire_strikes_back.jpg', 1980, 'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 82, 'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda.', '124 minutes', '["Action", "Adventure", "Fantasy"]', '["Mark Hamill", "Harrison Ford", "Carrie Fisher"]', 'Irvin Kershner');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (18, 'The Lion King', 'lion_king.jpg', 1994, 'https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_.jpg', 88, 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', '88 minutes', '["Animation", "Adventure", "Drama"]', '["Matthew Broderick", "Jeremy Irons", "James Earl Jones"]', 'Roger Allers, Rob Minkoff');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (19, 'The Prestige', 'prestige.jpg', 2006, 'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_.jpg', 66, 'After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.', '130 minutes', '["Drama", "Mystery", "Sci-Fi"]', '["Christian Bale", "Hugh Jackman", "Scarlett Johansson"]', 'Christopher Nolan');

-- INSERT INTO Movies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director) VALUES
-- (20, 'The Departed', 'departed.jpg', 2006, 'https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_FMjpg_UX1000_.jpg', 85, 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', '151 minutes', '["Crime", "Drama", "Thriller"]', '["Leonardo DiCaprio", "Matt Damon", "Jack Nicholson"]', 'Martin Scorsese');

-- DROP TABLE IF EXISTS SavedMovies;
-- CREATE TABLE if Not EXISTS SavedMovies (
--     id INTEGER PRIMARY KEY,
--     title TEXT NOT NULL,
--     image TEXT,
--     production_year INTEGER,
--     image_url TEXT,
--     meta_score INTEGER,
--     description TEXT,
--     duration TEXT,
--     categories JSON, -- This will store an array of categories
--     actors JSON,     -- This will store an array of actors
--     director TEXT,
--     is_saved BOOLEAN 
-- );

-- DROP TABLE IF EXISTS Categories;
-- CREATE TABLE IF NOT EXISTS Categories (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     name TEXT UNIQUE NOT NULL
-- );

-- WITH parsed_categories AS (
--     SELECT DISTINCT json_each.value AS category
--     FROM Movies, json_each(Movies.categories)
-- )
-- INSERT OR IGNORE INTO Categories (name)
-- SELECT category
-- FROM parsed_categories;

-- ***************************


DROP TABLE IF EXISTS Actors;
CREATE TABLE IF NOT EXISTS Actors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

WITH parsed_actors AS (
    SELECT DISTINCT json_each.value AS actor
    FROM Movies, json_each(Movies.actors)
)
INSERT OR IGNORE INTO Actors (name)
SELECT actor
FROM parsed_actors;
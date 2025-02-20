CREATE DATABASE university \ c university CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    age_in_million_years INT NOT NULL,
    diameter_in_lightyears NUMERIC NOT NULL,
    is_spiral BOOLEAN NOT NULL
);
-- Create the star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    mass_in_solar_masses NUMERIC NOT NULL,
    is_main_sequence BOOLEAN NOT NULL
);
-- Create the planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    has_life BOOLEAN NOT NULL,
    gravity_in_m_per_s2 NUMERIC NOT NULL
);
-- Create the moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    diameter_in_km INT NOT NULL,
    has_water_ice BOOLEAN NOT NULL
);
-- Create an asteroid table
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    diameter_in_km INT NOT NULL,
    discovered BOOLEAN NOT NULL
);
-- Insert data into galaxy
INSERT INTO galaxy (
        name,
        description,
        age_in_million_years,
        diameter_in_lightyears,
        is_spiral
    )
VALUES (
        'Milky Way',
        'Our home galaxy',
        13600,
        105000,
        TRUE
    ),
    (
        'Andromeda',
        'Nearest spiral galaxy',
        10000,
        220000,
        TRUE
    ),
    (
        'Triangulum',
        'Small member of Local Group',
        8000,
        60000,
        TRUE
    ),
    (
        'Messier 87',
        'Supergiant elliptical galaxy',
        14000,
        120000,
        FALSE
    ),
    (
        'Sombrero',
        'Bright spiral galaxy',
        11000,
        50000,
        TRUE
    ),
    (
        'Whirlpool',
        'Interacting spiral galaxy',
        13000,
        76000,
        TRUE
    );
-- Insert data into star
INSERT INTO star (
        name,
        description,
        galaxy_id,
        mass_in_solar_masses,
        is_main_sequence
    )
VALUES ('Sun', 'Our solar system’s star', 1, 1.0, TRUE),
    (
        'Betelgeuse',
        'Red supergiant in Orion',
        1,
        20.0,
        FALSE
    ),
    (
        'Sirius',
        'Brightest star in the sky',
        1,
        2.1,
        TRUE
    ),
    (
        'Proxima Centauri',
        'Closest known exoplanet host',
        1,
        0.12,
        TRUE
    ),
    (
        'Alpha Centauri A',
        'Part of closest star system',
        1,
        1.1,
        TRUE
    ),
    ('Vega', 'Bright star in Lyra', 1, 2.15, TRUE);
-- Insert data into planet
INSERT INTO planet (
        name,
        description,
        star_id,
        has_life,
        gravity_in_m_per_s2
    )
VALUES ('Earth', 'Our home planet', 1, TRUE, 9.81),
    ('Mars', 'Red planet', 1, FALSE, 3.71),
    ('Venus', 'Hot, thick atmosphere', 1, FALSE, 8.87),
    ('Jupiter', 'Gas giant', 1, FALSE, 24.79),
    ('Saturn', 'Ringed planet', 1, FALSE, 10.44),
    ('Neptune', 'Blue ice giant', 1, FALSE, 11.15),
    (
        'Kepler-22b',
        'Potentially habitable',
        2,
        FALSE,
        12.1
    ),
    (
        'Gliese 581g',
        'Super-Earth exoplanet',
        3,
        FALSE,
        7.8
    ),
    ('HD 209458 b', 'Hot Jupiter', 4, FALSE, 9.5),
    ('55 Cancri e', 'Lava world', 5, FALSE, 22.0),
    (
        'Tau Ceti f',
        'Potentially habitable',
        6,
        FALSE,
        7.0
    ),
    ('Proxima b', 'Closest exoplanet', 4, FALSE, 8.0);
-- Insert data into moon
INSERT INTO moon (
        name,
        description,
        planet_id,
        diameter_in_km,
        has_water_ice
    )
VALUES (
        'Moon',
        'Earth’s natural satellite',
        1,
        3474,
        FALSE
    ),
    ('Phobos', 'Mars’ larger moon', 2, 22, FALSE),
    ('Deimos', 'Mars’ smaller moon', 2, 12, FALSE),
    ('Io', 'Most volcanic moon', 4, 3643, FALSE),
    (
        'Europa',
        'Icy moon with subsurface ocean',
        4,
        3121,
        TRUE
    ),
    (
        'Ganymede',
        'Largest moon in solar system',
        4,
        5268,
        TRUE
    ),
    (
        'Callisto',
        'Heavily cratered moon',
        4,
        4821,
        TRUE
    ),
    (
        'Titan',
        'Only moon with thick atmosphere',
        5,
        5150,
        TRUE
    ),
    (
        'Enceladus',
        'Icy moon with geysers',
        5,
        504,
        TRUE
    ),
    ('Mimas', 'Small, cratered moon', 5, 396, FALSE),
    ('Triton', 'Retrograde orbit moon', 6, 2706, TRUE);
-- Insert data into asteroid
INSERT INTO asteroid (name, description, diameter_in_km, discovered)
VALUES (
        'Ceres',
        'Largest object in asteroid belt',
        939,
        TRUE
    ),
    (
        'Vesta',
        'Second largest in asteroid belt',
        525,
        TRUE
    ),
    ('Eros', 'Near-Earth asteroid', 34, TRUE),
    ('Pallas', 'Third largest asteroid', 512, TRUE),
    (
        'Hygiea',
        'Fourth largest in asteroid belt',
        431,
        TRUE
    );
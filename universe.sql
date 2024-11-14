--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    galaxy_id integer,
    name character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    mass numeric(15,3) NOT NULL,
    distance_from_earth numeric(15,2),
    is_active boolean NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    galaxy_size numeric(10,2) NOT NULL,
    mass numeric(15,3),
    is_observable boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass numeric(8,3),
    radius integer NOT NULL,
    orbit_duration numeric(8,4),
    can_support_life boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    mass numeric(8,2),
    radius integer NOT NULL,
    orbital_period numeric(10,4),
    has_ring_system boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    class character varying(50),
    luminosity numeric(10,2) NOT NULL,
    mass integer NOT NULL,
    surface_temperature integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 1, 'Sagittarius A*', 'Supermassive', 4100000.000, 26000.00, true);
INSERT INTO public.black_hole VALUES (2, 1, 'Cygnus X-1', 'Stellar-mass', 14.800, 6000.00, true);
INSERT INTO public.black_hole VALUES (3, 2, 'M87*', 'Supermassive', 6500000000.000, 53000000.00, true);
INSERT INTO public.black_hole VALUES (4, 2, 'GRO J1655-40', 'Stellar-mass', 7.000, 16000.00, true);
INSERT INTO public.black_hole VALUES (5, 3, 'NGC 1277', 'Supermassive', 1500000000.000, 23000000.00, true);
INSERT INTO public.black_hole VALUES (6, 4, 'NGC 4486B', 'Supermassive', 2000000000.000, 45000000.00, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100.00, 1500.230, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220.00, 2300.450, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60.00, 500.150, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 30.00, 250.500, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 20.00, 125.300, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 80.00, 900.750, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 0.012, 1737, 27.3000, false);
INSERT INTO public.moon VALUES (2, 3, 'Io', 0.015, 1821, 1.7700, false);
INSERT INTO public.moon VALUES (3, 3, 'Europa', 0.008, 1560, 3.5500, false);
INSERT INTO public.moon VALUES (4, 3, 'Ganymede', 0.025, 2634, 7.1500, false);
INSERT INTO public.moon VALUES (5, 3, 'Callisto', 0.018, 2410, 16.6900, false);
INSERT INTO public.moon VALUES (6, 4, 'Titan', 0.023, 2575, 15.9500, false);
INSERT INTO public.moon VALUES (7, 4, 'Enceladus', 0.005, 504, 1.3700, false);
INSERT INTO public.moon VALUES (8, 4, 'Rhea', 0.027, 1528, 4.5200, false);
INSERT INTO public.moon VALUES (9, 5, 'Phobos', 0.000, 11, 0.3000, false);
INSERT INTO public.moon VALUES (10, 5, 'Deimos', 0.000, 6, 1.3000, false);
INSERT INTO public.moon VALUES (11, 6, 'Vesta', 0.000, 17, 0.5000, false);
INSERT INTO public.moon VALUES (12, 7, 'TRAPPIST-1b', 0.001, 200, 2.5000, false);
INSERT INTO public.moon VALUES (13, 7, 'TRAPPIST-1c', 0.002, 350, 3.5000, false);
INSERT INTO public.moon VALUES (14, 8, 'TRAPPIST-1d', 0.003, 450, 4.2000, false);
INSERT INTO public.moon VALUES (15, 9, 'TRAPPIST-1e', 0.004, 500, 4.8000, false);
INSERT INTO public.moon VALUES (16, 10, 'Kepler-22b', 0.002, 450, 5.0000, false);
INSERT INTO public.moon VALUES (17, 11, 'HD 189733 b', 0.004, 1500, 6.0000, false);
INSERT INTO public.moon VALUES (18, 12, '51 Pegasi b', 0.002, 1700, 6.5000, false);
INSERT INTO public.moon VALUES (27, 12, 'Luna', 0.012, 1737, 28.0000, false);
INSERT INTO public.moon VALUES (28, 11, 'Io-2', 0.016, 1900, 2.1000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Terrestrial', 1.00, 6371, 1.0000, false);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'Terrestrial', 0.11, 3389, 1.8800, false);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', 'Gas giant', 317.80, 69911, 11.8600, true);
INSERT INTO public.planet VALUES (4, 1, 'Saturn', 'Gas giant', 95.20, 58232, 29.4600, true);
INSERT INTO public.planet VALUES (5, 1, 'Venus', 'Terrestrial', 0.82, 6052, 0.6150, false);
INSERT INTO public.planet VALUES (6, 1, 'Mercury', 'Terrestrial', 0.06, 2439, 0.2400, false);
INSERT INTO public.planet VALUES (7, 2, 'Kepler-22b', 'Exoplanet', 2.40, 14200, 289.9000, false);
INSERT INTO public.planet VALUES (8, 2, 'Kepler-452b', 'Super-Earth', 5.00, 16000, 385.9000, false);
INSERT INTO public.planet VALUES (9, 3, 'TRAPPIST-1d', 'Exoplanet', 0.33, 4900, 4.0500, false);
INSERT INTO public.planet VALUES (10, 3, 'TRAPPIST-1e', 'Exoplanet', 0.77, 6800, 6.1000, false);
INSERT INTO public.planet VALUES (11, 4, 'HD 189733 b', 'Hot Jupiter', 1.14, 71000, 2.2190, true);
INSERT INTO public.planet VALUES (12, 4, '51 Pegasi b', 'Gas giant', 0.47, 143900, 4.2300, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G-type', 1.00, 1, 5778, true);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'A-type', 25.40, 2, 9940, true);
INSERT INTO public.star VALUES (3, 1, 'Betelgeuse', 'Red supergiant', 120000.00, 20, 3500, false);
INSERT INTO public.star VALUES (4, 2, 'Rigel', 'Blue supergiant', 50000.00, 17, 11000, false);
INSERT INTO public.star VALUES (5, 3, 'Proxima Centauri', 'Red dwarf', 0.00, 1, 3042, true);
INSERT INTO public.star VALUES (6, 3, 'Alpha Centauri A', 'G-type', 1.50, 1, 5790, true);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


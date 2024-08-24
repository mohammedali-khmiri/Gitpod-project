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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    composition text,
    orbital_period_years numeric(7,2),
    is_periodic boolean,
    name character varying(30) NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_mass numeric(15,2),
    number_of_stars integer,
    age_in_million_years integer,
    is_visible boolean,
    has_supermassive_black_hole boolean
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
    name character varying(30) NOT NULL,
    description text,
    moon_diameter integer,
    orbital_period_days integer,
    is_habitable boolean,
    is_tidal_locked boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    planet_orbit_period numeric(10,4),
    number_of_moons integer,
    has_life boolean,
    has_rings boolean,
    star_id integer,
    planet_type character varying(30),
    planet_mass numeric(12,5)
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
    name character varying(30) NOT NULL,
    description text,
    star_mass numeric(12,3),
    star_age integer,
    luminosity integer,
    is_burning boolean,
    is_variable_star boolean,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (7, NULL, 75.32, true, 'Halley Comet');
INSERT INTO public.comet VALUES (8, NULL, 2520.00, false, 'Hale-Bopp');
INSERT INTO public.comet VALUES (9, NULL, 3.30, true, 'Encke Comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 1500000000000.00, 100, 13600, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 1230000000000.00, 100, 10000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, 57000000000.00, 400, 9200, true, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', NULL, 800000000000.00, 800, 13000, true, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', NULL, 100000000000.00, 100, 8000, true, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', NULL, 1000000000000.00, 100, 11000, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3475, 27, false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 22, 0, false, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 12, 1, false, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 3643, 2, false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 3122, 4, false, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5268, 7, false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 4821, 17, false, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, 5150, 16, false, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, 504, 1, false, true, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', NULL, 396, 1, false, true, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', NULL, 1528, 5, false, true, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', NULL, 472, 1, false, true, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', NULL, 1159, 3, false, true, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', NULL, 1169, 4, false, true, 7);
INSERT INTO public.moon VALUES (15, 'Titania', NULL, 1578, 9, false, true, 7);
INSERT INTO public.moon VALUES (16, 'Triton', NULL, 2707, 6, false, true, 8);
INSERT INTO public.moon VALUES (17, 'Proteus', NULL, 418, 1, false, true, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', NULL, 340, 360, false, false, 8);
INSERT INTO public.moon VALUES (19, 'Larissa', NULL, 194, 1, false, true, 8);
INSERT INTO public.moon VALUES (20, 'Proxima b I', NULL, 3500, 11, false, true, 9);
INSERT INTO public.moon VALUES (21, 'Sirius B Moon 1', NULL, 1500, 20, false, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 88.0000, 0, false, false, 1, 'Terrestrial', 0.33000);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 224.7000, 0, false, false, 1, 'Terrestrial', 4.87000);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 365.2000, 1, true, false, 1, 'Terrestrial', 5.97000);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 687.0000, 2, false, false, 1, 'Terrestrial', 0.64200);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 4331.0000, 79, false, true, 1, 'Gas Giant', 1898.00000);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 10747.0000, 83, false, true, 1, 'Gas Giant', 568.00000);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 30589.0000, 27, false, true, 1, 'Ice Giant', 86.80000);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 59800.0000, 14, false, true, 1, 'Ice Giant', 102.00000);
INSERT INTO public.planet VALUES (9, 'Proxima b', NULL, 11.2000, 0, false, false, 2, 'Terrestrial', 1.27000);
INSERT INTO public.planet VALUES (10, 'Sirius B Planet 1', NULL, 1237.0000, 2, false, false, 3, 'Gas Giant', 318.00000);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', NULL, 4125.0000, 12, false, true, 4, 'Gas Giant', 120.00000);
INSERT INTO public.planet VALUES (12, 'Rigel c', NULL, 278.0000, 0, false, false, 5, 'Terrestrial', 0.85000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1.000, 4600, 1, true, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, 0.120, 4500, 0, true, true, 2);
INSERT INTO public.star VALUES (3, 'Sirius', NULL, 2.020, 200, 25, true, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', NULL, 20.000, 10000, 126000, true, true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', NULL, 21.000, 8000, 120000, true, true, 4);
INSERT INTO public.star VALUES (6, 'Vega', NULL, 2.100, 450, 40, true, false, 6);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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


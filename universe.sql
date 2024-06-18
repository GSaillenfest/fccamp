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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(15) NOT NULL,
    diameter_in_lightyear integer,
    number_of_stars integer,
    age_in_billion_years integer
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
    name character varying(15) NOT NULL,
    orbital_period_in_day numeric(5,1),
    planet_id integer NOT NULL,
    diameter_in_km integer
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
    name character varying(15) NOT NULL,
    revolution_in_year numeric(5,1),
    is_a_gas_planet boolean,
    has_water boolean,
    star_id integer NOT NULL
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
    diameter_in_km integer,
    number_of_planet integer,
    name character varying(15) NOT NULL,
    category text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_composition; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_composition (
    star_id integer,
    star_composition_id integer NOT NULL,
    name character varying(20) NOT NULL,
    formula character varying(10),
    pourcentage numeric(4,2)
);


ALTER TABLE public.star_composition OWNER TO freecodecamp;

--
-- Name: star_composition_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_composition_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_composition_element_id_seq OWNER TO freecodecamp;

--
-- Name: star_composition_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_composition_element_id_seq OWNED BY public.star_composition.star_composition_id;


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
-- Name: star_composition star_composition_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_composition ALTER COLUMN star_composition_id SET DEFAULT nextval('public.star_composition_element_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 120000, 400, NULL);
INSERT INTO public.galaxy VALUES (2, 'fake1', NULL, 100, NULL);
INSERT INTO public.galaxy VALUES (3, 'fake2', NULL, 150, NULL);
INSERT INTO public.galaxy VALUES (4, 'fake3', NULL, 200, NULL);
INSERT INTO public.galaxy VALUES (5, 'fake4', NULL, 250, NULL);
INSERT INTO public.galaxy VALUES (6, 'fake5', NULL, 300, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Moon', 27.0, 2, NULL);
INSERT INTO public.moon VALUES (9, 'Deimos', 1.0, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Phobos', 1.0, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Io', NULL, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Europa', NULL, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Ganymede', NULL, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Callisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (28, 'A', NULL, 2, NULL);
INSERT INTO public.moon VALUES (29, 'B', NULL, 2, NULL);
INSERT INTO public.moon VALUES (30, 'C', NULL, 7, NULL);
INSERT INTO public.moon VALUES (31, 'D', NULL, 5, NULL);
INSERT INTO public.moon VALUES (32, 'E', NULL, 12, NULL);
INSERT INTO public.moon VALUES (33, 'F', NULL, 13, NULL);
INSERT INTO public.moon VALUES (34, 'G', NULL, 11, NULL);
INSERT INTO public.moon VALUES (35, 'H', NULL, 12, NULL);
INSERT INTO public.moon VALUES (36, 'J', NULL, 9, NULL);
INSERT INTO public.moon VALUES (37, 'K', NULL, 14, NULL);
INSERT INTO public.moon VALUES (38, 'L', NULL, 14, NULL);
INSERT INTO public.moon VALUES (39, 'M', NULL, 12, NULL);
INSERT INTO public.moon VALUES (40, 'N', NULL, 11, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 1.0, false, true, 2);
INSERT INTO public.planet VALUES (3, 'Mercury', 0.2, false, false, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 0.6, false, false, 2);
INSERT INTO public.planet VALUES (5, 'Mars', 1.9, false, true, 2);
INSERT INTO public.planet VALUES (6, 'Jupiter', 11.9, true, false, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 29.4, true, false, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 84.0, false, false, 2);
INSERT INTO public.planet VALUES (9, 'Neptune', 164.8, false, false, 2);
INSERT INTO public.planet VALUES (11, 'Wolf 1069', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Epsilon Indi A', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (13, 'Tau Ceti', NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES (14, 'Gliese 832', NULL, NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 1392000000, 8, 'sun', 'white dwarf', 1);
INSERT INTO public.star VALUES (3, NULL, NULL, 'Alpha Centauri', NULL, 1);
INSERT INTO public.star VALUES (4, NULL, NULL, 'Ross 154', NULL, 1);
INSERT INTO public.star VALUES (5, NULL, NULL, 'Ross 248', NULL, 1);
INSERT INTO public.star VALUES (6, NULL, NULL, 'Ran', NULL, 1);
INSERT INTO public.star VALUES (7, NULL, NULL, 'Tau Ceti', NULL, 1);


--
-- Data for Name: star_composition; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_composition VALUES (1, 1, 'hydrogen', 'H', 73.46);
INSERT INTO public.star_composition VALUES (1, 2, 'helium', 'He', 24.85);
INSERT INTO public.star_composition VALUES (1, 3, 'oxygen', 'O', 0.77);
INSERT INTO public.star_composition VALUES (1, 4, 'carbon', 'C', 0.29);
INSERT INTO public.star_composition VALUES (1, 5, 'iron', 'Fe', 0.16);
INSERT INTO public.star_composition VALUES (1, 6, 'neon', 'Ne', 0.12);
INSERT INTO public.star_composition VALUES (1, 7, 'nitrogen', 'N', 0.09);
INSERT INTO public.star_composition VALUES (1, 8, 'silicon', 'Si', 0.07);
INSERT INTO public.star_composition VALUES (1, 9, 'magnesium', 'Mg', 0.05);
INSERT INTO public.star_composition VALUES (1, 10, 'sulfur', 'S', 0.04);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_composition_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_composition_element_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: star_composition star_composition_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_composition
    ADD CONSTRAINT star_composition_name_key UNIQUE (name);


--
-- Name: star_composition star_composition_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_composition
    ADD CONSTRAINT star_composition_pkey PRIMARY KEY (star_composition_id);


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


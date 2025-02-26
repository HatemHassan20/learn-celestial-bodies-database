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
    name character varying(20),
    distance_from_eart integer,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    has_life boolean,
    no_of_stars numeric,
    me text NOT NULL
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
    name character varying(20),
    distance_from_eart integer,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    has_life boolean,
    me text NOT NULL,
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
    name character varying(20),
    distance_from_eart integer,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    has_life boolean,
    me text NOT NULL,
    star_id integer
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
-- Name: planet_relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_relation (
    name character varying(30) NOT NULL,
    planet_relation_id integer NOT NULL,
    me character varying(20) NOT NULL
);


ALTER TABLE public.planet_relation OWNER TO freecodecamp;

--
-- Name: planet_relation_planet_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_relation_planet_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_relation_planet_relation_id_seq OWNER TO freecodecamp;

--
-- Name: planet_relation_planet_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_relation_planet_relation_id_seq OWNED BY public.planet_relation.planet_relation_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    distance_from_eart integer,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    has_life boolean,
    galaxy_id integer,
    me text NOT NULL
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
-- Name: planet_relation planet_relation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_relation ALTER COLUMN planet_relation_id SET DEFAULT nextval('public.planet_relation_planet_relation_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milk way', NULL, NULL, NULL, NULL, NULL, NULL, 'hello');
INSERT INTO public.galaxy VALUES (3, 'milk way2', NULL, NULL, NULL, NULL, NULL, NULL, 'helloo');
INSERT INTO public.galaxy VALUES (4, 'milk way3', NULL, NULL, NULL, NULL, NULL, NULL, 'hellooo');
INSERT INTO public.galaxy VALUES (5, 'milk way4', NULL, NULL, NULL, NULL, NULL, NULL, 'helloooo');
INSERT INTO public.galaxy VALUES (6, 'milk way5', NULL, NULL, NULL, NULL, NULL, NULL, 'hellooooo');
INSERT INTO public.galaxy VALUES (7, 'milk way6', NULL, NULL, NULL, NULL, NULL, NULL, 'helloooooo');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', NULL, NULL, NULL, NULL, NULL, 'H', 1);
INSERT INTO public.moon VALUES (2, 'moon1', NULL, NULL, NULL, NULL, NULL, 'HH', 1);
INSERT INTO public.moon VALUES (3, 'moon2', NULL, NULL, NULL, NULL, NULL, 'HHH', 1);
INSERT INTO public.moon VALUES (4, 'moon3', NULL, NULL, NULL, NULL, NULL, 'HHHH', 1);
INSERT INTO public.moon VALUES (5, 'moon4', NULL, NULL, NULL, NULL, NULL, 'HHHHH', 1);
INSERT INTO public.moon VALUES (6, 'moon5', NULL, NULL, NULL, NULL, NULL, 'm', 1);
INSERT INTO public.moon VALUES (7, 'moon6', NULL, NULL, NULL, NULL, NULL, 'mm', 1);
INSERT INTO public.moon VALUES (8, 'moon7', NULL, NULL, NULL, NULL, NULL, 'mmm', 1);
INSERT INTO public.moon VALUES (9, 'moon8', NULL, NULL, NULL, NULL, NULL, 'mmmm', 1);
INSERT INTO public.moon VALUES (10, 'moon9', NULL, NULL, NULL, NULL, NULL, 'mmmmm', 1);
INSERT INTO public.moon VALUES (11, 'moon10', NULL, NULL, NULL, NULL, NULL, 'n', 1);
INSERT INTO public.moon VALUES (12, 'moon11', NULL, NULL, NULL, NULL, NULL, 'nn', 1);
INSERT INTO public.moon VALUES (13, 'moon12', NULL, NULL, NULL, NULL, NULL, 'nnn', 1);
INSERT INTO public.moon VALUES (14, 'moon13', NULL, NULL, NULL, NULL, NULL, 'nnnn', 1);
INSERT INTO public.moon VALUES (15, 'moon14', NULL, NULL, NULL, NULL, NULL, 'nnnnn', 1);
INSERT INTO public.moon VALUES (16, 'moon15', NULL, NULL, NULL, NULL, NULL, 'nnnnnn', 1);
INSERT INTO public.moon VALUES (17, 'moon16', NULL, NULL, NULL, NULL, NULL, 'k', 1);
INSERT INTO public.moon VALUES (18, 'moon17', NULL, NULL, NULL, NULL, NULL, 'kk', 1);
INSERT INTO public.moon VALUES (19, 'moon18', NULL, NULL, NULL, NULL, NULL, 'kkk', 1);
INSERT INTO public.moon VALUES (20, 'moon19', NULL, NULL, NULL, NULL, NULL, 'kkkk', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, NULL, NULL, 'HH', 4);
INSERT INTO public.planet VALUES (2, 'Earth1', NULL, NULL, NULL, NULL, NULL, 'HHH', 4);
INSERT INTO public.planet VALUES (3, 'Earth2', NULL, NULL, NULL, NULL, NULL, 'HHHH', 4);
INSERT INTO public.planet VALUES (4, 'Earth3', NULL, NULL, NULL, NULL, NULL, 'M', 4);
INSERT INTO public.planet VALUES (5, 'Earth4', NULL, NULL, NULL, NULL, NULL, 'MM', 4);
INSERT INTO public.planet VALUES (6, 'Earth5', NULL, NULL, NULL, NULL, NULL, 'MMM', 4);
INSERT INTO public.planet VALUES (7, 'Earth6', NULL, NULL, NULL, NULL, NULL, 'N', 4);
INSERT INTO public.planet VALUES (8, 'Earth7', NULL, NULL, NULL, NULL, NULL, 'NN', 4);
INSERT INTO public.planet VALUES (9, 'Earth8', NULL, NULL, NULL, NULL, NULL, 'NNN', 4);
INSERT INTO public.planet VALUES (10, 'Earth9', NULL, NULL, NULL, NULL, NULL, 'K', 4);
INSERT INTO public.planet VALUES (11, 'Earth10', NULL, NULL, NULL, NULL, NULL, 'KK', 4);
INSERT INTO public.planet VALUES (12, 'Earth11', NULL, NULL, NULL, NULL, NULL, 'KKK', 4);


--
-- Data for Name: planet_relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_relation VALUES ('1', 1, 'hhh');
INSERT INTO public.planet_relation VALUES ('2', 2, 'hh');
INSERT INTO public.planet_relation VALUES ('3', 3, 'h');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'sun', NULL, NULL, NULL, NULL, NULL, 1, 'hello');
INSERT INTO public.star VALUES (5, 'sunn', NULL, NULL, NULL, NULL, NULL, 1, 'He');
INSERT INTO public.star VALUES (6, 'sunnnn', NULL, NULL, NULL, NULL, NULL, 1, 'me');
INSERT INTO public.star VALUES (8, 'su', NULL, NULL, NULL, NULL, NULL, 1, 'n');
INSERT INTO public.star VALUES (9, 's', NULL, NULL, NULL, NULL, NULL, 1, 'm');
INSERT INTO public.star VALUES (10, 'sunnnnn', NULL, NULL, NULL, NULL, NULL, 1, 'e');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_relation_planet_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_relation_planet_relation_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_me_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_me_key UNIQUE (me);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_me_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_me_key UNIQUE (me);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_me_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_me_key UNIQUE (me);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_relation planet_relation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_relation
    ADD CONSTRAINT planet_relation_name_key UNIQUE (name);


--
-- Name: planet_relation planet_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_relation
    ADD CONSTRAINT planet_relation_pkey PRIMARY KEY (planet_relation_id);


--
-- Name: star star_me_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_me_key UNIQUE (me);


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


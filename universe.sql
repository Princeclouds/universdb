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
    name character varying(100) NOT NULL,
    orbit_radius integer,
    tail_length numeric(6,2),
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_million_years integer NOT NULL,
    diameter_in_light_years integer,
    distance_from_earth numeric(12,2),
    is_visible boolean NOT NULL,
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
    planet_id integer,
    name character varying(100) NOT NULL,
    radius integer,
    is_geologically_active boolean,
    composition text
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
    star_id integer,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    has_life boolean,
    gravity numeric(5,2),
    composition text
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
    galaxy_id integer,
    name character varying(100) NOT NULL,
    temperature integer NOT NULL,
    mass numeric(8,4),
    is_solar_system boolean NOT NULL
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

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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

INSERT INTO public.comet VALUES (1, 'Halley', 18, 100.00, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1000, 500.50, true);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 26, 90.20, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 105000, 0.00, true, 'Spiral galaxy containing our solar system');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000, 2537000.00, true, 'Neighboring galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 60000, 3000000.00, true, 'Third-largest galaxy in our local group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 9200, 50000, 29000000.00, false, 'Lenticular galaxy in the Virgo constellation');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 4100, 60000, 23000000.00, true, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 13600, 170000, 21200000.00, true, 'Face-on spiral galaxy in the Ursa Major constellation');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 1737, true, 'Silicate rock and ice');
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 11, false, 'Carbon-rich rock');
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 6, false, 'Carbonaceous rock');
INSERT INTO public.moon VALUES (4, 3, 'Venusian Moon 1', 200, false, 'Rocky iron core');
INSERT INTO public.moon VALUES (5, 4, 'Moon X1', 150, false, 'Ice and rock');
INSERT INTO public.moon VALUES (6, 4, 'Moon X2', 300, false, 'Rocky dust and iron');
INSERT INTO public.moon VALUES (7, 5, 'Alpha 1 Moon 1', 500, true, 'Active volcanoes');
INSERT INTO public.moon VALUES (8, 6, 'Alpha 2 Moon 1', 100, false, 'Sulfur-rich surface');
INSERT INTO public.moon VALUES (9, 7, 'Beta Prime Moon 1', 900, true, 'Frozen ammonia');
INSERT INTO public.moon VALUES (10, 7, 'Beta Prime Moon 2', 200, false, 'Cracked ice');
INSERT INTO public.moon VALUES (11, 8, 'Gamma One Moon', 300, false, 'Frozen helium');
INSERT INTO public.moon VALUES (12, 9, 'Gamma Two Moon 1', 250, false, 'Carbon dioxide ice');
INSERT INTO public.moon VALUES (13, 10, 'Delta Moon 1', 100, false, 'Methane ice');
INSERT INTO public.moon VALUES (14, 11, 'Epsilon Moon 1', 150, true, 'Organic compounds and water');
INSERT INTO public.moon VALUES (15, 11, 'Epsilon Moon 2', 50, false, 'Primordial sludge');
INSERT INTO public.moon VALUES (16, 12, 'Zeta Moon 1', 400, false, 'Sulfur compounds');
INSERT INTO public.moon VALUES (17, 12, 'Zeta Moon 2', 100, true, 'Yellowish acidic surface');
INSERT INTO public.moon VALUES (18, 12, 'Zeta Moon 3', 150, false, 'Sulfur-rich rock');
INSERT INTO public.moon VALUES (19, 5, 'Gamma One Moon 2', 350, false, 'Frozen nitrogen');
INSERT INTO public.moon VALUES (20, 5, 'Gamma One Moon 3', 120, true, 'Active geysers and ice');
INSERT INTO public.moon VALUES (21, 6, 'Delta Moon 2', 180, false, 'Rocky crust with thin atmosphere');
INSERT INTO public.moon VALUES (22, 7, 'Beta Prime Moon 3', 250, false, 'Crater-filled surface');
INSERT INTO public.moon VALUES (23, 8, 'Gamma Two Moon 2', 90, false, 'Water ice and organic compounds');
INSERT INTO public.moon VALUES (24, 9, 'Gamma Two Moon 3', 400, true, 'Iron-rich core with lava plains');
INSERT INTO public.moon VALUES (25, 10, 'Delta Moon 3', 230, true, 'Volcanically active');
INSERT INTO public.moon VALUES (26, 11, 'Epsilon Moon 3', 310, false, 'Silicate and water ice mixture');
INSERT INTO public.moon VALUES (27, 12, 'Zeta Moon 4', 220, true, 'Active sulfuric geysers');
INSERT INTO public.moon VALUES (28, 12, 'Zeta Moon 5', 140, false, 'Smooth plains of ice');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 12742, true, 1.00, 'Silicate rock with water');
INSERT INTO public.planet VALUES (2, 1, 'Mars', 6779, false, 0.38, 'Rock and iron oxide dust');
INSERT INTO public.planet VALUES (3, 1, 'Venus', 12104, false, 0.90, 'Thick sulfuric acid clouds');
INSERT INTO public.planet VALUES (4, 2, 'Planet X', 14000, false, 0.50, 'Unknown gases and dust');
INSERT INTO public.planet VALUES (5, 3, 'Alpha 1', 15000, false, 1.20, 'Methane-heavy atmosphere');
INSERT INTO public.planet VALUES (6, 3, 'Alpha 2', 8000, false, 0.80, 'Hydrogen-based atmosphere');
INSERT INTO public.planet VALUES (7, 4, 'Beta Prime', 17000, true, 1.40, 'Ammonia clouds and metallic hydrogen');
INSERT INTO public.planet VALUES (8, 5, 'Gamma One', 3000, false, 0.60, 'Helium-rich gases');
INSERT INTO public.planet VALUES (9, 5, 'Gamma Two', 9000, false, 0.70, 'Argon and oxygen');
INSERT INTO public.planet VALUES (10, 6, 'Delta', 2000, false, 0.30, 'Methane and trace gases');
INSERT INTO public.planet VALUES (11, 6, 'Epsilon', 8000, true, 0.80, 'Primordial soup of organic compounds');
INSERT INTO public.planet VALUES (12, 6, 'Zeta', 10000, false, 0.90, 'Volcanic surface with sulfur');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 5778, 1.0000, true);
INSERT INTO public.star VALUES (2, 2, 'Sirius', 9940, 2.0630, false);
INSERT INTO public.star VALUES (3, 3, 'Betelgeuse', 3500, 11.6000, false);
INSERT INTO public.star VALUES (4, 4, 'Rigel', 12100, 18.0000, false);
INSERT INTO public.star VALUES (5, 5, 'Vega', 9602, 2.1350, false);
INSERT INTO public.star VALUES (6, 6, 'Proxima Centauri', 3042, 0.1230, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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


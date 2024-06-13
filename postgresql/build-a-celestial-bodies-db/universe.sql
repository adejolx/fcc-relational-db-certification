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
    name character varying(40) NOT NULL,
    shape text,
    number_of_stars integer,
    age integer,
    size numeric,
    has_black_hole boolean,
    has_dust_lanes boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    name character varying(40) NOT NULL,
    galaxy_types_id integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_tidally_locked boolean,
    is_volcanic boolean,
    diameter_in_km integer,
    number_of_craters integer,
    mineral_composition text,
    orbital_radius numeric,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_life boolean,
    has_atmosphere boolean,
    atmospheric_composition text,
    number_of_moons integer,
    diameter numeric,
    orbital_period integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    name character varying(40) NOT NULL,
    planet_types_id integer NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    temperature numeric,
    is_binary_star boolean,
    constellation text,
    luminosity integer,
    radius integer,
    is_variable_star boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 1360, 105700, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 1000, 220000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 4000, 1230, 60000, true, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 16000, 1000, 76000, true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 800000, 11700, 49000, true, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 1200000, 150, 120000, true, false);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Elliptical', 1000000, 1340, 60000, true, true);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', 'Barred Spiral', 2000, 135, 110000, true, true);
INSERT INTO public.galaxy VALUES (9, 'IC 1101', 'Elliptical', 1000000, 1200, 600000, true, true);
INSERT INTO public.galaxy VALUES (10, 'Messier 81', 'Spiral', 25000000, 1100, 90000, true, true);
INSERT INTO public.galaxy VALUES (11, 'NGC 4414', 'Spiral', 10000000, 10600, 56000, true, false);
INSERT INTO public.galaxy VALUES (12, 'Black Eye', 'Spiral', 800000, 120000, 70000, true, true);
INSERT INTO public.galaxy VALUES (13, 'Messier 82', 'Irregular', 30000, 12500, 37000, true, true);
INSERT INTO public.galaxy VALUES (14, 'Messier 101', 'Spiral', 100000, 14000, 170000, true, true);
INSERT INTO public.galaxy VALUES (15, 'Sculptor', 'Dwarf Elliptical', 10000, 10000, 3000, true, false);
INSERT INTO public.galaxy VALUES (16, 'Carina', 'Dwarf Spheroidal', 700000, 1300, 2000, false, true);
INSERT INTO public.galaxy VALUES (17, 'Large Magellanic Cloud', 'Irregular', 30000, 13700, 14500, true, true);
INSERT INTO public.galaxy VALUES (18, 'Small Magellanic Cloud', 'Irregular', 300000, 13600, 7000, true, true);
INSERT INTO public.galaxy VALUES (19, 'Leo I', 'Dwarf Spheroidal', 5000, 1400000, 1900, false, false);
INSERT INTO public.galaxy VALUES (20, 'Canis Major Overdensity', 'Dwarf Irregular', 100000, 117000, 1900, true, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES ('Spiral', 1, 'A galaxy with a prominent spiral structure and arms winding out from a central bulge.');
INSERT INTO public.galaxy_types VALUES ('Elliptical', 2, 'A type of galaxy having an ellipsoidal shape and a smooth, nearly featureless brightness profile.');
INSERT INTO public.galaxy_types VALUES ('Irregular', 3, 'A galaxy that does not have a distinct regular shape, unlike a spiral or an elliptical galaxy.');
INSERT INTO public.galaxy_types VALUES ('Lenticular', 4, 'A galaxy type that has a central bulge and a disk-like structure but lacks the spiral arms of a spiral galaxy.');
INSERT INTO public.galaxy_types VALUES ('Dwarf Elliptical', 5, 'A smaller version of elliptical galaxies, often found in clusters and groups.');
INSERT INTO public.galaxy_types VALUES ('Dwarf Irregular', 6, 'A smaller version of irregular galaxies, typically lacking structure.');
INSERT INTO public.galaxy_types VALUES ('Barred Spiral', 7, 'A spiral galaxy with a central bar-shaped structure composed of stars.');
INSERT INTO public.galaxy_types VALUES ('Ring', 8, 'A type of galaxy with a ring-like appearance, often formed by a collision with another galaxy.');
INSERT INTO public.galaxy_types VALUES ('Peculiar', 9, 'A galaxy that has an unusual size, shape, or composition, often due to interactions with other galaxies.');
INSERT INTO public.galaxy_types VALUES ('Starburst', 10, 'A galaxy experiencing an exceptionally high rate of star formation.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, false, 3474, 3000, 'Silicates', 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', true, false, 22, 14000, 'Carbonaceous', 9377, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', true, false, 12, 1000, 'Carbonaceous', 23460, 3);
INSERT INTO public.moon VALUES (4, 'Europa', true, false, 3122, 100, 'Water Ice', 671100, 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, false, 5268, 200, 'Water Ice and Silicates', 1070400, 5);
INSERT INTO public.moon VALUES (6, 'Io', true, true, 3643, 400, 'Sulfur and Silicates', 421700, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', true, false, 4820, 2000, 'Water Ice and Rock', 1882700, 7);
INSERT INTO public.moon VALUES (8, 'Titan', true, false, 5150, 600, 'Water Ice and Hydrocarbons', 1221870, 8);
INSERT INTO public.moon VALUES (9, 'Rhea', true, false, 1528, 800, 'Water Ice', 527040, 9);
INSERT INTO public.moon VALUES (10, 'Iapetus', true, false, 1469, 1300, 'Water Ice', 3560800, 10);
INSERT INTO public.moon VALUES (11, 'Dione', true, false, 1123, 300, 'Water Ice and Silicates', 377420, 11);
INSERT INTO public.moon VALUES (12, 'Enceladus', true, true, 504, 100, 'Water Ice', 237948, 12);
INSERT INTO public.moon VALUES (13, 'Miranda', true, false, 471, 200, 'Water Ice and Rock', 129390, 13);
INSERT INTO public.moon VALUES (14, 'Ariel', true, false, 1162, 150, 'Water Ice and Rock', 191020, 14);
INSERT INTO public.moon VALUES (15, 'Umbriel', true, false, 1169, 500, 'Water Ice and Rock', 266300, 15);
INSERT INTO public.moon VALUES (16, 'Titania', true, false, 1577, 300, 'Water Ice and Rock', 436300, 16);
INSERT INTO public.moon VALUES (17, 'Oberon', true, false, 1523, 600, 'Water Ice and Rock', 583520, 17);
INSERT INTO public.moon VALUES (18, 'Triton', true, true, 2707, 400, 'Water Ice and Nitrogen Ice', 354800, 18);
INSERT INTO public.moon VALUES (19, 'Charon', true, false, 1212, 100, 'Water Ice and Ammonia', 19571, 19);
INSERT INTO public.moon VALUES (20, 'Nix', true, false, 50, 50, 'Water Ice', 48708, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 'N/A', 0, 4879, 88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 'CO2, N2', 0, 12104, 225, 2);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 'N2, O2', 1, 12742, 365, 3);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 'CO2, N2', 2, 6779, 687, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 'H2, He', 79, 139820, 4333, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 'H2, He', 82, 116460, 10759, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 'H2, He, CH4', 27, 50724, 30687, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 'H2, He, CH4', 14, 49244, 60190, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 'N2, CH4', 5, 2376, 90560, 9);
INSERT INTO public.planet VALUES (10, 'PlanetX', false, true, 'Unknown', 0, 5000, 120000, 10);
INSERT INTO public.planet VALUES (11, 'Alpha', true, true, 'H2, O2', 1, 13000, 400, 11);
INSERT INTO public.planet VALUES (12, 'Beta', false, false, 'CO2, N2', 2, 20000, 800, 12);
INSERT INTO public.planet VALUES (13, 'Gamma', true, false, 'N2, H2', 0, 15000, 600, 13);
INSERT INTO public.planet VALUES (14, 'Delta', false, true, 'H2O, CO2', 4, 10000, 300, 14);
INSERT INTO public.planet VALUES (15, 'Epsilon', true, true, 'O2, N2', 1, 16000, 365, 15);
INSERT INTO public.planet VALUES (16, 'Zeta', false, true, 'H2, He', 0, 20000, 500, 16);
INSERT INTO public.planet VALUES (17, 'Eta', true, true, 'CO2, CH4', 1, 14000, 700, 17);
INSERT INTO public.planet VALUES (18, 'Theta', false, false, 'N2, Ar', 0, 17000, 900, 18);
INSERT INTO public.planet VALUES (19, 'Iota', true, true, 'H2O, O2', 3, 18000, 1000, 19);
INSERT INTO public.planet VALUES (20, 'Kappa', false, true, 'H2, N2', 1, 21000, 1100, 20);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES ('Terrestrial', 1, 'Rocky planets with solid surfaces, typically smaller than gas giants.');
INSERT INTO public.planet_types VALUES ('Gas Giant', 2, 'Large planets composed mostly of gases such as hydrogen and helium, with a relatively small rocky core.');
INSERT INTO public.planet_types VALUES ('Ice Giant', 3, 'Large planets with a core of rock and metals surrounded by a thick mantle of water, ammonia, and methane ices.');
INSERT INTO public.planet_types VALUES ('Dwarf Planet', 4, 'Celestial bodies that orbit the sun and have sufficient mass for their self-gravity to overcome rigid body forces, but have not cleared their orbital region of other debris.');
INSERT INTO public.planet_types VALUES ('Super-Earth', 5, 'Exoplanets with masses higher than Earth’s but substantially below those of the Solar System’s gas giants.');
INSERT INTO public.planet_types VALUES ('Hot Jupiter', 6, 'Gas giants that orbit very close to their parent stars, resulting in very high surface temperatures.');
INSERT INTO public.planet_types VALUES ('Ocean Planet', 7, 'Hypothetical type of planet with a surface completely covered by an ocean of water.');
INSERT INTO public.planet_types VALUES ('Desert Planet', 8, 'Planets with extremely arid climates, having very little surface water.');
INSERT INTO public.planet_types VALUES ('Carbon Planet', 9, 'Hypothetical type of planet with a composition where carbon compounds are dominant.');
INSERT INTO public.planet_types VALUES ('Puffy Planet', 10, 'Gas giants with large radii and very low densities.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 5790.0, true, 'Centaurus', 1, 865000, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 3500.0, false, 'Orion', 126000, 1200000, true, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 9940.0, true, 'Canis Major', 25, 1710000, false, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 3042.0, false, 'Centaurus', 0, 210000, false, 4);
INSERT INTO public.star VALUES (5, 'Vega', 9602.0, false, 'Lyra', 40, 2380000, false, 5);
INSERT INTO public.star VALUES (6, 'Rigel', 12100.0, true, 'Orion', 120000, 8700000, true, 6);
INSERT INTO public.star VALUES (7, 'Polaris', 6015.0, false, 'Ursa Minor', 2200, 4500000, true, 7);
INSERT INTO public.star VALUES (8, 'Aldebaran', 3910.0, false, 'Taurus', 500, 6200000, false, 8);
INSERT INTO public.star VALUES (9, 'Arcturus', 4286.0, false, 'Boötes', 170, 1820000, false, 9);
INSERT INTO public.star VALUES (10, 'Spica', 22400.0, true, 'Virgo', 15000, 7350000, false, 10);
INSERT INTO public.star VALUES (11, 'Antares', 3500.0, true, 'Scorpius', 57000, 8830000, true, 11);
INSERT INTO public.star VALUES (12, 'Betelgeuse49', 3590.0, false, 'Orion', 118000, 1150000, true, 12);
INSERT INTO public.star VALUES (13, 'Altair', 7550.0, false, 'Aquila', 11, 1670000, false, 13);
INSERT INTO public.star VALUES (14, 'Fomalhaut', 8590.0, false, 'Piscis Austrinus', 16, 1860000, false, 14);
INSERT INTO public.star VALUES (15, 'Deneb', 8525.0, false, 'Cygnus', 196000, 20300000, true, 15);
INSERT INTO public.star VALUES (16, 'Canopus', 7350.0, false, 'Carina', 15100, 7120000, true, 16);
INSERT INTO public.star VALUES (17, 'Achernar', 15000.0, true, 'Eridanus', 3150, 11500000, false, 17);
INSERT INTO public.star VALUES (18, 'Procyon', 6530.0, true, 'Canis Minor', 7, 2480000, false, 18);
INSERT INTO public.star VALUES (19, 'Regulus', 12460.0, true, 'Leo', 360, 3520000, false, 19);
INSERT INTO public.star VALUES (20, 'Mimosa', 25000.0, true, 'Crux', 34000, 12300000, true, 20);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 20, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 10, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 20, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 10, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 20, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


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
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


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


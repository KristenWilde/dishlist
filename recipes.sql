--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: kristen
--

CREATE TABLE ingredients (
    ingredient text NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE ingredients OWNER TO kristen;

--
-- Name: recipes; Type: TABLE; Schema: public; Owner: kristen
--

CREATE TABLE recipes (
    id integer NOT NULL,
    title text NOT NULL,
    directions text NOT NULL
);


ALTER TABLE recipes OWNER TO kristen;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: kristen
--

CREATE SEQUENCE recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_id_seq OWNER TO kristen;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kristen
--

ALTER SEQUENCE recipes_id_seq OWNED BY recipes.id;


--
-- Name: recipes_tags; Type: TABLE; Schema: public; Owner: kristen
--

CREATE TABLE recipes_tags (
    recipe_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE recipes_tags OWNER TO kristen;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: kristen
--

CREATE TABLE tags (
    tag text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE tags OWNER TO kristen;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: kristen
--

CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_id_seq OWNER TO kristen;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kristen
--

ALTER SEQUENCE tags_tag_id_seq OWNED BY tags.id;


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: kristen
--

ALTER TABLE ONLY recipes ALTER COLUMN id SET DEFAULT nextval('recipes_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: kristen
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_tag_id_seq'::regclass);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: kristen
--

COPY ingredients (ingredient, recipe_id) FROM stdin;
1 1/2 cups flour	1
1 cup rolled oats	1
1/2 cut sugar	1
2 tsp baking powder	1
1 tsp baking soda	1
1/2 tsp salt	1
1 egg	1
3/4 cup milk	1
1/3 cup vegetable oil	1
1/2 tsp vanilla extract	1
3 mashed bananas	1
1 1/3 cups sugar	2
1 cup butter	2
2 eggs	2
2 3/4 cups flour	2
2 tsp cream of tartar	2
1 tsp baking soda	2
1/4 tsp salt	2
2 tsp cinnamon	2
1 egg	3
1/4 cup milk	3
1 tsp vanilla	3
1/2 tsp cinnamon	3
sliced bread	3
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: kristen
--

COPY recipes (id, title, directions) FROM stdin;
1	Banana Oat Muffins	Combine dry ingredients and mix thoroughly. Combine and mix other ingredients in separate bowl. Combine both mixtures and stir gently until batter is moist but still lumpy. Pour into 12 muffin cups (greased or lined) and bake at 400 degrees for 18-20 min.
2	Snickerdoodles	Heat oven to 400. Mix the cinnamon and 1/4 cup sugar in a small bowl. Cream the rest of the sugar with the butter, beat in eggs, and stir in all other ingredients. Shape dough into balls and roll in cinnamon sugar. Bake on ungreased cookie sheet, 8-10 minutes or until set. Cool on wire rack.
3	French Toast	Mix all ingredients together. Dip bread in mixture and brown on both sides in buttered skillet
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kristen
--

SELECT pg_catalog.setval('recipes_id_seq', 3, true);


--
-- Data for Name: recipes_tags; Type: TABLE DATA; Schema: public; Owner: kristen
--

COPY recipes_tags (recipe_id, tag_id) FROM stdin;
1	1
1	2
2	3
2	2
3	1
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: kristen
--

COPY tags (tag, id) FROM stdin;
breakfast	1
baking	2
cookies	3
beverage	4
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kristen
--

SELECT pg_catalog.setval('tags_tag_id_seq', 3, true);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: kristen
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: kristen
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kristen
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE;


--
-- Name: recipes_tags recipes_tags_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kristen
--

ALTER TABLE ONLY recipes_tags
    ADD CONSTRAINT recipes_tags_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE;


--
-- Name: recipes_tags recipes_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kristen
--

ALTER TABLE ONLY recipes_tags
    ADD CONSTRAINT recipes_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


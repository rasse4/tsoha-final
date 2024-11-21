--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

--
-- Name: myscehma; Type: SCHEMA; Schema: -; Owner: rasse
--

CREATE SCHEMA myscehma;


ALTER SCHEMA myscehma OWNER TO rasse;

--
-- Name: rasse3; Type: SCHEMA; Schema: -; Owner: rasse
--

CREATE SCHEMA rasse3;


ALTER SCHEMA rasse3 OWNER TO rasse;

--
-- Name: schema; Type: SCHEMA; Schema: -; Owner: rasse
--

CREATE SCHEMA schema;


ALTER SCHEMA schema OWNER TO rasse;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: rasse
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    rarity character varying(60)
);


ALTER TABLE public.ingredient OWNER TO rasse;

--
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: rasse
--

CREATE SEQUENCE public.ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_id_seq OWNER TO rasse;

--
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rasse
--

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;


--
-- Name: method; Type: TABLE; Schema: public; Owner: rasse
--

CREATE TABLE public.method (
    methodid integer NOT NULL,
    method character varying(4000),
    notes character varying(512),
    preptime integer,
    cooktime integer
);


ALTER TABLE public.method OWNER TO rasse;

--
-- Name: rec_ing; Type: TABLE; Schema: public; Owner: rasse
--

CREATE TABLE public.rec_ing (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    amount character varying(100)
);


ALTER TABLE public.rec_ing OWNER TO rasse;

--
-- Name: recipe; Type: TABLE; Schema: public; Owner: rasse
--

CREATE TABLE public.recipe (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.recipe OWNER TO rasse;

--
-- Name: recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: rasse
--

CREATE SEQUENCE public.recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_id_seq OWNER TO rasse;

--
-- Name: recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rasse
--

ALTER SEQUENCE public.recipe_id_seq OWNED BY public.recipe.id;


--
-- Name: styles_recipe; Type: TABLE; Schema: public; Owner: rasse
--

CREATE TABLE public.styles_recipe (
    style_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.styles_recipe OWNER TO rasse;

--
-- Name: stylesandorigins; Type: TABLE; Schema: public; Owner: rasse
--

CREATE TABLE public.stylesandorigins (
    id integer NOT NULL,
    name character varying(255),
    infotype character varying(512),
    notes character varying(1028)
);


ALTER TABLE public.stylesandorigins OWNER TO rasse;

--
-- Name: stylesandorigins_id_seq; Type: SEQUENCE; Schema: public; Owner: rasse
--

CREATE SEQUENCE public.stylesandorigins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stylesandorigins_id_seq OWNER TO rasse;

--
-- Name: stylesandorigins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rasse
--

ALTER SEQUENCE public.stylesandorigins_id_seq OWNED BY public.stylesandorigins.id;


--
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);


--
-- Name: recipe id; Type: DEFAULT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.recipe ALTER COLUMN id SET DEFAULT nextval('public.recipe_id_seq'::regclass);


--
-- Name: stylesandorigins id; Type: DEFAULT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.stylesandorigins ALTER COLUMN id SET DEFAULT nextval('public.stylesandorigins_id_seq'::regclass);


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: rasse
--

COPY public.ingredient (id, name, type, rarity) FROM stdin;
102	Lettuce	vegetable	very common
103	Water	water	very common
104	Brown sugar	sweetener	very common
105	Baking powder	powder	very common
106	Onion-potato mix	frozen	quite common
107	Fish broth	broth	common
3	Provencal herb mix	dry spices	very common
4	Garlic powder	dry spices	very common
6	Table salt	dry spices	very common
7	Ground black pepper	dry spices	very common
2	Canned Tuna (oil)	canned	very common
5	Dried spaghetti	dried food	very common
1	Tomato ketchup	sauce	very common
8	Sweet chili sauce	sauce	common
9	Kaffir lime leaf	dried food	common
10	Garlic	vegetable	very common
12	Sesame oil	oil	quite common
13	Boneless chicken thigs	meat	common
14	Minced chicken	meat	common
15	Chicken fillet pieces	meat	common
16	Ginger	root	common
17	Curry powder	dry spices	very common
18	Heavy cream	dairy	very common
19	Blackcurrant jelly	jellys	common
20	Corn starch	flours	very common
21	Long grain rice	dry foods	very common
22	Medium-wide rice noodles	dry foods	common
23	Butter	fat	very common
24	Chicken broth	sauce	common
25	Lemon juice	fresh juice	very common
26	White pepper	dry spices	very common
27	Cabbage	legume	very common
28	Minced Beef	meat	very common
29	Minced Lamb	meat	common
30	Onion	legume	very common
31	Syrup	sweetener	common
32	Beef Bullion	broth	very common
33	Milk	drink	very common
34	Eggs	eggs	very common
35	Macheroni	pasta	very common
36	Beef	meat	common
37	Pork	meat	common
38	Bay leaf	dry spices	common
39	Allspice	dry spices	common
40	Fish	meat	quite common
41	Kalaneuvos-seasoning	seasoning	somewhat rare
42	Prawns	meat	somewhat common
43	Butter	fat	very common
44	Lime Juice	fresh juice	very common
45	Jamaican rum	liquor	somewhat common
46	Light soy sauce	seasoning	common
47	Hamburger bun	bread	common
48	Pineapple slice	canned fruit	very common
49	Tofu	veg-protein	common
50	Bacon	meat	common
51	Pickled Cucumber	preservative	common
52	Grill sauce	seasoning	common
53	Pineapple	fresh frui	common
54	Red Bell Pepper	legume	very common
55	Red onion	legume	very common
56	Cilantro	fresh herb	quite common
57	Jalapeno	vegetable	quite common
58	Tomato	vegetable 	very common
59	Dried oregano	dry spices	common
60	Cumin	dry spices	common
61	Avocado	vegetable	somewhat common
62	Yellow onion	legume	very common
63	Chili powder	seasoning	common
64	Black pepper	dry spices	very common
65	Ground paprika	dry spices	common
66	Garlic powder	dry spices	quite common
67	Onion powder	dry spices	quite common
68	Crushed red pepper flakes	dry spices	common
69	Pinenut	nuts and seeds	somewhat common
70	Cashew Nuts	nuts and seeds	very common
71	Kiwi-fruit	fresh fruit	common
72	Cherry tomatoes	vegeables	common
73	Cucumber	vegetable	very common
74	Wheat flour	flour	very common
75	Yeast	yeasy	very common
76	Leek	legume	common
77	Dried basil	dry spices	common
78	Potato	vegetable	common
79	Carrot	vegetable	common
80	Wiener	meat	quite common
81	Buckwheat groats	groats	somewhat common
82	Lasagne sheets	pasta	very common
83	Tomato sauce (lasagne)	sauce	common
84	White sauce (lasagne)	sauce	common
85	Generic cheese	cheese	very common
86	Parmeggiano cheese	cheese	very common
87	Fusilli pasta	pasta	very common
88	Corn kernels	tinned food	common
89	White beans	tinned food	common
90	Tomato sauce	tinned food	common
91	Anchovies	fish	common
92	Vegetable oil	fat	very common
93	Dark beer	beer	common
94	Peas	legume	common
95	Cauliflower	vegetable	common
96	Salmon	fish	common
97	Koskenlaskija-cheese	cheese	common
98	Ground cloves	dry spices	common
99	Ground ginger	dry spices	common
100	Ground cinnamon	dry spices	common
101	Ground bitter orange peel	dry spices	common
\.


--
-- Data for Name: method; Type: TABLE DATA; Schema: public; Owner: rasse
--

COPY public.method (methodid, method, notes, preptime, cooktime) FROM stdin;
1	X: Put the tuna with the oil to a frying pan. X: Add ketchup and spices. X: Fry for a few minutes. X: Cook some spaghetti like instructed on the package. X: Serve with tomatoes of any kind.	N: You can use pasta of any kind or fresh pasta. N: You can add some tomato paste to the dish.	0	12
2	-	-	0	20
3	-	-	0	20
4	-	-	5	25
5	-	-	10	15
\.


--
-- Data for Name: rec_ing; Type: TABLE DATA; Schema: public; Owner: rasse
--

COPY public.rec_ing (recipe_id, ingredient_id, amount) FROM stdin;
1	1	1 dl
1	2	1 can
1	3	2 tsp
1	4	1 tsp
1	5	50g
1	6	0.75 tsp
1	7	0.5 tsp
3	14	400g
3	1	1 dl
3	3	2 tbsp
3	4	1 tbsp
3	6	0.5 tsp
3	5	100g
2	22	100g
2	16	1 tsp
2	12	1 tbsp
2	10	4 cloves
2	9	4 pieces
2	8	1 dl
30	26	0.25 tsp
2	7	0.5 tsp
4	13	400g
4	18	2 dl
4	20	1 tbsp
4	21	2dl (dry)
4	23	1 tbsp
4	24	1 cube
4	25	1 tbsp
4	26	0.25 tsp
5	13	350g
5	24	1 cube
5	21	3 dl (dry)
5	20	1 tbsp
4	19	1 tbsp
5	18	2 dl
5	16	1 tsp
5	10	4 cloves
5	7	0.25 tsp
7	27	2 kg
7	23	1 tbsp
7	30	1 piece
7	92	1 tbsp
7	28	400g
7	29	400g
7	26	1 tsp
7	32	3 pieces
7	31	4 tbsp
7	18	3 dl
8	35	400g
8	28	400g
8	6	2 tsp
8	7	1 tsp
8	34	3 pieces
8	33	7 dl
8	32	1 piece
9	36	400 g
9	37	400 g
9	6	1 tsp
9	39	10 pieces
11	40	400g
11	41	3 tbsp
14	47	4 pieces
14	48	4 slices
14	50	4 slices
14	102	4 leaves
14	52	2 tbsp
14	51	8 pieces
15	74	420g
15	103	2 dl
15	43	2 tbsp
15	34	1 piece
15	104	50g
15	6	1 tsp
15	75	9g
16	74	200g
16	43	50g
16	105	1 tsp
16	33	1 dl
17	53	1 medium piece
17	54	1 piece
17	55	0.5 small piece
17	56	2 tbsp
17	57	1 piece
17	44	3 tbsp
17	6	0.25 tsp
18	53	3 medium pieces
18	60	0.5 tsp
18	55	0.5 medium piece
18	56	4 tbsp
18	57	1 piece
18	44	2 tbsp
18	6	0.25 tsp
18	59	0.5 tsp
19	61	3 pieces
19	62	0.5 piece
19	58	2 pieces
19	56	3 tbsp
19	57	1 piece
19	10	2 cloves
19	44	2 tbsp
19	6	0.5 tsp
20	63	1 tbsp
20	60	1.5 tsp
20	6	1 tsp
20	64	1 tsp
20	65	0.5 tsp
20	66	0.25 tsp
20	67	0.25 tsp
20	68	0.25 tsp
20	59	0.25 tsp
21	53	100g
21	71	100g
21	70	50g
21	69	50g
21	73	200g
21	72	200g
21	58	200g
21	102	4 leaves
22	74	1 liter
22	75	2 tsp
22	33	5 dl
22	6	2 tsp
24	103	3 dl
24	81	1.5 dl
24	33	5 dl
24	6	1.5 tsp
25	83	1 jar
25	84	1 jar
25	85	75g
25	82	6 sheets
25	28	500g
27	89	1 tin
27	90	1 tin
27	28	400g
27	32	1 piece
27	60	1 tsp
27	1	2 tbsp
27	63	1 tbsp
28	106	1 bag
28	91	1 tin
28	18	4 dl
28	33	1 dl
29	36	800g
29	78	12 pieces
29	62	2 pieces
29	32	4 dl
29	93	3 dl
30	103	1 liter
30	6	1 tsp
30	78	500g
30	79	1 bunch
30	95	1 small piece
30	33	6 dl
30	74	1 tbsp
30	94	100g
30	104	1 tsp
30	23	1 tbsp
31	78	10 pieces
31	79	200g
31	62	1 small piece
31	23	1.5 tbsp
31	107	1 liter
31	97	1 packet
31	26	0.5 tsp
31	6	0.25 tsp
31	96	500g
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: rasse
--

COPY public.recipe (id, name) FROM stdin;
1	Tuna and spaghetti
2	Chili-garlic-sesame chicken
3	Ketchup  chicken
4	Sliced chicken
5	Cream-masala chicken
6	Tuna-Rice Casserole
7	Cabbage Stew
8	Macheroni Casserole
9	Karelian Stew
10	Meat Pie
11	Seasoned Fish
12	Mimosa Prawns
13	Dominican Fried Chicken
14	Hamburger
15	Burger bun
16	Tortilla
17	Pineapple Salsa
18	Tomato Salsa
19	Guacamole
20	Taco seasoning
21	Salad base
22	Bread base
23	Sausage Soup
24	Buckwheat Porridge
25	Lasagne
26	Lasagnette
27	Chili con Carne
28	Anchovy Casserole
29	Labskaus
30	Vegeable Soup
31	Salmon Soup
32	Gingerbread
33	S-cookies
34	Chocolate Cake
35	Tomato Salsa
\.


--
-- Data for Name: styles_recipe; Type: TABLE DATA; Schema: public; Owner: rasse
--

COPY public.styles_recipe (style_id, recipe_id) FROM stdin;
3	1
9	1
25	1
2	7
9	7
18	7
21	7
2	8
9	8
18	8
21	8
2	9
9	9
18	9
21	9
2	11
9	11
18	11
21	11
18	15
26	15
1	17
10	17
24	17
27	17
1	18
10	18
24	18
27	18
24	19
27	19
24	20
27	20
18	16
26	16
10	21
14	21
10	22
26	22
9	24
18	24
9	25
15	25
20	25
9	27
18	27
27	27
9	28
18	28
21	28
2	29
9	29
21	29
2	30
9	30
15	30
21	30
2	31
9	31
15	31
21	31
\.


--
-- Data for Name: stylesandorigins; Type: TABLE DATA; Schema: public; Owner: rasse
--

COPY public.stylesandorigins (id, name, infotype, notes) FROM stdin;
1	copyrighted	copyright	\N
2	common	copyright	\N
3	original	copyright	\N
4	Indian	cuisine	\N
5	Thailand	cuisine	\N
6	Chinese	cuisine	\N
7	Tiki	cuisine	\N
8	Korean	cuisine	\N
9	Main	type	\N
10	Side	type	\N
11	Dessert	type	\N
12	Appetizer	type	\N
13	Starter	type	\N
14	Salad	type	\N
15	One pot	equipment	\N
16	Blender	equipment	\N
17	Deep fried	method	\N
18	Oven baked	method	\N
19	Grilled	method	\N
20	Italian	cuisine	\N
21	Finnish	cuisine	\N
22	Sweet	taste profile	\N
23	Sour	taste profile	\N
24	Hot	taste profile	\N
25	Misc	cuisine	\N
26	Bread	type	\N
27	Mexican	cuisine	\N
\.


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rasse
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 26, true);


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rasse
--

SELECT pg_catalog.setval('public.recipe_id_seq', 5, true);


--
-- Name: stylesandorigins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rasse
--

SELECT pg_catalog.setval('public.stylesandorigins_id_seq', 25, true);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- Name: method method_methodid_key; Type: CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.method
    ADD CONSTRAINT method_methodid_key UNIQUE (methodid);


--
-- Name: rec_ing rec_ing_pk; Type: CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.rec_ing
    ADD CONSTRAINT rec_ing_pk PRIMARY KEY (recipe_id, ingredient_id);


--
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id);


--
-- Name: styles_recipe styles_recipe_pk; Type: CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.styles_recipe
    ADD CONSTRAINT styles_recipe_pk PRIMARY KEY (style_id, recipe_id);


--
-- Name: stylesandorigins stylesandorigins_pkey; Type: CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.stylesandorigins
    ADD CONSTRAINT stylesandorigins_pkey PRIMARY KEY (id);


--
-- Name: method fk_method_recipe; Type: FK CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.method
    ADD CONSTRAINT fk_method_recipe FOREIGN KEY (methodid) REFERENCES public.recipe(id);


--
-- Name: rec_ing rec_ing_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.rec_ing
    ADD CONSTRAINT rec_ing_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- Name: rec_ing rec_ing_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.rec_ing
    ADD CONSTRAINT rec_ing_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipe(id);


--
-- Name: styles_recipe styles_recipe_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.styles_recipe
    ADD CONSTRAINT styles_recipe_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipe(id);


--
-- Name: styles_recipe styles_recipe_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rasse
--

ALTER TABLE ONLY public.styles_recipe
    ADD CONSTRAINT styles_recipe_style_id_fkey FOREIGN KEY (style_id) REFERENCES public.stylesandorigins(id);


--
-- PostgreSQL database dump complete
--


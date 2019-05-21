--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

-- Started on 2019-05-21 00:35:23

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

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16405)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16459)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16457)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 199
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- TOC entry 204 (class 1259 OID 16568)
-- Name: comment_to_second; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_to_second (
    comment_id integer,
    second_comment_id integer
);


ALTER TABLE public.comment_to_second OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16396)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    text text,
    date timestamp without time zone
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16465)
-- Name: post_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_comments (
    post_id integer,
    comment_id integer
);


ALTER TABLE public.post_comments OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 196
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 203 (class 1259 OID 16562)
-- Name: second_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.second_comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);


ALTER TABLE public.second_comment OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16560)
-- Name: second_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.second_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.second_comment_id_seq OWNER TO postgres;

--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 202
-- Name: second_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.second_comment_id_seq OWNED BY public.second_comment.id;


--
-- TOC entry 2711 (class 2604 OID 16462)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 2710 (class 2604 OID 16399)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 16565)
-- Name: second_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.second_comment ALTER COLUMN id SET DEFAULT nextval('public.second_comment_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 16405)
-- Dependencies: 198
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
b3613473ae18
\.


--
-- TOC entry 2850 (class 0 OID 16459)
-- Dependencies: 200
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, text, date) FROM stdin;
78	2	2019-05-20 02:05:17.639658
79	23	2019-05-20 02:05:23.671382
85	2	2019-05-20 09:35:48.341648
86	2	2019-05-20 09:35:48.416707
87	2	2019-05-20 09:35:49.998126
47	124	2019-05-19 19:44:22.954737
66	125	2019-05-20 01:31:43.828431
69	25	2019-05-20 01:32:05.452988
90	23	2019-05-20 09:36:36.806144
91	2	2019-05-20 09:36:42.439212
37	4	2019-05-19 18:58:56.913638
38	4	2019-05-19 18:59:00.622969
39	125	2019-05-19 18:59:11.029962
44	241	2019-05-19 19:44:07.073964
67	125	2019-05-20 01:31:53.23078
68	124	2019-05-20 01:31:58.079842
80	2	2019-05-20 03:12:00.708456
88	2	2019-05-20 09:35:56.835857
93	124	2019-05-20 09:47:07.712204
94	23	2019-05-20 09:51:52.988094
40	2	2019-05-19 19:00:27.918972
43	125	2019-05-19 19:44:03.117033
45	124	2019-05-19 19:44:10.149945
48	2	2019-05-19 19:44:30.93942
49	2	2019-05-19 19:44:46.814382
97	124	2019-05-20 12:40:11.546702
55	2125125	2019-05-20 01:30:21.849988
65	12512525	2019-05-20 01:31:40.797951
76	2	2019-05-20 02:04:14.210574
82	22	2019-05-20 09:24:41.402654
83	23	2019-05-20 09:32:17.201776
57	124	2019-05-20 01:30:29.360699
58	2	2019-05-20 01:30:34.118307
59	124	2019-05-20 01:30:40.17223
60	124	2019-05-20 01:30:50.327742
61	2	2019-05-20 01:31:14.694735
62	124	2019-05-20 01:31:19.183457
63	124	2019-05-20 01:31:22.266437
64	124	2019-05-20 01:31:37.268567
92	124	2019-05-20 09:44:54.64993
98	124	2019-05-20 12:40:23.399203
46	241255	2019-05-19 19:44:20.57655
107	2	2019-05-20 15:12:01.719813
106	23	2019-05-20 15:10:02.463865
50	33	2019-05-19 19:44:51.209449
108	3	2019-05-20 16:31:24.758731
95	333	2019-05-20 09:52:06.364227
\.


--
-- TOC entry 2854 (class 0 OID 16568)
-- Dependencies: 204
-- Data for Name: comment_to_second; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_to_second (comment_id, second_comment_id) FROM stdin;
95	1
95	4
95	3
95	6
95	7
46	9
46	10
46	11
46	12
46	13
46	14
46	15
46	16
46	17
46	18
46	19
46	20
95	21
95	22
95	23
95	26
106	27
59	28
45	29
85	30
106	31
95	32
\.


--
-- TOC entry 2847 (class 0 OID 16396)
-- Dependencies: 197
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, text, date) FROM stdin;
159	Main\n	2019-05-19 18:55:36.506556
157	2124	2019-05-19 18:55:34.044632
155	24512	2019-05-19 18:55:23.408654
162	2	2019-05-19 19:01:51.053858
164	23	2019-05-19 19:42:52.365012
165	24	2019-05-19 19:42:56.109681
166	25	2019-05-19 19:43:35.389817
168	23	2019-05-20 01:31:10.791425
163	234	2019-05-19 19:41:46.028422
153	21245	2019-05-19 18:55:08.213122
169	2	2019-05-20 13:13:19.442545
170	2	2019-05-20 13:15:50.165797
171	2	2019-05-20 13:16:00.400644
172	2	2019-05-20 13:16:51.648551
173	2	2019-05-20 13:17:07.365899
174	1245	2019-05-20 13:17:10.030237
175	1245	2019-05-20 13:17:50.462681
149	1252632	2019-05-19 14:32:26.254461
167	1111111111111111	2019-05-20 01:31:02.071919
\.


--
-- TOC entry 2851 (class 0 OID 16465)
-- Dependencies: 201
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (post_id, comment_id) FROM stdin;
155	90
155	91
155	47
155	69
155	66
159	39
159	44
159	93
159	67
159	68
159	37
159	80
159	38
159	88
163	94
149	95
159	97
153	46
153	55
153	65
153	83
153	76
153	92
153	82
153	98
157	40
157	43
165	45
162	48
166	49
164	50
149	106
169	107
149	108
157	57
162	58
165	59
166	60
168	61
167	62
163	63
164	64
168	78
167	79
157	85
157	86
157	87
\.


--
-- TOC entry 2853 (class 0 OID 16562)
-- Dependencies: 203
-- Data for Name: second_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.second_comment (id, text, date) FROM stdin;
1	test	2019-05-20 03:10:02.276557
3	test2	2019-05-20 10:04:31.651249
4	test3	2019-05-20 10:05:41.450922
5	124	2019-05-20 12:15:56.783151
6	23	2019-05-20 12:19:21.861343
7	124	2019-05-20 12:23:08.36676
8	124	2019-05-20 12:24:56.794078
9	214	2019-05-20 12:45:47.894065
10	2	2019-05-20 12:47:08.739046
11	124	2019-05-20 12:47:10.16802
12	124	2019-05-20 12:47:10.494308
13	5125	2019-05-20 12:47:12.591943
14	263	2019-05-20 12:47:15.485026
15	2462	2019-05-20 12:47:18.192733
16	235	2019-05-20 12:47:19.264359
17	235	2019-05-20 12:47:19.591415
18	235	2019-05-20 12:47:19.915837
19	235125	2019-05-20 12:47:21.205096
20	2	2019-05-20 13:13:05.609115
21	124	2019-05-20 13:19:55.43292
22	222	2019-05-20 13:20:01.870786
23	2	2019-05-20 13:20:11.860452
24	23	2019-05-20 14:32:06.751246
25	2	2019-05-20 14:55:12.46806
26	2	2019-05-20 15:00:25.94472
27	2	2019-05-20 15:10:16.577218
28	23	2019-05-20 15:12:06.799448
29	124	2019-05-20 15:12:10.855921
30	2	2019-05-20 15:13:47.134725
31	2	2019-05-20 15:20:28.573056
32	33	2019-05-20 16:31:36.383983
\.


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 199
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 108, true);


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 196
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 175, true);


--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 202
-- Name: second_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.second_comment_id_seq', 32, true);


--
-- TOC entry 2716 (class 2606 OID 16409)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2718 (class 2606 OID 16464)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 16404)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 16567)
-- Name: second_comment second_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.second_comment
    ADD CONSTRAINT second_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 16571)
-- Name: comment_to_second comment_to_second_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);


--
-- TOC entry 2724 (class 2606 OID 16576)
-- Name: comment_to_second comment_to_second_second_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_second_comment_id_fkey FOREIGN KEY (second_comment_id) REFERENCES public.second_comment(id);


--
-- TOC entry 2721 (class 2606 OID 16468)
-- Name: post_comments post_comments_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);


--
-- TOC entry 2722 (class 2606 OID 16473)
-- Name: post_comments post_comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);


-- Completed on 2019-05-21 00:35:23

--
-- PostgreSQL database dump complete
--


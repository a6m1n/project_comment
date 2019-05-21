toc.dat                                                                                             0000600 0004000 0002000 00000022665 13471067760 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       8    &                 w           posts    11.3    11.3 $    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         ,           1262    16393    posts    DATABASE     �   CREATE DATABASE posts WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE posts;
             postgres    false         �            1259    16405    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         postgres    false         �            1259    16459    comment    TABLE     �   CREATE TABLE public.comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);
    DROP TABLE public.comment;
       public         postgres    false         �            1259    16457    comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public       postgres    false    200         -           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
            public       postgres    false    199         �            1259    16568    comment_to_second    TABLE     a   CREATE TABLE public.comment_to_second (
    comment_id integer,
    second_comment_id integer
);
 %   DROP TABLE public.comment_to_second;
       public         postgres    false         �            1259    16396    post    TABLE     k   CREATE TABLE public.post (
    id integer NOT NULL,
    text text,
    date timestamp without time zone
);
    DROP TABLE public.post;
       public         postgres    false         �            1259    16465    post_comments    TABLE     S   CREATE TABLE public.post_comments (
    post_id integer,
    comment_id integer
);
 !   DROP TABLE public.post_comments;
       public         postgres    false         �            1259    16394    post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.post_id_seq;
       public       postgres    false    197         .           0    0    post_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;
            public       postgres    false    196         �            1259    16562    second_comment    TABLE     �   CREATE TABLE public.second_comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);
 "   DROP TABLE public.second_comment;
       public         postgres    false         �            1259    16560    second_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.second_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.second_comment_id_seq;
       public       postgres    false    203         /           0    0    second_comment_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.second_comment_id_seq OWNED BY public.second_comment.id;
            public       postgres    false    202         �
           2604    16462 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    200    200         �
           2604    16399    post id    DEFAULT     b   ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);
 6   ALTER TABLE public.post ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197         �
           2604    16565    second_comment id    DEFAULT     v   ALTER TABLE ONLY public.second_comment ALTER COLUMN id SET DEFAULT nextval('public.second_comment_id_seq'::regclass);
 @   ALTER TABLE public.second_comment ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203                    0    16405    alembic_version 
   TABLE DATA               6   COPY public.alembic_version (version_num) FROM stdin;
    public       postgres    false    198       2848.dat "          0    16459    comment 
   TABLE DATA               1   COPY public.comment (id, text, date) FROM stdin;
    public       postgres    false    200       2850.dat &          0    16568    comment_to_second 
   TABLE DATA               J   COPY public.comment_to_second (comment_id, second_comment_id) FROM stdin;
    public       postgres    false    204       2854.dat           0    16396    post 
   TABLE DATA               .   COPY public.post (id, text, date) FROM stdin;
    public       postgres    false    197       2847.dat #          0    16465    post_comments 
   TABLE DATA               <   COPY public.post_comments (post_id, comment_id) FROM stdin;
    public       postgres    false    201       2851.dat %          0    16562    second_comment 
   TABLE DATA               8   COPY public.second_comment (id, text, date) FROM stdin;
    public       postgres    false    203       2853.dat 0           0    0    comment_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comment_id_seq', 121, true);
            public       postgres    false    199         1           0    0    post_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.post_id_seq', 190, true);
            public       postgres    false    196         2           0    0    second_comment_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.second_comment_id_seq', 59, true);
            public       postgres    false    202         �
           2606    16409 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public         postgres    false    198         �
           2606    16464    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public         postgres    false    200         �
           2606    16404    post post_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public         postgres    false    197         �
           2606    16567 "   second_comment second_comment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.second_comment
    ADD CONSTRAINT second_comment_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.second_comment DROP CONSTRAINT second_comment_pkey;
       public         postgres    false    203         �
           2606    16571 3   comment_to_second comment_to_second_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);
 ]   ALTER TABLE ONLY public.comment_to_second DROP CONSTRAINT comment_to_second_comment_id_fkey;
       public       postgres    false    2718    200    204         �
           2606    16576 :   comment_to_second comment_to_second_second_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_second_comment_id_fkey FOREIGN KEY (second_comment_id) REFERENCES public.second_comment(id);
 d   ALTER TABLE ONLY public.comment_to_second DROP CONSTRAINT comment_to_second_second_comment_id_fkey;
       public       postgres    false    204    203    2720         �
           2606    16468 +   post_comments post_comments_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);
 U   ALTER TABLE ONLY public.post_comments DROP CONSTRAINT post_comments_comment_id_fkey;
       public       postgres    false    2718    201    200         �
           2606    16473 (   post_comments post_comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);
 R   ALTER TABLE ONLY public.post_comments DROP CONSTRAINT post_comments_post_id_fkey;
       public       postgres    false    197    201    2714                                                                                   2848.dat                                                                                            0000600 0004000 0002000 00000000022 13471067760 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        b3613473ae18
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2850.dat                                                                                            0000600 0004000 0002000 00000003265 13471067760 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        117	124	2019-05-21 17:57:38.139998
118	124	2019-05-21 17:57:38.300706
119	3124	2019-05-21 17:59:52.002048
120	Yes	2019-05-21 23:29:16.076608
37	4	2019-05-19 18:58:56.913638
38	4	2019-05-19 18:59:00.622969
39	125	2019-05-19 18:59:11.029962
44	241	2019-05-19 19:44:07.073964
67	125	2019-05-20 01:31:53.23078
68	124	2019-05-20 01:31:58.079842
80	2	2019-05-20 03:12:00.708456
88	2	2019-05-20 09:35:56.835857
93	124	2019-05-20 09:47:07.712204
97	124	2019-05-20 12:40:11.546702
40	2	2019-05-19 19:00:27.918972
43	125	2019-05-19 19:44:03.117033
57	124	2019-05-20 01:30:29.360699
85	2	2019-05-20 09:35:48.341648
86	2	2019-05-20 09:35:48.416707
87	2	2019-05-20 09:35:49.998126
47	124	2019-05-19 19:44:22.954737
66	125	2019-05-20 01:31:43.828431
69	25	2019-05-20 01:32:05.452988
90	23	2019-05-20 09:36:36.806144
91	2	2019-05-20 09:36:42.439212
48	2	2019-05-19 19:44:30.93942
58	2	2019-05-20 01:30:34.118307
50	33	2019-05-19 19:44:51.209449
64	124	2019-05-20 01:31:37.268567
45	124	2019-05-19 19:44:10.149945
59	124	2019-05-20 01:30:40.17223
49	2	2019-05-19 19:44:46.814382
60	124	2019-05-20 01:30:50.327742
61	2	2019-05-20 01:31:14.694735
78	2	2019-05-20 02:05:17.639658
63	124	2019-05-20 01:31:22.266437
94	23	2019-05-20 09:51:52.988094
46	241255	2019-05-19 19:44:20.57655
55	2125125	2019-05-20 01:30:21.849988
65	12512525	2019-05-20 01:31:40.797951
76	2	2019-05-20 02:04:14.210574
82	22124	2019-05-20 09:24:41.402654
83	23	2019-05-20 09:32:17.201776
92	124	2019-05-20 09:44:54.64993
98	124	2019-05-20 12:40:23.399203
113	124	2019-05-21 14:23:43.608468
107	2	2019-05-20 15:12:01.719813
62	124	2019-05-20 01:31:19.183457
79	23	2019-05-20 02:05:23.671382
114	2	2019-05-21 14:44:14.441874
115	124	2019-05-21 14:44:20.284018
\.


                                                                                                                                                                                                                                                                                                                                           2854.dat                                                                                            0000600 0004000 0002000 00000000156 13471067760 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        119	53
119	51
119	48
119	56
119	55
119	52
119	54
119	57
120	58
114	40
114	41
114	42
114	43
114	44
114	39
\.


                                                                                                                                                                                                                                                                                                                                                                                                                  2847.dat                                                                                            0000600 0004000 0002000 00000001575 13471067760 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        159	Main\n	2019-05-19 18:55:36.506556
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
172	2	2019-05-20 13:16:51.648551
173	2	2019-05-20 13:17:07.365899
174	1245	2019-05-20 13:17:10.030237
175	1245	2019-05-20 13:17:50.462681
167	1111111111111111	2019-05-20 01:31:02.071919
182	2	2019-05-21 11:40:36.52684
149	125263212122	2019-05-19 14:32:26.254461
171	124	2019-05-20 13:16:00.400644
176	234	2019-05-21 11:27:46.786966
186	2	2019-05-21 17:59:47.518854
187	124	2019-05-21 18:07:50.630492
188	124	2019-05-21 18:09:03.318889
189	124	2019-05-21 23:29:08.341797
\.


                                                                                                                                   2851.dat                                                                                            0000600 0004000 0002000 00000000562 13471067760 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        182	117
182	118
186	119
189	120
159	37
159	38
159	39
159	44
159	67
159	68
159	80
159	88
159	93
159	97
157	86
157	87
157	43
157	57
157	40
157	85
155	47
155	66
155	69
155	90
155	91
162	48
162	58
164	64
164	50
165	59
165	45
166	49
166	60
168	61
168	78
163	63
163	94
153	46
153	55
153	65
153	76
153	82
153	83
153	92
153	98
153	113
169	107
167	62
167	79
182	115
182	114
\.


                                                                                                                                              2853.dat                                                                                            0000600 0004000 0002000 00000002320 13471067760 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	124	2019-05-20 12:15:56.783151
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
24	23	2019-05-20 14:32:06.751246
25	2	2019-05-20 14:55:12.46806
28	23	2019-05-20 15:12:06.799448
29	124	2019-05-20 15:12:10.855921
30	2	2019-05-20 15:13:47.134725
31	2	2019-05-20 15:20:28.573056
33	2	2019-05-21 11:54:04.624979
27	3	2019-05-20 15:10:16.577218
48	2	2019-05-21 18:00:13.020903
51	2	2019-05-21 18:01:30.205618
52	2	2019-05-21 18:01:33.292325
53	2	2019-05-21 18:01:34.291225
54	2	2019-05-21 18:01:34.633805
55	2	2019-05-21 18:01:37.257758
56	13	2019-05-21 18:07:41.830846
57	13	2019-05-21 18:07:42.261928
58	eee	2019-05-21 23:29:22.582362
39	2	2019-05-21 14:54:32.569283
40	125	2019-05-21 14:54:32.898992
41	125236	2019-05-21 14:54:40.443427
42	125	2019-05-21 14:55:59.575076
43	31	2019-05-21 15:08:51.844453
44	24	2019-05-21 15:09:08.950796
\.


                                                                                                                                                                                                                                                                                                                restore.sql                                                                                         0000600 0004000 0002000 00000017777 13471067760 0015422 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

DROP DATABASE posts;
--
-- Name: posts; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE posts WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE posts OWNER TO postgres;

\connect posts

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);


ALTER TABLE public.comment OWNER TO postgres;

--
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
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: comment_to_second; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_to_second (
    comment_id integer,
    second_comment_id integer
);


ALTER TABLE public.comment_to_second OWNER TO postgres;

--
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    text text,
    date timestamp without time zone
);


ALTER TABLE public.post OWNER TO postgres;

--
-- Name: post_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_comments (
    post_id integer,
    comment_id integer
);


ALTER TABLE public.post_comments OWNER TO postgres;

--
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
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- Name: second_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.second_comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);


ALTER TABLE public.second_comment OWNER TO postgres;

--
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
-- Name: second_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.second_comment_id_seq OWNED BY public.second_comment.id;


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- Name: second_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.second_comment ALTER COLUMN id SET DEFAULT nextval('public.second_comment_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
\.
COPY public.alembic_version (version_num) FROM '$$PATH$$/2848.dat';

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, text, date) FROM stdin;
\.
COPY public.comment (id, text, date) FROM '$$PATH$$/2850.dat';

--
-- Data for Name: comment_to_second; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_to_second (comment_id, second_comment_id) FROM stdin;
\.
COPY public.comment_to_second (comment_id, second_comment_id) FROM '$$PATH$$/2854.dat';

--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, text, date) FROM stdin;
\.
COPY public.post (id, text, date) FROM '$$PATH$$/2847.dat';

--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (post_id, comment_id) FROM stdin;
\.
COPY public.post_comments (post_id, comment_id) FROM '$$PATH$$/2851.dat';

--
-- Data for Name: second_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.second_comment (id, text, date) FROM stdin;
\.
COPY public.second_comment (id, text, date) FROM '$$PATH$$/2853.dat';

--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 121, true);


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 190, true);


--
-- Name: second_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.second_comment_id_seq', 59, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: second_comment second_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.second_comment
    ADD CONSTRAINT second_comment_pkey PRIMARY KEY (id);


--
-- Name: comment_to_second comment_to_second_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);


--
-- Name: comment_to_second comment_to_second_second_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_second_comment_id_fkey FOREIGN KEY (second_comment_id) REFERENCES public.second_comment(id);


--
-- Name: post_comments post_comments_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);


--
-- Name: post_comments post_comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
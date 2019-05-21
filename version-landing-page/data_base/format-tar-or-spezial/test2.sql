PGDMP         $                 w           test    11.3    11.3 $    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ,           1262    16581    test    DATABASE     �   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE test;
             postgres    false            �            1259    16583    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         postgres    false            �            1259    16586    comment    TABLE     �   CREATE TABLE public.comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);
    DROP TABLE public.comment;
       public         postgres    false            �            1259    16589    comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public       postgres    false    197            -           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
            public       postgres    false    198            �            1259    16591    comment_to_second    TABLE     a   CREATE TABLE public.comment_to_second (
    comment_id integer,
    second_comment_id integer
);
 %   DROP TABLE public.comment_to_second;
       public         postgres    false            �            1259    16594    post    TABLE     k   CREATE TABLE public.post (
    id integer NOT NULL,
    text text,
    date timestamp without time zone
);
    DROP TABLE public.post;
       public         postgres    false            �            1259    16600    post_comments    TABLE     S   CREATE TABLE public.post_comments (
    post_id integer,
    comment_id integer
);
 !   DROP TABLE public.post_comments;
       public         postgres    false            �            1259    16603    post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.post_id_seq;
       public       postgres    false    200            .           0    0    post_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;
            public       postgres    false    202            �            1259    16605    second_comment    TABLE     �   CREATE TABLE public.second_comment (
    id integer NOT NULL,
    text character varying(100),
    date timestamp without time zone
);
 "   DROP TABLE public.second_comment;
       public         postgres    false            �            1259    16608    second_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.second_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.second_comment_id_seq;
       public       postgres    false    203            /           0    0    second_comment_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.second_comment_id_seq OWNED BY public.second_comment.id;
            public       postgres    false    204            �
           2604    16610 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197            �
           2604    16611    post id    DEFAULT     b   ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);
 6   ALTER TABLE public.post ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    200            �
           2604    16612    second_comment id    DEFAULT     v   ALTER TABLE ONLY public.second_comment ALTER COLUMN id SET DEFAULT nextval('public.second_comment_id_seq'::regclass);
 @   ALTER TABLE public.second_comment ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203                      0    16583    alembic_version 
   TABLE DATA               6   COPY public.alembic_version (version_num) FROM stdin;
    public       postgres    false    196   �%                 0    16586    comment 
   TABLE DATA               1   COPY public.comment (id, text, date) FROM stdin;
    public       postgres    false    197   #&       !          0    16591    comment_to_second 
   TABLE DATA               J   COPY public.comment_to_second (comment_id, second_comment_id) FROM stdin;
    public       postgres    false    199   z(       "          0    16594    post 
   TABLE DATA               .   COPY public.post (id, text, date) FROM stdin;
    public       postgres    false    200   �(       #          0    16600    post_comments 
   TABLE DATA               <   COPY public.post_comments (post_id, comment_id) FROM stdin;
    public       postgres    false    201   -*       %          0    16605    second_comment 
   TABLE DATA               8   COPY public.second_comment (id, text, date) FROM stdin;
    public       postgres    false    203   �*       0           0    0    comment_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comment_id_seq', 121, true);
            public       postgres    false    198            1           0    0    post_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.post_id_seq', 190, true);
            public       postgres    false    202            2           0    0    second_comment_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.second_comment_id_seq', 59, true);
            public       postgres    false    204            �
           2606    16614 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public         postgres    false    196            �
           2606    16616    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public         postgres    false    197            �
           2606    16618    post post_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public         postgres    false    200            �
           2606    16620 "   second_comment second_comment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.second_comment
    ADD CONSTRAINT second_comment_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.second_comment DROP CONSTRAINT second_comment_pkey;
       public         postgres    false    203            �
           2606    16621 3   comment_to_second comment_to_second_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);
 ]   ALTER TABLE ONLY public.comment_to_second DROP CONSTRAINT comment_to_second_comment_id_fkey;
       public       postgres    false    2716    199    197            �
           2606    16626 :   comment_to_second comment_to_second_second_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_to_second
    ADD CONSTRAINT comment_to_second_second_comment_id_fkey FOREIGN KEY (second_comment_id) REFERENCES public.second_comment(id);
 d   ALTER TABLE ONLY public.comment_to_second DROP CONSTRAINT comment_to_second_second_comment_id_fkey;
       public       postgres    false    203    2720    199            �
           2606    16631 +   post_comments post_comments_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(id);
 U   ALTER TABLE ONLY public.post_comments DROP CONSTRAINT post_comments_comment_id_fkey;
       public       postgres    false    197    201    2716            �
           2606    16636 (   post_comments post_comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);
 R   ALTER TABLE ONLY public.post_comments DROP CONSTRAINT post_comments_post_id_fkey;
       public       postgres    false    200    201    2718                  x�K2634617NL5������� (.�         G  x�uTI�A;[��LA�R?	�k^��a��d���d�UII���P����T���Q�z��L�H�1��dv�����m�����Q�:[rqer��������4��Z�ͼRur�D�Y�3�����1�}s��M:e��P�`�&;l�q5�I�/@�Ŵ+5?��n[��Y�Iݧ�l�c̶�(�� �u�,Q�ISgp>�b���kL�){
u�H�H���cN��e�9Cws8R�p��:��E]��YH�h��3�⨺&��(��,���nB9�+ f���馁Pvf������re��u��
����h��a���O�!s#O�0�~���}(�>oVK�#�<�u^�3s�Q�F>wC8D�VJ�o�L�0g�ez�_9�*��:&l��X��Z]C�� �5�a��թ����GhE��rk��ZyEe@	�I�-��B����6\X�	�:3�1�
G95�z]e����5�ɟ�࿪�ѻk��@Z�5��Az���l8�v���Ď=����u��2J<����`��J���,�q�jΓ<-�,9B$���x��^���K$nx���:�4�^D��	;O      !   =   x�%��� C�s<L���]��
|z��'Wt�^4]�i�F�sD�S�ahҔѥ�����      "   V  x�u�;n�0�g��@	�E��A��]r��������`@�?H��>��_�MY���C�&5#�%gD�cSQ�8�{���M=D��9W�> =YfqXE����J���\:o�$���i�	�d�%D��(�`�d
�hq����LOb-����50��,(�%0���:M���+3�t4���*K��v���n �|�1���jK%�a��S���MNߵCV�!-Э�s�	���Z�=,�74�o�ez�i:5	%y����.�_{��xn�adOAkd��{\yr�|렐���5�2�&ʏ���z�`������Q��k/�eM���}����T      #   �   x�-���E!�3�%
���cqx����#���f���={���r(bF05L-g '�^KHb�d����Լq� �P���KqĒ��F�[��E�/Ċ��R�$��\R�+Wĝ`�9�3\R�*�껦׵���!Q�R����o����:S      %   �  x�u��qC!�Ϩ�4F� QK�,���x����X�E��,����%�$V�>�$���?�r�I�TN�c��	`	7=��8��b$r9�p���$��r�$��qA�G	 ��]���
��q�*٥t���v;���(����đ��H�$���}T�rp�3U[�8����]_���nh��w�C�؁9B��g���U�IZo��$�*Q*d���1b>5��MW^�=�q2{��Kd�/�>�k�loy�@�TI�<�s1t�\l��2�ԇ^u�Zj���?ݡ�n�?��,z\���?��	���C�'�yӈ�E�l���P[ZK��6���36���ۿA|!��J�����C�us��zk���b�Anm���G��e�=�i�	���`#~:���n     
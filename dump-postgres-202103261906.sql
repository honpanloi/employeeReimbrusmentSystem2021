PGDMP     "                    y           postgres    12.5    12.3 -    z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            {           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            |           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            }           1262    14314    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                postgres    false            ~           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3965                        2615    16616    ers_2021    SCHEMA        CREATE SCHEMA ers_2021;
    DROP SCHEMA ers_2021;
                postgres    false            �            1259    16617    employee    TABLE     �  CREATE TABLE ers_2021.employee (
    empl_id bigint NOT NULL,
    direct_manager_empl_id bigint,
    "position" character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    dob date NOT NULL,
    prim_phone bigint NOT NULL,
    amount_reimbursed_of_the_year double precision NOT NULL,
    is_manager boolean NOT NULL,
    first_name character varying(20),
    last_name character varying(20)
);
    DROP TABLE ers_2021.employee;
       ers_2021         heap    postgres    false    8            �            1259    16629    employee_id_seq    SEQUENCE     z   CREATE SEQUENCE ers_2021.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE ers_2021.employee_id_seq;
       ers_2021          postgres    false    8    219                       0    0    employee_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE ers_2021.employee_id_seq OWNED BY ers_2021.employee.empl_id;
          ers_2021          postgres    false    223            �            1259    16680    login    TABLE     �   CREATE TABLE ers_2021.login (
    email character varying(50) NOT NULL,
    password character varying(20),
    empl_id bigint
);
    DROP TABLE ers_2021.login;
       ers_2021         heap    postgres    false    8            �            1259    16626    position    TABLE     T   CREATE TABLE ers_2021."position" (
    "position" character varying(20) NOT NULL
);
     DROP TABLE ers_2021."position";
       ers_2021         heap    postgres    false    8            �            1259    16623    reimb_image    TABLE     �   CREATE TABLE ers_2021.reimb_image (
    image_id bigint NOT NULL,
    belongs_to_reimb_id bigint NOT NULL,
    is_approved boolean NOT NULL,
    time_uploaded character varying(40) NOT NULL,
    file_location character varying(60) NOT NULL
);
 !   DROP TABLE ers_2021.reimb_image;
       ers_2021         heap    postgres    false    8            �            1259    16642    reimb_image_id_seq    SEQUENCE     }   CREATE SEQUENCE ers_2021.reimb_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE ers_2021.reimb_image_id_seq;
       ers_2021          postgres    false    221    8            �           0    0    reimb_image_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE ers_2021.reimb_image_id_seq OWNED BY ers_2021.reimb_image.image_id;
          ers_2021          postgres    false    224            �            1259    16695    reimb_status    TABLE     X   CREATE TABLE ers_2021.reimb_status (
    reimb_status character varying(20) NOT NULL
);
 "   DROP TABLE ers_2021.reimb_status;
       ers_2021         heap    postgres    false    8            �            1259    16620    reimbursement    TABLE     �  CREATE TABLE ers_2021.reimbursement (
    reimb_id bigint NOT NULL,
    belongs_to_empl_id bigint NOT NULL,
    process_by_empl_id bigint NOT NULL,
    reimb_status character varying(20) DEFAULT 'Pending'::character varying,
    time_requested character varying(40) NOT NULL,
    reimb_amount double precision NOT NULL,
    time_completed character varying(40),
    event_occurred date NOT NULL
);
 #   DROP TABLE ers_2021.reimbursement;
       ers_2021         heap    postgres    false    8            �            1259    16650    reimbursement_id_seq    SEQUENCE        CREATE SEQUENCE ers_2021.reimbursement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE ers_2021.reimbursement_id_seq;
       ers_2021          postgres    false    220    8            �           0    0    reimbursement_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE ers_2021.reimbursement_id_seq OWNED BY ers_2021.reimbursement.reimb_id;
          ers_2021          postgres    false    225            �           2604    16631    employee empl_id    DEFAULT     s   ALTER TABLE ONLY ers_2021.employee ALTER COLUMN empl_id SET DEFAULT nextval('ers_2021.employee_id_seq'::regclass);
 A   ALTER TABLE ers_2021.employee ALTER COLUMN empl_id DROP DEFAULT;
       ers_2021          postgres    false    223    219            �           2604    16644    reimb_image image_id    DEFAULT     z   ALTER TABLE ONLY ers_2021.reimb_image ALTER COLUMN image_id SET DEFAULT nextval('ers_2021.reimb_image_id_seq'::regclass);
 E   ALTER TABLE ers_2021.reimb_image ALTER COLUMN image_id DROP DEFAULT;
       ers_2021          postgres    false    224    221            �           2604    16652    reimbursement reimb_id    DEFAULT     ~   ALTER TABLE ONLY ers_2021.reimbursement ALTER COLUMN reimb_id SET DEFAULT nextval('ers_2021.reimbursement_id_seq'::regclass);
 G   ALTER TABLE ers_2021.reimbursement ALTER COLUMN reimb_id DROP DEFAULT;
       ers_2021          postgres    false    225    220            o          0    16617    employee 
   TABLE DATA           �   COPY ers_2021.employee (empl_id, direct_manager_empl_id, "position", email, dob, prim_phone, amount_reimbursed_of_the_year, is_manager, first_name, last_name) FROM stdin;
    ers_2021          postgres    false    219            v          0    16680    login 
   TABLE DATA           ;   COPY ers_2021.login (email, password, empl_id) FROM stdin;
    ers_2021          postgres    false    226            r          0    16626    position 
   TABLE DATA           2   COPY ers_2021."position" ("position") FROM stdin;
    ers_2021          postgres    false    222            q          0    16623    reimb_image 
   TABLE DATA           q   COPY ers_2021.reimb_image (image_id, belongs_to_reimb_id, is_approved, time_uploaded, file_location) FROM stdin;
    ers_2021          postgres    false    221            w          0    16695    reimb_status 
   TABLE DATA           6   COPY ers_2021.reimb_status (reimb_status) FROM stdin;
    ers_2021          postgres    false    227            p          0    16620    reimbursement 
   TABLE DATA           �   COPY ers_2021.reimbursement (reimb_id, belongs_to_empl_id, process_by_empl_id, reimb_status, time_requested, reimb_amount, time_completed, event_occurred) FROM stdin;
    ers_2021          postgres    false    220            �           0    0    employee_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('ers_2021.employee_id_seq', 65, true);
          ers_2021          postgres    false    223            �           0    0    reimb_image_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('ers_2021.reimb_image_id_seq', 1, false);
          ers_2021          postgres    false    224            �           0    0    reimbursement_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('ers_2021.reimbursement_id_seq', 1, false);
          ers_2021          postgres    false    225            �           2606    16636    employee employee_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (empl_id);
 @   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_pk;
       ers_2021            postgres    false    219            �           2606    16706    employee employee_un 
   CONSTRAINT     R   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_un UNIQUE (email);
 @   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_un;
       ers_2021            postgres    false    219            �           2606    16708    login login_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY ers_2021.login
    ADD CONSTRAINT login_pk PRIMARY KEY (email);
 :   ALTER TABLE ONLY ers_2021.login DROP CONSTRAINT login_pk;
       ers_2021            postgres    false    226            �           2606    16664    position position_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY ers_2021."position"
    ADD CONSTRAINT position_pk PRIMARY KEY ("position");
 B   ALTER TABLE ONLY ers_2021."position" DROP CONSTRAINT position_pk;
       ers_2021            postgres    false    222            �           2606    16649    reimb_image reimb_image_pk 
   CONSTRAINT     `   ALTER TABLE ONLY ers_2021.reimb_image
    ADD CONSTRAINT reimb_image_pk PRIMARY KEY (image_id);
 F   ALTER TABLE ONLY ers_2021.reimb_image DROP CONSTRAINT reimb_image_pk;
       ers_2021            postgres    false    221            �           2606    16699    reimb_status reimb_status_pk 
   CONSTRAINT     f   ALTER TABLE ONLY ers_2021.reimb_status
    ADD CONSTRAINT reimb_status_pk PRIMARY KEY (reimb_status);
 H   ALTER TABLE ONLY ers_2021.reimb_status DROP CONSTRAINT reimb_status_pk;
       ers_2021            postgres    false    227            �           2606    16657    reimbursement reimbursement_pk 
   CONSTRAINT     d   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_pk PRIMARY KEY (reimb_id);
 J   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_pk;
       ers_2021            postgres    false    220            �           2606    16637    employee employee_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_fk FOREIGN KEY (direct_manager_empl_id) REFERENCES ers_2021.employee(empl_id) ON UPDATE CASCADE ON DELETE SET NULL;
 @   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_fk;
       ers_2021          postgres    false    219    219    3804            �           2606    16709    employee employee_fk_email    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_fk_email FOREIGN KEY (email) REFERENCES ers_2021.login(email) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_fk_email;
       ers_2021          postgres    false    226    219    3814            �           2606    16665    employee employee_fk_pos    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_fk_pos FOREIGN KEY ("position") REFERENCES ers_2021."position"("position") ON UPDATE CASCADE;
 D   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_fk_pos;
       ers_2021          postgres    false    3812    219    222            �           2606    16722    login login_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.login
    ADD CONSTRAINT login_fk FOREIGN KEY (empl_id) REFERENCES ers_2021.employee(empl_id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY ers_2021.login DROP CONSTRAINT login_fk;
       ers_2021          postgres    false    219    226    3804            �           2606    16658    reimb_image reimb_image_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimb_image
    ADD CONSTRAINT reimb_image_fk FOREIGN KEY (belongs_to_reimb_id) REFERENCES ers_2021.reimbursement(reimb_id) ON UPDATE CASCADE;
 F   ALTER TABLE ONLY ers_2021.reimb_image DROP CONSTRAINT reimb_image_fk;
       ers_2021          postgres    false    220    221    3808            �           2606    16675 "   reimbursement reimbursement_fk_emp    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_fk_emp FOREIGN KEY (belongs_to_empl_id) REFERENCES ers_2021.employee(empl_id) ON UPDATE CASCADE;
 N   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_fk_emp;
       ers_2021          postgres    false    219    220    3804            �           2606    16690 $   reimbursement reimbursement_fk_manag    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_fk_manag FOREIGN KEY (process_by_empl_id) REFERENCES ers_2021.employee(empl_id);
 P   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_fk_manag;
       ers_2021          postgres    false    220    3804    219            �           2606    16700 +   reimbursement reimbursement_fk_reimb_status    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_fk_reimb_status FOREIGN KEY (reimb_status) REFERENCES ers_2021.reimb_status(reimb_status) ON UPDATE CASCADE;
 W   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_fk_reimb_status;
       ers_2021          postgres    false    220    227    3816            o   �   x�U��
�0�ϓ��Z�Mҟ��� ���/�F���/��[�b�9-�vg����]W�g[׹��H�o����-T��H*6��Z��@/l½é*k� h�Mx{�Ě	�e��lc�4�-4��/�x;�dz?�$��FA�x�-���\���IJ9ङ��c�U��@��];~ �����!�5���,�q���^�c!���T      v   @   x�����K�OuH�M���K���4NC.C#cLac.SSSLa.333LaS.3SLas�=... f��      r   .   x�s�-�ɯLM�
IM�U�M�KLO-�r*J�K΀s�]��b���� x�s      q      x������ � �      w   %   x�s,((�/KM�
J�JM.2R�R2�ҹb���� ��	�      p   ~  x��Vˎ�0<K_�H R/��"Eo-�v{�K��a�X���ږ39�3$�#R̮���=?���wyp��.?�\�w&�,���p�_�����h�&�D
׃��z.#����Ͽ���������#o�����{�R�P%�1�	��(��C�L�  d�N�_�f�sbkt�/O��g�x�vw>���u%��OSB�p��Ф� �vBo�1��r�u�#嵈�%��Ȝ���[<U�#Y;w���G�ɼ!T>4� �'^6	8,!�t�̪���K��.:�<��T�J�3@�0�	�U���o ��[�ɧdE�Q�.] �dƭ�=�X@u!*�=���&��s`�i���bh��"b3�M`帬�}6ܓ%'Q�5F��! �]@�<�H�C)=0Z��$@�N�l����Џ��0N�����p���_�3lS�X��:Q�6U��K�ٰM�Z���i���M�.խuʰ�4èxUw�tS����m���n�|�vx�Kb��y�K�.�n.vcsM�U]:����R�'��&���)K�f�ݾ��Gm�t����1 �ziu_�1 ��%Mv4&�����ϲ�?!��+7�� �A�cfܟ��,�{{���{�
�I2      -    z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            {           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            |           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            }           1262    14314    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                postgres    false            ~           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3965                        2615    16616    ers_2021    SCHEMA        CREATE SCHEMA ers_2021;
    DROP SCHEMA ers_2021;
                postgres    false            �            1259    16617    employee    TABLE     �  CREATE TABLE ers_2021.employee (
    empl_id bigint NOT NULL,
    direct_manager_empl_id bigint,
    "position" character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    dob date NOT NULL,
    prim_phone bigint NOT NULL,
    amount_reimbursed_of_the_year double precision NOT NULL,
    is_manager boolean NOT NULL,
    first_name character varying(20),
    last_name character varying(20)
);
    DROP TABLE ers_2021.employee;
       ers_2021         heap    postgres    false    8            �            1259    16629    employee_id_seq    SEQUENCE     z   CREATE SEQUENCE ers_2021.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE ers_2021.employee_id_seq;
       ers_2021          postgres    false    8    219                       0    0    employee_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE ers_2021.employee_id_seq OWNED BY ers_2021.employee.empl_id;
          ers_2021          postgres    false    223            �            1259    16680    login    TABLE     �   CREATE TABLE ers_2021.login (
    email character varying(50) NOT NULL,
    password character varying(20),
    empl_id bigint
);
    DROP TABLE ers_2021.login;
       ers_2021         heap    postgres    false    8            �            1259    16626    position    TABLE     T   CREATE TABLE ers_2021."position" (
    "position" character varying(20) NOT NULL
);
     DROP TABLE ers_2021."position";
       ers_2021         heap    postgres    false    8            �            1259    16623    reimb_image    TABLE     �   CREATE TABLE ers_2021.reimb_image (
    image_id bigint NOT NULL,
    belongs_to_reimb_id bigint NOT NULL,
    is_approved boolean NOT NULL,
    time_uploaded character varying(40) NOT NULL,
    file_location character varying(60) NOT NULL
);
 !   DROP TABLE ers_2021.reimb_image;
       ers_2021         heap    postgres    false    8            �            1259    16642    reimb_image_id_seq    SEQUENCE     }   CREATE SEQUENCE ers_2021.reimb_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE ers_2021.reimb_image_id_seq;
       ers_2021          postgres    false    221    8            �           0    0    reimb_image_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE ers_2021.reimb_image_id_seq OWNED BY ers_2021.reimb_image.image_id;
          ers_2021          postgres    false    224            �            1259    16695    reimb_status    TABLE     X   CREATE TABLE ers_2021.reimb_status (
    reimb_status character varying(20) NOT NULL
);
 "   DROP TABLE ers_2021.reimb_status;
       ers_2021         heap    postgres    false    8            �            1259    16620    reimbursement    TABLE     �  CREATE TABLE ers_2021.reimbursement (
    reimb_id bigint NOT NULL,
    belongs_to_empl_id bigint NOT NULL,
    process_by_empl_id bigint NOT NULL,
    reimb_status character varying(20) DEFAULT 'Pending'::character varying,
    time_requested character varying(40) NOT NULL,
    reimb_amount double precision NOT NULL,
    time_completed character varying(40),
    event_occurred date NOT NULL
);
 #   DROP TABLE ers_2021.reimbursement;
       ers_2021         heap    postgres    false    8            �            1259    16650    reimbursement_id_seq    SEQUENCE        CREATE SEQUENCE ers_2021.reimbursement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE ers_2021.reimbursement_id_seq;
       ers_2021          postgres    false    220    8            �           0    0    reimbursement_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE ers_2021.reimbursement_id_seq OWNED BY ers_2021.reimbursement.reimb_id;
          ers_2021          postgres    false    225            �           2604    16631    employee empl_id    DEFAULT     s   ALTER TABLE ONLY ers_2021.employee ALTER COLUMN empl_id SET DEFAULT nextval('ers_2021.employee_id_seq'::regclass);
 A   ALTER TABLE ers_2021.employee ALTER COLUMN empl_id DROP DEFAULT;
       ers_2021          postgres    false    223    219            �           2604    16644    reimb_image image_id    DEFAULT     z   ALTER TABLE ONLY ers_2021.reimb_image ALTER COLUMN image_id SET DEFAULT nextval('ers_2021.reimb_image_id_seq'::regclass);
 E   ALTER TABLE ers_2021.reimb_image ALTER COLUMN image_id DROP DEFAULT;
       ers_2021          postgres    false    224    221            �           2604    16652    reimbursement reimb_id    DEFAULT     ~   ALTER TABLE ONLY ers_2021.reimbursement ALTER COLUMN reimb_id SET DEFAULT nextval('ers_2021.reimbursement_id_seq'::regclass);
 G   ALTER TABLE ers_2021.reimbursement ALTER COLUMN reimb_id DROP DEFAULT;
       ers_2021          postgres    false    225    220            o          0    16617    employee 
   TABLE DATA           �   COPY ers_2021.employee (empl_id, direct_manager_empl_id, "position", email, dob, prim_phone, amount_reimbursed_of_the_year, is_manager, first_name, last_name) FROM stdin;
    ers_2021          postgres    false    219            v          0    16680    login 
   TABLE DATA           ;   COPY ers_2021.login (email, password, empl_id) FROM stdin;
    ers_2021          postgres    false    226   �        r          0    16626    position 
   TABLE DATA           2   COPY ers_2021."position" ("position") FROM stdin;
    ers_2021          postgres    false    222   J        q          0    16623    reimb_image 
   TABLE DATA           q   COPY ers_2021.reimb_image (image_id, belongs_to_reimb_id, is_approved, time_uploaded, file_location) FROM stdin;
    ers_2021          postgres    false    221   8        w          0    16695    reimb_status 
   TABLE DATA           6   COPY ers_2021.reimb_status (reimb_status) FROM stdin;
    ers_2021          postgres    false    227           p          0    16620    reimbursement 
   TABLE DATA           �   COPY ers_2021.reimbursement (reimb_id, belongs_to_empl_id, process_by_empl_id, reimb_status, time_requested, reimb_amount, time_completed, event_occurred) FROM stdin;
    ers_2021          postgres    false    220   /        �           0    0    employee_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('ers_2021.employee_id_seq', 65, true);
          ers_2021          postgres    false    223            �           0    0    reimb_image_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('ers_2021.reimb_image_id_seq', 1, false);
          ers_2021          postgres    false    224            �           0    0    reimbursement_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('ers_2021.reimbursement_id_seq', 1, false);
          ers_2021          postgres    false    225            �           2606    16636    employee employee_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (empl_id);
 @   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_pk;
       ers_2021            postgres    false    219            �           2606    16706    employee employee_un 
   CONSTRAINT     R   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_un UNIQUE (email);
 @   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_un;
       ers_2021            postgres    false    219            �           2606    16708    login login_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY ers_2021.login
    ADD CONSTRAINT login_pk PRIMARY KEY (email);
 :   ALTER TABLE ONLY ers_2021.login DROP CONSTRAINT login_pk;
       ers_2021            postgres    false    226            �           2606    16664    position position_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY ers_2021."position"
    ADD CONSTRAINT position_pk PRIMARY KEY ("position");
 B   ALTER TABLE ONLY ers_2021."position" DROP CONSTRAINT position_pk;
       ers_2021            postgres    false    222            �           2606    16649    reimb_image reimb_image_pk 
   CONSTRAINT     `   ALTER TABLE ONLY ers_2021.reimb_image
    ADD CONSTRAINT reimb_image_pk PRIMARY KEY (image_id);
 F   ALTER TABLE ONLY ers_2021.reimb_image DROP CONSTRAINT reimb_image_pk;
       ers_2021            postgres    false    221            �           2606    16699    reimb_status reimb_status_pk 
   CONSTRAINT     f   ALTER TABLE ONLY ers_2021.reimb_status
    ADD CONSTRAINT reimb_status_pk PRIMARY KEY (reimb_status);
 H   ALTER TABLE ONLY ers_2021.reimb_status DROP CONSTRAINT reimb_status_pk;
       ers_2021            postgres    false    227            �           2606    16657    reimbursement reimbursement_pk 
   CONSTRAINT     d   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_pk PRIMARY KEY (reimb_id);
 J   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_pk;
       ers_2021            postgres    false    220            �           2606    16637    employee employee_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_fk FOREIGN KEY (direct_manager_empl_id) REFERENCES ers_2021.employee(empl_id) ON UPDATE CASCADE ON DELETE SET NULL;
 @   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_fk;
       ers_2021          postgres    false    219    219    3804            �           2606    16709    employee employee_fk_email    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_fk_email FOREIGN KEY (email) REFERENCES ers_2021.login(email) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_fk_email;
       ers_2021          postgres    false    226    219    3814            �           2606    16665    employee employee_fk_pos    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.employee
    ADD CONSTRAINT employee_fk_pos FOREIGN KEY ("position") REFERENCES ers_2021."position"("position") ON UPDATE CASCADE;
 D   ALTER TABLE ONLY ers_2021.employee DROP CONSTRAINT employee_fk_pos;
       ers_2021          postgres    false    3812    219    222            �           2606    16722    login login_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.login
    ADD CONSTRAINT login_fk FOREIGN KEY (empl_id) REFERENCES ers_2021.employee(empl_id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY ers_2021.login DROP CONSTRAINT login_fk;
       ers_2021          postgres    false    219    226    3804            �           2606    16658    reimb_image reimb_image_fk    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimb_image
    ADD CONSTRAINT reimb_image_fk FOREIGN KEY (belongs_to_reimb_id) REFERENCES ers_2021.reimbursement(reimb_id) ON UPDATE CASCADE;
 F   ALTER TABLE ONLY ers_2021.reimb_image DROP CONSTRAINT reimb_image_fk;
       ers_2021          postgres    false    220    221    3808            �           2606    16675 "   reimbursement reimbursement_fk_emp    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_fk_emp FOREIGN KEY (belongs_to_empl_id) REFERENCES ers_2021.employee(empl_id) ON UPDATE CASCADE;
 N   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_fk_emp;
       ers_2021          postgres    false    219    220    3804            �           2606    16690 $   reimbursement reimbursement_fk_manag    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_fk_manag FOREIGN KEY (process_by_empl_id) REFERENCES ers_2021.employee(empl_id);
 P   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_fk_manag;
       ers_2021          postgres    false    220    3804    219            �           2606    16700 +   reimbursement reimbursement_fk_reimb_status    FK CONSTRAINT     �   ALTER TABLE ONLY ers_2021.reimbursement
    ADD CONSTRAINT reimbursement_fk_reimb_status FOREIGN KEY (reimb_status) REFERENCES ers_2021.reimb_status(reimb_status) ON UPDATE CASCADE;
 W   ALTER TABLE ONLY ers_2021.reimbursement DROP CONSTRAINT reimbursement_fk_reimb_status;
       ers_2021          postgres    false    220    227    3816           
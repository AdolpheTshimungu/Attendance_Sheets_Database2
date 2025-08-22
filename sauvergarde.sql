--
-- PostgreSQL database dump
--

\restrict BV3H0uJ4ddpLUcUMyUfWuwekfK7mzfhZRqdZQJrr5Sq9Kbri8dalo2cz9gibv9v

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cohortes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cohortes (
    id_cohorte integer NOT NULL,
    nom_cohorte character varying(255),
    jour_semaine character varying(255),
    creneau_horaire character varying(255),
    id_formation integer,
    id_salle integer,
    id_sponsor integer
);


ALTER TABLE public.cohortes OWNER TO postgres;

--
-- Name: cohortes_id_cohorte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cohortes_id_cohorte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cohortes_id_cohorte_seq OWNER TO postgres;

--
-- Name: cohortes_id_cohorte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cohortes_id_cohorte_seq OWNED BY public.cohortes.id_cohorte;


--
-- Name: formations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formations (
    id_formation integer NOT NULL,
    nom_formation character varying(255) NOT NULL,
    description text,
    date_debut date,
    date_fin date,
    duree integer,
    niveau character varying(255)
);


ALTER TABLE public.formations OWNER TO postgres;

--
-- Name: formations_id_formation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formations_id_formation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.formations_id_formation_seq OWNER TO postgres;

--
-- Name: formations_id_formation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formations_id_formation_seq OWNED BY public.formations.id_formation;


--
-- Name: justifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.justifications (
    id_justification integer NOT NULL,
    absence_type character varying(255) NOT NULL,
    commentaire text,
    justificatif_document character varying(255),
    statut_validation character varying(255) NOT NULL,
    date_soumission date,
    id_utilisateur integer
);


ALTER TABLE public.justifications OWNER TO postgres;

--
-- Name: justifications_id_justification_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.justifications_id_justification_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.justifications_id_justification_seq OWNER TO postgres;

--
-- Name: justifications_id_justification_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.justifications_id_justification_seq OWNED BY public.justifications.id_justification;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    nom_role character varying(255) NOT NULL,
    permissions text,
    niveau_acces integer
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_role_seq OWNER TO postgres;

--
-- Name: role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;


--
-- Name: salles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salles (
    id_salle integer NOT NULL,
    nom_salle character varying(255) NOT NULL,
    capacite integer NOT NULL,
    adresse character varying(255),
    type_salle character varying(255),
    equipements text,
    id_ville integer
);


ALTER TABLE public.salles OWNER TO postgres;

--
-- Name: salles_id_salle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salles_id_salle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salles_id_salle_seq OWNER TO postgres;

--
-- Name: salles_id_salle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salles_id_salle_seq OWNED BY public.salles.id_salle;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id_session integer NOT NULL,
    date_session date NOT NULL,
    heure_debut time without time zone NOT NULL,
    heure_fin time without time zone NOT NULL,
    qr_code character varying(255) NOT NULL,
    id_cohorte integer,
    id_utilisateur integer
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_session_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_session_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sessions_id_session_seq OWNER TO postgres;

--
-- Name: sessions_id_session_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_session_seq OWNED BY public.sessions.id_session;


--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sponsors (
    id_sponsor integer NOT NULL,
    nom_sponsor character varying(255) NOT NULL
);


ALTER TABLE public.sponsors OWNER TO postgres;

--
-- Name: sponsors_id_sponsor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sponsors_id_sponsor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sponsors_id_sponsor_seq OWNER TO postgres;

--
-- Name: sponsors_id_sponsor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sponsors_id_sponsor_seq OWNED BY public.sponsors.id_sponsor;


--
-- Name: utilisateurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateurs (
    id_utilisateur integer NOT NULL,
    prenom character varying(255) NOT NULL,
    nom character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    genre character varying(255),
    mot_de_passe character varying(255) NOT NULL,
    id_role integer
);


ALTER TABLE public.utilisateurs OWNER TO postgres;

--
-- Name: utilisateurs_cohortes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateurs_cohortes (
    id_utilisateur integer,
    id_cohorte integer
);


ALTER TABLE public.utilisateurs_cohortes OWNER TO postgres;

--
-- Name: utilisateurs_id_utilisateur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateurs_id_utilisateur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utilisateurs_id_utilisateur_seq OWNER TO postgres;

--
-- Name: utilisateurs_id_utilisateur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateurs_id_utilisateur_seq OWNED BY public.utilisateurs.id_utilisateur;


--
-- Name: villes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villes (
    id_ville integer NOT NULL,
    nom_ville character varying(255) NOT NULL
);


ALTER TABLE public.villes OWNER TO postgres;

--
-- Name: villes_id_ville_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.villes_id_ville_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.villes_id_ville_seq OWNER TO postgres;

--
-- Name: villes_id_ville_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.villes_id_ville_seq OWNED BY public.villes.id_ville;


--
-- Name: cohortes id_cohorte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes ALTER COLUMN id_cohorte SET DEFAULT nextval('public.cohortes_id_cohorte_seq'::regclass);


--
-- Name: formations id_formation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formations ALTER COLUMN id_formation SET DEFAULT nextval('public.formations_id_formation_seq'::regclass);


--
-- Name: justifications id_justification; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.justifications ALTER COLUMN id_justification SET DEFAULT nextval('public.justifications_id_justification_seq'::regclass);


--
-- Name: role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);


--
-- Name: salles id_salle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salles ALTER COLUMN id_salle SET DEFAULT nextval('public.salles_id_salle_seq'::regclass);


--
-- Name: sessions id_session; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id_session SET DEFAULT nextval('public.sessions_id_session_seq'::regclass);


--
-- Name: sponsors id_sponsor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors ALTER COLUMN id_sponsor SET DEFAULT nextval('public.sponsors_id_sponsor_seq'::regclass);


--
-- Name: utilisateurs id_utilisateur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateurs ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.utilisateurs_id_utilisateur_seq'::regclass);


--
-- Name: villes id_ville; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villes ALTER COLUMN id_ville SET DEFAULT nextval('public.villes_id_ville_seq'::regclass);


--
-- Data for Name: cohortes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cohortes (id_cohorte, nom_cohorte, jour_semaine, creneau_horaire, id_formation, id_salle, id_sponsor) FROM stdin;
2	D‚veloppement Web	\N	\N	\N	\N	\N
\.


--
-- Data for Name: formations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formations (id_formation, nom_formation, description, date_debut, date_fin, duree, niveau) FROM stdin;
\.


--
-- Data for Name: justifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.justifications (id_justification, absence_type, commentaire, justificatif_document, statut_validation, date_soumission, id_utilisateur) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id_role, nom_role, permissions, niveau_acces) FROM stdin;
1	Apprenant	\N	\N
2	Formateur	\N	\N
3	Administrateur	\N	\N
\.


--
-- Data for Name: salles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salles (id_salle, nom_salle, capacite, adresse, type_salle, equipements, id_ville) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id_session, date_session, heure_debut, heure_fin, qr_code, id_cohorte, id_utilisateur) FROM stdin;
\.


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sponsors (id_sponsor, nom_sponsor) FROM stdin;
\.


--
-- Data for Name: utilisateurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateurs (id_utilisateur, prenom, nom, email, genre, mot_de_passe, id_role) FROM stdin;
1	adolphe	tshimungu	atshimungu04@gmail	masculin	apprenant	\N
2	adolphe	tshimungu	atshimungu04@gmail	masculin	apprenant	\N
3	etsa	kambandji	etsakambandji@email.com	masculin	apprenant	\N
\.


--
-- Data for Name: utilisateurs_cohortes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateurs_cohortes (id_utilisateur, id_cohorte) FROM stdin;
\.


--
-- Data for Name: villes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villes (id_ville, nom_ville) FROM stdin;
\.


--
-- Name: cohortes_id_cohorte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cohortes_id_cohorte_seq', 2, true);


--
-- Name: formations_id_formation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formations_id_formation_seq', 1, false);


--
-- Name: justifications_id_justification_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.justifications_id_justification_seq', 1, false);


--
-- Name: role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_role_seq', 3, true);


--
-- Name: salles_id_salle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salles_id_salle_seq', 1, false);


--
-- Name: sessions_id_session_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_session_seq', 1, false);


--
-- Name: sponsors_id_sponsor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sponsors_id_sponsor_seq', 1, false);


--
-- Name: utilisateurs_id_utilisateur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateurs_id_utilisateur_seq', 3, true);


--
-- Name: villes_id_ville_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.villes_id_ville_seq', 1, false);


--
-- Name: cohortes cohortes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes
    ADD CONSTRAINT cohortes_pkey PRIMARY KEY (id_cohorte);


--
-- Name: formations formations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formations
    ADD CONSTRAINT formations_pkey PRIMARY KEY (id_formation);


--
-- Name: justifications justifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.justifications
    ADD CONSTRAINT justifications_pkey PRIMARY KEY (id_justification);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);


--
-- Name: salles salles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salles
    ADD CONSTRAINT salles_pkey PRIMARY KEY (id_salle);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id_session);


--
-- Name: sponsors sponsors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors
    ADD CONSTRAINT sponsors_pkey PRIMARY KEY (id_sponsor);


--
-- Name: utilisateurs utilisateurs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateurs
    ADD CONSTRAINT utilisateurs_pkey PRIMARY KEY (id_utilisateur);


--
-- Name: villes villes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villes
    ADD CONSTRAINT villes_pkey PRIMARY KEY (id_ville);


--
-- Name: cohortes cohortes_id_formation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes
    ADD CONSTRAINT cohortes_id_formation_fkey FOREIGN KEY (id_formation) REFERENCES public.formations(id_formation);


--
-- Name: cohortes cohortes_id_salle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes
    ADD CONSTRAINT cohortes_id_salle_fkey FOREIGN KEY (id_salle) REFERENCES public.salles(id_salle);


--
-- Name: cohortes cohortes_id_sponsor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes
    ADD CONSTRAINT cohortes_id_sponsor_fkey FOREIGN KEY (id_sponsor) REFERENCES public.sponsors(id_sponsor);


--
-- Name: justifications justifications_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.justifications
    ADD CONSTRAINT justifications_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateurs(id_utilisateur);


--
-- Name: salles salles_id_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salles
    ADD CONSTRAINT salles_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES public.villes(id_ville);


--
-- Name: sessions sessions_id_cohorte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_id_cohorte_fkey FOREIGN KEY (id_cohorte) REFERENCES public.cohortes(id_cohorte);


--
-- Name: sessions sessions_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateurs(id_utilisateur);


--
-- Name: utilisateurs_cohortes utilisateurs_cohortes_id_cohorte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateurs_cohortes
    ADD CONSTRAINT utilisateurs_cohortes_id_cohorte_fkey FOREIGN KEY (id_cohorte) REFERENCES public.cohortes(id_cohorte);


--
-- Name: utilisateurs_cohortes utilisateurs_cohortes_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateurs_cohortes
    ADD CONSTRAINT utilisateurs_cohortes_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateurs(id_utilisateur);


--
-- Name: utilisateurs utilisateurs_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateurs
    ADD CONSTRAINT utilisateurs_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.role(id_role);


--
-- PostgreSQL database dump complete
--

\unrestrict BV3H0uJ4ddpLUcUMyUfWuwekfK7mzfhZRqdZQJrr5Sq9Kbri8dalo2cz9gibv9v


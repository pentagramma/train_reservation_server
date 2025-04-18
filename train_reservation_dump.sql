--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

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

ALTER TABLE IF EXISTS ONLY public."Seats" DROP CONSTRAINT IF EXISTS "Seats_userId_fkey";
ALTER TABLE IF EXISTS ONLY public."Seats" DROP CONSTRAINT IF EXISTS "Seats_UserId_fkey";
ALTER TABLE IF EXISTS ONLY public."Users" DROP CONSTRAINT IF EXISTS "Users_pkey";
ALTER TABLE IF EXISTS ONLY public."Users" DROP CONSTRAINT IF EXISTS "Users_email_key";
ALTER TABLE IF EXISTS ONLY public."Seats" DROP CONSTRAINT IF EXISTS "Seats_pkey";
ALTER TABLE IF EXISTS public."Users" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public."Users_id_seq";
DROP TABLE IF EXISTS public."Users";
DROP TABLE IF EXISTS public."Seats";
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Seats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seats" (
    id integer NOT NULL,
    "isBooked" boolean DEFAULT false,
    "userId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'user'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Seats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seats" (id, "isBooked", "userId", "createdAt", "updatedAt", "UserId") FROM stdin;
52	t	1	2025-04-12 15:13:45.464+05:30	2025-04-12 19:56:17.684+05:30	\N
53	t	1	2025-04-12 15:13:45.464+05:30	2025-04-12 19:56:17.684+05:30	\N
54	t	1	2025-04-12 15:13:45.464+05:30	2025-04-12 19:56:17.684+05:30	\N
55	t	2	2025-04-12 15:13:45.464+05:30	2025-04-12 19:56:27.763+05:30	\N
56	t	2	2025-04-12 15:13:45.464+05:30	2025-04-12 19:56:27.763+05:30	\N
57	t	2	2025-04-12 15:13:45.464+05:30	2025-04-12 19:56:27.763+05:30	\N
58	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
59	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
60	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
61	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
62	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
63	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
64	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
65	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
66	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
67	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
68	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
69	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
70	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
71	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
72	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
73	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
74	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
75	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
76	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
77	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
78	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
79	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
80	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
1	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
2	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
3	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
4	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
5	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
6	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
7	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
8	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
9	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
10	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
11	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
12	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
13	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
14	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
15	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
16	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
17	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
18	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
19	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
20	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
21	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
22	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
23	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
24	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
25	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
26	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
27	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
28	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
29	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
30	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
31	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
32	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
33	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
34	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
35	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
36	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
37	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
38	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
39	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
40	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
41	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
42	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
43	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
44	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
45	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
46	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
47	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
48	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
49	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
50	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
51	f	\N	2025-04-12 15:13:45.464+05:30	2025-04-12 16:24:11.185+05:30	\N
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" (id, email, password, role, "createdAt", "updatedAt") FROM stdin;
1	123456@gmail.com	$2a$10$RaHct3XQtTLetvU3e1eAp.Z/Sy5pL.Pzv.fI.lKiMyEqTFVOVD3Qe	user	2025-04-12 15:14:46.834+05:30	2025-04-12 15:14:46.834+05:30
2	12345@gmail.com	$2a$10$blxQlHZ30NtutUwj9kU8MO7Pg.iQsY/.lpPXhnQ.D248.b6lIe3E2	user	2025-04-12 15:28:24.756+05:30	2025-04-12 15:28:24.756+05:30
4	test@sample.com	$2a$10$wNrVsDgfkVP/atT2LlKwOuJ8GHgUuRIKbxJS8K1Pi4M1kuk.do9wO	user	2025-04-12 19:44:49.022+05:30	2025-04-12 19:44:49.022+05:30
5	admin@example.com	$2a$10$sjjR7acyArt5zd4CHwfpMeBqAYSE0tjzrgHJbeqfSo0tIDJM9b4ta	admin	2025-04-12 19:59:13.605819+05:30	2025-04-12 19:59:13.605819+05:30
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);


--
-- Name: Seats Seats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seats"
    ADD CONSTRAINT "Seats_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Seats Seats_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seats"
    ADD CONSTRAINT "Seats_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Seats Seats_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seats"
    ADD CONSTRAINT "Seats_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id);


--
-- PostgreSQL database dump complete
--


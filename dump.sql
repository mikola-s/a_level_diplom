--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "mikola-s";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "mikola-s";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "mikola-s";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "mikola-s";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "mikola-s";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "mikola-s";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "mikola-s";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "mikola-s";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO "mikola-s";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO "mikola-s";

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "mikola-s";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO "mikola-s";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "mikola-s";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "mikola-s";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "mikola-s";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "mikola-s";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "mikola-s";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "mikola-s";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "mikola-s";

--
-- Name: task_control_status; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.task_control_status (
    id integer NOT NULL,
    "order" integer NOT NULL,
    name character varying(20) NOT NULL,
    CONSTRAINT task_control_status_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.task_control_status OWNER TO "mikola-s";

--
-- Name: task_control_status_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.task_control_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_control_status_id_seq OWNER TO "mikola-s";

--
-- Name: task_control_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.task_control_status_id_seq OWNED BY public.task_control_status.id;


--
-- Name: task_control_taskmodel; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.task_control_taskmodel (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    create_time timestamp with time zone NOT NULL,
    update_time timestamp with time zone NOT NULL,
    status_id integer NOT NULL,
    worker_id integer,
    owner_id integer NOT NULL
);


ALTER TABLE public.task_control_taskmodel OWNER TO "mikola-s";

--
-- Name: task_control_taskmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.task_control_taskmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_control_taskmodel_id_seq OWNER TO "mikola-s";

--
-- Name: task_control_taskmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.task_control_taskmodel_id_seq OWNED BY public.task_control_taskmodel.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: task_control_status id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_status ALTER COLUMN id SET DEFAULT nextval('public.task_control_status_id_seq'::regclass);


--
-- Name: task_control_taskmodel id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_taskmodel ALTER COLUMN id SET DEFAULT nextval('public.task_control_taskmodel_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_group (id, name) FROM stdin;
1	admins_group
2	user_groups
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add task model	7	add_taskmodel
26	Can change task model	7	change_taskmodel
27	Can delete task model	7	delete_taskmodel
28	Can view task model	7	view_taskmodel
29	Can add status	8	add_status
30	Can change status	8	change_status
31	Can delete status	8	delete_status
32	Can view status	8	view_status
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$mvmeRjCGlDLv$qunItd9UCBKfQvnndr80QzLaTezYRp223FxuEuDPxuE=	\N	f	default user				f	t	2020-02-04 17:20:14.064917+02
3	pbkdf2_sha256$150000$fdrBqLIRlAYL$InjL2GS9GJZobxLeuAk/uNm+6S1LbGPLopdAu+bFX5A=	2020-02-22 19:18:04.321815+02	f	user2				f	t	2020-02-04 16:45:58.300125+02
4	pbkdf2_sha256$150000$Y0uKo66V1y37$Q5TddA/S8YaOrqA5mRUU8AQNQzzG8Gf5QhqWQzznhbI=	2020-02-22 22:54:08.261646+02	f	user1				f	t	2020-02-04 16:45:19.576857+02
5	pbkdf2_sha256$150000$LVkbrwLffsqh$vDUE/fIqRLtPbB5Nzk6IB6Fdhg3ZdVoo47XmhEulVlo=	2020-02-21 13:29:38.958642+02	f	user3				f	t	2020-02-21 13:26:10.46237+02
2	pbkdf2_sha256$150000$wupmrlF1TZSF$A595lIpNZV+vUAtfMugIoAhvFHhjUvaVOgNB215oYsg=	2020-02-22 22:54:43.622142+02	t	mikola-s			test@test.test	t	t	2020-02-04 14:40:01.040047+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-02-04 14:49:27.665416+02	1	admins	1	[{"added": {}}]	3	1
2	2020-02-04 14:49:33.891167+02	2	users	1	[{"added": {}}]	3	1
3	2020-02-04 14:50:35.102503+02	1	admin_group	2	[{"changed": {"fields": ["name"]}}]	3	1
4	2020-02-04 14:50:53.525835+02	1	admins_group	2	[{"changed": {"fields": ["name"]}}]	3	1
5	2020-02-04 14:51:02.623353+02	2	user_groups	2	[{"changed": {"fields": ["name"]}}]	3	1
6	2020-02-04 17:20:14.177276+02	4	no_name	1	[{"added": {}}]	4	1
7	2020-02-04 17:54:23.472087+02	1	Status object (1)	1	[{"added": {}}]	8	1
8	2020-02-04 17:54:40.046218+02	2	Status object (2)	1	[{"added": {}}]	8	1
9	2020-02-04 17:54:50.186284+02	3	Status object (3)	1	[{"added": {}}]	8	1
10	2020-02-04 17:55:06.796825+02	4	Status object (4)	1	[{"added": {}}]	8	1
11	2020-02-04 17:55:18.810549+02	5	Status object (5)	1	[{"added": {}}]	8	1
12	2020-02-10 18:13:42.140083+02	4	PK 4 TITLE task four OWNER mikola-s STATUS Ready	2	[{"changed": {"fields": ["status"]}}]	7	2
13	2020-02-10 18:13:51.695627+02	2	PK 2 TITLE task two OWNER user1 STATUS In progress	2	[{"changed": {"fields": ["status"]}}]	7	2
14	2020-02-10 18:13:56.343538+02	3	PK 3 TITLE task three OWNER mikola-s STATUS In QA	2	[{"changed": {"fields": ["status"]}}]	7	2
15	2020-02-10 18:14:00.542339+02	4	PK 4 TITLE task four OWNER mikola-s STATUS Ready	2	[]	7	2
16	2020-02-10 18:14:07.818686+02	5	PK 5 TITLE task five OWNER mikola-s STATUS Done	2	[{"changed": {"fields": ["status"]}}]	7	2
17	2020-02-10 18:17:14.542173+02	5	PK 5 TITLE task five OWNER mikola-s STATUS Ready	2	[{"changed": {"fields": ["status"]}}]	7	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	task_control	taskmodel
8	task_control	status
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-04 14:36:35.119379+02
2	auth	0001_initial	2020-02-04 14:36:35.355252+02
3	admin	0001_initial	2020-02-04 14:36:35.750024+02
4	admin	0002_logentry_remove_auto_add	2020-02-04 14:36:35.834155+02
5	admin	0003_logentry_add_action_flag_choices	2020-02-04 14:36:35.854481+02
6	contenttypes	0002_remove_content_type_name	2020-02-04 14:36:35.890122+02
7	auth	0002_alter_permission_name_max_length	2020-02-04 14:36:35.907936+02
8	auth	0003_alter_user_email_max_length	2020-02-04 14:36:35.935764+02
9	auth	0004_alter_user_username_opts	2020-02-04 14:36:35.957895+02
10	auth	0005_alter_user_last_login_null	2020-02-04 14:36:35.986826+02
11	auth	0006_require_contenttypes_0002	2020-02-04 14:36:36.000264+02
12	auth	0007_alter_validators_add_error_messages	2020-02-04 14:36:36.02342+02
13	auth	0008_alter_user_username_max_length	2020-02-04 14:36:36.07404+02
14	auth	0009_alter_user_last_name_max_length	2020-02-04 14:36:36.100254+02
15	auth	0010_alter_group_name_max_length	2020-02-04 14:36:36.124333+02
16	auth	0011_update_proxy_permissions	2020-02-04 14:36:36.148343+02
17	sessions	0001_initial	2020-02-04 14:36:36.208375+02
18	task_control	0001_initial	2020-02-04 17:46:08.190672+02
19	task_control	0002_auto_20200210_0049	2020-02-10 00:49:38.001967+02
20	task_control	0003_auto_20200213_1945	2020-02-13 19:45:52.653786+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
v8xrxh18b6zbzy5uupf19qekf8x1m448	MWI3MTA4ODgwNjQzZjkzZDU2MTAwNWVhMjliNjlhY2YyOWIyMWRkZDp7fQ==	2020-02-18 16:42:56.581667+02
ik5ptwiv2f5nqclrz2801e4ald6k19b8	YjdjMGM2M2MyZDYwNGVlNWM0NDBkZWU0YWVmNDQ4NTAyMjkyMGNmMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo1fQ==	2020-02-22 22:25:37.486038+02
aclqad2ruc9lo5ds4pfbeg774rv876y4	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-03-06 13:43:41.922277+02
gf5hpij25yns1d31c7gpkz6wqbwopism	MDgyYTJmMzQ5NmNjN2Q3OGY2ZmIxMjcyYmU5YTYyMWI4OTk5NDljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-18 17:18:00.078129+02
go1j6u4b8qob153rrbxsg6ctrxl0jc6a	YjdjMGM2M2MyZDYwNGVlNWM0NDBkZWU0YWVmNDQ4NTAyMjkyMGNmMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo1fQ==	2020-02-22 22:25:49.090591+02
6gt66s6er24ek1ugu7pg4fmp1dtyup4j	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-24 00:48:35.993722+02
atfpk71mchqdjlllert662dpyeqr66g6	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-24 17:08:23.338074+02
7o9njgty9lzr60rujgjusnk0mj4luj1k	ZjY3NDZiMzZmNDU2NWJiMWFkMWM0OGFlMDhlYzBkY2Q4YmU0MGU0Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYWQ2ODdmZmUyZjdkZWZmOTRjNWNlZWMxYTc4Yzg2MTUzNDA2MGJjIiwiX3Nlc3Npb25fZXhwaXJ5Ijo1fQ==	2020-02-22 22:37:40.76651+02
d9h8nb3p4sh9lz6d8ac1hryxa2f8vtgj	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-25 17:53:00.017926+02
ncaorul4uhj9fo9hwmcq940ta0w9wuay	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:48:18.18178+02
bu8lorm5xkfrdo5cvunt0tbcvtwejrus	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-25 19:25:08.922268+02
0rv377k5rf3okh23jxcvgn2ie95xfwnt	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-26 17:11:16.011258+02
27ymbe2cv0y7k86jmt8wo0fuyogmjyth	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-27 15:48:10.003601+02
6i8lfwmd885leggaw7p99gfwxk5dnll8	MDZiN2YzNGQ4ODQxN2E5N2FkZDY1ZThmMGQ1YWY4ZTIyZjdhYTNiNTp7Il9zZXNzaW9uX2V4cGlyeSI6NSwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFhZDY4N2ZmZTJmN2RlZmY5NGM1Y2VlYzFhNzhjODYxNTM0MDYwYmMifQ==	2020-02-22 22:48:25.577173+02
7h8leodkdhqworb0rifacjuqhzd58c37	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-27 17:45:07.91986+02
w7uy9m9cagznrayhghhn0rrbkod8mxpf	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:48:32.831381+02
cqp59lnec4478zpl0pf0l180kxb0ucl1	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-02-28 14:54:54.279565+02
ymth7bedzffefjku5tdw3081p2diay89	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-03-02 17:50:07.713126+02
fsdgefpvsc2ot79ngp3u8qv895nj5q65	ZDc5ODk1NWU3NDJlN2RkMmY3NmJkOWRiZjI1M2ZkZWY0M2VjOGI3ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NSwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjM1Zjc0Zjc2ZTI3MGJiN2RkZTI5MDhkYjI3Mzg5YzgwZjgxYzNiNTMifQ==	2020-02-22 22:48:51.043656+02
k0ljj2h7a3c7towtbo00suk2t8auvfbt	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:49:02.996876+02
ypfeu0w81t1fuyqb4ibv54d1as2u3wd4	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:53:16.31507+02
8sk5cbtdx9hwxhzm9rzhus8thynn7iia	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:53:35.450017+02
3jbcdln8xk6lhr70t27w14tifc6fpjg5	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:53:50.653559+02
xlw2qs8w28frl8kwomch3yk3xkvcpgzh	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:53:56.111746+02
2pmjengjlw0409tjmbmghrlbu5jh2b4c	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:54:06.738095+02
s8znllpmlh9pzy7au2h92gbr05m886dl	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-03-07 17:58:25.995388+02
j7gw71bhruehmvh17jtwqlogajcrde2p	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-03-06 10:13:01.279129+02
krq18ag5ikv277jg89jvtyv5rll6htkt	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-03-06 11:46:35.643546+02
choqi0npct7hbqkmjfmgy225d27n1h2t	MDZiN2YzNGQ4ODQxN2E5N2FkZDY1ZThmMGQ1YWY4ZTIyZjdhYTNiNTp7Il9zZXNzaW9uX2V4cGlyeSI6NSwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFhZDY4N2ZmZTJmN2RlZmY5NGM1Y2VlYzFhNzhjODYxNTM0MDYwYmMifQ==	2020-02-22 22:53:41.590958+02
kwty9mhryf8ulynj6moo7q4f806h90fh	MDZiN2YzNGQ4ODQxN2E5N2FkZDY1ZThmMGQ1YWY4ZTIyZjdhYTNiNTp7Il9zZXNzaW9uX2V4cGlyeSI6NSwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFhZDY4N2ZmZTJmN2RlZmY5NGM1Y2VlYzFhNzhjODYxNTM0MDYwYmMifQ==	2020-02-22 22:54:01.657261+02
hjbfbqtr24z9sdc5ajmyh2wodp0p8mmg	MDZiN2YzNGQ4ODQxN2E5N2FkZDY1ZThmMGQ1YWY4ZTIyZjdhYTNiNTp7Il9zZXNzaW9uX2V4cGlyeSI6NSwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFhZDY4N2ZmZTJmN2RlZmY5NGM1Y2VlYzFhNzhjODYxNTM0MDYwYmMifQ==	2020-02-22 22:54:21.548451+02
hvkxy8kq4ap75hh016pi5fl1xblw98df	M2U2ODNjNjgzNzQ5NzE0OThmYTU4Y2M0OTczNzJiM2IzOTIzZTAzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NX0=	2020-02-22 22:54:29.162894+02
25mfxtzhje5ghtgu6q1upsk7zkozufaz	ODYxYTM0YzhmMTY0NThlYzkwOTBlYzA3MjU1OGZlYWIwNzQ3MzUzNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNWY3NGY3NmUyNzBiYjdkZGUyOTA4ZGIyNzM4OWM4MGY4MWMzYjUzIn0=	2020-03-07 22:54:43.84432+02
\.


--
-- Data for Name: task_control_status; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.task_control_status (id, "order", name) FROM stdin;
1	1	New
2	2	In progress
3	3	In QA
4	4	Ready
5	5	Done
\.


--
-- Data for Name: task_control_taskmodel; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.task_control_taskmodel (id, title, create_time, update_time, status_id, worker_id, owner_id) FROM stdin;
6	task six	2020-02-10 19:55:32.534208+02	2020-02-21 18:28:06.424732+02	1	5	2
13	task	2020-02-21 13:22:42.500578+02	2020-02-22 22:55:05.078791+02	4	5	2
14	task fourteen	2020-02-21 13:26:31.133398+02	2020-02-21 13:40:08.578667+02	3	5	5
21	111	2020-02-22 18:29:35.030159+02	2020-02-22 19:23:05.320005+02	3	3	2
10	task ten	2020-02-21 09:49:31.315007+02	2020-02-22 19:54:55.580756+02	3	3	3
9	task nine	2020-02-20 19:31:37.479054+02	2020-02-22 19:57:01.103756+02	2	3	3
2	task two	2020-02-10 16:56:16.628033+02	2020-02-22 19:57:16.960633+02	2	5	4
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 17, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: task_control_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.task_control_status_id_seq', 5, true);


--
-- Name: task_control_taskmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.task_control_taskmodel_id_seq', 26, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: task_control_status task_control_status_order_1cd0a8d6_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_status
    ADD CONSTRAINT task_control_status_order_1cd0a8d6_uniq UNIQUE ("order");


--
-- Name: task_control_status task_control_status_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_status
    ADD CONSTRAINT task_control_status_pkey PRIMARY KEY (id);


--
-- Name: task_control_taskmodel task_control_taskmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_taskmodel
    ADD CONSTRAINT task_control_taskmodel_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: task_control_taskmodel_owner_id_d6d6e21f; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX task_control_taskmodel_owner_id_d6d6e21f ON public.task_control_taskmodel USING btree (owner_id);


--
-- Name: task_control_taskmodel_status_id_ef7f3161; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX task_control_taskmodel_status_id_ef7f3161 ON public.task_control_taskmodel USING btree (status_id);


--
-- Name: task_control_taskmodel_worker_id_31b95383; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX task_control_taskmodel_worker_id_31b95383 ON public.task_control_taskmodel USING btree (worker_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_control_taskmodel task_control_taskmod_status_id_ef7f3161_fk_task_cont; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_taskmodel
    ADD CONSTRAINT task_control_taskmod_status_id_ef7f3161_fk_task_cont FOREIGN KEY (status_id) REFERENCES public.task_control_status("order") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_control_taskmodel task_control_taskmodel_owner_id_d6d6e21f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_taskmodel
    ADD CONSTRAINT task_control_taskmodel_owner_id_d6d6e21f_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_control_taskmodel task_control_taskmodel_worker_id_31b95383_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.task_control_taskmodel
    ADD CONSTRAINT task_control_taskmodel_worker_id_31b95383_fk_auth_user_id FOREIGN KEY (worker_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


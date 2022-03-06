--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO sohamb;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_text_rich_texts_id_seq OWNER TO sohamb;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO sohamb;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO sohamb;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO sohamb;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO sohamb;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO sohamb;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    category character varying
);


ALTER TABLE public.categories OWNER TO sohamb;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO sohamb;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.conversations (
    id bigint NOT NULL,
    sender_id integer,
    recipient_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.conversations OWNER TO sohamb;

--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversations_id_seq OWNER TO sohamb;

--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    body text,
    conversation_id bigint,
    user_id bigint,
    read boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO sohamb;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO sohamb;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: offers; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.offers (
    id bigint NOT NULL,
    user_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    limitations character varying DEFAULT ''::character varying NOT NULL,
    redemption character varying DEFAULT ''::character varying NOT NULL,
    location character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.offers OWNER TO sohamb;

--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offers_id_seq OWNER TO sohamb;

--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying NOT NULL,
    body text,
    links text,
    project_ids text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO sohamb;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO sohamb;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    user_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    participants character varying DEFAULT ''::character varying NOT NULL,
    looking_for character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    volunteer_location character varying DEFAULT ''::character varying NOT NULL,
    contact character varying DEFAULT ''::character varying NOT NULL,
    highlight boolean DEFAULT false NOT NULL,
    progress character varying DEFAULT ''::character varying NOT NULL,
    docs_and_demo character varying DEFAULT ''::character varying NOT NULL,
    number_of_volunteers character varying DEFAULT ''::character varying NOT NULL,
    links character varying DEFAULT ''::character varying,
    status character varying DEFAULT ''::character varying NOT NULL,
    accepting_volunteers boolean DEFAULT true,
    short_description character varying DEFAULT ''::character varying NOT NULL,
    target_country character varying DEFAULT ''::character varying NOT NULL,
    target_location character varying DEFAULT ''::character varying NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    category character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    project_initiator character varying DEFAULT 'Student'::character varying NOT NULL,
    image_url character varying DEFAULT ''::character varying,
    user_ids jsonb[] DEFAULT '{}'::jsonb[],
    requirements character varying,
    steps character varying
);


ALTER TABLE public.projects OWNER TO sohamb;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO sohamb;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO sohamb;

--
-- Name: taggings; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_type character varying,
    taggable_id integer,
    tagger_type character varying,
    tagger_id integer,
    context character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE public.taggings OWNER TO sohamb;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.taggings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO sohamb;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    taggings_count integer DEFAULT 0
);


ALTER TABLE public.tags OWNER TO sohamb;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO sohamb;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    about character varying DEFAULT ''::character varying NOT NULL,
    location character varying DEFAULT ''::character varying NOT NULL,
    profile_links character varying DEFAULT ''::character varying NOT NULL,
    visibility boolean DEFAULT false,
    name character varying DEFAULT ''::character varying NOT NULL,
    level_of_availability character varying,
    pair_with_projects boolean DEFAULT false,
    deactivated boolean DEFAULT false NOT NULL,
    project_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    username character varying NOT NULL,
    initiator_type character varying DEFAULT 'Student'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO sohamb;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO sohamb;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: volunteer_groups; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.volunteer_groups (
    id bigint NOT NULL,
    project_id integer,
    assigned_user_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description character varying DEFAULT 'Used for personal project'::character varying NOT NULL
);


ALTER TABLE public.volunteer_groups OWNER TO sohamb;

--
-- Name: volunteer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.volunteer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteer_groups_id_seq OWNER TO sohamb;

--
-- Name: volunteer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.volunteer_groups_id_seq OWNED BY public.volunteer_groups.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: sohamb
--

CREATE TABLE public.volunteers (
    id bigint NOT NULL,
    user_id integer,
    project_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    note character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.volunteers OWNER TO sohamb;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: sohamb
--

CREATE SEQUENCE public.volunteers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO sohamb;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sohamb
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: volunteer_groups id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.volunteer_groups ALTER COLUMN id SET DEFAULT nextval('public.volunteer_groups_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
1	content	<div>asdfasdf</div>	Project	22	2022-03-06 02:47:03.522834	2022-03-06 02:47:03.522834
2	description	<div><strong>asdfasf</strong></div>	Project	25	2022-03-06 03:14:30.744007	2022-03-06 03:14:30.744007
4	description	<div><strong>Newest Project</strong></div><div><del>This is a test to differentiate <br></del><strong><em>The eating habits in today’s time have gone haywire, where we are more fond of junk food than healthy food. Because of this, many of us are becoming fat and getting lethargic. To stop this overeating and keep an eye on our food intake, we can make a calorie counter which would help in keeping a note of our calorie intake.</em></strong><em><br>The eating habits in today’s time have gone haywire, where we are more fond of junk food than healthy food. Because of this, many of us are becoming fat and getting lethargic. To stop this overeating and keep an eye on our food intake, we can make a calorie counter which would help in keeping a note of our calorie intake.</em></div>	Project	28	2022-03-06 03:58:09.027159	2022-03-06 04:02:58.549335
6	steps	<h1><strong>This is a header</strong></h1><div><br>This is a regular statement</div>	Project	5	2022-03-06 04:30:01.342393	2022-03-06 04:30:01.342393
5	requirements	<ul><li>This is an example to show a bullet list</li><li><strong>This is a bold statement</strong></li><li><em>This is an italicized statement</em><ul><li><del>This is a strike through statement and indente</del></li></ul></li></ul><div><br></div><ol><li>test</li><li>for</li><li>numbers<ol><li>inner</li></ol></li></ol>	Project	5	2022-03-06 04:30:01.330648	2022-03-06 04:52:00.240225
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-01-23 23:39:07.546107	2022-01-23 23:39:07.546107
schema_sha1	3d5a7417cdb8a670c629f5cc468e3d6a698b10ff	2022-01-23 23:39:07.656422	2022-01-23 23:39:07.656422
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.categories (id, category) FROM stdin;
1	Web Development
2	Mobile Development
3	Robotics
4	Deep Learning
5	Application Development
6	Blockchain
7	Cryptocurrencies
8	WEB3
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.conversations (id, sender_id, recipient_id, created_at, updated_at) FROM stdin;
1	4	2	2022-02-16 08:35:56.422394	2022-02-16 08:35:56.422394
2	5	2	2022-02-17 04:19:58.904676	2022-02-17 04:19:58.904676
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.messages (id, body, conversation_id, user_id, read, created_at, updated_at) FROM stdin;
1	hey	1	4	t	2022-02-16 08:36:10.176545	2022-02-16 08:36:21.033661
2	hi	1	2	t	2022-02-16 21:40:46.902449	2022-02-16 21:41:11.780446
3	hey	2	5	t	2022-02-17 04:20:02.820616	2022-02-17 04:20:19.812167
4	hi	1	4	t	2022-02-17 18:44:24.179823	2022-02-17 18:44:37.856205
5	hello	1	2	f	2022-02-23 00:00:50.530547	2022-02-23 00:00:50.530547
6	this is a test	1	2	f	2022-02-24 12:00:45.884242	2022-02-24 12:00:45.884242
7	hi	1	2	t	2022-02-24 13:19:21.412449	2022-02-24 13:23:03.462121
9	hello	1	2	t	2022-02-24 13:23:39.054029	2022-02-24 13:23:43.593098
10	hey	1	4	t	2022-02-24 13:38:23.797951	2022-02-24 14:04:02.901967
11	yo	1	4	t	2022-02-24 14:05:27.268508	2022-02-24 14:05:38.438055
12	yeah?	1	2	t	2022-02-24 14:05:51.151287	2022-02-24 14:05:51.398456
13	test	1	2	f	2022-02-25 02:31:55.61749	2022-02-25 02:31:55.61749
8	whats up	2	2	t	2022-02-24 13:22:16.728233	2022-02-25 03:44:28.378049
14	hi	2	5	t	2022-02-25 03:44:36.294432	2022-02-25 03:45:29.943147
15	test	2	5	t	2022-02-25 03:45:51.851556	2022-02-25 03:46:32.894289
16	hello!	2	2	t	2022-02-25 03:46:42.605873	2022-02-25 03:47:02.78768
17	Longer message test: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	2	2	f	2022-02-25 03:48:27.110435	2022-02-25 03:48:27.110435
18	hi	1	2	f	2022-03-03 18:34:18.355048	2022-03-03 18:34:18.355048
\.


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.offers (id, user_id, name, description, limitations, redemption, location, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.posts (id, title, body, links, project_ids, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.projects (id, user_id, name, description, participants, looking_for, created_at, updated_at, volunteer_location, contact, highlight, progress, docs_and_demo, number_of_volunteers, links, status, accepting_volunteers, short_description, target_country, target_location, views, category, project_initiator, image_url, user_ids, requirements, steps) FROM stdin;
2	4	Build a custom google maps theme	In this project, you’ll be creating and styling a Google Map with a theme and custom marker images. You’ll use Google Cloud Platform to create the map, and also use the Google Maps JavaScript API to load the map on a website. I’ve created a Super Mario themed map here but you are welcome to use any style you’d like!			2022-02-10 07:42:43.231359	2022-03-03 18:42:45.368293			t		None		www.github.com	Just started	t	Creating and styling a Google Map theme			42	{"Web Development"}	Student		{"{\\"id\\": 2, \\"role\\": \\"Student\\", \\"username\\": \\"sohambee\\", \\"description\\": \\"Personal Project\\"}"}	Display a Google Map on your website with a custom color theme\r\nCenter the map at a particular latitude/longitude\r\nUse custom markers around the map	Create a GitHub Repository:\r\nWe require a GitHub public repository for every solution. This way it's easier to share your code with the community if you need help. When you share your solution, your repo will need to be public, but feel free to start off private if you prefer that.\r\n\r\nBuild your project:\r\nList and prioritize the features for your project\r\nChoose the framework and library you want to use\r\nEstimate project timeline\r\nReference official documentation
4	4	Arduino based Smartphone Controlled Robot Car	Nowadays smartphones can be used to control a host of electrical and electronic devices including motors, music systems and lights. Here we present an Arduino based robot car, which can be controlled using an Android smartphone having ArduinoRC application installed in it. This bot receives commands from your smartphone with the help of a Bluetooth module.			2022-02-10 17:57:39.116572	2022-03-06 04:24:17.832298			t		None			Just started	t	Create a robot car that can be controlled from your smartphone			87	{Robotics}	Student		{"{\\"id\\": 2, \\"role\\": \\"Student\\", \\"username\\": \\"sohambee\\", \\"description\\": \\"Test\\"}"}	""	""
3	4	Temperature converter mobile app	You'll create a simple app to convert temperatures from Celsius to Fahrenheit, and vice-versa. This project should be implemented as a mobile app. See here for the website version of this project.			2022-02-10 17:54:37.074292	2022-02-25 20:46:52.257714			t		None			Just started	t	Using mobile application resources to develop a temperature conversion app			19	{"Mobile Development"}	Student		{}	""	""
6	4	Text Automation with Recurrent Neural Networks	To start with deep learning, the very basic project that you can build is to predict the next digit in a sequence. Create a sequence like a list of odd numbers and then build a model and train it to predict the next digit in the sequence. A simple neural network with 2 layers would be sufficient to build the model.			2022-02-10 18:01:00.272217	2022-02-23 08:44:38.617795			t		None			Just started	t	Build your own autofill system			6	{"Deep Learning"}	Student		{}	""	""
7	4	Human Face Detection using OpenCV	The face detection took a major leap with deep learning techniques. We can build models with high accuracy in detecting the bounding boxes of the human face. This project will get you started with object detection and you will learn how to detect any object in an image.			2022-02-10 18:02:18.286403	2022-02-25 10:17:00.965652			t		None			Just started	t	Detect human faces using openCV and deep learning			53	{"Deep Learning"}	Student		{"{\\"id\\": 2, \\"role\\": \\"Student\\", \\"username\\": \\"sohambee\\", \\"description\\": \\"Personal Project\\"}","{\\"id\\": 5, \\"role\\": \\"Student\\", \\"username\\": \\"ames\\", \\"description\\": \\"Course Project\\"}"}	""	""
9	4	Social Media Alert App	In this digital age where each and every person is using any social media app, the rate of cyber crimes is also increasing with online threats like sexual predators, fraud accounts, internet trolls, etc becoming prevalent. To prevent this, we can make some kind of plugin that blocks such suspicious people whenever they try to approach us.			2022-02-10 18:08:59.536164	2022-03-06 06:10:19.850817			t		None			Just started	t	A tool to help monitor and filter social media platforms			294	{"Application Development"}	Student		{"{\\"id\\": 2, \\"role\\": \\"Student\\", \\"username\\": \\"sohambee\\", \\"description\\": \\"Personal Project\\"}"}	""	""
5	4	RF Controlled Robot	We start off with a simple Arduino-board based robot. It can be driven remotely using an RF remote control.  This robot can be built very quickly in a small budget. The RF remote control provides the advantage of a good controlling range (up to 100 metres with proper antennae) besides being omnidirectional. The heart of the robot is Arduino UNO board. Another reason to get your hands dirty.			2022-02-10 17:58:31.558352	2022-03-06 06:10:24.965967			t		None			Just started	t	An automated robot controlled with radio frequencies			36	{Robotics}	Student		{"{\\"id\\": 2, \\"role\\": \\"Student\\", \\"username\\": \\"sohambee\\", \\"description\\": \\"Example\\"}"}	""	""
10	4	Calorie Counting Application	The eating habits in today’s time have gone haywire, where we are more fond of junk food than healthy food. Because of this, many of us are becoming fat and getting lethargic. To stop this overeating and keep an eye on our food intake, we can make a calorie counter which would help in keeping a note of our calorie intake.			2022-02-10 18:09:51.113711	2022-03-06 04:17:43.036184			t		None		www.github.com	Just started	t	An application to help monitor and track caloric intake			260	{"Application Development"}	Student		{"{\\"id\\": 2, \\"role\\": \\"Student\\", \\"username\\": \\"sohambee\\", \\"description\\": \\"Course Assignment\\"}"}	-	-
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.schema_migrations (version) FROM stdin;
20210725233035
20200315231312
20200315235813
20200316012101
20200316183014
20200316195620
20200316204207
20200317005612
20200317215331
20200318000013
20200318143205
20200318143206
20200318143207
20200318143208
20200318143209
20200318143210
20200318215539
20200319064535
20200321205731
20200321210730
20200322121011
20200323061132
20200327230914
20200328073356
20200329101014
20200330141451
20200401143158
20200405052014
20200406030212
20200406185148
20200408030827
20200508154345
20210630030455
20210707150604
20210708012210
20210708222445
20210709031651
20210709062029
20210709062406
20210712184726
20210712185618
20210712185932
20210712220709
20210725232438
20210725232909
20220301025827
20220301025844
20220305210507
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.taggings (id, tag_id, taggable_type, taggable_id, tagger_type, tagger_id, context, created_at) FROM stdin;
1	1	User	4	\N	\N	skills	2022-02-17 02:32:01.815636
2	2	User	4	\N	\N	skills	2022-02-17 02:32:01.826141
3	3	User	2	\N	\N	skills	2022-02-17 02:36:31.03293
4	4	User	2	\N	\N	skills	2022-02-17 02:36:31.044125
5	5	User	2	\N	\N	skills	2022-02-17 02:36:31.056121
6	6	User	2	\N	\N	skills	2022-02-17 02:36:31.06734
7	7	User	2	\N	\N	skills	2022-02-17 02:36:31.07632
8	8	User	2	\N	\N	skills	2022-02-17 02:36:31.088257
9	9	User	2	\N	\N	skills	2022-02-17 02:36:31.099977
10	10	User	2	\N	\N	skills	2022-02-17 02:36:31.11109
11	11	User	2	\N	\N	skills	2022-02-17 02:36:31.124226
12	12	User	2	\N	\N	skills	2022-02-17 02:36:31.134743
13	13	User	2	\N	\N	skills	2022-02-17 02:36:31.150286
14	1	User	2	\N	\N	skills	2022-02-17 02:36:31.160951
15	2	User	2	\N	\N	skills	2022-02-17 02:36:31.17116
16	14	User	2	\N	\N	skills	2022-02-17 02:36:31.182301
17	6	User	5	\N	\N	skills	2022-02-17 05:15:31.928613
18	7	User	5	\N	\N	skills	2022-02-17 05:15:31.936212
19	15	User	5	\N	\N	skills	2022-02-17 05:15:31.939544
20	9	User	5	\N	\N	skills	2022-02-17 05:15:31.942727
21	10	User	5	\N	\N	skills	2022-02-17 05:15:31.945924
22	12	User	5	\N	\N	skills	2022-02-17 05:15:31.95134
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.tags (id, name, created_at, updated_at, taggings_count) FROM stdin;
3	Biology	2022-02-17 02:36:30.970661	2022-02-17 02:36:30.970661	1
4	Biotech	2022-02-17 02:36:30.976009	2022-02-17 02:36:30.976009	1
5	Community Outreach	2022-02-17 02:36:30.984943	2022-02-17 02:36:30.984943	1
8	Localization	2022-02-17 02:36:30.996929	2022-02-17 02:36:30.996929	1
11	Mechanics & Electronics	2022-02-17 02:36:31.00938	2022-02-17 02:36:31.00938	1
13	PM	2022-02-17 02:36:31.019519	2022-02-17 02:36:31.019519	1
1	Software	2022-02-17 02:32:01.776137	2022-02-17 02:32:01.776137	2
2	Training Development	2022-02-17 02:32:01.78516	2022-02-17 02:32:01.78516	2
14	Volunteer vetting	2022-02-17 02:36:31.023726	2022-02-17 02:36:31.023726	1
6	Data entry	2022-02-17 02:36:30.989492	2022-02-17 02:36:30.989492	2
7	Design	2022-02-17 02:36:30.992847	2022-02-17 02:36:30.992847	2
15	Helpdesk	2022-02-17 05:15:31.912794	2022-02-17 05:15:31.912794	1
9	Manufacturing	2022-02-17 02:36:31.001488	2022-02-17 02:36:31.001488	2
10	Marketing	2022-02-17 02:36:31.005449	2022-02-17 02:36:31.005449	2
12	Operations	2022-02-17 02:36:31.014642	2022-02-17 02:36:31.014642	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, about, location, profile_links, visibility, name, level_of_availability, pair_with_projects, deactivated, project_ids, username, initiator_type) FROM stdin;
4	soham.bhavsar@ontariotechu.net	$2a$11$Elqco96WPDl81YR39Ashw.U7GQHl2RgjZ8eDf3EX5WTKbLyCcGWmy	\N	\N	\N	0	\N	\N	\N	\N	2022-02-09 21:59:33.250473	2022-02-17 02:32:01.762006	I like to code.	Canada	-	t	Soham Bhavsar	4+ hours a day	f	f	{}	sohamb	Student
5	amyngo87@gmail.com	$2a$11$UF6rHNHYxY8bYlZ0r20Re.1XLyKBB3VlUEzQdIlmLeTzmamdpfF0K	\N	\N	\N	0	\N	\N	\N	\N	2022-02-17 04:19:46.099905	2022-02-17 05:15:31.909381	I love to code.	Canada	-	t	Amy Ngo	4+ hours a day	f	f	{}	ames	Student
2	soham.bhavsar@hotmail.com	$2a$11$F0N6bNT.QPZu/ZDhKNPa8u3Lzmk2a4aGvdBnxendxddH1iOpj.NTi	\N	\N	\N	0	\N	\N	\N	\N	2022-02-02 09:43:14.550191	2022-02-25 03:44:17.458638	I love to code.	Canada	-	t	Soham Bhavsar	4+ hours a day	f	f	{}	sohambee	Student
\.


--
-- Data for Name: volunteer_groups; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.volunteer_groups (id, project_id, assigned_user_ids, created_at, updated_at, description) FROM stdin;
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: sohamb
--

COPY public.volunteers (id, user_id, project_id, created_at, updated_at, note) FROM stdin;
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 6, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.conversations_id_seq', 2, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.messages_id_seq', 18, true);


--
-- Name: offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.offers_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.projects_id_seq', 28, true);


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.taggings_id_seq', 22, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.tags_id_seq', 15, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: volunteer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.volunteer_groups_id_seq', 1, false);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sohamb
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 1, false);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volunteer_groups volunteer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.volunteer_groups
    ADD CONSTRAINT volunteer_groups_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_categories_on_category; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_categories_on_category ON public.categories USING btree (category);


--
-- Name: index_messages_on_conversation_id; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_messages_on_conversation_id ON public.messages USING btree (conversation_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_messages_on_user_id ON public.messages USING btree (user_id);


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_taggings_on_context ON public.taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_taggings_on_tag_id ON public.taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_taggings_on_taggable_id ON public.taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_taggings_on_taggable_type ON public.taggings USING btree (taggable_type);


--
-- Name: index_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_taggings_on_tagger_id ON public.taggings USING btree (tagger_id);


--
-- Name: index_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX index_taggings_on_tagger_id_and_tagger_type ON public.taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE UNIQUE INDEX taggings_idx ON public.taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX taggings_idy ON public.taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: taggings_taggable_context_idx; Type: INDEX; Schema: public; Owner: sohamb
--

CREATE INDEX taggings_taggable_context_idx ON public.taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: taggings fk_rails_9fcd2e236b; Type: FK CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT fk_rails_9fcd2e236b FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: sohamb
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--


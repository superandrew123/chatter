--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: comments; Type: TABLE; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    comment_content character varying,
    user_id integer,
    post_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE comments OWNER TO mpsj;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: mpsj
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO mpsj;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mpsj
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE TABLE followers (
    id integer NOT NULL,
    follower_id integer,
    followed_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE followers OWNER TO mpsj;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: mpsj
--

CREATE SEQUENCE followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE followers_id_seq OWNER TO mpsj;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mpsj
--

ALTER SEQUENCE followers_id_seq OWNED BY followers.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    post_content character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    expired timestamp without time zone,
    search_post_content character varying
);


ALTER TABLE posts OWNER TO mpsj;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: mpsj
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO mpsj;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mpsj
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO mpsj;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
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
    handle character varying,
    name character varying,
    search_handle character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE users OWNER TO mpsj;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mpsj
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO mpsj;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mpsj
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mpsj
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mpsj
--

ALTER TABLE ONLY followers ALTER COLUMN id SET DEFAULT nextval('followers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mpsj
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mpsj
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: mpsj
--

COPY comments (id, comment_content, user_id, post_id, created_at, updated_at) FROM stdin;
433	It is best to stay committed to a time in the morning for a workout so the day does not get away from you and you find excuses to not follow through along the way.	72	387	2015-04-20 17:12:17.140331	2015-04-20 17:12:17.140331
434	For me it helps to just DECIDE. my calendar literally and stick to the times allotted for exercise.	70	387	2015-04-20 17:13:46.859454	2015-04-20 17:13:46.859454
435	It helps to find a friend or two to workout together, make a commitment and help you keep to the schedule.	71	387	2015-04-20 17:14:36.998015	2015-04-20 17:14:36.998015
436	Many people make the mistake of confusing information with knowledge. They are not the same thing. Knowledge involves the interpretation of information. Knowledge involves listening.	66	388	2015-04-20 19:50:43.164287	2015-04-20 19:50:43.164287
437	As Shari Morwood put it, "It starts at the top-if we as management don't listen or don't know how, we can't tap the full power of the amazing talent in our own organizations. Listening is learning." Rosa Urtubi added that "listening is assuming the responsibility, generosity to do something with whatever you hear. After all it is someone's gift to you." Wendy Zito believes that "when you feel you are being listened to then it helps you connect to the other person but it also helps you hear yourself."	67	388	2015-04-20 20:00:47.472384	2015-04-20 20:00:47.472384
438	"How many times (do) you have an answer as soon as you heard the main topic, suddenly your mind stopped listening and started developing your argument?" A discussion leadership strategy at Harvard Business School is based on this assumption: It is that a discussion leader should avoid calling on students whose hands have been in the air for several minutes. The assumption, which is nearly always borne out, is that they will bring the discussion back to where it was when they raised their hand, the point at which they stopped listening to what was being said by other students.	104	388	2015-04-20 20:07:52.589547	2015-04-20 20:07:52.589547
439	I think the right question here is, what makes people think not listening is OK? … Or even better, are there any situations that would require you to not listen deliberately?	66	388	2015-04-20 20:09:03.999674	2015-04-20 20:09:03.999674
440	Maybe companies (and individuals) are figuring out that listening to customers is not as profitable as other forms of interaction. 	105	388	2015-04-20 20:11:17.091536	2015-04-20 20:11:17.091536
441	I think it’s unethical for creditors to, in effect, stereotype users and make decisions based on aggregate data.  We need to enforce rules that govern how companies collect and use personal and aggregate data	104	389	2015-04-20 20:25:47.946073	2015-04-20 20:25:47.946073
442	Agreed.  Even though laws allow people to challenge false information in credit reports, there are no laws that require data aggregators to reveal what they know about you. If I’ve Googled “diabetes” for a friend or “date rape drugs” for a mystery I’m writing, data aggregators assume those searches reflect my own health and proclivities. Because no laws regulate what types of data these aggregators can collect, they make their own rules.	102	389	2015-04-20 20:27:07.867562	2015-04-20 20:27:07.867562
443	Yes, Stereotyping is alive and well in data aggregation. Your application for credit could be declined not on the basis of your own finances or credit history, but on the basis of aggregate data — what other people whose likes and dislikes are similar to yours have done. 	67	389	2015-04-20 20:28:39.751825	2015-04-20 20:28:39.751825
444	You must make a dent in the universe with your company.	106	390	2015-04-20 21:36:04.836036	2015-04-20 21:36:04.836036
445	build something that 100 people love rather than 1 million people kind of like.	107	390	2015-04-20 21:42:09.839079	2015-04-20 21:42:09.839079
446	“If you want to create a great product, just focus on one person.  Make that one person have the most amazing experience ever."	107	390	2015-04-20 21:43:18.877341	2015-04-20 21:43:18.877341
447	The most successful start-up leaders recognize they do not have time to get all of the facts for the dozens of decisions they make each day. Instead, they just need to gather enough information to make sound decisions so the company can move forward. Some of those decisions will be wrong, but it is better to learn from those mistakes and try again than to be immobilized by indecisiveness.	108	390	2015-04-20 21:49:48.342257	2015-04-20 21:49:48.342257
448	The most successful start-up leaders recognize they do not have time to get all of the facts for the dozens of decisions they make each day. Instead, they just need to gather enough information to make sound decisions so the company can move forward. Some of those decisions will be wrong, but it is better to learn from those mistakes and try again than to be immobilized by indecisiveness.	109	390	2015-04-20 21:51:39.729213	2015-04-20 21:51:39.729213
449	Vision is the most important trait of a start-up leader. The ultimate test, though, is instilling the dream: encouraging the people around you to believe in your vision and quest. A consistent message and constantly renewed energy will help others to live your passion.	111	390	2015-04-20 22:08:23.716731	2015-04-20 22:08:23.716731
450	 A positive mindset defines a great leader. If you don't buy into a bulletproof mindset of positivity, you won't make it as an entrepreneur. Business is constantly filled with ups and downs; if the captain of the ship is always positive, he will influence others to feel the same.	113	390	2015-04-20 22:14:03.655663	2015-04-20 22:14:03.655663
451	"Always work hard on something uncomfortably exciting!"	117	391	2015-04-20 22:45:49.06837	2015-04-20 22:45:49.06837
452	You have to combine both things: invention and innovation focus.	117	391	2015-04-20 22:47:16.567037	2015-04-20 22:47:16.567037
453	Focus on new ideas, things that don't exist	66	391	2015-04-20 22:48:46.46474	2015-04-20 22:48:46.46474
454	A good leader creates great opportunities for others, that have a meaningful impact and are contributing to the good of society. 	66	391	2015-04-20 22:52:07.926074	2015-04-20 22:52:07.926074
455	a time machine, let's plug it in!	118	392	2015-04-20 23:04:18.300769	2015-04-20 23:04:18.300769
456	 ‘Why do you need to plug it in?’”	117	392	2015-04-20 23:04:51.71322	2015-04-20 23:04:51.71322
457	You're either never going to be the only developer on the project, or you will never be able to remember everything you've contributed to a project. Future you is an entirely different developer than present you. Tests make future you's life much much easier by self-documenting and validating your work as you go. Tests become a time capsule to make working with past you as easy as working with present youAnother thing to take into consideration is you might not always be working alone. There may come a contract or a job where you would be working on a team. Teams love tests because they are a great way to reveal how an individual's code works. Writing tests on a team is your way of saying "My code works. See? Whatever you do, make sure this code still works." Being a good teammate means making sure you make it as easy as possible for your other team members.	67	393	2015-04-20 23:31:35.086679	2015-04-20 23:31:35.086679
458	"Yes, test-first is dead to me. But rather than dance on its grave, I'd rather honor its contributions than linger on the travesties. It marked an important phase in our history, yet it's time to move on.  Long live testing."	106	393	2015-04-20 23:32:30.828908	2015-04-20 23:32:30.828908
459	What is the best way to install node in that situation to be able to use it in multiple projects and without having to use sudo?  Should I use nvm (to make sure that the applications will work in the future)? Can i use nvm to install global packages without sudo?  What would you recommend or can you post a link to installation/configuration instructions that I could pass to my provider?	66	394	2015-04-21 13:46:49.866737	2015-04-21 13:46:49.866737
462	whats the latest controversy	66	399	2015-04-21 22:07:27.020852	2015-04-21 22:07:27.020852
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mpsj
--

SELECT pg_catalog.setval('comments_id_seq', 467, true);


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: mpsj
--

COPY followers (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
333	71	68	2015-04-20 14:52:42.113388	2015-04-20 14:52:42.113388
334	65	69	2015-04-20 14:52:42.115734	2015-04-20 14:52:42.115734
335	72	64	2015-04-20 14:52:42.117312	2015-04-20 14:52:42.117312
336	68	70	2015-04-20 14:52:42.11886	2015-04-20 14:52:42.11886
337	73	71	2015-04-20 14:52:42.120386	2015-04-20 14:52:42.120386
338	64	68	2015-04-20 14:52:42.122011	2015-04-20 14:52:42.122011
339	65	64	2015-04-20 14:52:42.123698	2015-04-20 14:52:42.123698
340	67	69	2015-04-20 14:52:42.125272	2015-04-20 14:52:42.125272
341	64	70	2015-04-20 14:52:42.126772	2015-04-20 14:52:42.126772
342	64	73	2015-04-20 14:52:42.128303	2015-04-20 14:52:42.128303
343	69	70	2015-04-20 14:52:42.129828	2015-04-20 14:52:42.129828
344	65	64	2015-04-20 14:52:42.1314	2015-04-20 14:52:42.1314
345	70	71	2015-04-20 14:52:42.132906	2015-04-20 14:52:42.132906
346	66	72	2015-04-20 14:52:42.13437	2015-04-20 14:52:42.13437
347	71	73	2015-04-20 14:52:42.135863	2015-04-20 14:52:42.135863
348	68	66	2015-04-20 14:52:42.137355	2015-04-20 14:52:42.137355
349	70	67	2015-04-20 14:52:42.138862	2015-04-20 14:52:42.138862
350	66	72	2015-04-20 14:52:42.140378	2015-04-20 14:52:42.140378
351	67	72	2015-04-20 14:52:42.141895	2015-04-20 14:52:42.141895
352	73	66	2015-04-20 14:52:42.143362	2015-04-20 14:52:42.143362
353	66	67	2015-04-20 14:52:42.144854	2015-04-20 14:52:42.144854
354	68	72	2015-04-20 14:52:42.14661	2015-04-20 14:52:42.14661
355	67	71	2015-04-20 14:52:42.148286	2015-04-20 14:52:42.148286
356	65	64	2015-04-20 14:52:42.14983	2015-04-20 14:52:42.14983
357	66	65	2015-04-20 14:52:42.151337	2015-04-20 14:52:42.151337
358	64	67	2015-04-20 14:52:42.152828	2015-04-20 14:52:42.152828
359	71	64	2015-04-20 14:52:42.154408	2015-04-20 14:52:42.154408
360	66	67	2015-04-20 14:52:42.155895	2015-04-20 14:52:42.155895
361	70	69	2015-04-20 14:52:42.157365	2015-04-20 14:52:42.157365
362	65	68	2015-04-20 14:52:42.158902	2015-04-20 14:52:42.158902
363	70	64	2015-04-20 14:52:42.160392	2015-04-20 14:52:42.160392
364	65	67	2015-04-20 14:52:42.161929	2015-04-20 14:52:42.161929
365	67	73	2015-04-20 14:52:42.163489	2015-04-20 14:52:42.163489
366	64	72	2015-04-20 14:52:42.164969	2015-04-20 14:52:42.164969
367	71	69	2015-04-20 14:52:42.16646	2015-04-20 14:52:42.16646
368	64	67	2015-04-20 14:52:42.167992	2015-04-20 14:52:42.167992
369	65	67	2015-04-20 14:52:42.169529	2015-04-20 14:52:42.169529
370	71	73	2015-04-20 14:52:42.171053	2015-04-20 14:52:42.171053
371	64	66	2015-04-20 14:52:42.172619	2015-04-20 14:52:42.172619
372	65	64	2015-04-20 14:52:42.174124	2015-04-20 14:52:42.174124
373	66	68	2015-04-20 15:31:11.177954	2015-04-20 15:31:11.177954
374	66	71	2015-04-20 15:31:20.649747	2015-04-20 15:31:20.649747
375	66	64	2015-04-20 15:31:43.825594	2015-04-20 15:31:43.825594
376	66	70	2015-04-20 15:31:52.024715	2015-04-20 15:31:52.024715
377	70	66	2015-04-20 15:32:39.825039	2015-04-20 15:32:39.825039
378	70	68	2015-04-20 15:32:46.818087	2015-04-20 15:32:46.818087
379	72	66	2015-04-20 15:35:37.736936	2015-04-20 15:35:37.736936
380	67	66	2015-04-20 15:35:59.75635	2015-04-20 15:35:59.75635
381	65	66	2015-04-20 15:36:52.448861	2015-04-20 15:36:52.448861
382	66	104	2015-04-20 20:29:57.414335	2015-04-20 20:29:57.414335
383	66	102	2015-04-20 20:30:06.725218	2015-04-20 20:30:06.725218
385	66	105	2015-04-20 20:49:00.139932	2015-04-20 20:49:00.139932
386	103	66	2015-04-20 21:14:39.418887	2015-04-20 21:14:39.418887
387	104	66	2015-04-20 21:15:07.770165	2015-04-20 21:15:07.770165
388	109	66	2015-04-20 21:52:24.679751	2015-04-20 21:52:24.679751
389	110	66	2015-04-20 21:53:35.896102	2015-04-20 21:53:35.896102
390	111	66	2015-04-20 22:08:38.645557	2015-04-20 22:08:38.645557
391	112	66	2015-04-20 22:09:45.298923	2015-04-20 22:09:45.298923
392	113	66	2015-04-20 22:14:14.12513	2015-04-20 22:14:14.12513
393	113	106	2015-04-20 22:15:02.690914	2015-04-20 22:15:02.690914
394	113	107	2015-04-20 22:15:10.185891	2015-04-20 22:15:10.185891
395	113	108	2015-04-20 22:15:20.057076	2015-04-20 22:15:20.057076
396	114	66	2015-04-20 22:17:15.102535	2015-04-20 22:17:15.102535
397	114	113	2015-04-20 22:17:24.621625	2015-04-20 22:17:24.621625
398	115	66	2015-04-20 22:18:42.231069	2015-04-20 22:18:42.231069
399	115	104	2015-04-20 22:18:48.738107	2015-04-20 22:18:48.738107
400	116	66	2015-04-20 22:19:52.530437	2015-04-20 22:19:52.530437
402	117	66	2015-04-20 22:44:40.187498	2015-04-20 22:44:40.187498
403	66	117	2015-04-20 23:14:40.122964	2015-04-20 23:14:40.122964
\.


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mpsj
--

SELECT pg_catalog.setval('followers_id_seq', 403, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: mpsj
--

COPY posts (id, post_content, user_id, created_at, updated_at, expired, search_post_content) FROM stdin;
387	How to find time for exercise in your busy schedule	66	2015-04-20 17:10:42.018505	2015-04-20 17:10:42.018505	2015-04-27 17:10:42.016746	how to find time for exercise in your busy schedule
388	Are We Losing the Art of Listening?	103	2015-04-20 19:49:21.021247	2015-04-20 19:49:21.021247	2015-04-27 19:49:21.018667	are we losing the art of listening?
389	what is your opinion on data aggregators revealing what they know about you?	66	2015-04-20 20:23:21.40371	2015-04-20 20:23:21.40371	2015-04-27 20:23:21.401529	what is your opinion on data aggregators revealing what they know about you?
390	What does a Start-Up need to have to succeed	66	2015-04-20 21:35:20.530079	2015-04-20 21:35:20.530079	2015-04-27 21:35:20.528191	what does a start-up need to have to succeed
391	What is the one sentence summary of how you change the world?  	113	2015-04-20 22:43:32.58634	2015-04-20 22:43:32.58634	2015-04-27 22:43:32.584051	what is the one sentence summary of how you change the world?  
392	"We should be building great things that don’t exist.”  What is the next moon shot project that will push the boundaries of whatever is currently the “norm.” 	117	2015-04-20 23:02:03.76457	2015-04-20 23:02:03.76457	2015-04-27 23:02:03.762736	"we should be building great things that don’t exist.”  what is the next moon shot project that will push the boundaries of whatever is currently the “norm.” 
393	"The test-first part was a wonderful set of training wheels that taught me how to think about testing at a deeper level, but also some I quickly left behind."  What are your thoughts...	106	2015-04-20 23:21:12.464487	2015-04-20 23:21:12.464487	2015-04-27 23:21:12.46184	"the test-first part was a wonderful set of training wheels that taught me how to think about testing at a deeper level, but also some i quickly left behind."  what are your thoughts...
394	Node.js and MongoDB have literally taken the software and web industries by storm	119	2015-04-21 13:42:36.085188	2015-04-21 13:42:36.085188	2015-04-28 13:42:36.083202	node.js and mongodb have literally taken the software and web industries by storm
399	Whats going on with node.js	66	2015-04-21 20:09:41.315289	2015-04-21 20:09:41.315289	2015-04-28 20:09:41.312826	whats going on with node.js
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mpsj
--

SELECT pg_catalog.setval('posts_id_seq', 429, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: mpsj
--

COPY schema_migrations (version) FROM stdin;
20150406201632
20150406201642
20150406215404
20150406215829
20150407131140
20150407210300
20150408131932
20150408133059
20150408133348
20150408140439
20150414145825
20150415203635
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mpsj
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, handle, name, search_handle, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
67	ville@email.com	$2a$10$GJb6cUP8lUwGjHaPJ/GG.ecd88Q4R.TKeJ5fde7gloSiDxxw2XRcW	\N	\N	\N	5	2015-04-20 23:30:54.061845	2015-04-20 20:28:12.113537	::1	::1	ville	Ville Vesterinen	ville	2012-09-21_16.26.42.jpg	image/jpeg	2096968	2015-04-20 15:20:50.452556
72	taylor@email.com	$2a$10$ayMMsVsvNowKgH/3LI84ruKKLoYh7ANwM2cLIzshGGqaIjeVij3/.	\N	\N	\N	3	2015-04-20 17:11:27.044412	2015-04-20 15:35:28.188752	::1	::1	SoSwift	Taylor Swift	soswift	taylor.jpg	image/jpeg	156441	2015-04-20 15:29:19.236037
70	boss@email.com	$2a$10$bmMCBo8iFhXkUPc.yVBG2.JSw16okiO/Fo9VuSTODg4JjFaNMZpkq	\N	\N	\N	3	2015-04-20 17:13:15.745238	2015-04-20 15:32:32.405059	::1	::1	theBoss	Bruce Springsteen	theboss	bruce-springsteen.jpg	image/jpeg	126640	2015-04-20 15:28:00.225204
71	jada@email.com	$2a$10$7bh5vP3.M.nQs.PHrKS5GOnM2.03jGFIgy0szrB5q6IIpmInkQ8Z6	\N	\N	\N	2	2015-04-20 17:14:02.868342	2015-04-20 15:28:12.918808	::1	::1	Jada	Jada Pinkett Smith	jada	jada-pinkett-smith.jpg	image/jpeg	75394	2015-04-20 15:28:47.52347
69	kurt@email.com	$2a$10$rxB35iKMzZ/21X7ii2QfveJTZBFSWb8wBI2B7B4fS31NmH1y3geLG	\N	\N	\N	1	2015-04-20 15:27:01.319049	2015-04-20 15:27:01.319049	::1	::1	KurtyPants	Kurt Russell	kurtypants	\N	\N	\N	\N
73	karlie@email.com	$2a$10$/zYF6GEbUnR0ooPs.o5wVeSi7BN.3BvBGq7Ig6ufoicq0Jb5IkPq.	\N	\N	\N	1	2015-04-20 15:29:35.473987	2015-04-20 15:29:35.473987	::1	::1	TheKloss	Karlie Kloss	thekloss	Karlie_Kloss_Short_Hairstyles_Short_Wavy_Cut_tJ9v4RB09VFx.jpg	image/jpeg	145778	2015-04-20 15:29:56.961547
68	rock@email.com	$2a$10$lm62sdqAF1O6XBk7chgqKOhZS5WVPyHQvZ230F4GZ4Kd0PGEN8NjC	\N	\N	\N	2	2015-04-20 15:33:14.22583	2015-04-20 15:26:00.175778	::1	::1	theRock	Dwayne Johnson	therock	Dwayne_Johnson_at_the_2009_Tribeca_Film_Festival.jpg	image/jpeg	635420	2015-04-20 15:26:27.552159
102	laura@email.com	$2a$10$wByC63FZBgkYr1L79tT4VO01NqnWbMA.G3T4wiIrI4TkoUeJLWWhC	\N	\N	\N	1	2015-04-20 20:26:09.534122	2015-04-20 20:26:09.534122	::1	::1	laurahines22	Laura Hines	\N	\N	\N	\N	\N
76	projectflatironemail3@gmail.com	$2a$10$F.XBST.3X/xDN/qPqggpdOcNSQDrME9/2yT7INz6nZsD0ubVFAsfS	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79b6c3820>	Sopie DeBenedetto	\N	\N	\N	\N	\N
77	projectflatironemail4@gmail.com	$2a$10$VPYiCBuMAyu8dGboLpFZ8erwQyAQmHlTROMeOnfWUoA5BBQF.Cffi	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a18001b0>	Rebecca Eakins	\N	\N	\N	\N	\N
78	projectflatironemail5@gmail.com	$2a$10$WmUQ0XRmPxK6KkjuBZ8vQOlr0.3VrbTU8ABZ6NRGmW8FesqtGxuhC	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79c678c20>	Eric Fries	\N	\N	\N	\N	\N
79	projectflatironemail6@gmail.com	$2a$10$VN3yGyxnOehukeAN2si6UuonpHbjuz4paPK8QxAzMUeHJc9xgzdRq	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79c6d56f0>	Jay Jacobs	\N	\N	\N	\N	\N
80	projectflatironemail7@gmail.com	$2a$10$Lkscuj7Y62lm/BgIxOlteusASHHP3b8BJi2tVAzX7Bnv7cGlicxXS	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a010a3c0>	Casie Levine	\N	\N	\N	\N	\N
81	projectflatironemail8@gmail.com	$2a$10$fZOgOvKVT5nuoROgppixJ.MKbcRAmNkFi82wZlTXhe8ENq9MuWF7C	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79c6f2f70>	John "Jack" Gaybrick	\N	\N	\N	\N	\N
82	projectflatironemail9@gmail.com	$2a$10$wUid57elbp6ofoj0vYJDzuuDLPdoVzDShHudm9SKztq0P3qzf0aqS	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79b6f3ae8>	Cyrus Ghazanfar	\N	\N	\N	\N	\N
83	projectflatironemail10@gmail.com	$2a$10$/vYJTEIl5frugcUFUlfYMeArEW6IpAshe8Vl/LHX8HKBDwxcf7Uua	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a017fcb0>	Alex Goldvarg	\N	\N	\N	\N	\N
84	projectflatironemail12@gmail.com	$2a$10$zG8dAoZCRhcuRhqxD99k3OvttXf6IKDqoiBpCB6lVKUevdmHMg9FO	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a1949a80>	Maureen Johnston	\N	\N	\N	\N	\N
65	projectflatironemail11@gmail.com	$2a$10$xihX72d1k.7BCPiGHw8PAuQGyB9Lp/oXl94sRWZGkQ494a7WiwvDu	\N	\N	\N	2	2015-04-20 15:36:08.480426	2015-04-20 15:12:05.707982	::1	::1	laura	Laura Hines	laurahines22	2013-05-30_16.58.38.jpg	image/jpeg	48171	2015-04-20 15:13:15.57211
85	projectflatironemail13@gmail.com	$2a$10$MtOd6JHgNvdq6vI1eYStR.AKvIiiRuJFTMF1RUGc8Y28r6JrwqL3C	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79b7c9a30>	Alex Lee	\N	\N	\N	\N	\N
86	projectflatironemail14@gmail.com	$2a$10$6tVohyYRfgG0SPHN6QEIIeFcZ7AinRE2c9mnylQo3.0AJsufTSdHO	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79b7ee510>	Chloe Lee	\N	\N	\N	\N	\N
87	projectflatironemail16@gmail.com	$2a$10$d9.ZE9X4ryL0QK811gDnOOSPyqEO0agjbLbIatmiI3YMYGcvX05Ha	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a02e3b60>	Rachel Nackman	\N	\N	\N	\N	\N
64	projectflatironemail15@gmail.com	$2a$10$RAE2qRnQUnsVMQyE7YhW4eT49IAzGtNiCWXITB4nnbJKCjs60kLK.	\N	\N	\N	2	2015-04-20 15:34:23.082579	2015-04-20 15:21:56.513991	::1	::1	andrew	Andrew Miksch	superandrew	Andrew.jpg	image/jpeg	117555	2015-04-20 15:25:16.944095
88	projectflatironemail17@gmail.com	$2a$10$zN0sOCEFQ7cbudXAw6hKA.5vsDmr7lb2vu1qNPwDApY3gZzSEf3jm	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a031c6b8>	Seiji Naganuma	\N	\N	\N	\N	\N
89	projectflatironemail18@gmail.com	$2a$10$./ffEbJGqwzLgFJC2g2WIuIMvRm96zTZ2fsqqxpqkJj3kLcV4V3U2	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a20407d0>	Skylar Panuska	\N	\N	\N	\N	\N
90	projectflatironemail19@gmail.com	$2a$10$GXeqVwqdr8eQ5fwh1CMCe./VBI6cbzfLr/JBF7AePy41Qywvj6Tua	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a1a912d0>	Jennifer Sardina	\N	\N	\N	\N	\N
91	projectflatironemail20@gmail.com	$2a$10$jXeNscYqEVqGALbUtiitxe5u98JB13vXUFMcBB2zzR3OPZ7Z3lYBq	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79c75deb0>	Rebecca Shapiro	\N	\N	\N	\N	\N
92	projectflatironemail21@gmail.com	$2a$10$swzjg0FEwhkwF5NdXlsCrepD3YpiKJB01ymTviwz73VgoI9AhDoym	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a03ae130>	Jeremy Sklarsky	\N	\N	\N	\N	\N
93	projectflatironemail22@gmail.com	$2a$10$zHStfjSk6vsNPFTHkz7l1uGqovLLVxcFyC9iDbchonG7ORB.zfYdu	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a207b8a8>	Holden Steinberg	\N	\N	\N	\N	\N
94	projectflatironemail23@gmail.com	$2a$10$mcxSuLNctnytbYwrdvTDouYRspw.0gTc32Vm5WQ5gvSAAh1iKYqci	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a20a9ac8>	Matthew Stines	\N	\N	\N	\N	\N
95	projectflatironemail24@gmail.com	$2a$10$8gLfaH5zGT0Vj.2OCCqxDuQwRcqOBG5WPb3IzzodB7rlr0NJm25XS	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a0441c00>	Michael Tejada	\N	\N	\N	\N	\N
96	projectflatironemail25@gmail.com	$2a$10$R0O97BuQWZAzuJVG38bpj.npmYkYoaX.Uy2G01RuJE4bPATz715gm	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a20e6838>	Kate Travers	\N	\N	\N	\N	\N
97	projectflatironemail26@gmail.com	$2a$10$lPt9VlbcuPwn6LTyqN6TjOcRRP4z62Eo6quSI0B2XDlEOlVHIQVHC	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff7a3013658>	Deniz Unat	\N	\N	\N	\N	\N
98	projectflatironemail27@gmail.com	$2a$10$JU1ti.3wu5hx6Qar/Fps0OU6u1FHwi8tIv4Hu39gJU2OSKbI7lDQC	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79b1057f8>	Ville Vesterninen	\N	\N	\N	\N	\N
99	projectflatironemail28@gmail.com	$2a$10$BV1gkLKThqbaGE87tlIqGOQRNQ53yjmjpMYjazrLpcSQEUVvbdOwW	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79b23d760>	Dan Visintainer	\N	\N	\N	\N	\N
100	projectflatironemail29@gmail.com	$2a$10$udM0lPiPPi4VSAhhsVNB8.p.ciJSHB0pnS7BT/O1tpTcGvoKF5HDq	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79c1b6318>	Bethanne Zink	\N	\N	\N	\N	\N
75	projectflatironemail2@gmail.com	$2a$10$DtP0jC2I9ii9p7M4EOr2YuNd0ed0uKKbrrdKGeEImweMuQRiY9N0y	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79c975c48>	Kevin Character	\N	\N	\N	\N	\N
101	andrew@email.com	$2a$10$VZNkgTCbGrcuugK.OnhjMOvSZHBTGSMH/7.h8erBSyq4IwdRtT6p6	\N	\N	\N	4	2015-04-20 20:38:13.001977	2015-04-20 20:36:33.643663	::1	::1	superandrew	Andrew Milksch	\N	download.png	image/png	1545	2015-04-20 20:38:54.140314
74	projectflatironemail1@gmail.com	$2a$10$FS/0WO0prASxCMCFi8VgBeYVie/gN07bJj342fYpXE8Xf4DFFEWR.	\N	\N	\N	0	\N	\N	\N	\N	#<User:0x007ff79c0eec28>	Ian Candy	\N	\N	\N	\N	\N
116	brendan@email.com	$2a$10$R.fZSyyoOEdWSy1RdmVCTO11nZTgp9uWYYCc0yHaUj.4y.GZtGXnu	\N	\N	\N	1	2015-04-20 22:19:29.154252	2015-04-20 22:19:29.154252	::1	::1	brendan	Brendan Mangus	brendan	Brendan-Mangus.jpeg	image/jpeg	6549	2015-04-20 22:19:43.671029
108	doug@email.com	$2a$10$IrxQSso/dQn5Iyx1Yb3SdeV.VTwvs4Ofdgsp5/2wx4vZkS6hJvUUO	\N	\N	\N	1	2015-04-20 21:49:33.404873	2015-04-20 21:49:33.404873	::1	::1	doug	Doug Bend	doug	Doug-Bend.jpg	image/jpeg	6103	2015-04-20 21:50:16.347878
113	aaron@email.com	$2a$10$1mAkty4sNBd7nRkKFvZ2TOpvXKBtrM5IwT249AqHCOH.txxt4z87G	\N	\N	\N	2	2015-04-20 22:43:08.519615	2015-04-20 22:13:49.789205	::1	::1	aaron	Aaron Pitman	aaron	Aaron-Pitman.jpg	image/jpeg	29908	2015-04-20 22:14:40.96932
109	thursday@email.com	$2a$10$CAPgafoFJPbPtIg73owJJu9UruDx.sV2kLnghnUB9dAzFLgHyauuG	\N	\N	\N	2	2015-04-20 21:52:15.704064	2015-04-20 21:51:14.780889	::1	::1	thursday	Thursday Bram	thursday	Thursday-Bram.jpg	image/jpeg	19752	2015-04-20 21:51:31.345509
105	wayne@email.com	$2a$10$xtlEwQRuDoyb2AsmpF5X2uTp3s7Ns8liI8ZgHejNEfc42MqNwIvMa	\N	\N	\N	2	2015-04-20 20:12:26.95528	2015-04-20 20:10:56.391062	::1	::1	@Wayne	Wayne Brewer	@wayne	WayneBrewer.jpeg	image/jpeg	3836	2015-04-20 20:12:48.096354
110	russell@email.com	$2a$10$GAffNzV/DB0U6w0uVbyvE.xdihyF.Y5uL6RvmZVx1uUEhOftg5UBi	\N	\N	\N	1	2015-04-20 21:53:10.656638	2015-04-20 21:53:10.656638	::1	::1	russell	Russel Kommer	russell	Russell-Kommer.jpg	image/jpeg	19110	2015-04-20 21:53:28.759613
117	larry@email.com	$2a$10$PRGHWrbFQ6kYyCE857OzMeF3N27W38QBOUZdONbz9RvildMOeGsYW	\N	\N	\N	7	2015-04-21 19:47:05.268317	2015-04-21 19:41:26.656052	::1	::1	larry	Larry Page	larry	LarryPage.jpeg	image/jpeg	4328	2015-04-20 22:44:19.560455
119	isaac@email.com	$2a$10$CmUbszev2m8yE2OYPaW2heu3KraW8Vky4eGRzHLBH1EaQsHItUrJm	\N	\N	\N	1	2015-04-21 13:41:43.561697	2015-04-21 13:41:43.561697	::1	::1	Isaac	Isaac Schleuter	isaac	isaac-schleuter.jpeg	image/jpeg	15529	2015-04-21 13:42:11.308797
111	derik@email.com	$2a$10$FHvSIhgxt2JN5OPLZwnFnOEvarXC6LLGquPvSqT7xZValQLf..En.	\N	\N	\N	1	2015-04-20 22:07:41.575183	2015-04-20 22:07:41.575183	::1	::1	derik	Derik Flanzraich	derik	Derek-Flanzraich.jpg	image/jpeg	6361	2015-04-20 22:08:11.257014
103	jon@email.com	$2a$10$YIvNe7z74SZItSuFb6OplOLWwbPWAu5nDCQ/.L5i9GdSG997iEzfW	\N	\N	\N	3	2015-04-20 21:14:27.938381	2015-04-20 20:11:45.913183	::1	::1	JonH	Jon Hamm	jonh	jon_hamm.jpg	image/jpeg	28574	2015-04-20 20:12:15.797417
104	james@email.com	$2a$10$wlAwqloa11o0GcUGNDxOWeQH59vVCOlXt/kmLF0dkv2l5shmiZwAy	\N	\N	\N	4	2015-04-20 21:14:51.414188	2015-04-20 20:23:45.125436	::1	::1	JamesH	James Heskett	jamesh	James_Heskett.jpg	image/jpeg	3871	2015-04-20 20:13:31.914282
112	johnh@email.com	$2a$10$BTipD951SaB3yJ0wxXMHLeLVopKFJdXeob3sgDW88wkYwE1c6RKwS	\N	\N	\N	1	2015-04-20 22:09:15.970726	2015-04-20 22:09:15.970726	::1	::1	johnH	john Harthorne	johnh	John-Harthorne.jpg	image/jpeg	5178	2015-04-20 22:09:40.385659
107	brian@email.com	$2a$10$VP2wICx5BL1po67TsSypj.OyiBXUJbHLHU7XDo8ZJdHQfgsYQC3r.	\N	\N	\N	1	2015-04-20 21:40:01.279595	2015-04-20 21:40:01.279595	::1	::1	brian	Brian Joseph Chesky	brian	BrianChesky.jpeg	image/jpeg	2207	2015-04-20 21:43:57.308273
114	peter@email.com	$2a$10$8LnQHV6AFrtACRCCEPG/5OX/ljWM7q4kIIQdeqGDo4pkx7P6wZX7y	\N	\N	\N	1	2015-04-20 22:16:32.545339	2015-04-20 22:16:32.545339	::1	::1	peter	Peter Nguyen	peter	Peter-Nguyen.jpg	image/jpeg	59777	2015-04-20 22:16:56.909091
118	brainiac@email.com	$2a$10$wFKargIEIK0uUj63VzdMDOz6rZAlantF1xwGUMCO/nphYjNY3RrWC	\N	\N	\N	1	2015-04-20 23:03:16.810795	2015-04-20 23:03:16.810795	::1	::1	brainiac	 brainiac	brainiac	\N	\N	\N	\N
115	charles@email.com	$2a$10$0EF4VopGhB.MT92un.kwj.OJtcnlwtybCzDIkm6TGTbPWCvj/GhKq	\N	\N	\N	1	2015-04-20 22:18:13.735664	2015-04-20 22:18:13.735664	::1	::1	charles	Charles Bogolan	charles	Charles-Bogoian.jpg	image/jpeg	17218	2015-04-20 22:18:30.019334
106	david@email.com	$2a$10$ucwaGna6SSt80XJyqUAWGu4qzqbrfmI8Wz3WFIUOvxky/M15pQ3qi	\N	\N	\N	4	2015-04-20 23:32:15.477423	2015-04-20 23:17:08.171917	::1	::1	david	David Heinemeier Hansson 	david	DHH.jpg	image/jpeg	28093	2015-04-20 21:33:31.567175
66	maureen@email.com	$2a$10$u/zKZTp.bWCNZQMqJ949Ge55Yy4H8sHlh7DnOnkcV4K0GW1W2S.A.	\N	\N	\N	26	2015-04-21 19:46:29.957724	2015-04-21 15:42:09.704694	::1	::1	MoPj	Maureen Johnson	mopj	img_6560.jpg	image/jpeg	15430	2015-04-21 14:24:13.348418
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mpsj
--

SELECT pg_catalog.setval('users_id_seq', 119, true);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: mpsj; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: followers_pkey; Type: CONSTRAINT; Schema: public; Owner: mpsj; Tablespace: 
--

ALTER TABLE ONLY followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: mpsj; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: mpsj; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: mpsj; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: mpsj
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mpsj;
GRANT ALL ON SCHEMA public TO mpsj;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


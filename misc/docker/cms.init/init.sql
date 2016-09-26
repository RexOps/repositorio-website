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
-- Name: content_type; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE content_type (
    id integer NOT NULL,
    site_id integer NOT NULL,
    name character varying(150) NOT NULL,
    class character varying(500)
);


ALTER TABLE content_type OWNER TO $USERNAME$;

--
-- Name: content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE content_type_id_seq OWNER TO $USERNAME$;

--
-- Name: content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE content_type_id_seq OWNED BY content_type.id;


--
-- Name: dbix_class_deploymenthandler_versions; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE dbix_class_deploymenthandler_versions (
    id integer NOT NULL,
    version character varying(50) NOT NULL,
    ddl text,
    upgrade_sql text
);


ALTER TABLE dbix_class_deploymenthandler_versions OWNER TO $USERNAME$;

--
-- Name: dbix_class_deploymenthandler_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE dbix_class_deploymenthandler_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbix_class_deploymenthandler_versions_id_seq OWNER TO $USERNAME$;

--
-- Name: dbix_class_deploymenthandler_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE dbix_class_deploymenthandler_versions_id_seq OWNED BY dbix_class_deploymenthandler_versions.id;


--
-- Name: language; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE language (
    id integer NOT NULL,
    master_site_id integer NOT NULL,
    lang_site_id integer NOT NULL
);


ALTER TABLE language OWNER TO $USERNAME$;

--
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE language_id_seq OWNER TO $USERNAME$;

--
-- Name: language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE language_id_seq OWNED BY language.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE media (
    id integer NOT NULL,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    level integer NOT NULL,
    site_id integer NOT NULL,
    active smallint NOT NULL,
    hidden smallint NOT NULL,
    creator_id integer NOT NULL,
    name character varying(150) NOT NULL,
    url character varying(250) NOT NULL,
    title character varying(150),
    description character varying(500),
    keywords character varying(500),
    type_id integer NOT NULL,
    c_date timestamp without time zone DEFAULT now() NOT NULL,
    m_date timestamp without time zone DEFAULT now() NOT NULL,
    rel_date timestamp without time zone,
    lock_date timestamp without time zone,
    content text,
    data jsonb
);


ALTER TABLE media OWNER TO $USERNAME$;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_id_seq OWNER TO $USERNAME$;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE media_id_seq OWNED BY media.id;


--
-- Name: media_type; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE media_type (
    id integer NOT NULL,
    site_id integer NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(500)
);


ALTER TABLE media_type OWNER TO $USERNAME$;

--
-- Name: media_type_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE media_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_type_id_seq OWNER TO $USERNAME$;

--
-- Name: media_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE media_type_id_seq OWNED BY media_type.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE page (
    id integer NOT NULL,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    level integer NOT NULL,
    site_id integer NOT NULL,
    active smallint NOT NULL,
    hidden smallint NOT NULL,
    navigation smallint NOT NULL,
    creator_id integer NOT NULL,
    content_type_id integer NOT NULL,
    name character varying(150) NOT NULL,
    url character varying(250) NOT NULL,
    title character varying(150),
    description character varying(1000),
    keywords character varying(1000),
    type_id integer NOT NULL,
    c_date timestamp without time zone DEFAULT now() NOT NULL,
    m_date timestamp without time zone DEFAULT now() NOT NULL,
    rel_date timestamp without time zone,
    lock_date timestamp without time zone,
    content text,
    data jsonb
);


ALTER TABLE page OWNER TO $USERNAME$;

--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE page_id_seq OWNER TO $USERNAME$;

--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE page_id_seq OWNED BY page.id;


--
-- Name: page_type; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE page_type (
    id integer NOT NULL,
    site_id integer NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(500)
);


ALTER TABLE page_type OWNER TO $USERNAME$;

--
-- Name: page_type_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE page_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE page_type_id_seq OWNER TO $USERNAME$;

--
-- Name: page_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE page_type_id_seq OWNED BY page_type.id;


--
-- Name: site; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE site (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    c_date timestamp without time zone DEFAULT now() NOT NULL,
    m_date timestamp without time zone DEFAULT now() NOT NULL,
    skin character varying(150) NOT NULL,
    data jsonb
);


ALTER TABLE site OWNER TO $USERNAME$;

--
-- Name: site_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_id_seq OWNER TO $USERNAME$;

--
-- Name: site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE site_id_seq OWNED BY site.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(150) NOT NULL,
    password text NOT NULL,
    email character varying(250),
    data jsonb
);


ALTER TABLE users OWNER TO $USERNAME$;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO $USERNAME$;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: virtual_host; Type: TABLE; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE TABLE virtual_host (
    id integer NOT NULL,
    site_id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE virtual_host OWNER TO $USERNAME$;

--
-- Name: virtual_host_id_seq; Type: SEQUENCE; Schema: public; Owner: $USERNAME$
--

CREATE SEQUENCE virtual_host_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE virtual_host_id_seq OWNER TO $USERNAME$;

--
-- Name: virtual_host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: $USERNAME$
--

ALTER SEQUENCE virtual_host_id_seq OWNED BY virtual_host.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY content_type ALTER COLUMN id SET DEFAULT nextval('content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY dbix_class_deploymenthandler_versions ALTER COLUMN id SET DEFAULT nextval('dbix_class_deploymenthandler_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY language ALTER COLUMN id SET DEFAULT nextval('language_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY media ALTER COLUMN id SET DEFAULT nextval('media_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY media_type ALTER COLUMN id SET DEFAULT nextval('media_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY page ALTER COLUMN id SET DEFAULT nextval('page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY page_type ALTER COLUMN id SET DEFAULT nextval('page_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY site ALTER COLUMN id SET DEFAULT nextval('site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY virtual_host ALTER COLUMN id SET DEFAULT nextval('virtual_host_id_seq'::regclass);


--
-- Data for Name: content_type; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY content_type (id, site_id, name, class) FROM stdin;
1	1	text/html	Pitahaya::ContentType::text_html
2	1	text/markdown	Pitahaya::ContentType::text_markdown
\.


--
-- Name: content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('content_type_id_seq', 2, true);


--
-- Data for Name: dbix_class_deploymenthandler_versions; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY dbix_class_deploymenthandler_versions (id, version, ddl, upgrade_sql) FROM stdin;
1	7	CREATE TABLE "dbix_class_deploymenthandler_versions" ( "id" serial NOT NULL, "version" character varying(50) NOT NULL, "ddl" text, "upgrade_sql" text, PRIMARY KEY ("id"), CONSTRAINT "dbix_class_deploymenthandler_versions_version" UNIQUE ("version") )CREATE TABLE "site" ( "id" serial NOT NULL, "name" character varying(150) NOT NULL, "c_date" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, "m_date" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, "skin" character varying(150) NOT NULL, "data" jsonb, PRIMARY KEY ("id") )\nCREATE TABLE "users" ( "id" serial NOT NULL, "username" character varying(150) NOT NULL, "password" text NOT NULL, "email" character varying(250), "data" jsonb, PRIMARY KEY ("id") )\nCREATE TABLE "content_type" ( "id" serial NOT NULL, "site_id" integer NOT NULL, "name" character varying(150) NOT NULL, "class" character varying(500), PRIMARY KEY ("id", "site_id") )\nCREATE INDEX "content_type_idx_site_id" on "content_type" ("site_id")\nCREATE TABLE "language" ( "id" serial NOT NULL, "master_site_id" integer NOT NULL, "lang_site_id" integer NOT NULL, PRIMARY KEY ("id") )\nCREATE INDEX "language_idx_lang_site_id" on "language" ("lang_site_id")\nCREATE INDEX "language_idx_master_site_id" on "language" ("master_site_id")\nCREATE TABLE "media_type" ( "id" serial NOT NULL, "site_id" integer NOT NULL, "name" character varying(150) NOT NULL, "description" character varying(500), PRIMARY KEY ("id") )\nCREATE INDEX "media_type_idx_site_id" on "media_type" ("site_id")\nCREATE TABLE "page_type" ( "id" serial NOT NULL, "site_id" integer NOT NULL, "name" character varying(150) NOT NULL, "description" character varying(500), PRIMARY KEY ("id") )\nCREATE INDEX "page_type_idx_site_id" on "page_type" ("site_id")\nCREATE TABLE "virtual_host" ( "id" serial NOT NULL, "site_id" integer NOT NULL, "name" character varying(150) NOT NULL, PRIMARY KEY ("id"), CONSTRAINT "virtual_host_name" UNIQUE ("name") )\nCREATE INDEX "virtual_host_idx_site_id" on "virtual_host" ("site_id")\nCREATE TABLE "media" ( "id" serial NOT NULL, "lft" integer NOT NULL, "rgt" integer NOT NULL, "level" integer NOT NULL, "site_id" integer NOT NULL, "active" smallint NOT NULL, "hidden" smallint NOT NULL, "creator_id" integer NOT NULL, "name" character varying(150) NOT NULL, "url" character varying(250) NOT NULL, "title" character varying(150), "description" character varying(500), "keywords" character varying(500), "type_id" integer NOT NULL, "c_date" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, "m_date" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, "rel_date" timestamp, "lock_date" timestamp, "content" text, "data" jsonb, PRIMARY KEY ("id", "site_id") )\nCREATE INDEX "media_idx_site_id" on "media" ("site_id")\nCREATE INDEX "media_idx_type_id" on "media" ("type_id")\nCREATE TABLE "page" ( "id" serial NOT NULL, "lft" integer NOT NULL, "rgt" integer NOT NULL, "level" integer NOT NULL, "site_id" integer NOT NULL, "active" smallint NOT NULL, "hidden" smallint NOT NULL, "navigation" smallint NOT NULL, "creator_id" integer NOT NULL, "content_type_id" integer NOT NULL, "name" character varying(150) NOT NULL, "url" character varying(250) NOT NULL, "title" character varying(150), "description" character varying(1000), "keywords" character varying(1000), "type_id" integer NOT NULL, "c_date" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, "m_date" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, "rel_date" timestamp, "lock_date" timestamp, "content" text, "data" jsonb, PRIMARY KEY ("id", "site_id") )\nCREATE INDEX "page_idx_content_type_id_site_id" on "page" ("content_type_id", "site_id")\nCREATE INDEX "page_idx_creator_id" on "page" ("creator_id")\nCREATE INDEX "page_idx_site_id" on "page" ("site_id")\nCREATE INDEX "page_idx_type_id" on "page" ("type_id")\nALTER TABLE "content_type" ADD CONSTRAINT "content_type_fk_site_id" FOREIGN KEY ("site_id") REFERENCES "site" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "language" ADD CONSTRAINT "language_fk_lang_site_id" FOREIGN KEY ("lang_site_id") REFERENCES "site" ("id") ON DELETE CASCADE DEFERRABLE\nALTER TABLE "language" ADD CONSTRAINT "language_fk_master_site_id" FOREIGN KEY ("master_site_id") REFERENCES "site" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "media_type" ADD CONSTRAINT "media_type_fk_site_id" FOREIGN KEY ("site_id") REFERENCES "site" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "page_type" ADD CONSTRAINT "page_type_fk_site_id" FOREIGN KEY ("site_id") REFERENCES "site" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "virtual_host" ADD CONSTRAINT "virtual_host_fk_site_id" FOREIGN KEY ("site_id") REFERENCES "site" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "media" ADD CONSTRAINT "media_fk_site_id" FOREIGN KEY ("site_id") REFERENCES "site" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "media" ADD CONSTRAINT "media_fk_type_id" FOREIGN KEY ("type_id") REFERENCES "media_type" ("id") DEFERRABLE\nALTER TABLE "page" ADD CONSTRAINT "page_fk_content_type_id_site_id" FOREIGN KEY ("content_type_id", "site_id") REFERENCES "content_type" ("id", "site_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "page" ADD CONSTRAINT "page_fk_creator_id" FOREIGN KEY ("creator_id") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "page" ADD CONSTRAINT "page_fk_site_id" FOREIGN KEY ("site_id") REFERENCES "site" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE\nALTER TABLE "page" ADD CONSTRAINT "page_fk_type_id" FOREIGN KEY ("type_id") REFERENCES "page_type" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE	\N
\.


--
-- Name: dbix_class_deploymenthandler_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('dbix_class_deploymenthandler_versions_id_seq', 1, true);


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY language (id, master_site_id, lang_site_id) FROM stdin;
\.


--
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('language_id_seq', 1, false);


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY media (id, lft, rgt, level, site_id, active, hidden, creator_id, name, url, title, description, keywords, type_id, c_date, m_date, rel_date, lock_date, content, data) FROM stdin;
1	1	2	0	1	1	0	1	Root	Root.html	\N	\N	\N	1	2016-07-22 20:26:18.184954	2016-07-22 20:26:18.184954	\N	\N	\N	\N
\.


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('media_id_seq', 1, true);


--
-- Data for Name: media_type; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY media_type (id, site_id, name, description) FROM stdin;
1	1	index	\N
2	1	folder	\N
3	1	image	\N
4	1	object	\N
\.


--
-- Name: media_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('media_type_id_seq', 4, true);


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY page (id, lft, rgt, level, site_id, active, hidden, navigation, creator_id, content_type_id, name, url, title, description, keywords, type_id, c_date, m_date, rel_date, lock_date, content, data) FROM stdin;
2	2	3	1	1	1	0	1	1	1	Features	features	Features		\N	2	2016-07-23 06:34:30.846087	2016-07-23 06:34:30	\N	\N	<h1><span class="highlight">Features</span> made for you</h1>\n<p>We had the requirement to mirror yum and apt repositories in a reliable way. Also we had the need to maintain custom repositories with custom packages. So we decided to build repositor.io.</p>\n<p>All the features in repositor.io is driven by its community. So if you miss some functions please feel free to report your requirement on <a href="https://github.com/RexOps/repositorio">Github</a>.</p>\n<h2><span class="highlight">repositor.io</span> supported repositories</h2>\n<ul>\n<li>Debian (apt)</li>\n<li>Ubuntu (apt)</li>\n<li>CentOS (yum)</li>\n<li>RedHat (yum)</li>\n<li>OpenSuSE (yast mirroring, yum custom repositories)</li>\n<li>Docker (private docker registry)</li>\n</ul>\n<h2><span class="highlight">Proxy</span> support to save bandwith</h2>\n<p>The webserver of repositor.io supports proxying of packages. This allows you to save bandwith and diskspace because repositorio will only store the files you really needs.</p>\n<p>See the <a href="../../docs/misc/proxy_support.html">proxy documentation</a> to see how you can configure this feature.</p>	{}
46	18	19	3	1	1	0	1	1	1	Mirror Ubuntu	mirror_ubuntu	Mirror Ubuntu repositories	Show you how to mirror a Ubuntu repository	\N	2	2016-07-24 11:09:44.493198	2016-07-24 11:09:44	\N	\N	  <h1><span class="highlight">Mirror </span> Ubuntu repositories</h1>\n\n<p>\n          To mirror a ubuntu repository you need to know which <i>version</i>, which <i>architecture</i> and which <i>component</i> you want to mirror. You'll find an example configuration below. This example will mirror the <i>main</i> repository for <i>precise</i> from <i>de.archive.ubuntu.com</i>.\n          </p>\n          <pre><code>&lt;Repository ubuntu-precise-amd64-main&gt;\n  url       = http://de.archive.ubuntu.com/ubuntu/\n  local     = ubuntu-precise-amd64-main/ubuntu\n  type      = Apt\n  arch      = amd64\n  dist      = precise\n  component = main\n&lt;/Repository&gt;\n</code></pre>\n          <p>It is <b>important</b> that the first part of the <i>local</i> option is the same as the repository name. (here: ubuntu-precise-amd64-main).</p>\n	{}
1	1	42	0	1	1	0	1	1	1	Home	Home	Homepage	\N	\N	1	2016-07-22 20:26:18.169351	2016-07-22 20:26:18.169351	\N	\N	  <h1><span class="highlight">What</span> is repositor.io?</h1>\n  <p>repositor.io is a tool to create and manage linux repositories. You can mirror online repositories so that you don't need to download the package every time you set up a new server. You can also secure your servers behind a firewall and disable outgoing http traffic.</p>\n\n  <h1><span class="highlight">What</span> repositories can it handle?</h1>\n  <div id="table_os">\n    <ul>\n      <li class="table_os_debian">\n        <h4>Debian</h4>\n        <p>the universal operating system</p>\n      </li>\n      <li class="table_os_ubuntu">\n        <h4>Ubuntu</h4>\n        <p>the well known os from canonical</p>\n      </li>\n      <li class="table_os_centos">\n        <h4>CentOS</h4>\n        <p>the community enterprise os</p>\n      </li>\n    </ul>\n    <ul>\n      <li class="table_os_redhat">\n        <h4>RedHat</h4>\n        <p>the enterprise operating system</p>\n      </li>\n      <li class="table_os_suse">\n        <h4>OpenSuSE</h4>\n        <p>the community os from SuSE</p>\n      </li>\n      <li class="table_os_docker">\n        <h4>Docker</h4>\n        <p>the platform for distributed applications</p>\n      </li>\n    </ul>\n    <div class="clearfix"></div>\n  </div>\n	\N
4	6	7	1	1	1	0	1	1	1	Contribute	contribute	Contribute		\N	2	2016-07-23 06:48:19.898008	2016-07-23 06:48:19	\N	\N	  <h1><span class="highlight">Development</span> of repositor.io</h1>\n\n  <p>There is no company behind repositor.io. Everything is developed by volunteers around the globe during their free time. repositor.io is a free, open source project. Every contribution is welcome.</p>\n\n\n  <h1><span class="highlight">Get</span> in contact</h1>\n  <p>You'll find us on irc.freenode.net in the <a href="irc://irc.freenode.net/rex">#rex</a> channel. Just be a bit patient, it might take a few minutes until someone answers.</p>\n\n  <h1><span class="highlight">Help</span> people in need</h1>\n  <p>repositor.io is an open source project driven by volunteers to ease your daily work. If you also want to help others but don't have the time to contribute with code, documentation or other time consuming things we encourage you to help other people in need with a donation.</p>\n  <p>Below we have collect a few charity organizations. If you know more trustworthy organizations just <a href="mailto:jfried@mailbox.org">let us know</a>.</p>\n  <ul>\n   <li><a href="http://amref.org/">AMREF</a> - Better health for Africa</li>\n   <li><a href="http://www.iccf.nl/">ICCF</a> - Helping children in Uganda (from the <a href="http://www.vim.org/">VIM</a> project)</li>\n   <li><a href="http://www.msf.org/">MSF</a> - Medecins sans frontieres (Doctors without borders)</li>\n   <li><a href="http://www.mercy.se/">Operation Mercy</a> - International development and relief</li>\n   <li><a href="http://www.unicef.org/">UNICEF</a> - United Nations International Children’s Emergency Fund</li>\n  </ul>\n  <p>&nbsp;</p>\n  <p><b>Disclaimer:</b> We are not incorporated/engaged with any of these organizations.</p>\n\n  <h1><span class="highlight">Writing</span> the documentation</h1>\n  <p>The success of every project is its documentation. If there is no documentation a project won't be successful. So one part where you can help is writing user friendly documentation.</p>\n  <p>It is often hard to find a good balance between documenting new features (or removing deprecated documentation) and writing new code. So if you find outdated documentation, want to add guides, tweak the design or rewrite the complete webpage, don't hesitate to contact us.</p>\n  <p>You can clone the website code from <a href="https://github.com/RexOps/repositorio-website">GitHub</a>. Please read the README file on how to get the website up and running on your local machine.</p>\n\n\n  <h1><span class="highlight">Committing</span> code</h1>\n  <p>If you want to contribute new functionality or fix things, you can just clone the repository on <a href="https://github.com/RexOps/repositorio">GitHub</a> and send pull requests against the master branch. We encourage you to logically group your commits together in topic/feature branches and send a pull request for each of your topic branches.</p>\n  <p>We use perltidy to help us to maintain a consequent code style throughout the project (check out our .perltidyrc for more details). We recommend setting it up with your favorite IDE or text editor, so you can apply formatting easily or even automatically to your changes before committing them.</p>\n  <p>If you have any questions about how to implement something, join us on <a href="irc://irc.freenode.net/rex">irc.freenode.net / #rex</a>.</p>\n\n  <h1><span class="highlight">Sponsoring</span> hardware or features</h1>\n  <p>As mentioned above repositor.io is completely developed by volunteers. So there is no guarantee that a special feature will be released at a defined date. If you need a special feature you can sponsor it. So we will focus on that feature for the next release. You can contact us at <a href="mailto:jfried@mailbox.org">jfried@mailbox.org</a></p>\n	{}
8	10	11	3	1	1	0	1	1	1	Mirror	mirror	Mirror a repository	Using repositor.io to mirror a repository	\N	2	2016-07-24 07:53:55.002892	2016-07-24 07:53:55	\N	\N	  <h1><span class="highlight">Using </span> repositor.io to mirror a repository</h1>\n\n  <p>\n            First you have to create a configuration file. The installation already has created an example file for you\n            in <b>/etc/rex/repositorio.conf</b>. Just open the file in an editor and add the repositories you want to mirror.\n          </p>\n          <p>\n          Currently repositor.io supports <i>Yum</i>, <i>Apt</i>, <i>Yast</i> and plain <i>HTTP</i> mirrors. If you want to contribute please visit our <a href="https://github.com/RexOps/repositorio">Github</a> repository.\n          </p>\n          <p>\n            Now you can run the mirror command to start the mirror process:\n          </p>\n          <pre><code class="bash">$ repositorio --mirror --repo=repository-name</code></pre>\n          <p>\n            repositorio will download the repository into the <i>head</i> branch. If you want to create a tag of a tested state you\ncan do this with the tag command:\n          </p>\n          <pre><code class="bash">$ repositorio --repo=repository-name --tag=production</code></pre>\n	{}
48	24	25	3	1	1	0	1	1	1	Create private repository	create_private_repository	Create private repository	This howto will show you how to setup a private docker repository.	\N	2	2016-07-24 11:13:07.582105	2016-07-24 11:13:07	\N	\N	  <h1><span class="highlight">Create </span> a private docker registry</h1>\n\n<p>To create a private docker registry you just need repositor.io and some place to store the images.</p>\n<p>The current stable version of repositor.io only support docker API v1.</p>\n\n        <h2>Using a demo docker container</h2>\n        <p>If you don't want to setup everything manually or just want to play a bit, you can also use a preconfigured <a href="https://registry.hub.docker.com/u/jbrunk/repositorio-docker/">docker container</a>. Many thanks to <a href="https://plus.google.com/+JürgenBrunk">J&uuml;rgen Brunk</a> for the contribution.</p>\n          <pre><code class="bash">$ docker run -d -p 3000:3000 --name repositorio-docker jbrunk/repositorio-docker</code></pre>\n          <p>With this you can just skip to <b>Creating User</b>.</p>\n\n          <h2>Manually configuration</h2>\n          <p>First you need to configure the docker repository inside your <i>/etc/repositorio.conf</i> file.</p>\n            <pre><code>&lt;Repository docker&gt;\n    local = docker\n    type  = Docker\n&lt;/Repository&gt;</code></pre>\n\n          <p>Now you can initialize the repository as usual. This will create a <i>docker</i> directory under your <i>RepositoryRoot</i>.</p>\n          <pre><code class="bash">$ repositorio --repo=docker --init</code></pre>\n          <h2>Serving Content</h2>\n          <p>To get your Docker registry up and running you need to start a webserver to serve the content. You can't use a plain Apache or nginx server to serve the content because the docker client is not just downloading files like <i>yum</i> or <i>apt</i>. So repositor.io is comming with an integrated webserver.</p>\n          <pre><code class="bash">$ repositorio --repo=docker --server prefork</code></pre>\n          <p>This will start a preforking webserver on port 3000. If you want to use another port you can get help for all the parameters with the following command.</p> \n          <pre><code class="bash">$ repositorio --repo=docker --server prefork -- --help</code></pre>\n\n          <h2>Creating User</h2>\n          <p>Now you are ready to create users. To register a new user, you can use the <i>docker</i> client.</p>\n          <pre><code class="bash">$ docker login -e some@mail.tld -p some-save-password -u some-user http://myserver:3000/v1/</code></pre>\n\n          <h2>Push Images</h2>\n          <p>After create a user you'll be able to push and pull images into repositor.io.</p>\n\n          <p>First, download an image from the official docker registry.</p>\n          <pre><code class="bash">$ docker pull ubuntu</code></pre>\n\n          <p>Now you have to tag the image with a special name. You have to include the domain of your private registry in the tag name.</p>\n          <pre><code class="bash">$ docker tag myserver:3000/ubuntu</code></pre>\n\n          <p>After tagging your image, you can push it to your repositor.io server.</p>\n          <pre><code class="bash">$ docker push myserver:3000/ubuntu</code></pre>\n\n          <h2>Pull Images</h2>\n          <p>Pulling an image is similar to pushing images.</p>\n          <pre><code class="bash">$ docker pull myserver:3000/ubuntu</code></pre>\n\n          <h2>Have Problems?</h2>\n          <p>If you don't use SSL encryption you have to add the following option to your docker daemons options:</p>\n          <pre><code>--insecure-registry myserver:3000</code></pre>\n\n          <p>If you have problems, questions or suggestions, feel free to open an issue on <a href="https://github.com/RexOps/repositorio">Github</a> and/or join our irc channel on <a href="irc://irc.freenode.net/rex">irc.freenode.net</a> channel <b>#rex</b>.</p>\n	{}
45	16	17	3	1	1	0	1	1	1	Mirror Debian	mirror_debian	Mirror Debian repositories	Show you how to mirror a Debian repository	\N	2	2016-07-24 11:09:09.491831	2016-07-24 11:09:09	\N	\N	  <h1><span class="highlight">Mirror </span> Debian repositories</h1>\n\n<p>\n          To mirror a debian repository you need to know which <i>version</i>, which <i>architecture</i> and which <i>component</i> you want to mirror. You'll find an example configuration below. This example will mirror the <i>main</i> repository for <i>wheezy</i> from <i>ftp2.de.debian.org</i>.\n          </p>\n          <pre><code>&lt;Repository debian-wheezy-amd64-main&gt;\n  url       = http://ftp2.de.debian.org/debian/\n  local     = debian-wheezy-amd64-main/debian\n  type      = Apt\n  arch      = amd64\n  dist      = wheezy\n  component = main\n&lt;/Repository&gt;\n</code></pre>\n          <p>It is <b>important</b> that the first part of the <i>local</i> option is the same as the repository name. (here: debian-wheezy-amd64-main).</p>\n	{}
9	9	22	2	1	1	0	1	1	1	Getting started	getting_started	Getting started	Some documentation that will help you to get started.	\N	13	2016-07-24 08:44:08.850958	2016-07-24 08:44:08	\N	\N		{}
6	36	37	1	1	1	0	1	1	1	About	about	About		\N	2	2016-07-23 06:49:13.084076	2016-07-23 06:49:13	\N	\N	  <h1><span class="highlight">About</span> repositor.io</h1>\n\n  <p>There is no company behind repositor.io. Everything is developed by volunteers around the globe during their free time. repositor.io is a free, open source project. Every contribution is welcome.</p>\n\n  <p>repositor.io is part of the <a href="https://github.com/RexOps/">RexOps</a> project.</p>\n\n  <p>You'll find us on irc.freenode.net in the <a href="irc://irc.freenode.net/rex">#rex</a> channel. Just be a bit patient, it might take a few minutes until someone answers.</p>\n\n  <p>repositor.io is licensed under the Apache 2.0 license.</p>\n	{}
54	39	40	2	1	1	0	0	1	2	repositor.io 1.1.0 released	repositor.io_1.1.0_released	repositor.io 1.1.0 released	repositor.io 1.1.0 released. This is a bugfix release with fixes for ubuntu and centos7 installation media mirroring.	\N	15	2016-07-24 11:33:26.829907	2016-07-24 11:33:26	2015-05-09 00:00:00	\N	repositor.io 1.1.0 released. This is a bugfix release with fixes for ubuntu and centos7 installation media mirroring.	{"news_date": "2015-05-09 00:00"}
12	12	13	3	1	1	0	1	1	1	Custom Repository	custom_repository	Create a custom repository	If you have custom packages you want to create a custom repository to deliver your packages to your servers.	\N	2	2016-07-24 08:51:15.259928	2016-07-24 08:51:15	\N	\N	  <h1><span class="highlight">Create </span> a custom repository</h1>\n\n<p>\n            First you have to edit your configuration file and add a new repository.\n          </p>\n          <pre><code>&lt;Repository custom-repo&gt;\n  local = custom-repo/custom/6/x86_64/\n  type  = Yum\n&lt;/Repository&gt;</code></pre>\n          <p>\n            If you want to create an Apt repository instead the configuration looks a bit different.\n          </p>\n          <pre><code># line in sources.list:\n# deb http://your-server.corp/custom-repo/debian wheezy custom\n&lt;Repository custom-repo&gt;\n  local     = custom-repo/debian\n  type      = Apt\n  arch      = amd64\n  dist      = wheezy\n  component = custom\n&lt;/Repository&gt;</code></pre>\n          <p>\n            After adding your repository to the configuration file you can just initialize the new repository.\n          </p>\n          <p>\n            For the <b>Yum</b> repository type you need to have <b>createrepo</b> installed on your system.\n            For <b>Apt</b> you need <b>apt-ftparchive</b>.\n          </p>\n          <pre><code class="bash">$ repositorio --repo=custom-repo --init</code></pre>\n          <p>\n            Now you can add files to your new repository with the <i>add-file</i> command:\n          </p>\n          <pre><code class="bash">$ repositorio --repo=custom-repo --add-file=my-custom-package-1.0.rpm</code></pre>\n          <h2>Signing repositories</h2>\n            <p>If you want to sign your repositories, you have to create a gpg first. You can do this with the following command.</p>\n                  <pre><code class="bash">$ gpg --gen-key</code></pre>\n            <p>After you have create your key, you need to get the key id.</p>\n                  <pre><code class="bash">$ gpg --list-secret-keys</code></pre>\n            <p>You will see a line like this: <i>sec   2048R/DA95F273</i> and from this line you need <i>DA95F273</i></p>\n            <p>Now you can edit the repositorio configuration file and add the following part to your custom repository.</p>\n                  <pre><code>&lt;Repository custom-repo&gt;\n  local = custom-repo/custom/6/x86_64/\n  type  = Yum\n  &lt;gpg&gt;\n    key      = DA95F273\n    password = passw0rd\n  &lt;/gpg&gt;\n&lt;/Repository&gt;</code></pre>\n\t  <p>For <b>Apt</b> repositories you have to extend the configuration with the same parameters.</p>\n\t  <p>If you don't want to add your password into the configuration file, you can just omit the password line. repositorio will ask you for the password during execution.</p>\n	{}
10	23	28	2	1	1	0	1	1	1	Docker	docker	Docker	Docker Repository support in repositor.io	\N	13	2016-07-24 08:48:41.248813	2016-07-24 08:48:41	\N	\N		{}
3	4	5	1	1	1	0	1	1	1	Get	get	Installation		\N	2	2016-07-23 06:42:44.655067	2016-07-23 06:42:44	\N	\N	  <h1><span class="highlight">Howto</span> install repositor.io</h1>\n\n  <p>Installing repositor.io is easy! Just open a terminal as root and run this command:</p>\n  <pre><code class="bash">$ \\wget -O - http://get.repositor.io/ | bash</code></pre>\n\n  <p>If you don't have wget installed you can also use curl for this:</p>\n  <pre><code class="bash">$ \\curl http://get.repositor.io/ | bash</code></pre>\n\n  <p>This will add the <a href="https://fedoraproject.org/wiki/EPEL">EPEL</a> and <a href="http://www.rexify.org/">RexOps</a> package repositories to your package manager (on CentOS and RedHat) and install the application.</p>\n\n  <h2><span class="highlight">Supported</span> Distributions</h2>\n  <p>The installer script of <i>repositor.io</i> is tested on the following distributions.</p>\n  <ul>\n    <li>CentOS 6 + 7</li>\n    <li>Debian 7 + 8</li>\n    <li>Ubuntu 12.04 + 14.04</li>\n  </ul>\n	{}
5	8	35	1	1	1	0	1	1	1	Docs	docs	Documentation		\N	12	2016-07-23 06:48:53.007419	2016-07-23 06:48:53	\N	\N	<h1><span class="highlight">List</span> of guides and documentation</h1>	{}
13	14	15	3	1	1	0	1	1	1	Mirror CentOS	mirror_centos_repositories	Mirror CentOS repositories	Show you how to mirror a CentOS repository	\N	2	2016-07-24 08:53:00.496791	2016-07-24 08:53:00	\N	\N	<h1><span class="highlight">Mirror </span> CentOS repositories</h1>\n<p>To mirror a CentOS repository you need to know the complete url to an existing mirror. You'll find an example configuration below. This example will mirror the CentOS 6 installation media from ftp.hosteurope.de.</p>\n<pre><code>&lt;Repository centos-6-x86-64&gt;\n  url    = http://ftp.hosteurope.de/mirror/centos.org/6/os/x86_64/\n  local  = centos-6-x86-64/CentOS/6/os/x86_64/\n  type   = Yum\n  images = true\n&lt;/Repository&gt;\n</code></pre>\n<p>It is <strong>important</strong> that the first part of the <em>local</em> option is the same as the repository name. (here: centos-6-x86-64).</p>\n<p>The option <strong>images = true</strong> will also mirror the pxe/tftp boot files.</p>	{}
47	20	21	3	1	1	0	1	1	1	Mirror RedHat Enterprise	mirror_redhat_enterprise	Mirror RedHat Enterprise repositories	Show you how to mirror a RedHat repository	\N	2	2016-07-24 11:10:31.758877	2016-07-24 11:10:31	\N	\N	  <h1><span class="highlight">Mirror </span> RedHat Enterprise repositories</h1>\n\n<p>\n          To mirror a Redhat Enterprise repository you need to know the complete url to an existing mirror and the SSL client certification. You can download this certificate from Redhat Network (see below if you need help). You'll find an example configuration below. This example will mirror the RHEL 6 repository from https://cdn.redhat.com/.\n          </p>\n          <pre><code>&lt;Repository rhel-6-x86-64&gt;\n  url    = https://cdn.redhat.com/content/dist/rhel/server/6/6Server/x86_64/os/\n  local  = rhel-6-x86-64/rhel/server/6Server/x86_64/os\n  type   = Yum\n  key    = /etc/rex/ssl/db15c9814abada2a014ab335f6fe3f8c.pem\n  cert   = /etc/rex/ssl/db15c9814abada2a014ab335f6fe3f8c.pem\n  ca     = /etc/rhsm/ca/redhat-uep.pem\n&lt;/Repository&gt;\n</code></pre>\n          <p>The <i>key</i>, <i>cert</i> and <i>ca</i> parameter defines the proper SSL options, so that repositor.io know that it must do ssl client authentication.</p>\n          <p>It is <b>important</b> that the first part of the <i>local</i> option is the same as the repository name. (here: rhel-6-x86-64).</p>\n          <p>The option <b>images = true</b> will also mirror the pxe/tftp boot files.</p>\n\n          <h2>Register on Redhat Network</h2>\n          <p>To be able to connect to the Redhat Network you need to register the machine where repositor.io is running to the Redhat Network. You can do this on the <a href="https://access.redhat.com/management/consumers/">Customer Portal</a>. After registering a new system you need to attach a subscribtion to it. Now you can download the certificate file from the <i>Entitlement Certificate</i> column. This will download one file containing the key and the certificate.</p>\n          <p>You also need the Redhat Network CA certificate. If you're on a Redhat System you'll find it under <i>/etc/rhsm/ca/redhat-uep.pem</i>.</p>\n	{}
49	29	34	2	1	1	0	1	1	1	Misc	misc	Miscellaneous documentation	Some unsorted documentation.	\N	13	2016-07-24 11:16:53.806922	2016-07-24 11:16:53	\N	\N		{}
51	32	33	3	1	1	0	1	1	1	Proxy Support	proxy_support	Proxy repositories to save bandwidth	Linux repositories can be very large and normaly you don't need all packages. As of 0.7.0 repositor.io can act as a proxy to the upstream servers.	\N	2	2016-07-24 11:19:57.215124	2016-07-24 11:19:57	\N	\N	  <h1><span class="highlight">Proxy </span> repositories to save bandwidth</h1>\n\n  <p>Linux repositories can be very large and normaly you don't need all packages. As of 0.7.0 repositor.io can act as a proxy to the upstream servers.</p>\n  <p>Configured as a proxy server repositor.io will build up the local mirror as the packages are requested. This means, if your package manager want to download a package, repositor.io first looks on its harddrive and if it can't find the package it will download the package from the upstream server.\n          </p>\n          <p>To configure repositor.io as a proxy you need to configure the repository to allow proxying and start the build-in webserver.</p>\n\n          <pre><code>&lt;Repository ubuntu-precise-amd64-main&gt;\n  url       = http://de.archive.ubuntu.com/ubuntu/\n  local     = ubuntu-precise-amd64-main/ubuntu\n  type      = Apt\n  arch      = amd64\n  dist      = precise\n  component = main\n  proxy     = true\n&lt;/Repository&gt;\n</code></pre>\n          <p>It is <b>important</b> that the first part of the <i>local</i> option is the same as the repository name. (here: ubuntu-precise-amd64-main).</p>\n\n\n  <p>To have better performance to deliver your packages we recommend to setup a webserver in front of the build-in http server.</p>\n\n  <h2><span class="highlight">Configure</span> Apache as reverse proxy</h2>\n\n  <p>To configure apache as a reverse proxy for repositor.io the following configuration snippet should get you started.</p>\n  <pre><code>RewriteEngine On\nRewriteCond %{DOCUMENT_ROOT}%{REQUEST_FILENAME} !-f\nRewriteRule ^/(.*) http://localhost:3000/$1 [L,P]</code></pre>\n\n  <p>This rewrite rule tells apache to first check if the file is present in its document root and only if the file is not there it will give the request to repositorio. With this it is possible to reduce the load on repositorio.</p>\n\n  <p>To start the build-in preforking webserver please run the following command:</p>\n  <pre><code>repositorio --repo=your-repositoy-name --server prefork</code></pre>\n  <p>This will start a preforking webserver on port 3000. To get a help for all the options just append <code>-- -h</code> to the above command.</p>\n  <pre><code>repositorio --repo=your-repositoy-name --server prefork -- -h</code></pre>\n\n  <p>Now there is the problem that apache doesn't look upstream if the metadata changed. So apache is always serving old (cached) content. To update the metadata without downloading all the packages you can run the following command.</p>\n  <pre><code>repositorio --repo=your-repository-name --update-metadata --no-update-files --mirror</code></pre>\n	{}
50	30	31	3	1	1	0	1	1	1	Querry Errata	querry_errata	Querying errata information	Package errata information are important for a secure server. With repositor.io you can lookup errata information of your packages.	\N	2	2016-07-24 11:17:39.735921	2016-07-24 11:17:39	\N	\N	  <h1><span class="highlight">Querying </span> errata information</h1>\n\n\n<p>If you want to do proper patch management you always need to know which packages are on your servers and which updates are available for them. <i>repositor.io</i> has currently a database that can be queried to get information about package updates.</p>\n          <p>This database can be used together with a configuration management tool like <a href="http://www.rexify.org/">(R)?ex</a> to manage package updates on your servers.</p>\n          <h2>Configuration</h2>\n          <p>To configure an errata database for a repository you have to define the errata type repositor.io should use. The following example configuration is a CentOS 6 mirror and will expose the errata database for CentOS 6.</p>\n          <pre><code>&lt;Repository centos-6-x86-64&gt;\n  url    = http://ftp.hosteurope.de/mirror/centos.org/6/os/x86_64/\n  local  = centos-6-x86-64/CentOS/6/rex/x86_64/\n  type   = Yum\n  errata = CentOS-6\n&lt;/Repository&gt;\n</code></pre>\n          <p>Currently we are maintaining errata databases for CentOS (5, 6, 7), EPEL (5, 6, 7), Debian (squeeze, wheezy, jessie) and Ubuntu (10.04, 12.04, 14.04). If you want to provide errata databases for other distributions feel free to contact us on <a href="https://github.com/RexOps/repositorio">Github</a> or <a href="irc://irc.freenode.net/rex">irc.freenode.net</a> channel <b>#rex</b>.</p>\n          <p>Valid errata types are:</p>\n          <ul>\n            <li>CentOS-5</li>\n            <li>CentOS-6</li>\n            <li>CentOS-7</li>\n            <li>epel-5</li>\n            <li>epel-6</li>\n            <li>epel-7</li>\n            <li>debian-squeeze</li>\n            <li>debian-wheezy</li>\n            <li>debian-jessie</li>\n            <li>ubuntu-10.04</li>\n            <li>ubuntu-12.04</li>\n            <li>ubuntu-14.04</li>\n          </ul>\n          <h2>Update Errata Database</h2>\n          <p>To update your errata database you can use the <i>--update-errata</i> option. We are updating errata information every day.</p>\n          <pre><code class="bash">$ repositorio --repo=centos-6-x86-64 --update-errata</code></pre>\n\n          <h2>Query Errata Database</h2>\n          <p>There are 2 types how you can query the errata database. You can use the command line tool <i>repositorio</i> or a webservice.</p>\n          <p>To use the CLI run the following command.</p>\n          <pre><code class="bash">$ repositorio --repo=centos-6-x86-64 --errata --package=openssl --arch=x86_64 --version=1.0.1e-16.el6_5.4</code></pre>\n          <p>To use the webservice you first need to start an integrated webserver. This webserver can serve the contents of a repository and is used to query the errata database.</p>\n          <pre><code class="bash">$ repositorio --repo=centos-6-x86-64 --server prefork</code></pre>\n          <p>This will start a preforking webserver on port 3000. If you want to use another port you can get help for all the parameters with the following command.</p> \n          <pre><code class="bash">$ repositorio --repo=centos-6-x86-64 --server prefork -- --help</code></pre>\n\n          <p>Now you can query the database with - for example - curl.</p>\n          <pre><code class="bash">$ curl -XGET \\\n   http://yourrepo:3000/head/centos-6-x86-64/errata?package=openssl&amp;arch=x86_64&amp;version=1.0.1e-16.el6_5.4</code></pre>\n	{}
52	26	27	3	1	1	0	1	1	1	Docker Proxy	docker_proxy	Docker Private Registry with proxy support	Sometimes your workstation or servers are not allowed to connect to the internet and so they can't reach the official docker registry.	\N	2	2016-07-24 11:21:19.274469	2016-07-24 11:21:19	\N	\N	  <h1><span class="highlight">Proxy </span> to another docker registry</h1>\n\n  <p>Sometimes your workstation or servers are not allowed to connect to the internet and so they can't reach the official docker registry. Or you have a central docker registry in your company and also want to create your own for images in your team. But you don't want to remember which registry you need to use for specific images. This is where the docker proxy support joins the game.</p>\n  <p>You can configure repositorio to act as a proxy server for images that are not found localy to an upstream registry.</p>\n  <p>To configure your private registry to connect to an upstream registry you need to set the following options.</p>\n  <pre><code>&lt;Repository docker&gt;\n  local = docker\n  type  = Docker\n  proxy = true\n  url   = https://registry.hub.docker.com/\n  upstream_user     = upstream-user\n  upstream_password = upstream-password\n&lt;/Repository&gt;\n  </code></pre>\n\n  <p>If you want to learn how to setup a private registry please see <a href="/documentation/docker.html">this</a> article.</p>\n	{}
53	38	41	1	1	1	1	0	1	1	News	news			\N	14	2016-07-24 11:27:44.565174	2016-07-24 11:27:44	\N	\N		{}
\.


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: repositorio
--

SELECT pg_catalog.setval('page_id_seq', 54, true);


--
-- Data for Name: page_type; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY page_type (id, site_id, name, description) FROM stdin;
1	1	index	\N
2	1	page	\N
12	1	docs	
13	1	docs_chapter	
14	1	news	
15	1	news_entry	
\.


--
-- Name: page_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('page_type_id_seq', 15, true);


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY site (id, name, c_date, m_date, skin, data) FROM stdin;
1	repositor.io	2016-07-22 20:26:18.089978	2016-07-22 20:26:18.089978	repositor.io	\N
\.


--
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('site_id_seq', 1, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY users (id, username, password, email, data) FROM stdin;
1	admin	{SSHA}Tpbrs4fEpW9LScu+PmJ//1XbpEHEjZOU36M9ALrpgSVfzdyPCPCYlgh0WhvHsasGL1fLRV5R8VDYOaFuDBM=	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: virtual_host; Type: TABLE DATA; Schema: public; Owner: $USERNAME$
--

COPY virtual_host (id, site_id, name) FROM stdin;
\.


--
-- Name: virtual_host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: $USERNAME$
--

SELECT pg_catalog.setval('virtual_host_id_seq', 1, false);


--
-- Name: content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY content_type
    ADD CONSTRAINT content_type_pkey PRIMARY KEY (id, site_id);


--
-- Name: dbix_class_deploymenthandler_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY dbix_class_deploymenthandler_versions
    ADD CONSTRAINT dbix_class_deploymenthandler_versions_pkey PRIMARY KEY (id);


--
-- Name: dbix_class_deploymenthandler_versions_version; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY dbix_class_deploymenthandler_versions
    ADD CONSTRAINT dbix_class_deploymenthandler_versions_version UNIQUE (version);


--
-- Name: language_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: media_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id, site_id);


--
-- Name: media_type_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY media_type
    ADD CONSTRAINT media_type_pkey PRIMARY KEY (id);


--
-- Name: page_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id, site_id);


--
-- Name: page_type_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY page_type
    ADD CONSTRAINT page_type_pkey PRIMARY KEY (id);


--
-- Name: site_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: virtual_host_name; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY virtual_host
    ADD CONSTRAINT virtual_host_name UNIQUE (name);


--
-- Name: virtual_host_pkey; Type: CONSTRAINT; Schema: public; Owner: $USERNAME$; Tablespace: 
--

ALTER TABLE ONLY virtual_host
    ADD CONSTRAINT virtual_host_pkey PRIMARY KEY (id);


--
-- Name: content_type_idx_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX content_type_idx_site_id ON content_type USING btree (site_id);


--
-- Name: language_idx_lang_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX language_idx_lang_site_id ON language USING btree (lang_site_id);


--
-- Name: language_idx_master_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX language_idx_master_site_id ON language USING btree (master_site_id);


--
-- Name: media_idx_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX media_idx_site_id ON media USING btree (site_id);


--
-- Name: media_idx_type_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX media_idx_type_id ON media USING btree (type_id);


--
-- Name: media_type_idx_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX media_type_idx_site_id ON media_type USING btree (site_id);


--
-- Name: page_idx_content_type_id_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX page_idx_content_type_id_site_id ON page USING btree (content_type_id, site_id);


--
-- Name: page_idx_creator_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX page_idx_creator_id ON page USING btree (creator_id);


--
-- Name: page_idx_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX page_idx_site_id ON page USING btree (site_id);


--
-- Name: page_idx_type_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX page_idx_type_id ON page USING btree (type_id);


--
-- Name: page_type_idx_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX page_type_idx_site_id ON page_type USING btree (site_id);


--
-- Name: virtual_host_idx_site_id; Type: INDEX; Schema: public; Owner: $USERNAME$; Tablespace: 
--

CREATE INDEX virtual_host_idx_site_id ON virtual_host USING btree (site_id);


--
-- Name: content_type_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY content_type
    ADD CONSTRAINT content_type_fk_site_id FOREIGN KEY (site_id) REFERENCES site(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: language_fk_lang_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_fk_lang_site_id FOREIGN KEY (lang_site_id) REFERENCES site(id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: language_fk_master_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_fk_master_site_id FOREIGN KEY (master_site_id) REFERENCES site(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: media_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_fk_site_id FOREIGN KEY (site_id) REFERENCES site(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: media_fk_type_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_fk_type_id FOREIGN KEY (type_id) REFERENCES media_type(id) DEFERRABLE;


--
-- Name: media_type_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY media_type
    ADD CONSTRAINT media_type_fk_site_id FOREIGN KEY (site_id) REFERENCES site(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: page_fk_content_type_id_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_fk_content_type_id_site_id FOREIGN KEY (content_type_id, site_id) REFERENCES content_type(id, site_id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: page_fk_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_fk_creator_id FOREIGN KEY (creator_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: page_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_fk_site_id FOREIGN KEY (site_id) REFERENCES site(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: page_fk_type_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_fk_type_id FOREIGN KEY (type_id) REFERENCES page_type(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: page_type_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY page_type
    ADD CONSTRAINT page_type_fk_site_id FOREIGN KEY (site_id) REFERENCES site(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: virtual_host_fk_site_id; Type: FK CONSTRAINT; Schema: public; Owner: $USERNAME$
--

ALTER TABLE ONLY virtual_host
    ADD CONSTRAINT virtual_host_fk_site_id FOREIGN KEY (site_id) REFERENCES site(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- PostgreSQL database dump complete
--


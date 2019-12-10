--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE pricewatcher;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5f669773c3bc40401c00685cf2f9c4ca2';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "pricewatcher" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

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
-- Name: pricewatcher; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pricewatcher WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE pricewatcher OWNER TO postgres;

\connect pricewatcher

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
-- Name: box; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.box (
    id bigint NOT NULL,
    boxid character varying(255),
    boxname character varying(255),
    cashprice double precision,
    categoryid character varying(255),
    exchangeprice double precision,
    sellprice double precision
);


ALTER TABLE public.box OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id bigint NOT NULL,
    categoryid character varying(255),
    externalid character varying(255),
    name character varying(255)
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: item_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_price (
    item_id bigint NOT NULL,
    prices_id bigint NOT NULL
);


ALTER TABLE public.item_price OWNER TO postgres;

--
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    id bigint NOT NULL,
    cashprice double precision,
    date timestamp without time zone,
    exchangeprice double precision,
    sellprice double precision
);


ALTER TABLE public.price OWNER TO postgres;

--
-- Data for Name: box; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.box (id, boxid, boxname, cashprice, categoryid, exchangeprice, sellprice) FROM stdin;
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (id, categoryid, externalid, name) FROM stdin;
2	1064	045496424756	Pokemon Sword
4	1064	045496424824	Pokemon Shield
6	1064	045496420277	Mario Kart 8 Deluxe
8	1064	045496420055	Legend of Zelda: Breath Of The Wild
10	1064	045496425241	Luigi's Mansion 3
1128	1064	5060146465533	Hello Neighbor
1130	1064	5055277034604	Sega Mega Drive Classics
1132	1064	3307216125549	Just Dance 2020
1134	1064	045496422189	Octopath Traveller
1136	1064	5051892206716	LEGO Ninjago Movie Game
1138	1064	5026555067553	Sid Meier's Civilization VI
1140	1064	4012927085226	Yu-Gi-Oh! Legacy Of The Duelist: Link Evolution (No Cards)
1142	1064	3391891994415	Dragonball Xenoverse 2
1144	1064	045496421816	Hyrule Warriors: Definitive Edition
1146	1064	5055277033515	Team Sonic Racing
1148	1064	3307216079453	Sports Party
1150	1064	4012927085134	Super Bomberman R
1152	1064	045496424169	Ring Fit Adventure W/Fitness Ring & Leg Strap 
1154	1064	4020628756116	Saints Row The Third, Full Package
1156	1064	5055060948491	Monster Hunter Generations Ultimate
1158	1064	045496422738	Dragon Quest Builders 2
1160	1064	045496421311	Doom
1162	1064	5026555067645	NBA 2K20 (No DLC)
1164	1064	5016488132169	Bendy & The Ink Machine
1166	1064	045496424596	Daemon X Machina
1168	1064	5051892219419	Lego Movie 2 Videogame (No Minifig)
1170	1064	5026555066808	WWE 2K18
1172	1064	3307216053750	South Park: The Fractured But Whole
1174	1064	3307216111955	Assassin's Creed III/3 Remastered
1176	1064	5051892213585	Rocket League
1178	1064	5021290083684	Final Fantasy X HD Only
1180	1064	045496420802	Fire Emblem Warriors
1182	1064	045496422462	Go Vacation
1184	1064	710535220230	Ghostbusters The Video Game Remastered
1186	1064	5021290083905	Final Fantasy XII The Zodiac Age
1188	1064	3307216075561	Trials Rising (No DLC)
1190	1064	045496421403	Dragon Quest Builders
1192	1064	5055060948378	Street Fighter 30th Anniversary Collection
1194	1064	045496421144	SnipperClips Plus: Cut It Out Together!
1196	1064	5026555066617	NBA 2K18
1198	1064	045496422264	Wolfenstein II: The New Colossus
1200	1064	3391892004328	Ni No Kuni: Wrath of the White Witch
1202	1064	3499550370492	Rollercoaster Tycoon Adventures
1204	1064	8023171043234	Bloodstained: Ritual of the Night
1206	1064	5026555067423	Nba 2k Playgrounds 2
1208	1064	8718591186684	Xenon Racer
1210	1064	045496425517	Layton's Mystery Journey: Katrielle and the Millionaires' Conspiracy
1212	1064	5016488131773	Nickelodeon Kart Racers
1214	1064	5060146464550	Minecraft Story Mode
1216	1064	5051892208697	Cars 3: Driven to Win
1218	1064	5060264371280	Binding of Isaac, The: Afterbirth+
1220	1064	5056208803092	My Time At Portia
1222	1064	5056208804310	Yooka-Laylee and the Impossible Lair
1224	1064	8023171041049	Payday 2
1226	1064	884095192815	ARK: Survival Evolved
1228	1064	5060102954941	Harvest Moon Light of Hope
1230	1064	3307216064114	Starlink: Battle For Atlas Starter Pack
1232	1064	5051892213455	Scribblenauts Showdown
1234	1064	3391891998918	Dragon Ball: FighterZ
1236	1064	045496420543	Ultra Street Fighter II: The Final Challengers
1238	1064	5056208802217	Overcooked 2
1240	1064	5060528030762	Paw Patrol: On A Roll!
1242	1064	3391892000160	Tales of Vesperia Definitive Edition
1244	1064	3760156482613	Gear Club Unlimited 2
1246	1064	5060146466783	Hello Neighbor: Hide & Seek
1248	1064	9120080073839	Sphinx And The Cursed Mummy
1250	1064	3391891999182	My Hero One's Justice
1252	1064	8023171040899	Portal Knights
1254	1064	3760156481722	Gear. Club Unlimited
1256	1064	5060264372478	Yonder: The Cloud Catcher Chronicles
1258	1064	9120080074010	Darksiders: Warmastered Edition
1260	1064	5056208803238	Sniper Elite V2 Remastered
1262	1064	5060112431838	Disgaea 5 Complete
1264	1064	3307216088165	Hasbro Game Night
1266	1064	3391892003758	Super Dragon Ball Heroes: World Mission
1268	1064	5016488130950	Monster Jam - Crush It
1270	1064	5060146468381	Disney Classic Games: Aladdin & The Lion King
1272	1064	045496422813	Xenoblade Chronicles 2: Torna - The Golden Country
1274	1064	5056208803658	Sniper Elite 3 - Ultimate Edition
1276	1064	5051895410219	Batman - The Telltale Series
1278	1064	045496425630	Tetris 99 (No Subscription Code)
1280	1064	5060102955276	Little Dragons Cafe
1282	1064	5060528032223	Jumanji: The Video Game
1284	1064	5021290085367	Collection of Mana
1286	1064	5060057024539	Stern Pinball Arcade
1288	1064	5060528030069	Ben 10
1290	1064	5060264373147	Dead Cells
1292	1064	3307216009344	Just Dance 2017
1294	1064	3391892004472	God Eater 3
1296	1064	5060146467285	Hollow Knight
1298	1064	9120080074188	Red Faction Guerilla Re-Mars-Tered
1300	1064	5060201659310	Our World is Ended
1302	1064	3499550364316	Tennis World Tour
1304	1064	5060264371525	Unbox: Newbies Adventure
1306	1064	8436566140966	Axiom Verge
1308	1064	3391891997522	Little Nightmares
1310	1064	5060528030373	Adventure Time Pirates of the Enchiridion
1312	1064	045496425173	Legend of Zelda: Link's Awakening Limited Ed. w/ Artbook & Steelbook
1314	1064	9120080074201	Darksiders 2 Deathinitive Edition
1316	1064	5060236969491	Overcooked
1318	1064	5035228123465	Unravel Two
1320	1064	5060264372386	Moonlighter
1322	1064	5060327534393	A.O.T. 2
1324	1064	884095192594	PixArk
1326	1064	811949030450	Telltale's The Walking Dead: The Final Season
1328	1064	045496422547	The World Ends With You: Final Remix
1330	1064	5060528031691	Dragons: Dawn of New Riders
1332	1064	3499550366587	V-Rally 4
1334	1064	3307216079316	Legendary Fishing
1336	1064	5055277035526	Super Monkey Ball: Banana Blitz HD
1338	1064	3391892005523	Digimonstory Cybersleuth Complete Edition
1340	1064	4020628745226	Cities: Skylines
1342	1064	5060528030588	Hotel Transylvania 3: Monsters Overboard
1344	1064	3512899120907	Spintires: MudRunner - American Wilds Edition
1346	1064	4020628811860	Puyo Puyo Tetris
1348	1064	5026555067126	NBA 2k19
1350	1064	811949030740	Baldur's Gate Enhanced Edition
1352	1064	5060146465823	Minecraft Story Mode - Season 2
1354	1064	3499550373752	TT Isle Of Man: Ride On The Edge
1356	1064	5060690790655	Dusk Diver
1358	1064	5060264372232	Wonder Boy: The Dragon's Trap
1360	1064	5021290079236	Lost Sphear
1362	1064	3391892000320	Namco Museum Arcade Pac
1364	1064	5060146465892	Banner Saga Trilogy, The
1366	1064	9120080070845	Battle Chasers Nightwar
1368	1064	5060540770172	Fate/Extella Link
1370	1064	5060102954828	Steam World Dig 2
1372	1064	5060188670711	Grip: Combat Racing
1374	1064	5016488131636	Goosebumps The Game
1376	1064	3512899118966	Farming Simulator 2017
1378	1064	5060146464475	RiME
1380	1064	8718591185717	Owlboy
1382	1064	5060201658733	Blazblue Cross Tag Battle
1384	1064	4020628780753	Lets Sing 2018 (Game Only)
1386	1064	5060201659532	Kotodama: The 7 Mysteries of Fujisawa
1388	1064	5060201658771	Cat Quest
1390	1064	8023171043012	Terraria
1392	1064	5060188670810	Shaq Fu - A Legend Reborn
1394	1064	045496423483	Fitness Boxing
1396	1064	5060690790211	Raging Loop (No Book)
1398	1064	3391892000252	Taiko no Tatsujin: Drum 'n' Fun!
1400	1064	3512899121645	Vampyr
1402	1064	5016488130899	Cartoon Network Battle Crashers
1404	1064	4260458361795	Air Conflicts Collection
1406	1064	5016488132985	Mutant Year Zero: Road to Eden
1408	1064	045496421564	Nintendo Labo Toy-Con 01: Variety (Game Only)
1410	1064	5060102955542	R.I.C.O
1412	1064	5060102955030	Trailblazers
1414	1064	5016488133272	Snooker 19
1416	1064	5060201658276	Gal Gun 2
1418	1064	5055377602970	Vegas Party
1420	1064	9120080073877	Raven Remastered, The
1422	1064	9120080073853	Book of Unwritten Tales 2, The
1424	1064	5055377603014	Chicken Range
1426	1064	5060264373512	For The King
1428	1064	5060264371662	Aragami: Shadow Edition
1430	1064	5060540770011	Fate/Extella: The Umbral Star
1432	1064	045496423315	Travis Strikes Again: No More Heroes (No DLC)
1434	1064	5060264372058	Darkest Dungeon
1436	1064	5060102954774	Lumo
1438	1064	5060327534447	Nights of Azure 2
1440	1064	5016488131230	Poi
1442	1064	5060264371952	Runbow
1444	1064	5060327535062	Nelke & the Legendary Alchemists: Ateliers of the New World
1446	1064	045496422103	Sushi Striker: The Way of Sushido
1448	1064	3391892003871	Sword Art Online: Hollow Realisation Deluxe Edition
1450	1064	5060264373536	Children of Morta
1452	1064	3760156483399	Blacksad: Under The Skin
1454	1064	3760156481647	Syberia 1 & 2
1456	1064	4020628756628	This War of Mine Complete Edition
1458	1064	5060102954880	Flipping Death
1460	1064	5060146467131	Wasteland 2
1462	1064	5060327535567	Atelier Ryza: Ever Darkness & The Secret Hideout
1464	1064	5060528030939	Ice Age: Scrat's Nutty Adventure
1466	1064	5060264372805	Brawlout
1468	1064	045496421595	Nintendo Labo Toy-Con 02: Robot (Game Only)
1470	1064	5060146465984	Mutant Football League
1472	1064	5903268341029	Urban Trial Playground
1474	1064	3760156482996	Fort Boyard
1476	1064	810023032984	Lapis x Labyrinth
1478	1064	5056208802583	Escapists 2, The
1480	1064	3391892000313	Taiko no Tatsujin: Drum 'n' Fun! Collector's Edition W/Drum Set
1482	1064	8059617109707	MotoGP 19
1484	1064	5060528031219	Crayola Scoot
1486	1064	3512899122031	Call of Cthulhu
1488	1064	810023030720	Ys VIII: Lacrimosa of Dana
1490	1064	5060201659273	BlazBlue Central Fiction
1492	1064	3391892003819	Sword Art Online: Fatal Bullet Complete Edition
1494	1064	5060327535451	A.O.T.2 Final Battle
1496	1064	5055277032778	Valkyria Chronicles 4
1498	1064	4020628737832	Dead By Daylight
1500	1064	5060201658948	All-Star Fruit Racing
1502	1064	3499550375947	WRC 8
1504	1064	5060528031912	Ugly Dolls: An Imperfect Adventure
1506	1064	8059617107604	Monster Energy Supercross
1508	1064	9120080073082	Rad Rodgers Radical Edition
1510	1064	5060327534812	Warriors Orochi 4
1512	1064	045496420833	Fire Emblem Warriors Limited Edition W/3 CD OST + Art Cards
1514	1064	3391891998604	One Piece Pirate Warriors 3
1516	1064	5056208800213	Yoku's Island Express
1518	1064	5060201659693	Gun Gun Pixies (No Art Book)
1520	1064	045496424008	SNK Heroines Tag Team Frenzy
1522	1064	5060201657637	Shantae: Half-Genie Hero
1524	1064	8059617107116	MXGP3 - The Official Motocross Videogame
1526	1064	9120080070647	This is the Police
1528	1064	9120080070623	Sine Mora EX
1530	1064	8059617108045	MotoGP 18
1532	1064	3307216102045	Child Of Light: Ultimate Edition/Valiant Hearts: The Great War
1534	1064	4020628743758	Redeemer Enhanced Edition
1536	1064	5060112432095	Touhou Kobuto V: Burst Battle
1538	1064	5060146468596	Into the Dead 2
1540	1064	4020628764777	Lets Sing 2019 (Game Only)
1542	1064	5060146468060	Friday the 13th: The Game
1544	1064	5016488132695	Trine 4: The Nightmare Prince
1546	1064	5016488133661	Zombieland: Double Tap Roadtrip
1548	1064	5060264373475	Bomber Crew
1550	1064	3499550381313	Bee Simulator
1552	1064	5060201659457	World End Syndrome
1554	1064	3760156482064	Yesterday Origins
1556	1064	8059617109264	Monster Energy Supercross 2
1558	1064	3760156482095	Super Chariot
1560	1064	5060188671121	Victor Vran: Overkill Edition
1562	1064	5056280410171	Yu-No: A Girl Who Chants Love At The Bound Of This World
1564	1064	3391891994439	One Piece: Unlimited World Red Deluxe
1566	1064	045496420116	Legend of Zelda: Breath Of The Wild Limited Edition w/ Statue & Soundtrack
1568	1064	5055277031429	Shining Resonance Refrain
1570	1064	5060327534577	Atelier Lydie and Suelle The Alchemists and the Mysterious Paintings
1572	1064	5056280410010	Cytus Alpha Collector's Edition
1574	1064	3760156481852	Syberia 2
1576	1064	0810023034186	Disgaea 4 Complete+
1578	1064	045496421977	Nintendo Labo Toy-Con 03: Vehicle Kit (Game Only)
1580	1064	3499550374759	FIA European Truck Racing Championship
1582	1064	4260558699545	Bubble Bobble 4 Friends
1584	1064	5016488131704	Big Buck Hunter Arcade
1586	1064	5056280414568	Deadly Premonition: Origins
1588	1064	5060102955269	Hello Kitty Kruisers
1590	1064	5060264372133	Slain: Back from Hell
1592	1064	5060528032445	Race With Ryan
1594	1064	3760156482293	Moto Racer 4
1596	1064	5055377603397	Grave Danger
1598	1064	5060146466851	Dragon Marked for Death
1600	1064	0810023031499	SNK 40th Anniversary Collection
1602	1064	5060112432392	Death Mark
1604	1064	3700664525600	Instant Sports
1606	1064	3499550362107	Aqua Moto Racing Utopia
1608	1064	5060102955092	Harvest Moon: Light of Hope Collector Ed. (6 Badges+Bag+Mug) No DLC
1610	1064	5060540770196	Gal Metal: World Tour Edition
1612	1064	5060264373420	Truberbrook
1614	1064	5060201659938	Kill La Kill IF
1616	1064	4020628761998	Broken Sword 5: The Serpent's Curse
1618	1064	8718591186974	Among The Sleep: Enhanced Edition
1620	1064	5060102954699	Superbeat Xonic EX
1622	1064	5060327535307	Atelier Lulua: The Scion of Arland
1624	1064	4012927085301	Contra: Rogue Corps
1626	1064	5056208804839	Wargroove
1628	1064	884095195809	Star Wars Pinball
1630	1064	5060057024157	Constructor Plus
1632	1064	3760156481692	Syberia
1634	1064	5016488130448	Troll and I
1636	1064	3512899122581	Farming Simulator 20
1638	1064	045496422585	Nintendo Labo Toy-Con 04: VR (Game Only)
1640	1064	045496425227	Astral Chain Collector's Edition (Artbook, Artboard, OST)
1642	1064	3307216015437	Mario + Rabbids Kingdom Battle Coll.Ed w/ Figure+CD
1644	1064	3499550366761	Hunting Simulator
1646	1064	3499550370379	My Little Riding Champion
1648	1064	3499550383416	Unicorn Princess, The
1650	1064	3760156482088	Flashback Collector's Edition (With MetalCard)
1652	1064	5056280410072	Horizon Chase Turbo
1654	1064	5060102955535	Harvest Moon: Light of Hope Complete Edition
1656	1064	5060146465199	Azure Strikes Gunvolt Striker Pack
1658	1064	5060146467797	A Hat In Time
1660	1064	5060528031394	Steven Universe Save The Light & OK K.O.! Lets Play Heroes
1662	1064	810023031208	Lost Child, The
1664	1064	810023032137	Princess Guide, The
1666	1064	860777002641	Bass Pro Shops The Strike: Championship Edition (w/Fishing Rod)
1668	1064	9120080072283	De Blob
1670	1064	4260252081349	Deponia
1672	1064	5056280410133	AI: The Somnium Files
1674	1064	4020628740979	Goat Simulator: The Goaty
1676	1064	9120080071910	Titan Quest
1678	1064	5060690790136	Root Letter: Last Answer
1680	1064	5055377603373	My Riding Stables - Life With Horses
1682	1064	9120080072405	Legend of Kay Anniversary
1684	1064	5060102954781	88 Heroes: 98 Heroes Edition
1686	1064	5060188670827	Max: The Curse Of Brotherhood
1688	1064	5016488131650	Rapala Fishing Pro Series
1690	1064	4260458361283	Project Highrise: Architect's Edition
1692	1064	3760156482361	Asterix & Obelix XXL2 (No Figures)
1694	1064	810023032342	Caligula Effect, The: Overdose
1696	1064	3307216148364	Assassin's Creed: The Rebel Collection
1698	1064	9120080072368	This Is The Police 2
1700	1064	0810023031581	Disgaea 1 Complete
1702	1064	3499550362169	Snow Moto Racing Freedom
1704	1064	3760156482354	Toki Collector's Edition (W/ Arcade Machine)
1706	1064	3760156482781	Syberia 3
1708	1064	4260252080854	State of Mind
1710	1064	5060146464604	Minecraft Story Mode The Complete Adventure
1712	1064	5060188671503	Close To The Sun
1714	1064	5060201659747	Guilty Gear 20th Anniversary Edition W/Art Book & Switch Case
1716	1064	5060201659785	Nippon Marathon
1718	1064	5060201659860	Aggelos
1720	1064	5060201659907	AeternoBlade II
1722	1064	5060264372980	Candle: The Power Of The Flame
1724	1064	5060264373789	Vaporum
1726	1064	5060264378036	Stranded Sails: Explorers Of The Cursed Islands
1728	1064	5060522093589	Ultrawings Flat
1730	1064	604565041104	Mutant Mudds Collection
1732	1064	604565178053	SteamWorld Quest: Hand of Gilgamech
1734	1064	653341127617	Has Been Heroes
1736	1064	810023031925	Yomawari: The Long Night Collection
1738	1064	813633019918	Penny Punching Princess
1740	1064	8436566141543	Nightmare Boy
1742	1064	8436566141673	Ginger Beyond the Crystal
1744	1064	860108001244	Cabela's The Hunt: Championship Edition (Game Only)
1746	1064	8718591187070	Remothered: Tormented Fathers
1748	1064	9120080073662	Aces of the Luftwaffe Squadron: Extended Edition
1750	1064	045496424312	Fire Emblem: Three Houses Ltd Ed. (Artbook/SteelBook/USB/Badges)
1752	1064	4020628780746	Let's Sing 2018 + 1 Microphone
1754	1064	3391892004700	Disney Tsum Tsum Festival
1756	1064	3760156483788	Garfield Kart Furious Racing
1758	1064	5016488134361	Beast Quest
1760	1064	3760156483641	Asterix & Obelix XXL 3: The Crystal Menhir
1762	1064	5390102520885	3D Mini Golf
1764	1064	5055377603427	Mahjong Deluxe 3
1766	1064	3760156482316	ATV Drift & Tricks
1768	1064	813633019512	Longest Five Minutes, The
1770	1064	604565041074	Flame in the Flood, The
1772	1064	604565178008	Wulverblade
1774	1064	5055377603410	Gem Smashers
1776	1064	045496422400	Octopath Traveller - Special Ed. W/Book+Map+Coin
1778	1064	5055377603434	Farm Expert 2019
1780	1064	5055377603342	Crash Dummy
1782	1064	811949031303	Neverwinter Nights : Enhanced Edition
1784	1064	8436566141567	Anima: Gate of Memories Arcane Edition
1786	1064	4020628753788	Steins;Gate Elite
1788	1064	5060264373888	Northgard
1790	1064	5060057024867	Super Putty Squad
1792	1064	04549642DIDR	SNK Heroines Diamond Dream Ed. w/ Hat,Book,Towel,Sweatband,CD,Top,14x Pins
1794	1064	0810023031833	RPG Maker MV
1796	1064	0810023033929	Alliance Alive HD
1798	1064	3760156482330	Toki
1800	1064	3770011615186	Old Man's Journey
1802	1064	4020628742157	Let's Sing 2020 (No Mic)
1804	1064	4260252081370	Silence
1806	1064	4260401950847	Super Street Racer
1808	1064	4260558699170	Ninja Saviors,The: Return Of The Warriors
1810	1064	5016488132480	Trine 4 (No DLC) *** USE 5016488132695**
1812	1064	5016488133845	Street Outlaws: The List
1814	1064	5055277032747	Valkyria Chronicles 4: Premium Ed W/Statue and Artbook (No DLC)
1816	1064	5055377603595	Panda Hero
1818	1064	5056280406723	Fun! Fun! Animal Park
1820	1064	5060102955580	Harvest Moon: Mad Dash
1822	1064	5060112432286	Super Neptunia RPG
1824	1064	5060146466998	Shovel Knight: Treasure Trove
1826	1064	5060146467582	Slay the Spire
1828	1064	5060146468879	Risk Of Rain 2
1830	1064	5060201659594	Guilty Gear 20th Anniversary Edition W/Art Book
1832	1064	5060201659952	Kill La Kill IF - Collector’s Ed. (w/ Artwork, Artbook, OST, Ball Chain
1834	1064	5060264371938	Count Lucanor, The
1836	1064	5060264372249	Coma, The: Recut
1838	1064	5060264373680	Sparklite
1840	1064	5060264374519	Valfaris
1842	1064	5390102521240	Harvest Life
1844	1064	604565041081	Shelter Generations - Super Rare Games
1846	1064	604565041098	Lovers In A Dangerous Spacetime - Super Rare Games
1848	1064	604565177858	Worms WMD
1850	1064	604565177865	Snake Pass
1852	1064	604565177872	Adventure Pals, The
1854	1064	604565177889	N++
1856	1064	604565177896	Steredenn: Binary Stars
1858	1064	604565177902	Knights of Pen and Paper 1
1860	1064	604565177926	Knights of Pen and Paper 1 & 2
1862	1064	604565177933	Q.U.B.E. 2
1864	1064	604565177940	Fairune Collection
1866	1064	604565177957	Darkside Detective
1868	1064	604565177964	Earthlock
1870	1064	604565177971	Joe Dever's Lone Wolf
1872	1064	604565177988	Machinarium
1874	1064	604565177995	Earthlock Collector's Ed. w/ Artbook, CD, Manual, Card Pack, 2x Comics
1876	1064	604565178015	Toki Tori Collection
1878	1064	604565178022	Rive: Ultimate Edition
1880	1064	604565178046	Evoland
1882	1064	6622485530939	World of Final Fantasy Maxima
1884	1064	810023030560	Fallen Legion: Rise to Glory
1886	1064	810023031116	Happy Birthdays
1888	1064	810023031284	God Wars the Complete Legend
1890	1064	810023033714	Destiny Connect: Tick-Tock Travellers
1892	1064	811949031020	Planescape: Torment & Icewind Dale Enhanced Edition
1894	1064	860000098618	Cabela's The Hunt: Championship Edition (w/ Bullseye Pro Gun)
1896	1064	8718591186134	Owlboy Limited Ed. w/ Coins, Pins, Notebook, Manual, CD & Certificate
1898	1064	9120080072870	Giana Sisters Twisted Dreams
1900	1064	9120080073990	Battle Worlds: Kronos
1902	1064	045496425586	Daemon X Machina Orbital Edition (w/ Statue, Artbook)
1904	1064	8023171044293	Zumba Burn It Up
1906	1064	4260558698326	Velocity 2X
1908	1064	5021290085473	Oninaki
1910	1064	3760156484099	Off Road Racing
1912	1064	3760156484365	Gear Club Unlimited 2
1914	1064	4251357805510	Island Flight Simulator
1916	1064	3760156483924	Syberia Trilogy
1918	1064	5060201659686	Valthirian Arc: Hero School Story
1920	1064	810023030874	Labyrinth of Refrain: Coven of Dusk
1922	1064	5030917210761	Skylanders Imaginators Starter Pack
1924	1064	4020628740832	Leisure Suit Larry - Wet Dreams Don't Dry
1926	1064	5060146468213	Forager
1928	1064	9120080072306	De Blob 2
1930	1064	857126007013	Soldam: Drop/Connect/Erase
1932	1064	604565041067	Human Fall Flat - Super Rare Games Ed.
1934	1064	5060264372669	Riot: Civil Unrest
1936	1064	762743430949	Everspace - Stellar Edition
1938	1064	4020628764760	Let's Sing 2019 + 1 Microphone
1940	1064	4020628753115	YouTubers Life OMG!
2034	1003	5055060946121	Resident Evil 2
2036	1003	3307215912997	Ghost Recon: Wildlands (No DLC)
2038	1003	3307216136545	Ghost Recon Breakpoint (No DLC)
2040	1003	5026555426176	Outer Worlds, The
2042	1003	3307215889077	Rainbow Six: Siege
2044	1003	5030917188817	Overwatch
2046	1003	5030946112876	FIFA 16
2048	1003	3307215785867	Assassin's Creed Unity
2050	1003	5055856403319	Doom (2016)
2052	1003	711719276579	DriveClub
2054	1003	5030936121567	Need For Speed Payback
2056	1003	3307215732816	Watch Dogs
2058	1003	3307215748824	Crew, The (No DLC)
2060	1003	711719846963	Uncharted: The Lost Legacy (No DLC)
2062	1003	3391891978989	Witcher 3: Wild Hunt
2064	1003	5021290000575	Just Cause 3
2066	1003	5021290081963	Just Cause 4
2068	1003	5050013392246	Detroit: Become Human
2070	1003	5030917126154	Call Of Duty: Ghosts
2072	1003	5050013372835	Final Fantasy XV (No DLC)
2074	1003	5030917269721	Crash Team Racing Nitro-Fueled (No DLC)
2076	1003	5030944113738	Need For Speed 2015
2078	1003	8023171037691	Rocket League
2080	1003	0711719849339	No Man's Sky
2082	1003	5055856420675	Fallout 76 (No DLC)
2084	1003	711719278276	Infamous: Second Son
2086	1003	3307215938690	Far Cry Primal
2088	1003	5026555424677	WWE 2K19 (No DLC)
2090	1003	711719274971	Killzone: Shadow Fall
2092	1003	5030941121491	Anthem (No DLC)
2094	1003	711719848639	Ratchet & Clank (2016)
2096	1003	5021290074767	Rise of the Tomb Raider
2098	1003	5050013372859	Elder Scrolls Online
2100	1003	5055060945285	Monster Hunter: World
2102	1003	5030917250378	Sekiro: Shadows Die Twice (No DLC)
2104	1003	5051892197472	LEGO Star Wars: The Force Awakens
2106	1003	5026555423434	WWE 2K18
2108	1003	711719445517	Little Big Planet 3
2110	1003	5051892187831	LEGO Jurassic World (No Figure)
2112	1003	5030946112531	Battlefield 4
2114	1003	711719961567	Horizon Zero Dawn: Complete Edition (No DLC)
2116	1003	5051892203951	LEGO Worlds
2118	1003	4012927100134	Metal Gear Solid V: The Phantom Pain
2120	1003	5051892144537	Dying Light
2122	1003	3307216096665	Far Cry New Dawn (No DLC)
2124	1003	5030937112380	FIFA 15
2126	1003	5055856420187	Rage 2 (No DLC)
2128	1003	4020628779573	Metro Exodus (No DLC)
2130	1003	5051892206969	Middle-Earth: Shadow of War
2132	1003	5050013392857	Kingdom Hearts 3
2134	1003	3307215715314	Assassin's Creed IV: Black Flag
2136	1003	5035223122401	Sims 4, The (No DLC)
2138	1003	3307216024590	Crew 2, The (No DLC)
2140	1003	5051892168687	Middle-Earth: Shadow of Mordor
2142	1003	711719815136	Until Dawn
2144	1003	5051892219440	Mortal Kombat 11 (No DLC)
2146	1003	5035223116912	Titanfall 2
2148	1003	5051892206907	LEGO Marvel Super Heroes 2 (No Minifig)
2150	1003	5055856407577	Dishonored 2 (No DLC)
2152	1003	5050013393304	South Park: The Fractured But Whole (No DLC)
2154	1003	5030948113772	UFC 2
2156	1003	5051892215107	Hitman 2 (No DLC)
2158	1003	5030917214639	Call Of Duty Modern Warfare Remastered
2160	1003	5051892189767	LEGO Marvel Avengers
2162	1003	5026555424783	NBA 2k19 (No DLC)
2164	1003	5055856416821	Wolfenstein II: The New Colossus
2166	1003	5051892206686	Injustice 2 (No DLC)
2168	1003	5051892175104	Mortal Kombat X
2170	1003	5055856411918	Prey (2017) (No DLC)
2172	1003	5026555421058	Borderlands: The Handsome Collection
2174	1003	5030939112425	Battlefield: Hardline
2176	1003	5055856416326	Evil Within 2
2178	1003	5030946121595	UFC 3
2180	1003	711719469919	Bloodborne
2182	1003	5051892202701	Lego Harry Potter Collection
1942	1003	5030917285752	Call of Duty: Modern Warfare (2019)
1944	1003	5026555423045	Red Dead Redemption 2 (2 Disc) (No DLC)
1946	1003	5030937122440	Star Wars Jedi: Fallen Order (No DLC)
1948	1003	5026555416986	Grand Theft Auto V (5)
1950	1003	5030943122533	Fifa 20
1952	1003	711719417576	Spider-Man (2018) No DLC
1954	1003	5030917215094	Call of Duty: WWII (No DLC)
1956	1003	5030917239205	Call Of Duty: Black Ops 4 (No DLC)
1958	1003	5030945121916	FIFA 19
1960	1003	0711719386070	God Of War (2018) No DLC
1962	1003	711719876748	Uncharted 4: A Thief's End
1964	1003	0711719997399	Death Stranding
1966	1003	711719795315	Days Gone (No DLC)
1968	1003	5030946121526	FIFA 18
1970	1003	5030917162503	Call Of Duty Black Ops III
1972	1003	5030917197116	Call of Duty: Infinite Warfare (No DLC)
1974	1003	5030933121638	Star Wars Battlefront
1976	1003	5030917211034	Crash Bandicoot N. Sane Trilogy
1978	1003	5055856406112	Fallout 4
1980	1003	711719406716	Last Of Us, The: Remastered
1982	1003	3307216029557	Assassin's Creed Origins (No DLC)
1984	1003	3307216063834	Assassin's Creed Odyssey (No DLC)
1986	1003	5030935113761	Battlefield 1 (No DLC)
1988	1003	3307216016595	Far Cry 5 (No DLC)
1022	1064	045496420864	Super Mario Odyssey
1024	1064	045496422899	Super Smash Bros. Ultimate
1026	1064	045496423155	Pokemon: Let's Go, Pikachu!
1028	1064	045496424435	Legend of Zelda: Link's Awakening
1030	1064	3307216024330	Mario + Rabbids Kingdom Battle
1032	1064	045496424343	Super Mario Maker 2 (No DLC)
1034	1064	045496420437	Splatoon 2
1036	1064	045496423780	New Super Mario Bros. U Deluxe
1038	1064	045496420628	Minecraft
1040	1064	045496422981	Super Mario Party
1042	1064	5030917236730	Crash Bandicoot N. Sane Trilogy
1044	1064	045496423230	Pokemon: Let's Go, Eevee!
1046	1064	045496420185	1-2-Switch
1048	1064	045496421731	Donkey Kong Country: Tropical Freeze
1050	1064	045496421229	Elder Scrolls V: Skyrim
1052	1064	045496424671	Astral Chain
1054	1064	045496423391	Marvel Ultimate Alliance 3: The Black Order
1056	1064	5030917269806	Crash Team Racing Nitro-Fueled (No DLC)
1058	1064	045496422011	Mario Tennis Aces
1060	1064	045496420727	Pokken Tournament DX
1062	1064	5030917284540	Spyro Reignited Trilogy
1064	1064	5902367642051	Witcher 3: Wild Hunt
1066	1064	5030934122542	FIFA 19
1068	1064	045496424916	Mario & Sonic At The Olympic Games Tokyo 2020
1070	1064	3307216014034	Rayman Legends: Definitive Edition
1072	1064	045496422356	Captain Toad: Treasure Tracker
1074	1064	045496422646	Yoshi's Crafted World
1076	1064	045496424220	Fire Emblem: Three Houses
1078	1064	5030930123482	Fifa 20
1080	1064	5051892210041	LEGO Marvel Super Heroes 2
1082	1064	5026555066976	LA Noire
1084	1064	5055277030026	Sonic Forces (No DLC)
1086	1064	045496420369	ARMS
1088	1064	5030944122433	FIFA 18
1090	1064	5030917259012	Diablo III: Eternal Collection (No DLC)
1092	1064	3307216081234	Just Dance 2019
1094	1064	5051892213288	LEGO The Incredibles
1096	1064	5051892213257	LEGO DC Super-Villains (No DLC or Minifig)
1098	1064	5055277031894	Sonic Mania Plus
1100	1064	045496420956	Xenoblade Chronicles 2
1102	1064	5051892206709	LEGO City Undercover
1104	1064	5051892219433	Mortal Kombat 11 (No DLC)
1106	1064	5051892210263	Lego Worlds
1108	1064	5051892223874	LEGO Jurassic World
1110	1064	3307216026761	Monopoly
1112	1064	045496421489	Bayonetta 2 (No DLC)
1114	1064	045496421656	Kirby Star Allies
1116	1064	045496421892	Dark Souls: Remastered
1118	1064	5056208803245	Little Friends: Dogs & Cats
1120	1064	045496424510	Dragon Quest XI S: Echoes Of An Elusive Age
1122	1064	3307216018193	Just Dance 2018
1124	1064	5026555067416	Carnival Games
1126	1064	5051892217026	LEGO Harry Potter Collection
1990	1003	5035225116378	FIFA 17
1992	1003	711719827450	Gran Turismo Sport (No DLC)
1994	1003	3307216080435	Division 2, The (No DLC)
1996	1003	5051892170543	Batman: Arkham Knight
1998	1003	5030941121613	Star Wars Battlefront II (No DLC)
2000	1003	0711719439417	Minecraft
2002	1003	5055060900536	Resident Evil 7: Biohazard
2004	1003	5030917147944	Call Of Duty: Advanced Warfare
2006	1003	5030917124419	Destiny (No DLC)
2008	1003	711719815341	Horizon: Zero Dawn
2010	1003	3307215804377	Division, The
2012	1003	5030917242175	Spyro Reignited Trilogy
2014	1003	5021290080898	Shadow of the Tomb Raider (No DLC)
2016	1003	0711719866039	Uncharted: The Nathan Drake Collection
2018	1003	3307215966648	Watch Dogs 2
2020	1003	3307215793510	Far Cry 4
2022	1003	3307215893081	Assassin's Creed Syndicate
2024	1003	5050013393120	Mafia III
2026	1003	5026555426145	Borderlands 3 (No DLC)
2028	1003	5055856411581	Elder Scrolls V: Skyrim Special Edition
2030	1003	5035225122478	Need For Speed (NFS) Heat
2032	1003	5030946122271	Battlefield V (No DLC)
2184	1003	3307215774519	Rayman Legends
2186	1003	5051892145237	LEGO Marvel Super Heroes
2188	1003	5051892145251	Mad Max
2190	1003	711719284192	Order 1886, The
2192	1003	5030935116359	Mass Effect: Andromeda (No DLC)
2194	1003	5026555423731	LA Noire
2196	1003	711719945406	Medievil
2198	1003	711719351870	Shadow of the Colossus
2200	1003	3391891989886	Witcher 3: Game of The Year Edition
2202	1003	8023171042435	Control (No DLC)
2204	1003	5055060946404	Devil May Cry 5 (No DLC)
2206	1003	4012927104484	eFootball PES 2020 (No DLC)
2208	1003	5021290060814	Tomb Raider Definitive Edition
2210	1003	5026555422499	WWE 2K17
2212	1003	5051892195287	Mortal Kombat XL
2214	1003	5030947111342	Need For Speed Rivals
2216	1003	5026555423205	NBA 2K18
2218	1003	093155148918	Evil Within
2220	1003	4020628868611	Homefront: The Revolution
2222	1003	3391891990899	Tekken 7 (No DLC)
2224	1003	3307215914830	For Honor (No DLC)
2226	1003	5026555425544	WWE 2K20 (No DLC)
2228	1003	5060236965073	Sniper Elite 4
2230	1003	711719817567	Nioh
2232	1003	5051892168649	LEGO Batman 3: Beyond Gotham
2234	1003	3307215974285	Steep (No DLC)
2236	1003	3391892002652	Dark Pictures Anthology, The: Man Of Medan
2238	1003	5021290074484	Nier: Automata (No DLC)
2240	1003	5051892213233	LEGO DC Super-Villains (No DLC or Minifig)
2242	1003	3307215977361	Assassin's Creed - The Ezio Collection
2244	1003	5055060930939	Street Fighter V (No DLC)
2246	1003	5051892194969	Dying Light: The Following
2248	1003	3512899118690	Vampyr
2250	1003	5030938111351	Dragon Age: Inquisition
2252	1003	5026555421294	WWE 2K16
2254	1003	093155149137	Wolfenstein: The New Order
2256	1003	5026555426312	NBA 2K20 (No DLC)
2258	1003	3391891987332	Dark Souls III
2260	1003	5030932111333	FIFA 14
2262	1003	5055277023776	Alien: Isolation
2264	1003	5021290068995	Deus Ex: Mankind Divided
2266	1003	711719787815	Player Unknown's Battlegrounds
2268	1003	711719838357	Last Guardian, The
2270	1003	5030917185939	Deadpool
2272	1003	711719847465	Wipeout Omega Collection
2274	1003	4020628763046	F1 2018 (No DLC)
2276	1003	4012927103692	Pro Evolution Soccer 2019 (No DLC)
2278	1003	4020628747459	F1 2019 (No DLC)
2280	1003	5060146462310	Minecraft: Story Mode (Episode 1 Only)
2282	1003	711719279976	Knack
2284	1003	5055277029785	Sonic Forces (No DLC)
2286	1003	3391891981019	Project CARS
2288	1003	5055856417729	Elder Scrolls V, The: Skyrim VR
2290	1003	5021290075863	Hitman: The Complete First Season (No DLC)
2292	1003	4020628787783	Dirt 4
2294	1003	5051895409411	LEGO Ninjago Movie Game
2296	1003	5030936122748	Burnout Paradise Remastered
2298	1003	4020628816117	Kingdom Come Deliverance (No DLC)
2300	1003	5060146465472	Hello Neighbor
2302	1003	5021290057166	Thief
2304	1003	3391891994668	Ni No Kuni II: Revenant Kingdom (No DLC)
2306	1003	0711719877745	Heavy Rain/ Beyond Two Souls
2308	1003	5030917144516	Diablo III: Reaper of Souls
2310	1003	3391891995399	Dragon Ball: FighterZ (No DLC)
2312	1003	5030939116379	Plants vs Zombies: Garden Warfare 2
2314	1003	3391891993821	Project Cars 2
2316	1003	5021290077614	Kingdom Hearts HD 1.5 & 2.5 Remix
2318	1003	5051892154567	Lego Movie Videogame, The
2320	1003	5026555417280	Evolve
2322	1003	5051892215282	LEGO The Incredibles (No Minifig)
2324	1003	4020628782429	F1 2017
2326	1003	5055856405085	Wolfenstein: The Old Blood
2328	1003	4020628821968	Persona 5
2330	1003	711719842835	God of War III/3 Remastered
2332	1003	5051892198745	Batman: Return To Arkham (2 Disc)
2334	1003	5030939112678	Rory McIlroy PGA Tour
2336	1003	711719848653	Farpoint (Game Only) PSVR
2338	1003	3307216044475	Assassin's Creed Rogue Remastered
2340	1003	4020628776954	Shenmue III (No DLC)
2342	1003	711719934561	Hidden Agenda (Playlink)
2344	1003	5060112433047	Terminator: Resistance
2346	1003	0884095178192	ARK: Survival Evolved
2348	1003	710535418804	World War Z
2350	1003	5060146464918	Friday the 13th: The Game (No DLC)
2352	1003	5026555417358	WWE 2K15
2354	1003	745114517609	Ghostbusters The Video Game Remastered
2356	1003	3512899119222	GreedFall
2358	1003	3391891990059	Dragonball Xenoverse 2
2360	1003	711719761815	Astro Bot Rescue Mission (PSVR)
2362	1003	5051892203937	LEGO City Undercover
2364	1003	5026555418003	Battleborn
2366	1003	5055856425151	Wolfenstein: Youngblood (No DLC)
2368	1003	5030946116355	Mirror's Edge Catalyst
2370	1003	4020628827953	F1 2016
2372	1003	5021290000032	Final Fantasy X/X-2 HD Remastered
2374	1003	5021290081253	Dragon Quest XI: Echoes Of An Elusive Age (No DLC)
2376	1003	3391891995931	Code Vein
2378	1003	5055060931103	Resident Evil: Origins Collection
2380	1003	5055277031726	Sonic Mania Plus
2382	1003	5030917141553	Amazing Spider-Man 2
2384	1003	0711719389378	Firewall Zero Hour PSVR (Game Only)
2386	1003	4020628886417	Metro Redux
2388	1003	5030917171161	Guitar Hero Live + 6 Button Guitar + USB Dongle
2390	1003	4020628836443	Dirt Rally (Game Only)
2392	1003	5055277032082	SEGA Mega Drive Classics
2394	1003	5056208801517	Jurassic World Evolution
2396	1003	5055277033379	Team Sonic Racing
2398	1003	711719854654	Playstation VR Worlds (PSVR)
2400	1003	5060146463584	Minecraft: Story Mode Complete Adventure Ep 1-8
2402	1003	5021290074309	Final Fantasy XII: The Zodiac Age
2404	1003	5026555421898	Bioshock: The Collection (2 Disc)
2406	1003	8023171034478	Sniper Elite 3
2408	1003	3391891993111	Ace Combat 7: Skies Unknown (No DLC)
2410	1003	5051892190961	Middle-Earth: Shadow of Mordor Game Of The Year Edition
2412	1003	5055856417606	Doom VFR (PSVR)
2414	1003	5030945121749	Plants Vs Zombies: Battle for Neighborville
2416	1003	711719847366	Knack II (2)
2418	1003	4020628862251	Saints Row IV Re-Elected (No Gat Out Of Hell DLC)
2420	1003	4020628825874	Agents of Mayhem (No DLC)
2422	1003	5060236966988	Yooka-Laylee
2424	1003	4012927103067	Pro Evolution Soccer 2018
2426	1003	5055060931776	Marvel Vs Capcom Infinite
2428	1003	5051892166256	Lego: The Hobbit
2430	1003	5035223112525	UFC
2432	1003	5060146466196	Subnautica
2434	1003	711719947967	Knowledge is Power (Playlink)
2436	1003	5906961199621	Sniper Ghost Warrior Contracts
2438	1003	4012927100011	Metal Gear Solid V: Ground Zeroes
2440	1003	5055277035021	Judgment
2442	1003	5030917172038	Tony Hawk's Pro Skater 5
2444	1003	3391891997324	Dark Souls Remastered
2446	1003	5024866363968	F1 2015
2448	1003	9120080072818	Wreckfest
2450	1003	5026555421881	NBA 2K17
2452	1003	4020628754723	Dirt Rally 2.0 (No DLC)
2454	1003	5055060945995	Dead Rising 4: Frank's Big Package
2456	1003	8023171035987	Terraria
2458	1003	5021290070950	World Of Final Fantasy
2460	1003	5056208804969	DayZ
2462	1003	5051892145213	Injustice Gods Among Us: Ultimate Ed.
2464	1003	8023171040042	Dead by Daylight
2466	1003	3512899121478	Plague Tale, A: Innocence
2468	1003	9352522000206	Cricket 19 (No DLC)
2470	1003	5021290066007	Sleeping Dogs: Definitive Edition
2472	1003	711719856252	Until Dawn: Rush Of Blood (PSVR)
2474	1003	5055060930458	Resident Evil Revelations 2
2476	1003	3391892000382	Jump Force (No DLC)
2478	1003	4012927101148	Pro Evolution Soccer 2016
2480	1003	5050013378745	Dragonball Xenoverse
2482	1003	3512899116641	Farming Simulator 17
2484	1003	4020628872311	Catherine: Full Body
2486	1003	5021290071964	Kingdom Hearts HD 2.8 Final Chapter Prologue
2488	1003	5907813591549	Sniper: Ghost Warrior 3
2490	1003	5060146464635	Minecraft Story Mode - Season 2 (Episode 1 Only)
2492	1003	3391891983143	Dark Souls II (2): Scholar of the First Sin
2494	1003	5021290064959	Final Fantasy Type-0 HD
2496	1003	3307215777466	Trials Fusion (No DLC)
2498	1003	5055856406976	Dishonored: Definitive Edition
2500	1003	5035225121945	Madden NFL 19
2502	1003	5051892221313	Lego Movie 2 Videogame (No Minifig)
2504	1003	4012927102916	Metal Gear Survive
2506	1003	3512899114081	Farming Simulator 15
2508	1003	5060236968432	Escapists 2, The
2510	1003	5055856415824	Dishonored: Death of the Outsider
2512	1003	3391891997669	Soul Calibur VI
2514	1003	5016488132923	Snooker 19
2516	1003	4020628738594	Grid (2019) No DLC
2518	1003	9352522000015	Ashes Cricket
2520	1003	711719998198	Blood & Truth (PSVR)
2522	1003	5051892207270	Outlast Trinity
2524	1003	5030944112342	Plants Vs Zombies: Garden Warfare
2526	1003	9120080070784	Darksiders III
2528	1003	5055277027934	Yakuza 0
2530	1003	5060146465403	Rick and Morty Virtual Rick-Ality (PSVR)
2532	1003	5026555421201	NBA 2K16
2534	1003	5030945122760	Way Out, A
2536	1003	5055060945001	Street Fighter 30th Anniversary Collection
2538	1003	3512899120228	Farming Simulator 19
2540	1003	4020628844677	Dead Island Only (No Riptide/Retro DLC)
2542	1003	5060146463355	7 Days To Die
2544	1003	5035228122451	Madden NFL 20
2546	1003	5030917143090	Transformers: Rise of the Dark Spark
2548	1003	8023171036106	Sniper Elite 3: Ultimate Edition
2550	1003	5030917250583	Call Of Duty: Black Ops 4 (No DLC) Pro Ed. W/Art Cards,Patches&Pop Socket
2552	1003	5026555425346	Golf Club 2019, The
2554	1003	5055060931387	Resident Evil 4 HD Remake
2556	1003	8023171036342	Payday 2 Crimewave Edition
2558	1003	4012927102305	Pro Evolution Soccer 2017
2560	1003	711719854517	Tearaway Unfolded
2562	1003	711719844440	Bloodborne - Game Of The Year Edition
2564	1003	3391891992411	Little Nightmares
2566	1003	5907813598777	Lords Of The Fallen
2568	1003	711719847267	Everybody's Golf
2570	1003	0850942007182	We Happy Few
2572	1003	5060236960498	Worms Battlegrounds
2574	1003	8023171037103	Assetto Corsa
2576	1003	5021290070387	Life Is Strange (Game Only)
2578	1003	3391891999014	Divinity Original Sin 2
2580	1003	8717418464547	Disney Infinity 3.0 Software Only
2582	1003	711719973966	Superhot (PSVR)
2584	1003	5060236969033	Strange Brigade
2586	1003	711719955665	Bravo Team (PSVR)
2588	1003	3391891988780	Project Cars GOTY
2590	1003	5051892215558	Hitman Definitive Edition (No DLC)
2592	1003	3391891983471	Naruto Shippuden: Ultimate Ninja Storm 4
2594	1003	4020628818180	Micro Machines: World Series
2596	1003	5026555422383	XCOM 2
2598	1003	5051892206648	Marvel's Guardians of the Galaxy: The Telltale Series (Episode 1 Only)
2600	1003	5030938121541	Madden NFL 18
2602	1003	5021290069336	Dragon Quest Heroes: The World Tree's Woe and The Blight Below
2604	1003	5016488131537	Train Sim World
2606	1003	5060236962188	Zombie Army Trilogy
2608	1003	5055277030491	Yakuza 6: The Song Of Life (No DLC)
2610	1003	5055060930755	Devil May Cry: Definitive Edition
2612	1003	5026555417464	NBA 2K15
2614	1003	3499550376999	Sinking City, The (No DLC)
2616	1003	711719838814	Infamous: First Light
2618	1003	811949030511	Walking Dead, The - Telltale Final Season
2620	1003	4012927102053	Metal Gear Solid V: The Definitive Experience
2622	1003	8023171042602	Hellblade: Senua's Sacrifice
2624	1003	5060327533297	A.O.T. Wings of Freedom
2626	1003	5060528032292	Jumanji: The Video Game
2628	1003	5016488130745	Extinction
2630	1003	5050013407360	Star Trek: Bridge Crew (PSVR)
2632	1003	5055277033249	Shenmue I & II
2634	1003	5021290062764	Murdered: Soul Suspect
2636	1003	5060327534195	Dynasty Warriors 9
2638	1003	8023171038933	Portal Knights
2640	1003	5051892202633	Batman: The Telltale Series (Episode 1 Only)
2642	1003	5055060931516	Resident Evil 5 HD
2644	1003	3512899117204	Surge, The
2646	1003	711719753919	Concrete Genie
2648	1003	711719865452	Robinson: The Journey (PSVR)
2650	1003	5016488132145	Bendy & The Ink Machine
2652	1003	711719459811	Singstar: Ultimate Party
2654	1003	711719853053	Driveclub VR (PSVR)
2656	1003	711719966562	Inpatient, The (PSVR)
2658	1003	5021290078987	Dissidia Final Fantasy NT (No DLC)
2660	1003	4020628788971	Cities Skylines
2662	1003	4012927100462	Pro Evolution Soccer 2015
2664	1003	5060236967848	Elite Dangerous (No DLC)
2666	1003	5055060931646	Resident Evil 6 HD Remake
2668	1003	5030942116380	Madden NFL 17
2670	1003	5030917175732	Guitar Hero Live + 2x 6 Button Guitars + USB Dongle
2672	1003	5055060948101	Devil May Cry HD Collection
2674	1003	502129006LTNC	Lara Croft and the Temple of Osiris (Game Only)
2676	1003	5060146468459	Disney Classic Games: Aladdin & The Lion King
2678	1003	3307216017479	Just Dance 2018
2680	1003	5026555425384	Carnival Games
2682	1003	3391891986878	Digimon Story: Cyber Sleuth
2684	1003	3307215913673	Track Mania Turbo
2686	1003	3512899121713	Surge 2, The
2688	1003	3307215967430	Just Dance 2017
2690	1003	3512899115415	Technomancer, The
2692	1003	5021290083752	Kingdom Hearts: The Story So Far
2694	1003	8154030104169	Adventure Time: Finn and Jake Investigations
2696	1003	9006113008125	Darksiders 2
2698	1003	711719850052	RIGS: Mechanized Combat League (PSVR)
2700	1003	5030917176562	Transformers Devastation
2702	1003	5030917192883	Teenage Mutant Ninja Turtles: Mutants in Manhattan (12)
2704	1003	3307216111597	Assassin's Creed III/3 Remastered
2706	1003	3499550361728	Rugby 18
2708	1003	5030917213953	Destiny 2 (No DLC)
2710	1003	5021290074200	Dragon Quest Builders
2712	1003	5026555415057	NBA 2K14
2714	1003	5016488132633	Dangerous Driving
2716	1003	5051892213875	Injustice 2 Legendary Edition
2718	1003	5051892208628	Cars 3 Driven To Win
2720	1003	9120080073488	Generation Zero
2722	1003	811949030078	Long Dark, The
2724	1003	711719866756	Eve: Valkyrie (PSVR)
2726	1003	4020628789442	Yakuza Kiwami
2728	1003	4020628778804	Car Mechanic Simulator
2730	1003	3391891995719	Digimon Story: Cyber Sleuth Hacker's Memory
2732	1003	5060327534294	A.O.T. 2
2734	1003	5051892208529	Batman, The Telltale Series: The Enemy Within (Episode 1 Only)
2736	1003	3307216030300	Trials Rising
2738	1003	3307215916254	Assassin's Creed Chronicles
2740	1003	9006113008156	MX vs. ATV: Supercross Encore Edition
2742	1003	8023171039633	Stardew Valley
2744	1003	4260089416000	Tropico 5
2746	1003	5016488131759	Nickelodeon Kart Racers
2748	1003	5021290084308	Dragon Quest Builders 2
2750	1003	5060236961471	Escapists, The
2752	1003	5035226121951	NHL 19
2754	1003	3391891985314	Tales of Zestiria
2756	1003	3499550344707	WRC 5
2758	1003	5056208800510	Overcooked 2
2760	1003	5030917195273	Ghostbusters (2016)
2762	1003	5056208803214	Sniper Elite V2 Remastered
2764	1003	9006113008897	Elex
2766	1003	5060522091899	Moss (PSVR)
2768	1003	3391891983693	J-Stars Victory VS+
2770	1003	3512899117976	Call of Cthulhu
2772	1003	5035225112905	Madden NFL 16
2774	1003	5055060945148	Dragons Dogma Dark Arisen
2776	1003	5060146466646	Hello Neighbor: Hide & Seek
2778	1003	3499550346770	Sherlock Holmes: The Devil's Daughter
2780	1003	4020628772901	Conan Exiles
2782	1003	3499550360011	TT Isle of Man
2784	1003	5055277033904	Fist of the North Star: Lost Paradise (No DLC)
2786	1003	5055277033041	Yakuza Kiwami 2
2788	1003	5055277027590	Valkyria Chronicles Remastered
2790	1003	3499550351323	WRC 6
2792	1003	5060236963895	Worms WMD (No DLC)
2794	1003	5051892210140	Walking Dead - Telltale Series: Collection
2796	1003	5055060945476	Resident Evil 7: Biohazard - Gold Edition
2798	1003	711719883159	Gravity Rush 2
2800	1003	3391891981194	Shadow Warrior
2802	1003	8718591185830	Truck Driver
2804	1003	8059617108502	Ride 3
2806	1003	3307215991053	Eagle Flight (PSVR)
2808	1003	3307215912638	Hasbro Family Fun Pack
2810	1003	4020628746421	Kingdom Come: Deliverance: Royal Edition (No DLC)
2812	1003	8023171043081	Bloodstained: Ritual of the Night
2814	1003	5016488130639	Beast Quest
2816	1003	4041417840229	Bus Simulator 2019
2818	1003	4020628815202	Valkyria Revolution
2820	1003	8059617102616	MXGP - The Official Motocross Videogame
2822	1003	4260089416536	Grand Ages: Medieval
2824	1003	5021290079465	Life Is Strange: Before The Storm
2826	1003	8059617105518	Ride 2
2828	1003	5021290071124	Star Ocean: Integrity & Faithlessness
2830	1003	711719783411	Tetris Effect
2832	1003	3499550363906	Tennis World Tour
2834	1003	4020628773915	Outward
2836	1003	5021290073142	Final Fantasy XV Deluxe Edition (2 Disc)
2838	1003	8059617106034	MXGP3 - The Official Motocross Videogame
2840	1003	3391891994279	Get Even
2842	1003	5030930116378	NHL 17
2844	1003	5060146461528	Walking Dead, The - Telltale Season 2
2846	1003	711719375272	Frantics (Playlink)
2848	1003	8059617102128	MotoGP 14
2850	1003	3307215802038	Monopoly Family Fun Pack
2852	1003	4020628852306	Now That's What I Call Sing (No Mic)
2854	1003	8717418463120	Disney Infinity 3.0 Star Wars Starter Pack
2856	1003	9312590124167	Don Bradman Cricket 17
2858	1003	5030933123427	Unravel Yarny Bundle
2860	1003	711719975663	Arizona Sunshine (PSVR)
2862	1003	5060327534867	Dead Or Alive 6
2864	1003	3307215897225	Just Dance 2016
2866	1003	8059617104634	MXGP2: The Official Motocross
2868	1003	4260089416895	Sudden Strike 4
2870	1003	8059617102722	Ride
2872	1003	5051892202800	Walking Dead - Telltale Series: The New Frontier  (Episode 1 Only)
2874	1003	3391891998161	One Piece: World Seeker
2876	1003	814290013738	Road Rage
2878	1003	3391892003635	Dark Souls Trilogy (W/O Soundtrack)
2880	1003	5051892224291	Batman Arkham Collection Steelbook Edition (No Arkham Knight DLC)
2882	1003	5060327530869	Dynasty Warriors 8 Xtreme Legends
2884	1003	5026555425223	NBA 2K Playgrounds 2
2886	1003	811949031679	Walking Dead, The: The Telltale Definitive Series
2888	1003	3307216049333	Far Cry 3 Classic Edition
2890	1003	3391891990646	Tales Of Berseria
2892	1003	5060146462730	Game of Thrones - A Telltale Games Series (Episodes 1-5 Only)
2894	1003	3499550366297	V-Rally 4
2896	1003	5030917199097	Skylanders Imaginators Starter Pack
2898	1003	5060146461108	Walking Dead, The - Telltale Season 1
2900	1003	3391891991452	Digimon World: Next Order
2902	1003	5060522094364	Angry Birds Movie 2, The - VR Under Pressure (PSVR)
2904	1003	5021290077867	Dragon Quest Heroes II
2906	1003	711719712510	Persistence, The (PSVR)
2908	1003	8059617107239	Monster Energy Supercross
2910	1003	3512899119437	Spintires: Mudrunner
2912	1003	3307216081111	Just Dance 2019
2914	1003	5055060900956	Resident Evil Revelations HD
2916	1003	5060057022191	Pure Pool
2918	1003	4020628741686	Age of Wonders: Planetfall (No DLC)
2920	1003	3499550340792	Rugby World Cup 2015
2922	1003	5060146461221	Wolf Among Us, The
2924	1003	5060528030823	Paw Patrol: On A Roll!
2926	1003	4020628823689	Killing Floor 2
2928	1003	5060522090496	Fruit Ninja VR (PSVR)
2930	1003	3391891999120	My Hero One's Justice
2932	1003	9006113009085	Warhammer: End Times - Vermintide
2934	1003	5026555421775	Tales From the Borderlands, A Telltale Game
2936	1003	8059617106690	Gravel
2938	1003	5060236968739	Rogue Trooper Redux
2940	1003	5060327531958	Dead Or Alive 5: Last Round
2942	1003	3391891994651	Naruto to Boruto: Shinobi Striker
2944	1003	3391892004212	Ni No Kuni: Wrath of the White Witch
2946	1003	3391891992039	Dark Souls III: The Fire Fades GOTY Edition
2948	1003	5060057029206	Putty Squad
2950	1003	711719857853	Super Stardust Ultra VR (PSVR)
2952	1003	3499550372397	Warhammer: Chaosbane
2954	1003	5060201659877	Aggelos
2956	1003	811949030054	Slime Rancher
2958	1003	5016488130530	Dead Alliance
2960	1003	4260089416833	Vikings - Wolves of Midgard
2962	1003	5016488132961	Mutant Year Zero: Road to Eden
2964	1003	3307216043270	South Park The Stick Of Truth
2966	1003	5060236964120	Escapists, The: Walking Dead Edition
2968	1003	3307215734575	Just Dance 2014
2970	1003	3391891987806	Sword Art Online: Hollow Realization
2972	1003	3512899112544	Bound By Flame
2974	1003	8059617103996	Sebastien Loeb Rally EVO
2976	1003	3391891996167	Sword Art Online: Fatal Bullet
2978	1003	3512899120723	Spintires: MudRunner - American Wilds Edition
2980	1003	5030917163029	Skylanders Superchargers Starter Pack
2982	1003	8059617106300	MotoGP 17
2984	1003	5026555425667	Civilization VI
2986	1003	5016488130318	Golf Club 2, The
2988	1003	5030934121576	NHL 18
2990	1003	8023171040301	Pillars of Eternity
2992	1003	711719859451	Hustle Kings VR (PSVR)
2994	1003	5060146464260	Rime
2996	1003	0711719926665	Singstar Celebration (Playlink)
2998	1003	5055277035397	Super Monkey Ball Banana Blitz HD
3000	1003	5902385104289	Torment - Tides Of Numenera
3002	1003	3499550355413	Flatout 4
3004	1003	5055060944905	Okami
3006	1003	5030917139574	Angry Birds Star Wars
3008	1003	5021290080225	Left Alive
3010	1003	5055060901335	Monster Hunter World: Iceborne
3012	1003	5060236964977	Carmageddon: Max Damage
3014	1003	5060690790112	Root Letter: Last Answer
3016	1003	3391891984157	One Piece: Pirate Warriors 3
3018	1003	4020628841782	Wasteland 2: Directors Cut
3020	1003	3307215937303	Zombi
3022	1003	3391891996532	Seven Deadly Sins: Knights Of Britannia, The
3024	1003	4020636131745	Professional Farmer 2017
3026	1003	3512899113770	Blood Bowl 2
3028	1003	8154030103773	Kung Fu Panda: Showdown of Legendary Legends
3030	1003	5055060948736	Mega Man 11
3032	1003	3512899116405	Styx: Shards of Darkness
3034	1003	8023171039060	RAID World War II
3036	1003	4012927103630	Super Bomberman R
3038	1003	8059617109363	MotoGP 19
3040	1003	5016488130066	Troll And I
3042	1003	4020628770655	Onrush
3044	1003	711719879541	Gravity Rush Remastered
3046	1003	5060528030649	Hotel Transylvania 3: Monsters Overboard
3048	1003	5060236964588	Prison Architect
3050	1003	5060236969576	Immortal: Unchained
3052	1003	9120080072658	Red Faction Guerrilla
3054	1003	5060146467421	Trover Saves The Universe
3056	1003	5060201656883	White Day: A Labyrinth Named School
3058	1003	5060201657996	Under Night In-Birth Exe: Late(st)
3060	1003	5051892213448	Scribblenauts Showdown
3062	1003	814290013714	Mark McMorris Infinite Air
3064	1003	5030941111324	Madden NFL 25
3066	1003	8023171036786	Brothers: A Tale of Two Sons
3068	1003	4020628774318	Agony
3070	1003	5060528030311	Ben 10
3072	1003	5060201655718	Guilty Gear XRD: Revelator
3074	1003	5056208800312	Genesis: Alpha One
3076	1003	811949030832	Baldur's Gate/Baldur's Gate II
3078	1003	9006113009429	Darksiders: Warmastered Edition
3080	1003	4020628834388	Deadlight: Directors Cut
3082	1003	5060327532535	Toukiden: Kiwami
3084	1003	711719801764	Uncharted 3: Drakes Deception Remastered
3086	1003	5060146462136	Back to the Future: The Game
3088	1003	9312590123924	Don Bradman Cricket
3090	1003	5060057023655	Tiny Troopers Joint Ops
3092	1003	5060528030441	Adventure Time: Pirates of The Enchiridion
3094	1003	3307216125013	Just Dance 2020
3096	1003	5060522090199	Don't Knock Twice (PSVR)
3098	1003	3391892000016	Tales of Vesperia Definitive Edition
3100	1003	5060146461825	Shovel Knight
3102	1003	711719868453	Battlezone (PSVR)
3104	1003	5030917236334	Diablo III: Eternal Collection (No DLC)
3106	1003	4260231341365	Air Conflicts - Vietnam
3108	1003	5060236967541	Aven Colony
3110	1003	3307215790991	Just Dance 2015
3112	1003	5035225123338	Sims 4 Plus Cats and Dogs Bundle, The
3114	1003	5030917147197	Skylanders Trap Team Starter Pack
3116	1003	5030936112923	NHL 16
3118	1003	8059617108151	MXGP Pro
3120	1003	5060201654292	BlazBlue Chrono Phantasma Extend
3122	1003	3512899116030	Space Hulk Deathwing Enhanced Edition
3124	1003	5060327532276	Dynasty Warriors 8 Empires
3126	1003	8023171038483	ABZU
3128	1003	9312590124204	Rugby League Live 4
3130	1003	5035225116880	NBA Live 18
3132	1003	5060146469081	Astroneer
3134	1003	9120080071835	Titan Quest
3136	1003	3391891988117	One Piece Burning Blood
3138	1003	3512899121829	Samurai Shodown
3140	1003	5056208802361	Occupation, The
3142	1003	5056208802873	My Time At Portia
3144	1003	4260458360156	Shadow Tactics: Blades of the Shogun
3146	1003	3499550330007	Rugby 15
3148	1003	8717418434564	Disney Infinity 2.0 Marvel Super Heroes Starter Pack
3150	1003	8059617105044	MotoGP 16: Valentino Rossi
3152	1003	5030932112460	Madden NFL 15
3154	1003	5056208804051	Yooka-Laylee and the Impossible Lair
3156	1003	3391891989459	God Eater 2: Rage Burst
3158	1003	3325120117504	Dino Dini's Kick Off Revival
3160	1003	3499550359626	WRC 7
3162	1003	5016488130288	Bulletstorm: Full Clip Edition (No DLC)
3164	1003	5060327534041	Blue Reflection
3166	1003	3499550375589	WRC 8
3168	1003	5060201656036	Steins;Gate Zero
3170	1003	4260563640013	Past Cure
3172	1003	4260089416512	Tropico 5: Complete Collection
3174	1003	4041417840120	Hunter, The: Call of the Wild
3176	1003	3391891989237	JoJo's Bizarre Adventure: Eyes of Heaven
3178	1003	3512899115163	Divinity Original Sin: Enhanced Edition
3180	1003	811949030313	Death's Gambit
3182	1003	3512899113039	Crimes & Punishments: Sherlock Holmes
3184	1003	5030949122483	NHL 20
3186	1003	5060528030991	Ice Age: Scrat's Nutty Adventure
3188	1003	5055856419396	Wolfenstein The New Order and The Old Blood Double Pack
3190	1003	5016488129442	Cartoon Network - Battle Crashers
3192	1003	9312590124020	Rugby Challenge 3
3194	1003	8059617107697	MotoGP 18
3196	1003	5060327531583	Warriors Orochi 3 Ultimate
3198	1003	3391892003215	God Eater 3
3200	1003	5060522090007	VR Karts (PSVR)
3202	1003	0728658047528	Rock Band 4
3204	1003	4260458360613	Shadows Awakening
3206	1003	5060327533990	Warriors All Stars
3208	1003	5060201654445	Akiba's Beat
3210	1003	5060201658566	Song Of Memories
3212	1003	5060327534508	Atelier Lydie and Suelle: The Alchemists and the Mysterious Paintings
3214	1003	711719872160	That's You (Playlink)
3216	1003	813633019437	Ys VIII: Lacrimosa of Dana
3218	1003	9006113007937	Legend of Kay Anniversary
3220	1003	3391891985772	Sword Art Online - Lost Song
3222	1003	5060540770356	Legend Of Heroes, The: Trails Of Cold Steel
3224	1003	4260089416581	Dungeons 2
3226	1003	5060522092681	Paper Dolls (PSVR)
3228	1003	5060057029343	Pinball Arcade
3230	1003	5060540770332	Legend of Heroes, The: Trails of Cold Steel II
3232	1003	5030917179679	Peanuts Movie: Snoopy's Grand Adventure
3234	1003	5060327533631	Berserk And The Band Of The Hawk
3236	1003	814290013424	Alekhine's Gun
3238	1003	5060540770035	Senran Kagura Peach Beach Splash
3240	1003	3499550363333	Warhammer 40K Inquisitor Martyr
3242	1003	5030947112509	NHL 15
3244	1003	9352522000060	AO International Tennis
3246	1003	5060522090038	Radial-G Racing Evolved (PSVR)
3248	1003	8059617103347	Moto GP 15
3250	1003	5060264373154	Dead Cells
3252	1003	5060327535352	A.O.T.2 Final Battle
3254	1003	5060327533549	Toukiden 2
3256	1003	742725911628	Atari Flashback Classics Collection Vol.2
3258	1003	853736006217	BlazBlue Central Fiction
3260	1003	8059617109813	MXGP 2019
3262	1003	4020636128929	Firefighters: Airport Fire Department
3264	1003	5060327533938	Samurai Warriors Spirit Of Sanada
3266	1003	5060327532986	Nights of Azure
3268	1003	5055377602642	Demons Age
3270	1003	5021290065703	Lara Croft and the Temple of Osiris: Gold Edition (No DLC)
3272	1003	5060201658986	Valthirian Arc: Hero School Story
3274	1003	4020628753139	YouTubers Life OMG!
3276	1003	9120080071507	MX vs ATV: All Out
3278	1003	5060522091233	Theseus (PSVR)
3280	1003	5060201656371	Root Letter
3282	1003	8023171038049	Payday 2 The Big Score
3284	1003	3391891994972	.hack//G.U. Last Recode
3286	1003	8023171040653	Inside + Limbo
3288	1003	060327534713	Warriors Orochi 4
3290	1003	3391891991254	Naruto Shippuden Ultimate Ninja Storm 4: Road to Boruto
3292	1003	8718591182495	Adam's Venture Origins
3294	1003	3307215803790	Rocksmith 2014 (With Real Tone Cable)
3296	1003	814290013691	Loading Human (PSVR)
3298	1003	3391891984034	Godzilla
3300	1003	0813633016894	Odin Sphere Leifthrasir
3302	1003	5060327534096	Nights of Azure 2
3304	1003	5060201658160	Raiden V: Director's Cut
3306	1003	5021290068650	Kingdom Hearts 3 Deluxe Edition (w/ Pin, Artbook & Steelbook)
3308	1003	5060327532849	Arslan The Warriors of Legend
3310	1003	711719841432	Journey Collectors Edition
3312	1003	5055277032631	Valkyria Chronicles 4
3314	1003	635292926754	Senran Kagura Estival Versus
3316	1003	5060236965714	Overcooked
3318	1003	5060201654636	Earth Defense Force 4.1: The Shadow of New Despair
3320	1003	3307215834114	Rocksmith 2014 (Game Only)
3322	1003	8023171041131	Assetto Corsa Ultimate Edition
3324	1003	5060236960917	Flockers
3326	1003	4020628758950	Fire Pro Wrestling World
3328	1003	884095192747	Ark Park (PSVR)
3330	1003	728658046514	Rock Band 4 Game And Guitar Bundle
3332	1003	5055277030859	Dragon's Crown Pro
3334	1003	814290013448	Lichdom - Battlemage
3336	1003	5060327532795	Samurai Warriors 4 II
3338	1003	5016488131353	Euro Fishing
3340	1003	4260458361061	Tropico 6 (No DLC)
3342	1003	8059617108915	Monster Energy Supercross 2
3344	1003	4020628845438	Broken Sword 5: The Serpent's Curse
3346	1003	5021290080430	Secret of Mana
3348	1003	3391891993227	Accel World VS Sword Art Online
3350	1003	4020628761592	Bard's Tale IV, The - Director's Cut
3352	1003	5060522092957	Ghost Giants (PSVR)
3354	1003	4260252080601	Pillars Of The Earth, The
3356	1003	3307215887240	Watch Dogs Complete Edition
3358	1003	3391891996402	Naruto Ultimate Ninja Storm Trilogy
3360	1003	8402862060635	Anima: Gate of Memories
3362	1003	813633019758	Demon Gaze II/2
3364	1003	4020628743772	Redeemer Enhanced Edition
3366	1003	711719816348	Helldivers
3368	1003	0813633014937	Akiba's Trip Undead & Undressed
3370	1003	813633016542	Republique
3372	1003	711719920304	Everybody's Golf (PSVR)
3374	1003	5060188670254	Town of Light, The
3376	1003	3391892002485	Tokyo Ghoul :re [CALL to EXIST]
3378	1003	5060188670087	Super Dungeon Bros
3380	1003	5060057024126	Constructor
3382	1003	4260089417281	Valhalla Hills
3384	1003	711719872351	Here They Lie (PSVR)
3386	1003	3307216084020	Legendary Fishing
3388	1003	5060522090878	Time Carnage (PSVR)
3390	1003	5016488133647	Zombieland: Double Tap
3392	1003	9120080074942	Monkey King: Hero Is Back
3394	1003	711719800163	Uncharted 2: Among Thieves Remastered
3396	1003	5060522090731	American Dream, The (PSVR)
3398	1003	5060188670858	Shaq Fu - A Legend Reborn
3400	1003	8023171041322	Banner Saga Trilogy, The
3402	1003	5060540770141	Fate/Extella Link
3404	1003	711719832669	StarBlood Arena (PSVR)
3406	1003	5060201659839	Nippon Marathon
3408	1003	5060201659921	Kill La Kill IF
3410	1003	4260458360583	Railway Empire
3412	1003	5060327533037	Samurai Warriors 4 Empires
3414	1003	5060201657149	Guilty Gear Xrd Rev 2
3416	1003	9120080073754	Fade To Silence
3418	1003	5060327532719	Deception IV: The Nightmare Princess
3420	1003	5060264374557	Frostpunk
3422	1003	4260401950823	Super Street: The Game
3424	1003	5021290086074	Life Is Strange 2
3426	1003	5060201654520	Aegis of Earth: Protonovus Assault
3428	1003	853736006309	Zero Escape: The Nonary Games
3430	1003	810023030478	Witch and the Hundred Knight 2, The
3432	1003	5060522091691	Operation Warcade (PSVR)
3434	1003	5060264371020	Slain: Back From Hell
3436	1003	9006113008996	Dwarves, The
3438	1003	5060146465960	Mutant Football League
3440	1003	5055277034000	Persona 3: Dancing In Moonlight
3442	1003	5055856422426	Wolfenstein Cyberpilot (PSVR)
3444	1003	5060690790679	Dusk Diver
3446	1003	4260252080519	Silence
3448	1003	5056280410126	Crystar
3450	1003	3760156480213	Agatha Christie - The ABC Murders
3452	1003	3760156480862	Syberia 3
3454	1003	5060201656814	Chaos Child
3456	1003	5055277034024	Persona 5: Dancing In Starlight
3458	1003	5060264371211	Ping Pong (PSVR)
3460	1003	5055277031047	Shining Resonance Refrain
3462	1003	5060528031776	Dragons: Dawn of New Riders
3464	1003	5060201659297	Our World is Ended
3466	1003	4012927104118	Zone of the Enders - The 2nd Runner
3468	1003	4020628824877	Now That's What I Call Sing 2 (No Mic)
3470	1003	3499550356670	Outcast: Second Contact
3472	1003	5060264371396	Yonder: The Cloud Catcher Chronicles
3474	1003	4260089416772	Air Conflicts: Pacific Carriers
3476	1003	711719957409	Death Stranding Collector's Edition w/ BB Pod, Key Ring, Case, Steelbook
3478	1003	3391891994736	Gundam Versus
3480	1003	4260252080984	State Of Mind
3482	1003	5030917199349	Skylanders Imaginators Dark Edition Starter Pack
3484	1003	8718591182105	Ether One
3486	1003	813633019031	Danganronpa V3: Killing Harmony
3488	1003	4020628769659	Surviving Mars
3490	1003	3760156483016	Fort Boyard
3492	1003	813633019284	Touhou Kobuto V: Burst Battle
3494	1003	8023171039336	Redout (No DLC)
3496	1003	5016488130233	ArmaGallant: Decks of Destiny
3498	1003	4260089417335	Dungeons III
3500	1003	9312590123962	Rugby League Live 3
3502	1003	4020628816391	Dreamfall Chapters
3504	1003	5060201657514	Cat Quest
3506	1003	711719768616	Chimparty (Playlink)
3508	1003	5060146463935	Marvel Pinball
3510	1003	8718591182822	Among The Sleep
3512	1003	9120080071743	Raven, The
3514	1003	4020628758820	428: Shibuya Scramble
3516	1003	9120080070883	Rad Rodgers: World One
3518	1003	4020636132261	Forestry 2017 - The Simulation
3520	1003	4020628740887	Leisure Suit Larry: Wet Dreams Don't Dry
3522	1003	5060264370863	Aragami
3524	1003	5055377603496	Everspace - Stellar Edition
3526	1003	5060327535512	Atelier Ryza: Ever Darkness & The Secret Hideout
3528	1003	5060201658900	All-Star Fruit Racing
3530	1003	4260089417250	Air Conflicts - Double Pack
3532	1003	5060327533198	Atelier Sophie: The Alchemist Of The Mysterious Book
3534	1003	4020636133206	Industry Giant 2
3536	1003	4260458361245	Project Highrise
3538	1003	3391891999540	11-11 Memories Retold
3540	1003	5902385106177	Pure Farming 2018
3542	1003	0859204005997	Cyberdimension Neptunia: 4 Goddesses Online
3544	1003	5060522090342	Assembly, The (No Perfect) (PSVR)
3546	1003	4020628838362	Goat Simulator: The Bundle
3548	1003	5060236968135	Mothergunship
3550	1003	5060102954811	SteamWorld Dig 2
3552	1003	0642968659076	Nitroplus Blasterz: Heroines Infinite Duel
3554	1003	5060146465618	Earthfall
3556	1003	3512899120112	Space Hulk Tactics
3558	1003	9120080072320	This Is The Police 2
3560	1003	5030942112467	NBA Live 15
3562	1003	8402862060628	Dex
3564	1003	711719814757	No Man's Sky - Limited Ed. W/Steelbook, Comic, Book
3566	1003	9120080070029	This Is the Police
3568	1003	8718591182419	Ziggurat
3570	1003	5060327533785	Atelier Firis: The Alchemist and the Mysterious Journey
3572	1003	5030940111332	NBA Live 14
3574	1003	8402862060703	Dead Synchronicity: Tomorrow Comes Today
3576	1003	813633018898	Danganronpa Another Episode: Ultra Despair Girls
3578	1003	5060522090410	Ultimate VR Collection (PSVR)
3580	1003	5060188670759	GRIP
3582	1003	5060327531712	Samurai Warriors 4
3584	1003	4260252080816	Chaos on Deponia
3586	1003	3760156480596	Moto Racer 4 (PSVR)
3588	1003	742725911604	Atari Flashback Classics Collection Vol.1
3590	1003	5060201658696	Blazblue Cross Tag Battle
3592	1003	9120080071187	Black Mirror
3594	1003	5060057023396	Pure Hold'em World Poker Championship
3596	1003	5060102954446	Lumo
3598	1003	9006113009207	Battle Chasers Nightwar
3600	1003	3499550374537	Fia European Truck Racing Championship
3602	1003	3391891997997	Black Clover Quartet Knights
3604	1003	813633015583	Disgaea 5: Alliance of Vengeance
3606	1003	4020628811587	Utawarerumono: Mask of Truth
3608	1003	9006113007890	Arcania: The Complete Tale
3610	1003	5060264371174	Unbox: Newbies Adventure
3612	1003	711719803362	Uncharted: Drakes Fortune Remastered
3614	1003	859292000416	Home Sweet Home
3616	1003	3307215984239	Far Cry Primal & Far Cry 4
3618	1003	9120080070531	Sine Mora EX
3620	1003	5016488131995	Override
3622	1003	813633018317	Danganronpa 1-2 Reload
3624	1003	813633017440	Grand Kingdom
3626	1003	5060201655480	Gal Gun Double Peace
3628	1003	5060188670636	Max The Curse of Brotherhood
3630	1003	3499550377316	Bee Simulator
3632	1003	9006113009979	Baja: Edge of Control HD
3634	1003	3760156482484	Asterix & Obelix XXL2
3636	1003	810023030799	Labyrinth of Refrain: Coven of Dusk
3638	1003	3499550348675	Voice, The (No Mic)
3640	1003	3307216064039	Starlink: Battle For Atlas Starter Pack
3642	1003	635131948312	Fate/Extella: The Umbral Star
3644	1003	3307216016618	Far Cry 5, The Father Edition (Figure/Soundtrack/World Map/Steelbook)
3646	1003	5026555426657	WWE 2K20 Smackdown! Ed (Ring Skirt, Plaque) No DLC
3648	1003	5060201659068	Punch Line
3650	1003	5060522091394	Blind (PSVR)
3652	1003	4020636129131	Professional Construction: The Simulation
3654	1003	4260252080502	Deponia
3656	1003	4020628753351	Killing Floor Double Feature (PSVR)
3658	1003	4020628774691	Dakar 18
3660	1003	4020636131714	Pineview Drive
3662	1003	5060522093138	Squishies (PSVR)
3664	1003	5060146464055	ATV Renegades
3666	1003	810023032267	Caligula Effect, The: Overdose
3668	1003	5060522092094	Smash Hit Plunder (PSVR)
3670	1003	5060327533242	Romance of The Three Kingdoms XIII
3672	1003	3391891985451	T.A.L.O.S Principle
3674	1003	3307215715512	Assassin's Creed IV: Black Flag Skull Ed
3676	1003	3760156482743	Flashback
3678	1003	3760156481906	ATV Drift and Tricks
3680	1003	5060188671497	Close To The Sun
3682	1003	5060522093671	Ultrawings (PSVR)
3684	1003	4020628831042	Mount and Blade: Warband
3686	1003	5060522093046	Wizards, The (PSVR)
3688	1003	884095191603	PixArk
3690	1003	5016488134422	Train Sim World 2020 Collector's Edition
3692	1003	5060102954965	Harvest Moon Light of Hope
3694	1003	5060327535017	Nelke & the Legendary Alchemists: Ateliers of the New World
3696	1003	813633015729	Onechanbara Z2: Chaos
3698	1003	5060522091790	Apex Construct (PSVR)
3700	1003	5016488132671	Trine 4: The Nightmare Prince
3702	1003	5060327532405	Bladestorm: Nightmare
3704	1003	5060201658269	Gal Gun 2
3706	1003	711719866749	Uncharted 4: Libertalia CE (Statue + Artbook + Steel Case)
3708	1003	5016488129688	Monster Jam - Crush It
3710	1003	4020628846206	Risen 3 - Titan Lords
3712	1003	5060201657460	Shantae: Half-Genie Hero
3714	1003	5060522092865	Sairento VR (PSVR)
3716	1003	9006113008088	Book of Unwritten Tales 2, The
3718	1003	8718591181238	Teslagrad
3720	1003	5055277034239	Persona 3 & 5: Endless Night Collection (No DLC)
3722	1003	4020628753801	Steins;Gate Elite
3724	1003	8718591183041	Earthlock - Festival of Magic
3726	1003	5016488131018	Rapala Fishing Pro Series
3728	1003	3499550330335	Motorcycle Club
3730	1003	5021290063525	Murdered: Soul Suspect Limited Edition
3732	1003	4020628772604	Dead Island Definitive Collection: Slaughter Pack (W/ Figurine/Weapon/Post
3734	1003	9006113008569	Battle Worlds: Kronos
3736	1003	5055377602512	Warhammer 40,000: Deathwatch
3738	1003	5060528031271	Crayola Scoot
3740	1003	3307216146018	Assassin's Creed Origins + Odyssey Double Pack (No DLC)
3742	1003	3307216134879	Far Cry 4 + Far Cry 5 (2 Discs)
3744	1003	5060112432729	Dragon Star Varnir
3746	1003	8023171043319	Indivisible
3748	1003	8718591187032	Remothered: Tormented Fathers
3750	1003	813633018065	Touhou Genso Wanderer
3752	1003	5060264372287	Wonder Boy: The Dragon's Trap
3754	1003	5060528031998	Ugly Dolls: An Imperfect Adventure
3756	1003	5051892222266	LEGO Movie 1 & 2 Double Pack, The
3758	1003	5060327532740	Nobunaga's Ambition
3760	1003	5060057029909	Pinball Arcade Season 2
3762	1003	3391891996341	One Piece Unlimited World Red Deluxe
3764	1003	5060264373383	Truberbrook
3766	1003	5060146467216	Hollow Knight
3768	1003	4020628852290	Now That's What I Call Sing + Microphone
3770	1003	5060102954347	Zombie Vikings: Ragnarok Edition
3772	1003	859204005508	Fairy Fencer F: Advent Dark Force
3774	1003	8402862060611	Zenith
3776	1003	5030934121712	NBA Live 16
3778	1003	8023171043654	Warhammer: Vermintide 2 (No DLC)
3780	1003	4020628821951	Persona 5 - Take Your Heart Edition W/Bag, Plush, Book, CD & Steelbook
3782	1003	3760156481302	Yesterday Origins
3784	1003	4020628826512	King Of Fighters XIV
3786	1003	5906395575015	Kholat
3788	1003	8718591185595	Owlboy
3790	1003	4020636131691	Joe's Diner
3792	1003	5060188671619	Pool Nation
3794	1003	5056208800015	Yoku's Island Express
3796	1003	5030917132681	Skylanders Swap Force Starter Pack
3798	1003	853736006422	Zero Time Dilemma
3800	1003	3307216110644	Space Junkies (PSVR)
3802	1003	8436566140355	Axiom Verge
3804	1003	4260458360699	Inner World, The: The Last Windmonk
3806	1003	5060264373505	For The King
3808	1003	5060540770103	Senran Kagura Burst Re:Newel
3810	1003	5055856406556	Fallout 4 Pip-Boy Editon
3812	1003	5060201657224	Rabi Ribi
3814	1003	5060264371532	Binding of Isaac, The: Afterbirth+
3816	1003	4020628847487	Mighty No 9
3818	1003	4020628747787	Shenmue III Collector's Ed. (w/ Light Box, Mirror, Patches) No DLC
3820	1003	5060201659518	Kotodama: The 7 Mysteries of Fujisawa
3822	1003	5060522092490	Torn (PSVR)
3824	1003	4020628811723	Utawarerumono: Mask Of Deception
3826	1003	3499550370027	Council, The
3828	1003	5060327535253	Atelier Lulua: The Scion of Arland
3830	1003	9120080074041	Monster Jam Steel Titans
3832	1003	5060188670667	Surf World Series
3834	1003	3760156483344	Blacksad: Under the Skin
3836	1003	4020628843915	Golf Club Collector's Edition
3838	1003	5055377602963	Vegas Party
3840	1003	4020628817121	Puyo Puyo Tetris
3842	1003	3307215719572	Watch Dogs DEDSEC Edition
3844	1003	5021290079120	Lost Sphear
3846	1003	4020636136177	Airport Simulator 2019
3848	1003	5060540770226	Gungrave (PSVR)
3850	1003	5055377603366	Crash Dummy
3852	1003	4012927104736	Contra: Rogue Corps
3854	1003	5056280410195	Conception Plus: Maiden Of The Twelve Stars
3856	1003	3307215863091	Division, The: Sleeper Agent Ed. (Watch+Armband+Artbook) No DLC
3858	1003	5056208805621	Escapists, The + Escapist 2, The
3860	1003	9120080073136	Hunter, The: Call Of The Wild 2019 Edition
3862	1003	5055856421269	Fallout 76 Power Armor Ed. (No DLC) w/ Helmet, Bag, 24 Figures & Map
3864	1003	653341125910	Has Been Heroes
3866	1003	5030917258312	Sekiro: Shadows Die Twice (No DLC) Coll Ed. W/Statue,Map,3 Coins,Book
3868	1003	0810023033318	Legend of Heroes, The - Trails of Cold Steel III
3870	1003	5060102955436	R.I.C.O.
3872	1003	8436566140560	Velocity 2X
3874	1003	3391891992473	Little Nightmares Six Edition (Figure + CD)
3876	1003	711719771913	Knowledge is Power: Decades (Playlink)
3878	1003	5060522092193	Downward Spiral: Horus Station (PSVR)
3880	1003	5060264370733	Super Meatboy
3882	1003	8436566140447	Sexy Brutale
3884	1003	4020636133244	Transport Giant
3886	1003	813633019611	Yomawari: Midnight Shadows
3888	1003	5060188671350	Wordhunters (Playlink)
3890	1003	5060146463195	Jackbox Games Party Pack: Volume 1
3892	1003	5016488131902	Fishing Sim World
3894	1003	5056208805843	Overcooked/ Overcooked 2
3896	1003	3512899114890	Tour De France 2015
3898	1003	5055377602840	Quar Infernal Machines (PSVR)
3900	1003	653341122513	De-Formers
3902	1003	810023031369	Metal Max Xeno
3904	1003	3512899112841	Tour De France 2014
3906	1003	4020628748999	Zanki Zero - Last Beginning
3908	1003	5026555422338	Mafia III Collector's Ed (Includes Vinyls+Dog Tags)
3910	1003	5060188670377	Victor Vran: Overkill Edition
3912	1003	5016488133821	Street Outlaws: The List
3914	1003	9120080070197	Lock's Quest
3916	1003	5060112432682	Code: Realize Wintertide Miracles
3918	1003	4012927100240	Metal Gear Solid V: The Phantom Pain Collectors Edition
3920	1003	3307216017202	Assassin's Creed Origins Gods Edition (Statue+Book+OST) (No DLC)
3922	1003	5060057022139	Pure Chess
3924	1003	4020628841560	This War Of Mine: The Little Ones
3926	1003	4020636136405	Another Sight
3928	1003	9120080072054	De Blob 2
3930	1003	742725911772	Tempest 4000
3932	1003	5056280410157	AI: The Somnium Files
3934	1003	5060146469227	World Of Warships: Legends
3936	1003	711719987598	Days Gone Col. Ed. W/ Statue,Steelbook,Patch,6x Pin,CD & Artbook (No DLC)
3938	1003	884095196097	Citadel: Forged with Fire
3940	1003	5060522092773	Unearthing Mars 2: The Ancient War (PSVR)
3942	1003	4260252081448	Deponia Collection
3944	1003	859204005294	Megadimension Neptunia VII
3946	1003	3499550355635	2Dark
3948	1003	3512899115798	Tour de France 2016
3950	1003	9006113009306	We Sing
3952	1003	8717418445010	Disney Infinity 2.0 Toy Box Combo Starter Pack
3954	1003	4020636128899	Firefighters - The Simulation
3956	1003	8718591183874	Real Farm (2017)
3958	1003	5021290073340	Final Fantasy XV - Ultimate Ed W/Noctis Figure, Book & Steelbooks (4 Disc)
3960	1003	5060112432385	Death Mark
3962	1003	813633016320	Witch & The Hundred Knight, The - Revival Edition
3964	1003	5030917174216	Call Of Duty Black Ops III Juggernog Edition
3966	1003	5060264373468	Bomber Crew
3968	1003	8718591185533	Blackhole Complete Edition
3970	1003	8718591184048	Aerea
3972	1003	4260252080748	AER: Memories Of Old
3974	1003	813633018454	God Wars Future Past
3976	1003	9120080070692	Elex Collector's Edition (Fig+Map+Amulet+Soundtrack+Art Book)
3978	1003	5021290078086	Final Fantasy XII The Zodiac Age - Collector's Edition
3980	1003	3499550356243	Hunting Simulator
3982	1003	3307216094906	Division 2, The: Dark Zone Ed. (No DLC) W/Figure, CD, Book, Map
3984	1003	3760156483771	Garfield Kart Furious Racing
3986	1003	5060522093220	Honor And Duty - All Out War Edition (No DLC)
3988	1003	5060528031455	Steven Universe Save The Light & OK K.O.! Lets Play Heroes
3990	1003	0853736006514	School Girl Zombie Hunter
3992	1003	711719862963	Matterfall
3994	1003	3499550369724	Pro Fishing Simulator
3996	1003	3760156484129	Off Road Racing
3998	1003	5060264373840	Northgard
4000	1003	5060264378524	Valfaris
4002	1003	3499550383270	Unicorn Princess, The
4004	1003	3307215971611	South Park: The Fractured But Whole CE W/Figurine + Cards (No DLC)
4006	1003	711719829164	Horizon: Zero Dawn Collectors Edition w/ Statue & Artbook
4008	1003	4260089417151	Blackguards 2
4010	1003	4020636133411	Professional Farmer: American Dream
4012	1003	859204005782	Dark Rose Valkyrie
4014	1003	4020628852283	Now That's What I Call Sing + 2 Microphones
4016	1003	5060690790235	Raging Loop (No Book)
4018	1003	5060201659433	World End Syndrome + Art Book
4020	1003	8718591183423	World to the West
4022	1003	5055277032709	Valkyria Chronicles 4: Premium Ed W/Statue and Artbook (No DLC)
4024	1003	3391892001716	Dragon Ball FighterZ/Dragon Ball Xenoverse 2
4026	1003	5060264374014	Stranded Sails: Explorers Of The Cursed Islands
4028	1003	5055957701277	Shoppe Keep
4030	1003	5030917133312	Call Of Duty: Ghosts Prestige Edition (W/Camera)
4032	1003	5060112432781	Date A Live: Rio Reincarnation (No DLC)
4034	1003	5055856421832	Rage 2 Collector's Edition (No DLC) W/Talking Head, Poster & Steelbook
4036	1003	5060264372928	Candle: The Power of the Flame
4038	1003	3307215790489	Far Cry 4 Kyrat Edition
4040	1003	5060112432224	Super Neptunia RPG
4042	1003	3391891984911	Saint Seiya: Soldiers' Soul
4044	1003	4020628742188	Let's Sing 2020 (No Mic)
4046	1003	5021290074576	Nier Automata Black Box Ed. w/ Figurine, Artbook & Soundtrack (No DLC)
4048	1003	5060201659884	AeternoBlade II
4050	1003	8023171042015	Don't Starve Mega Pack
4052	1003	0859204005096	Omega Quintet
4054	1003	5055377602499	Space Hulk
4056	1003	3307215809310	Rabbids Invasion
4058	1003	5055856417132	Wolfenstein II The New Colossus Coll Edition(Statue+SteelBook+Jacket+Guns)
4060	1003	5055377602581	Syndrome
4062	1003	8402862060673	Olli Olli 2: Welcome to Olliwood
4064	1003	5055856410997	Dishonored 2 CE W/ Corvo Mask & Ring (No DLC)
4066	1003	4260401950311	Air Conflicts: Secret Wars Ultimate Edition
4068	1003	3391891995436	Dragon Ball: FighterZ Col. Ed (Game+Steelbook+Goku Statue+3x Art Boards)
4070	1003	5060102955320	Little Dragons Cafe
4072	1003	3770011615391	Gekido Kintaro's Revenge
4074	1003	8718591183591	Dollhouse
4076	1003	8718591181450	Giana Sisters: Twisted Dreams Directors Cut
4078	1003	5060327533686	Nobunaga's Ambition: Sphere of Influence - Ascension
4080	1003	3307215938256	Just Sing
4082	1003	8718591183034	N.E.R.O: Nothing Ever Remains Obscure
4084	1003	5051892213912	Middle-Earth: Shadow of War Definitive Edition (2 Disc)
4086	1003	3391891998710	New Gundam Breaker
4088	1003	5060102954309	Kromaia Omega
4090	1003	5060264372003	Darkest Dungeon
4092	1003	5030917285424	Call of Duty: Modern Warfare (2019) Dark Ed (Goggles, Stand) No DLC
4094	1003	8718591185021	8-Bit Armies
4096	1003	5026555422673	WWE 2K17 NXT Ed w/Figurine, Lithograph, Cards (No DLC)
4098	1003	711719402572	Spider-Man (2018) Col. Ed. - Steelbook/Sticker/Statue/Artbook (No DLC)
4100	1003	8718591184741	Tricky Towers
4102	1003	5060264372416	Moonlighter
4104	1003	3307215968253	Watch Dogs 2 San Francisco Edition (With Statue & Lithographs)
4106	1003	5051892187701	Mortal Kombat X Kollectors Edition (No DLC)
4108	1003	0711719371779	God Of War Collectors Edition (2018) No DLC
4110	1003	5021290000315	Final Fantasy Type-0 HD - Collector's Edition
4112	1003	4020636132766	Realms of Arkania
4114	1003	810023033141	SNK 40th Anniversary Collection
4116	1003	5390102520892	3D Mini Golf
4118	1003	4020628764807	Lets Sing 2019 (Game Only)
4120	1003	5060102954613	88 Heroes
4122	1003	5060102954576	Steamworld Collection
4298	1003	5051892199407	Batman: Return To Arkham
4124	1003	3307215893678	Assassin's Creed Syndicate - Charing Cross Ed. W/Statue
4126	1003	5021290071674	Deus Ex: Mankind Divided Col. Ed. (Figure+Art/Steelbook)
4128	1003	5055060949214	Resident Evil 2 CE w/ Steelbook,Statue,Keys,Artbk,Poster,Pin,OST (No DLC)
4130	1003	8023171038728	Don't Starve
4132	1003	8436566141550	Anima Gate of Memories: The Nameless Chronicles (w/ OST)
4134	1003	3391891996679	Code Vein Collector's Edition w/ Figure (No DLC)
4136	1003	8718591181221	Awesomenauts Assemble
4138	1003	5026555297240	Borderlands: The Handsome Collection Gentleman Claptrap Edition
4140	1003	3760156483634	Asterix & Obelix XXL 3: The Crystal Menhir
4142	1003	5060522094036	Crazy Machines VR (PSVR)
4144	1003	5026555292962	Borderlands 3 Chest Ed. w/10x Figs, 4xKeychains, Ship, Map &Litho (No DLC)
4146	1003	0810023033851	Alliance Alive HD
4148	1003	4020628756499	Bridge Constructor Compilation
4150	1003	9120080072467	Jagged Alliance Rage
4152	1003	3499550379662	Fisherman: Fishing Planet, The
4154	1003	5056280410089	Horizon Chase Turbo
4156	1003	3499550341355	Handball 16
4158	1003	5060102955122	Harvest Moon Light of Hope Collector's Ed. (mug+bag+pin badges+Barn Case)
4160	1003	4020628832063	Homefront Revolution Goliath Edition W/Drone & Book
4162	1003	3391892001754	Dragon Ball Xenoverse And Dragon Ball Xenoverse 2 (2 Discs)
4164	1003	5021290069848	Just Cause 3 - Collector's Edition W/Grappling Hook
4166	1003	5055856419808	Elder Scrolls Online Summerset Collector's Edition (Statue+Steelbk+Artbk)
4168	1003	9120080071972	Titan Quest: Collector's Edition (With Replica Helmet & Notebook)
4170	1003	3391892000009	Tales Of Vesperia Premium Ed. 4 CDs/Artbook/Artcards/4 Pins/Steelbook
4172	1003	8718591181573	Tower of Guns
4174	1003	3391891997676	Soul Calibur VI Collector's Edition (Figure)
4176	1003	4020636133138	Realms of Arkania: Startrail
4178	1003	5060201659778	Songbird Symphony
4180	1003	813633018959	Silver Case, The
4182	1003	9312590124303	Phar Lap Horse Racing Challenge
4184	1003	4009750550854	Pilot Sports
4186	1003	5060327534669	Nobunaga's Ambition: Taishi
4188	1003	5390102521219	Panda Hero
4190	1003	5060522093947	Quivr (PSVR)
4192	1003	0813633017259	Psycho-Pass: Mandatory Happiness
4194	1003	4020628783860	Lets Sing 2018 (Game Only)
4196	1003	5051892188616	Mortal Kombat X - Kollector's Edition By Coarse (No DLC)
4198	1003	4260558699132	Ninja Saviors,The: Return Of The Warriors
4200	1003	0819245020069	Megadimension Neptunia VIIR
4202	1003	3499550370140	My Little Riding Champion
4204	1003	5026555284301	WWE 2K15 - Hulkamania Edition (Art Card/Ring Canvas/Figure)
4206	1003	8436566140379	Vostok Inc
4208	1003	9006113009337	We Sing + 2 Microphone
4210	1003	5056208805409	Worms Battlegrounds + Worms WMD
4212	1003	3391891978750	Witcher 3: Wild Hunt Collector's Edition
4214	1003	5056280410034	Will : A Wonderful World
4216	1003	711719863458	World Of Warriors
4218	1003	711719256892	Infamous: Second Son Special Edition
4220	1003	8437015294049	Yasai Ninja
4222	1003	5030917199547	Skylanders Imaginators Crash Bandicoot Starter Pack
4224	1003	8718591182341	Toki Tori 2+
4226	1003	5060188671428	Just Deal With It (Playlink)
4228	1003	5030917171697	Skylanders Superchargers Dark Edition Starter Pack
4230	1003	810023030119	Lost Child, The
4232	1003	5055856400745	Elder Scrolls Online Imperial Edition (Statue+Book)
4234	1003	8402862060697	Ginger: Beyond the Crystal
4236	1003	8402862060666	OlliOlli: Epic Combo Edition
4238	1003	3499550375251	Tour De France 2019
4240	1003	5060102954422	Assault Suit Leynos
4242	1003	9120080073686	Aces Of The Luftwaffe: Squadron (No DLC)
4244	1003	813633018386	Birthdays The Beginning
4246	1003	711719814214	Order 1886, The: Blackwater Edition
4248	1003	3307216066781	Assassin's Creed Odyssey Medusa Ed. (W/Statue, Artbook, Map & OST)(No DLC)
4250	1003	8402862060659	Heart & Slash
4252	1003	0810023031673	Disgaea 1 Complete
4254	1003	3391891990974	Tekken 7 (No DLC) Collector's Ed. W/ Kazuya & Heihachi Figurine/Steelbook
4256	1003	5060112432163	Death end re;Quest
4258	1003	5021290085466	Oninaki
4260	1003	8718591181511	Last Tinker City Of Colors
4262	1003	3391891994682	Ni No Kuni II (No DLC) Kings Ed. (w/ Music Box, Vinyl, Art Book)
4264	1003	3391891994477	Naruto Shippuden: Ultimate Ninja Storm Legacy
4266	1003	811949031112	Planescape: Torment & Icewind Dale Enhanced Edition
4268	1003	5060522094302	Golem (PSVR)
4270	1003	5055377602505	Space Hulk Ascension
4272	1003	813633017686	Touhou Genso Rondo: Bullet Ballet
4274	1003	8718591186561	Xenon Racer
4276	1003	5055377603380	My Riding Stables - Life with Horses
4278	1003	859292000386	Heavy Fire Red Shadow (PSVR)
4280	1003	5055856409144	Doom (2016) Collector's Ed. W/ Statue
4282	1003	5060264372225	Long Reach, The
4284	1003	8437020062015	Ancestors Legacy: Conqueror's Edition (OST/ Art Book)
4286	1003	3391891993722	Project Cars 2 Collectors Edition (No DLC) w/ Car, Art Book, Vip Pass
4288	1003	5050013410292	Gran Turismo Sport Collector's Ed. W/Car, Artbook + Steelbook (No DLC)
4290	1003	9120080071033	We Sing Pop (Game Only)
4292	1003	5016488131063	Deer Hunter Reloaded
4294	1003	5016488132466	Trine The Ultimate Collection
4296	1003	711719926665	Sony SingStar Celebration
4300	1003	5060236966070	Worms WMD (No DLC)
4302	1003	8718591185366	8-Bit Invaders
4304	1003	9120080073372	8 To Glory
4306	1003	810023030331	25th Ward, The: The Silver Case
4308	1003	8718591185199	8-Bit Hordes
4310	1003	636676492193	Skullgirls: 2nd Encore (Game Only)
4312	1003	0813633017112	Odin Sphere Leifthrasir: Storybook Ed. Art Book/Print, T-Shirt, Metal Case
4314	1003	3391891990691	Tales Of Berseria CE W/ Art Book + Chibi Figures + Coins Set
4316	1003	5026555423687	WWE 2K18 Cena (Nuff) Edition W/Figure & Plaque
4318	1003	5016488129626	Big Buck Hunter Arcade
4320	1003	5051892216456	Hitman 2 Collectors Edition (No DLC) w/ Case, Keyring, Rubber Duck & Coin
4322	1003	8059617105471	Ducati 90th Anniversary
4324	1003	0711719841555	Last Guardian, The: Collectors Ed. (W/Statue + Artbook)
4326	1003	4020636129018	Firefighters - Plant Fire Department
4328	1003	3307215719497	Watch Dogs Vigilante Edition With Cap&Mask
4330	1003	5026555421621	WWE 2K16 SE W/Pop Figure (No DLC)
4332	1003	5060522093763	CoolPaintr VR (PSVR)
4334	1003	5026555425087	WWE 2K19 - Edition WOOOOO! (No DLC) W/Funko POP, Ring & Plaque
4336	1003	5060327533440	A.O.T: Wings Of Freedom Treasure Box (Artbook/OST/Towel/Badges)
4338	1003	3391891985307	Tales Of Zestiria Collectors Ed. (Four Chibi Figures + DVD + CD+ Artbook)
4340	1003	5026555421164	Evolve: Special Edition
4342	1003	853736006538	Code: Realize Bouquet of Rainbows
4344	1003	5056280410164	Ai: The Somnium Files Special Agent Ed (Artbook/Stand/OST)
4346	1003	5055957701529	Circuit Breakers
4348	1003	813633018645	Cladun Returns
4350	1003	3307216062172	Assassin's Creed Odyssey Spartan Ed. (W/Statue,Book,Print,Map&OST)(No DLC)
4352	1003	636676491905	Dear Esther: Landmark Edition
4354	1003	4009750551134	Bayala - The Game
4356	1003	3391891986991	Dark Souls III: Collector's Ed (Statue+Patches+Artbook+Map+CD)
4358	1003	8718591184857	Armello
4360	1003	9120080071460	De Blob
4362	1003	3307215715673	Assassin's Creed IV: Black Flag B.E
4364	1003	0884095178215	ARK: Survival Evolved - Collector's Ed (W/Map, Journal, Necklace)
4366	1003	9120080072955	Darksiders III Collector's Edi (No DLC) Fig+Steelbook+Artbook+Soundtrack
4368	1003	5060264373529	Children Of Morta
4370	1003	5030917257339	Call Of Duty: Black Ops 4 - Mystery Box Ed. (SEALED ONLY)
4372	1003	4020628769376	Conan Exiles: Collector's Edition (Figurine,Comic,OST,ArtBook,World Map)
4374	1003	3307215715819	Assassin's Creed IV: Black Flag Chest Ed
4376	1003	5060264371457	Count Lucanor, The
4378	1003	3391891992961	Ace Combat 7: Skies Unknown Strangereal Ed (Figure/Art Book/Pin/Patch)
4380	1003	3307216021674	AC Origins Dawn Of Creed Ed. (Statue+Book+CD+Amulet+Cards+Map)
4382	1003	5060264372737	Brawlout
4384	1003	5055377603007	Chicken Range
4386	1003	5060522094722	Box VR (PSVR)
4388	1003	3307215791967	Assassin's Creed Unity - Notre Dame Edition W/Figure
4390	1003	810023033646	Destiny Connect Tick-Tock Travellers
4392	1003	3770011615346	Jack Quest: The Tale of the Sword
4394	1003	3770011615124	Ice Cream Surfer
4396	1003	8431305026495	Drawfighters (No DLC)
4398	1003	4009750550830	Fimbul
4400	1003	636676491417	Dragon Fantasy: The Black Tome of Ice
4402	1003	8718591184550	Girl and the Robot, The
4404	1003	4020628813024	Kingdom Come Deliverance: Collectors Ed. (Statue+Map+Artbook+CD+Tin Box)
4406	1003	3391891990226	Dragonball Xenoverse 2 Collector's Edition (Goku Figure + Guide)
4408	1003	5060102955528	Harvest Moon: Light of Hope Complete Edition
4410	1003	3391891980623	Dragonball Xenoverse: Trunks Travel Edition
4412	1003	3499550351583	Handball 2017
4414	1003	5060102954460	Earth's Dawn
4416	1003	5060102955566	Harvest Moon: Mad Dash
4418	1003	635131948459	FATE/Extella: The Umbral Star
4420	1003	8436566141680	Distrust
4422	1003	5055377603403	Grave Danger
4424	1003	3391892000443	Jump Force Collector's Ed. w/ Diorama, Art Boards & Steelbook (No DLC)
4426	1003	0040232872839	Dragon Age: Inquisition Collector's Edition
4428	1003	853736006118	Exist Archive: Other Side of Sky
4430	1003	5060264371853	Hero Defense
4432	1003	5060201659945	Kill La Kill IF - Collector’s Ed. (w/ Artwork, Artbook, OST, Ball Chain)
4434	1003	3391891996228	Sword Art Online: Fatal Bullet Collector's Edi. (2 Figurines/Artbook/Map)
4436	1003	5060264371075	Sublevel Zero Redux
4438	1003	0810023031758	RPG Maker MV
4440	1003	3770011615322	Splasher
4442	1003	5060102955054	Trailblazers
4444	1003	8718591185656	Shiny
4446	1003	636676491646	Thomas Was Alone
4448	1003	4260252081127	Skyhill
4450	1003	5060146466929	Shovel Knight: Treasure Trove
4452	1003	0813633016641	Republique Contraband Edition
4454	1003	3512899119888	Tour De France 2018
4456	1003	5060264372591	Riot: Civil Unrest
4458	1003	5906395575114	Symmetry
4460	1003	813633017990	Tokyo Twilight Ghost Hunters: Daybreak Special Gigs
4462	1003	5060264371792	Runbow
4464	1003	852428007440	Rez Infinite
4466	1003	3499550372298	Roller Coaster Tycoon Joyride (PSVR)
4468	1003	5060102954682	Superbeat Xonic
4470	1003	3760156481470	Syberia 3: Collectors Ed (Statue+Comicbook+Artbook+Poster+2 Lithos)
4472	1003	5021290081673	Shadow Of Tomb Raider U.E w/ Statue, F.Light, Opener, Cards, OST (No DLC)
4474	1003	3391891990424	Sword Art Online: Hollow Realization CE + Two Figurines
4476	1003	3499550373530	Spike Volleyball
4478	1003	8718591183706	Rogue Stormers
4480	1003	81002303DIDR	SNK Heroines Diamond Dream Ed. w/ Hat,Book,Towel,Sweatband,CD,Top,14x Pins
4482	1003	5060528032520	Race With Ryan
4484	1003	5021290073579	Star Ocean: Integrity & Faithlessness Collectors Ed.
4486	1003	653341120915	Song Of The Deep
4488	1003	636676491356	RF Generation: Xeodrifter
4490	1003	3307215966266	Tom Clancy's Ghost Recon Wildlands Calavera (Skull+Pouch+Headphones)
4492	1003	636676491530	Rainbow Moon
4494	1003	8718591183157	Reus
4496	1003	5906395575237	Seven
4498	1003	5060146468947	Risk Of Rain 2
4500	1003	5060264373635	Sparklite
4502	1003	4018281682569	Toby: The Secret Mine
4504	1003	636676491615	Shadow Complex Remastered
4506	1003	3760156482866	Toki
4508	1003	5021290074859	Rise of the Tomb Raider Collectors Ed.(Statue, Journal, Artbook, Necklace)
4510	1003	5051892208581	Middle-Earth: Shadow of War Mithril Ed. W/Statue, Ring, OST & Lithographs
4512	1003	813633017525	Psycho-Pass: Mandatory Happiness Limited Ed.
4514	1003	636676491622	Mystery Chronicle One Way Heroics
4516	1003	5906395575169	My Memory of Us
4518	1003	3512899117464	Le Tour De France Season 2017
4520	1003	5056208802965	My Time at Portia
4522	1003	8437015294117	Numantia
4524	1003	8718591184383	Pharaonic
4526	1003	5907813599378	Lords Of The Fallen - Collector's Edition
4528	1003	4020628852399	Let's Sing 2016
4530	1003	8437018875016	Petoons Party
4532	1003	3391891985413	Naruto Shippuden: Ultimate Ninja Storm 4 Collectors Ed. (With Figurine)
4534	1003	810023032052	Princess Guide, The
4536	1003	636676491561	Octodad Deadliest Catch
4538	1003	636676491332	Night Trap
4540	1003	3391891988025	One Piece Burning Blood - Marineford Edition
4542	1003	8437015294070	Kyurinaga's Revenge
4544	1003	3391891998239	One Piece: World Seeker - Pirate King Ed  W/Figure, Devil Fruit, CD(NoDLC)
4546	1003	5060522091998	Zen Studios Ultimate VR Collection (PSVR)
4548	1003	0010086632231	Yakuza 6: Song Of Life A.H Ed W/2x Glasses, 2x Stones, 2x Mats, Art Book
4550	1003	5021290074132	World Of Final Fantasy CE+ Figures
4552	1003	810023034001	Utawarerumono ZAN
4554	1003	5056208804709	Wargroove
4556	1003	5016488129022	Worlds of Magic Planar Conquest
4558	1003	5056280410188	Yu-No: A Girl Who Chants Love At The Bound Of This World
4560	1003	5030917189210	Overwatch: Coll. Ed.- Steelbook/Figure/Artbook/OST
4562	1003	5051892187336	Lego Dimensions: Starter Pack (Sealed Only)
4564	1003	3307216124870	Ghost Recon Breakpoint Wolves Col Ed(Fig+Steelbook+Map+Dog Tag,File) NoDLC
4566	1003	5060690790945	Blazblue Cross Tag Battle Special Edition
4568	1003	3307215972COL	For Honor (No DLC) Col. Ed.: Lithograph/OST/3 Helmets/Stand
4570	1003	5060057022252	Stick It To The Man
4572	1003	5051892219525	Mortal Kombat 11 Kollector's Edition w/ Mask, Magnet, Steelbook (No DLC)
4574	1003	5060146468282	Forager
4576	1003	8718591186141	Air Missions Hind
4578	1003	5060188672265	Close to the Sun Limited Ed. w/ Artbook, Pin, Vinyl (No DLC)
4580	1003	711719829638	Bloodborne Nightmare Collector's Edition
4582	1003	5030917151408	Skylanders Trap Team Dark Edition Starter Pack
4584	1003	810023032823	Danganronpa Trilogy
4586	1003	3307216117896	Division 2, The: Phoenix Shield Ed. (No DLC) W/Figure, CD, Book, Map
4588	1003	5030917146787	Destiny: Ghost Edition
4590	1003	0853736006231	Tokyo Xanadu eX+
4592	1003	806891060143	Mind Labyrinth VR Dreams (PSVR)
4594	1003	813633014050	Natural Doctrine
4596	1003	0810023031437	SNK Heroines Tag Team Frenzy
4598	1003	8718591186066	Omen Of Sorrow
4600	1003	5021290080324	Left Alive - Mech Ed (Volk Action Fig, Artbook, Steelbook Case) (No DLC)
4602	1003	047875770591	Cabelas African Adventures
4604	1003	4020628824860	Now That's What I Call Sing 2 + Microphone
4606	1003	0810023034100	Disgaea 4 Complete+
4608	1003	5055277035311	Catherine: Full Body Heart's Desire Premium Ed. w/ Plush,CD,Artbook,Case
4610	1003	5060102954903	Flipping Death
4612	1003	3391892002317	Dark Souls III & The Witcher 3 Wild Hunt Compilation (2 Discs)
4614	1003	4260252081196	Intruders: Hide and Seek
4616	1003	811949031396	Neverwinter Nights Enhanced Edition
4618	1003	5030917214370	Destiny 2 Collector’s Edition (No DLC) W/Frontier Bag, Artbook & Pawns
4620	1003	636676491387	Futuridium
4622	1003	5051892186537	Batman Arkham Knight: LE + Statue & Artbook & Comic
\.


--
-- Data for Name: item_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_price (item_id, prices_id) FROM stdin;
2	1
4	3
6	5
8	7
10	9
1126	1125
1128	1127
1130	1129
1132	1131
1134	1133
1136	1135
1138	1137
1140	1139
1142	1141
1144	1143
1146	1145
1148	1147
1150	1149
1152	1151
1154	1153
1156	1155
1158	1157
1160	1159
1162	1161
1164	1163
1166	1165
1168	1167
1170	1169
1172	1171
1174	1173
1176	1175
1178	1177
1180	1179
1182	1181
1184	1183
1186	1185
1188	1187
1190	1189
1192	1191
1194	1193
1196	1195
1198	1197
1200	1199
1202	1201
1204	1203
1206	1205
1208	1207
1210	1209
1212	1211
1214	1213
1216	1215
1218	1217
1220	1219
1222	1221
1224	1223
1226	1225
1228	1227
1230	1229
1232	1231
1234	1233
1236	1235
1238	1237
1240	1239
1242	1241
1244	1243
1246	1245
1248	1247
1250	1249
1252	1251
1254	1253
1256	1255
1258	1257
1260	1259
1262	1261
1264	1263
1266	1265
1268	1267
1270	1269
1272	1271
1274	1273
1276	1275
1278	1277
1280	1279
1282	1281
1284	1283
1286	1285
1288	1287
1290	1289
1292	1291
1294	1293
1296	1295
1298	1297
1300	1299
1302	1301
1304	1303
1306	1305
1308	1307
1310	1309
1312	1311
1314	1313
1316	1315
1318	1317
1320	1319
1322	1321
1324	1323
1326	1325
1328	1327
1330	1329
1332	1331
1334	1333
1336	1335
1338	1337
1340	1339
1342	1341
1344	1343
1346	1345
1348	1347
1350	1349
1352	1351
1354	1353
1356	1355
1358	1357
1360	1359
1362	1361
1364	1363
1366	1365
1368	1367
1370	1369
1372	1371
1374	1373
1376	1375
1378	1377
1380	1379
1382	1381
1384	1383
1386	1385
1388	1387
1390	1389
1392	1391
1394	1393
1396	1395
1398	1397
1400	1399
1402	1401
1404	1403
1406	1405
1408	1407
1410	1409
1412	1411
1414	1413
1416	1415
1418	1417
1420	1419
1422	1421
1424	1423
1426	1425
1428	1427
1430	1429
1432	1431
1434	1433
1436	1435
1438	1437
1440	1439
1442	1441
1444	1443
1446	1445
1448	1447
1450	1449
1452	1451
1454	1453
1456	1455
1458	1457
1460	1459
1462	1461
1464	1463
1466	1465
1468	1467
1470	1469
1472	1471
1474	1473
1476	1475
1478	1477
1480	1479
1482	1481
1484	1483
1486	1485
1488	1487
1490	1489
1492	1491
1494	1493
1496	1495
1498	1497
1500	1499
1502	1501
1504	1503
1506	1505
1508	1507
1510	1509
1512	1511
1514	1513
1516	1515
1518	1517
1520	1519
1522	1521
1524	1523
1526	1525
1528	1527
1530	1529
1532	1531
1534	1533
1536	1535
1538	1537
1540	1539
1542	1541
1544	1543
1546	1545
1548	1547
1550	1549
1552	1551
1554	1553
1556	1555
1558	1557
1560	1559
1562	1561
1564	1563
1566	1565
1568	1567
1570	1569
1572	1571
1574	1573
1576	1575
1578	1577
1580	1579
1582	1581
1584	1583
1586	1585
1588	1587
1590	1589
1592	1591
1594	1593
1596	1595
1598	1597
1600	1599
1602	1601
1604	1603
1606	1605
1608	1607
1610	1609
1612	1611
1614	1613
1616	1615
1618	1617
1620	1619
1622	1621
1624	1623
1626	1625
1628	1627
1630	1629
1632	1631
1634	1633
1636	1635
1638	1637
1640	1639
1642	1641
1644	1643
1646	1645
1648	1647
1650	1649
1652	1651
1654	1653
1656	1655
1658	1657
1660	1659
1662	1661
1664	1663
1666	1665
1668	1667
1670	1669
1672	1671
1674	1673
1676	1675
1678	1677
1680	1679
1682	1681
1684	1683
1686	1685
1688	1687
1690	1689
1692	1691
1694	1693
1696	1695
1698	1697
1700	1699
1702	1701
1704	1703
1706	1705
1708	1707
1710	1709
1712	1711
1714	1713
1716	1715
1718	1717
1720	1719
1722	1721
1724	1723
1726	1725
1728	1727
1730	1729
1732	1731
1734	1733
1736	1735
1738	1737
1740	1739
1742	1741
1744	1743
1746	1745
1748	1747
1750	1749
1752	1751
1754	1753
1756	1755
1758	1757
1760	1759
1762	1761
1764	1763
1766	1765
1768	1767
1770	1769
1772	1771
1774	1773
1776	1775
1778	1777
1780	1779
1782	1781
1784	1783
1786	1785
1788	1787
1790	1789
1792	1791
1794	1793
1796	1795
1798	1797
1800	1799
1802	1801
1804	1803
1806	1805
1808	1807
1810	1809
1812	1811
1814	1813
1816	1815
1818	1817
1820	1819
1822	1821
1824	1823
1826	1825
1828	1827
1830	1829
1832	1831
1834	1833
1836	1835
1838	1837
1840	1839
1842	1841
1844	1843
1846	1845
1848	1847
1850	1849
1852	1851
1854	1853
1856	1855
1858	1857
1860	1859
1862	1861
1864	1863
1866	1865
1868	1867
1870	1869
1872	1871
1874	1873
1876	1875
1878	1877
1880	1879
1882	1881
1884	1883
1886	1885
1888	1887
1890	1889
1892	1891
1894	1893
1896	1895
1898	1897
1900	1899
1902	1901
1904	1903
1906	1905
1908	1907
1910	1909
1912	1911
1914	1913
1916	1915
1918	1917
1920	1919
1922	1921
1924	1923
1926	1925
1928	1927
1930	1929
1932	1931
1934	1933
1936	1935
1938	1937
1940	1939
2300	2299
2302	2301
2304	2303
2306	2305
2308	2307
2310	2309
2312	2311
2314	2313
2316	2315
2318	2317
2320	2319
2322	2321
2324	2323
2326	2325
2328	2327
2330	2329
2332	2331
2334	2333
2336	2335
2338	2337
2340	2339
2342	2341
2344	2343
2346	2345
2348	2347
2350	2349
2352	2351
2354	2353
2356	2355
2358	2357
2360	2359
2362	2361
2364	2363
2366	2365
2368	2367
2370	2369
2372	2371
2374	2373
2376	2375
2378	2377
2380	2379
2382	2381
2384	2383
2386	2385
2388	2387
2390	2389
2392	2391
2394	2393
2396	2395
2398	2397
2400	2399
2402	2401
2404	2403
2406	2405
2408	2407
2410	2409
2412	2411
2414	2413
2416	2415
2418	2417
2420	2419
2422	2421
2424	2423
2426	2425
2428	2427
2430	2429
2432	2431
2434	2433
2436	2435
2438	2437
2440	2439
2442	2441
2444	2443
2446	2445
2448	2447
2450	2449
2452	2451
2454	2453
2456	2455
2458	2457
2460	2459
2462	2461
2464	2463
2466	2465
2468	2467
2470	2469
2472	2471
2474	2473
2476	2475
2478	2477
2480	2479
2482	2481
2484	2483
2486	2485
2488	2487
2490	2489
1022	1021
1024	1023
1026	1025
1028	1027
1030	1029
1032	1031
1034	1033
1036	1035
1038	1037
1040	1039
1042	1041
1044	1043
1046	1045
1048	1047
1050	1049
1052	1051
1054	1053
1056	1055
1058	1057
1060	1059
1062	1061
1064	1063
1066	1065
1068	1067
1070	1069
1072	1071
1074	1073
1076	1075
1078	1077
1080	1079
1082	1081
1084	1083
1086	1085
1088	1087
1090	1089
1092	1091
1094	1093
1096	1095
1098	1097
1100	1099
1102	1101
1104	1103
1106	1105
1108	1107
1110	1109
1112	1111
1114	1113
1116	1115
1118	1117
1120	1119
1122	1121
1124	1123
1942	1941
1944	1943
1946	1945
1948	1947
1950	1949
1952	1951
1954	1953
1956	1955
1958	1957
1960	1959
1962	1961
1964	1963
1966	1965
1968	1967
1970	1969
1972	1971
1974	1973
1976	1975
1978	1977
1980	1979
1982	1981
1984	1983
1986	1985
1988	1987
1990	1989
1992	1991
1994	1993
1996	1995
1998	1997
2000	1999
2002	2001
2004	2003
2006	2005
2008	2007
2010	2009
2012	2011
2014	2013
2016	2015
2018	2017
2020	2019
2022	2021
2024	2023
2026	2025
2028	2027
2030	2029
2032	2031
2034	2033
2036	2035
2038	2037
2040	2039
2042	2041
2044	2043
2046	2045
2048	2047
2050	2049
2052	2051
2054	2053
2056	2055
2058	2057
2060	2059
2062	2061
2064	2063
2066	2065
2068	2067
2070	2069
2072	2071
2074	2073
2076	2075
2078	2077
2080	2079
2082	2081
2084	2083
2086	2085
2088	2087
2090	2089
2092	2091
2094	2093
2096	2095
2098	2097
2100	2099
2102	2101
2104	2103
2106	2105
2108	2107
2110	2109
2112	2111
2114	2113
2116	2115
2118	2117
2120	2119
2122	2121
2124	2123
2126	2125
2128	2127
2130	2129
2132	2131
2134	2133
2136	2135
2138	2137
2140	2139
2142	2141
2144	2143
2146	2145
2148	2147
2150	2149
2152	2151
2154	2153
2156	2155
2158	2157
2160	2159
2162	2161
2164	2163
2166	2165
2168	2167
2170	2169
2172	2171
2174	2173
2176	2175
2178	2177
2180	2179
2182	2181
2184	2183
2186	2185
2188	2187
2190	2189
2192	2191
2194	2193
2196	2195
2198	2197
2200	2199
2202	2201
2204	2203
2206	2205
2208	2207
2210	2209
2212	2211
2214	2213
2216	2215
2218	2217
2220	2219
2222	2221
2224	2223
2226	2225
2228	2227
2230	2229
2232	2231
2234	2233
2236	2235
2238	2237
2240	2239
2242	2241
2244	2243
2246	2245
2248	2247
2250	2249
2252	2251
2254	2253
2256	2255
2258	2257
2260	2259
2262	2261
2264	2263
2266	2265
2268	2267
2270	2269
2272	2271
2274	2273
2276	2275
2278	2277
2280	2279
2282	2281
2284	2283
2286	2285
2288	2287
2290	2289
2292	2291
2294	2293
2296	2295
2298	2297
2492	2491
2494	2493
2496	2495
2498	2497
2500	2499
2502	2501
2504	2503
2506	2505
2508	2507
2510	2509
2512	2511
2514	2513
2516	2515
2518	2517
2520	2519
2522	2521
2524	2523
2526	2525
2528	2527
2530	2529
2532	2531
2534	2533
2536	2535
2538	2537
2540	2539
2542	2541
2544	2543
2546	2545
2548	2547
2550	2549
2552	2551
2554	2553
2556	2555
2558	2557
2560	2559
2562	2561
2564	2563
2566	2565
2568	2567
2570	2569
2572	2571
2574	2573
2576	2575
2578	2577
2580	2579
2582	2581
2584	2583
2586	2585
2588	2587
2590	2589
2592	2591
2594	2593
2596	2595
2598	2597
2600	2599
2602	2601
2604	2603
2606	2605
2608	2607
2610	2609
2612	2611
2614	2613
2616	2615
2618	2617
2620	2619
2622	2621
2624	2623
2626	2625
2628	2627
2630	2629
2632	2631
2634	2633
2636	2635
2638	2637
2640	2639
2642	2641
2644	2643
2646	2645
2648	2647
2650	2649
2652	2651
2654	2653
2656	2655
2658	2657
2660	2659
2662	2661
2664	2663
2666	2665
2668	2667
2670	2669
2672	2671
2674	2673
2676	2675
2678	2677
2680	2679
2682	2681
2684	2683
2686	2685
2688	2687
2690	2689
2692	2691
2694	2693
2696	2695
2698	2697
2700	2699
2702	2701
2704	2703
2706	2705
2708	2707
2710	2709
2712	2711
2714	2713
2716	2715
2718	2717
2720	2719
2722	2721
2724	2723
2726	2725
2728	2727
2730	2729
2732	2731
2734	2733
2736	2735
2738	2737
2740	2739
2742	2741
2744	2743
2746	2745
2748	2747
2750	2749
2752	2751
2754	2753
2756	2755
2758	2757
2760	2759
2762	2761
2764	2763
2766	2765
2768	2767
2770	2769
2772	2771
2774	2773
2776	2775
2778	2777
2780	2779
2782	2781
2784	2783
2786	2785
2788	2787
2790	2789
2792	2791
2794	2793
2796	2795
2798	2797
2800	2799
2802	2801
2804	2803
2806	2805
2808	2807
2810	2809
2812	2811
2814	2813
2816	2815
2818	2817
2820	2819
2822	2821
2824	2823
2826	2825
2828	2827
2830	2829
2832	2831
2834	2833
2836	2835
2838	2837
2840	2839
2842	2841
2844	2843
2846	2845
2848	2847
2850	2849
2852	2851
2854	2853
2856	2855
2858	2857
2860	2859
2862	2861
2864	2863
2866	2865
2868	2867
2870	2869
2872	2871
2874	2873
2876	2875
2878	2877
2880	2879
2882	2881
2884	2883
2886	2885
2888	2887
2890	2889
2892	2891
2894	2893
2896	2895
2898	2897
2900	2899
2902	2901
2904	2903
2906	2905
2908	2907
2910	2909
2912	2911
2914	2913
2916	2915
2918	2917
2920	2919
2922	2921
2924	2923
2926	2925
2928	2927
2930	2929
2932	2931
2934	2933
2936	2935
2938	2937
2940	2939
2942	2941
2944	2943
2946	2945
2948	2947
2950	2949
2952	2951
2954	2953
2956	2955
2958	2957
2960	2959
2962	2961
2964	2963
2966	2965
2968	2967
2970	2969
2972	2971
2974	2973
2976	2975
2978	2977
2980	2979
2982	2981
2984	2983
2986	2985
2988	2987
2990	2989
2992	2991
2994	2993
2996	2995
2998	2997
3000	2999
3002	3001
3004	3003
3006	3005
3008	3007
3010	3009
3012	3011
3014	3013
3016	3015
3018	3017
3020	3019
3022	3021
3024	3023
3026	3025
3028	3027
3030	3029
3032	3031
3034	3033
3036	3035
3038	3037
3040	3039
3042	3041
3044	3043
3046	3045
3048	3047
3050	3049
3052	3051
3054	3053
3056	3055
3058	3057
3060	3059
3062	3061
3064	3063
3066	3065
3068	3067
3070	3069
3072	3071
3074	3073
3076	3075
3078	3077
3080	3079
3082	3081
3084	3083
3086	3085
3088	3087
3090	3089
3092	3091
3094	3093
3096	3095
3098	3097
3100	3099
3102	3101
3104	3103
3106	3105
3108	3107
3110	3109
3112	3111
3114	3113
3116	3115
3118	3117
3120	3119
3122	3121
3124	3123
3126	3125
3128	3127
3130	3129
3132	3131
3134	3133
3136	3135
3138	3137
3140	3139
3142	3141
3144	3143
3146	3145
3148	3147
3150	3149
3152	3151
3154	3153
3156	3155
3158	3157
3160	3159
3162	3161
3164	3163
3166	3165
3168	3167
3170	3169
3172	3171
3174	3173
3176	3175
3178	3177
3180	3179
3182	3181
3184	3183
3186	3185
3188	3187
3190	3189
3192	3191
3194	3193
3196	3195
3198	3197
3200	3199
3202	3201
3204	3203
3206	3205
3208	3207
3210	3209
3212	3211
3214	3213
3216	3215
3218	3217
3220	3219
3222	3221
3224	3223
3226	3225
3228	3227
3230	3229
3232	3231
3234	3233
3236	3235
3238	3237
3240	3239
3242	3241
3244	3243
3246	3245
3248	3247
3250	3249
3252	3251
3254	3253
3256	3255
3258	3257
3260	3259
3262	3261
3264	3263
3266	3265
3268	3267
3270	3269
3272	3271
3274	3273
3276	3275
3278	3277
3280	3279
3282	3281
3284	3283
3286	3285
3288	3287
3290	3289
3292	3291
3294	3293
3296	3295
3298	3297
3300	3299
3302	3301
3304	3303
3306	3305
3308	3307
3310	3309
3312	3311
3314	3313
3316	3315
3318	3317
3320	3319
3322	3321
3324	3323
3326	3325
3328	3327
3330	3329
3332	3331
3334	3333
3336	3335
3338	3337
3340	3339
3342	3341
3344	3343
3346	3345
3348	3347
3350	3349
3352	3351
3354	3353
3356	3355
3358	3357
3360	3359
3362	3361
3364	3363
3366	3365
3368	3367
3370	3369
3372	3371
3374	3373
3376	3375
3378	3377
3380	3379
3382	3381
3384	3383
3386	3385
3388	3387
3390	3389
3392	3391
3394	3393
3396	3395
3398	3397
3400	3399
3402	3401
3404	3403
3406	3405
3408	3407
3410	3409
3412	3411
3414	3413
3416	3415
3418	3417
3420	3419
3422	3421
3424	3423
3426	3425
3428	3427
3430	3429
3432	3431
3434	3433
3436	3435
3438	3437
3440	3439
3442	3441
3444	3443
3446	3445
3448	3447
3450	3449
3452	3451
3454	3453
3456	3455
3458	3457
3460	3459
3462	3461
3464	3463
3466	3465
3468	3467
3470	3469
3472	3471
3474	3473
3476	3475
3478	3477
3480	3479
3482	3481
3484	3483
3486	3485
3488	3487
3490	3489
3492	3491
3494	3493
3496	3495
3498	3497
3500	3499
3502	3501
3504	3503
3506	3505
3508	3507
3510	3509
3512	3511
3514	3513
3516	3515
3518	3517
3520	3519
3522	3521
3524	3523
3526	3525
3528	3527
3530	3529
3532	3531
3534	3533
3536	3535
3538	3537
3540	3539
3542	3541
3544	3543
3546	3545
3548	3547
3550	3549
3552	3551
3554	3553
3556	3555
3558	3557
3560	3559
3562	3561
3564	3563
3566	3565
3568	3567
3570	3569
3572	3571
3574	3573
3576	3575
3578	3577
3580	3579
3582	3581
3584	3583
3586	3585
3588	3587
3590	3589
3592	3591
3594	3593
3596	3595
3598	3597
3600	3599
3602	3601
3604	3603
3606	3605
3608	3607
3610	3609
3612	3611
3614	3613
3616	3615
3618	3617
3620	3619
3622	3621
3624	3623
3626	3625
3628	3627
3630	3629
3632	3631
3634	3633
3636	3635
3638	3637
3640	3639
3642	3641
3644	3643
3646	3645
3648	3647
3650	3649
3652	3651
3654	3653
3656	3655
3658	3657
3660	3659
3662	3661
3664	3663
3666	3665
3668	3667
3670	3669
3672	3671
3674	3673
3676	3675
3678	3677
3680	3679
3682	3681
3684	3683
3686	3685
3688	3687
3690	3689
3692	3691
3694	3693
3696	3695
3698	3697
3700	3699
3702	3701
3704	3703
3706	3705
3708	3707
3710	3709
3712	3711
3714	3713
3716	3715
3718	3717
3720	3719
3722	3721
3724	3723
3726	3725
3728	3727
3730	3729
3732	3731
3734	3733
3736	3735
3738	3737
3740	3739
3742	3741
3744	3743
3746	3745
3748	3747
3750	3749
3752	3751
3754	3753
3756	3755
3758	3757
3760	3759
3762	3761
3764	3763
3766	3765
3768	3767
3770	3769
3772	3771
3774	3773
3776	3775
3778	3777
3780	3779
3782	3781
3784	3783
3786	3785
3788	3787
3790	3789
3792	3791
3794	3793
3796	3795
3798	3797
3800	3799
3802	3801
3804	3803
3806	3805
3808	3807
3810	3809
3812	3811
3814	3813
3816	3815
3818	3817
3820	3819
3822	3821
3824	3823
3826	3825
3828	3827
3830	3829
3832	3831
3834	3833
3836	3835
3838	3837
3840	3839
3842	3841
3844	3843
3846	3845
3848	3847
3850	3849
3852	3851
3854	3853
3856	3855
3858	3857
3860	3859
3862	3861
3864	3863
3866	3865
3868	3867
3870	3869
3872	3871
3874	3873
3876	3875
3878	3877
3880	3879
3882	3881
3884	3883
3886	3885
3888	3887
3890	3889
3892	3891
3894	3893
3896	3895
3898	3897
3900	3899
3902	3901
3904	3903
3906	3905
3908	3907
3910	3909
3912	3911
3914	3913
3916	3915
3918	3917
3920	3919
3922	3921
3924	3923
3926	3925
3928	3927
3930	3929
3932	3931
3934	3933
3936	3935
3938	3937
3940	3939
3942	3941
3944	3943
3946	3945
3948	3947
3950	3949
3952	3951
3954	3953
3956	3955
3958	3957
3960	3959
3962	3961
3964	3963
3966	3965
3968	3967
3970	3969
3972	3971
3974	3973
3976	3975
3978	3977
3980	3979
3982	3981
3984	3983
3986	3985
3988	3987
3990	3989
3992	3991
3994	3993
3996	3995
3998	3997
4000	3999
4002	4001
4004	4003
4006	4005
4008	4007
4010	4009
4012	4011
4014	4013
4016	4015
4018	4017
4020	4019
4022	4021
4024	4023
4026	4025
4028	4027
4030	4029
4032	4031
4034	4033
4036	4035
4038	4037
4040	4039
4042	4041
4044	4043
4046	4045
4048	4047
4050	4049
4052	4051
4054	4053
4056	4055
4058	4057
4060	4059
4062	4061
4064	4063
4066	4065
4068	4067
4070	4069
4072	4071
4074	4073
4076	4075
4078	4077
4080	4079
4082	4081
4084	4083
4086	4085
4088	4087
4090	4089
4092	4091
4094	4093
4096	4095
4098	4097
4100	4099
4102	4101
4104	4103
4106	4105
4108	4107
4110	4109
4112	4111
4114	4113
4116	4115
4118	4117
4120	4119
4122	4121
4124	4123
4126	4125
4128	4127
4130	4129
4132	4131
4134	4133
4136	4135
4138	4137
4140	4139
4142	4141
4144	4143
4146	4145
4148	4147
4150	4149
4152	4151
4154	4153
4156	4155
4158	4157
4160	4159
4162	4161
4164	4163
4166	4165
4168	4167
4170	4169
4172	4171
4174	4173
4176	4175
4178	4177
4180	4179
4182	4181
4184	4183
4186	4185
4188	4187
4190	4189
4192	4191
4194	4193
4196	4195
4198	4197
4200	4199
4202	4201
4204	4203
4206	4205
4208	4207
4210	4209
4212	4211
4214	4213
4216	4215
4218	4217
4220	4219
4222	4221
4224	4223
4226	4225
4228	4227
4230	4229
4232	4231
4234	4233
4236	4235
4238	4237
4240	4239
4242	4241
4244	4243
4246	4245
4248	4247
4250	4249
4252	4251
4254	4253
4256	4255
4258	4257
4260	4259
4262	4261
4264	4263
4266	4265
4268	4267
4270	4269
4272	4271
4274	4273
4276	4275
4278	4277
4280	4279
4282	4281
4284	4283
4286	4285
4288	4287
4290	4289
4292	4291
4294	4293
4296	4295
4298	4297
4300	4299
4302	4301
4304	4303
4306	4305
4308	4307
4310	4309
4312	4311
4314	4313
4316	4315
4318	4317
4320	4319
4322	4321
4324	4323
4326	4325
4328	4327
4330	4329
4332	4331
4334	4333
4336	4335
4338	4337
4340	4339
4342	4341
4344	4343
4346	4345
4348	4347
4350	4349
4352	4351
4354	4353
4356	4355
4358	4357
4360	4359
4362	4361
4364	4363
4366	4365
4368	4367
4370	4369
4372	4371
4374	4373
4376	4375
4378	4377
4380	4379
4382	4381
4384	4383
4386	4385
4388	4387
4390	4389
4392	4391
4394	4393
4396	4395
4398	4397
4400	4399
4402	4401
4404	4403
4406	4405
4408	4407
4410	4409
4412	4411
4414	4413
4416	4415
4418	4417
4420	4419
4422	4421
4424	4423
4426	4425
4428	4427
4430	4429
4432	4431
4434	4433
4436	4435
4438	4437
4440	4439
4442	4441
4444	4443
4446	4445
4448	4447
4450	4449
4452	4451
4454	4453
4456	4455
4458	4457
4460	4459
4462	4461
4464	4463
4466	4465
4468	4467
4470	4469
4472	4471
4474	4473
4476	4475
4478	4477
4480	4479
4482	4481
4484	4483
4486	4485
4488	4487
4490	4489
4492	4491
4494	4493
4496	4495
4498	4497
4500	4499
4502	4501
4504	4503
4506	4505
4508	4507
4510	4509
4512	4511
4514	4513
4516	4515
4518	4517
4520	4519
4522	4521
4524	4523
4526	4525
4528	4527
4530	4529
4532	4531
4534	4533
4536	4535
4538	4537
4540	4539
4542	4541
4544	4543
4546	4545
4548	4547
4550	4549
4552	4551
4554	4553
4556	4555
4558	4557
4560	4559
4562	4561
4564	4563
4566	4565
4568	4567
4570	4569
4572	4571
4574	4573
4576	4575
4578	4577
4580	4579
4582	4581
4584	4583
4586	4585
4588	4587
4590	4589
4592	4591
4594	4593
4596	4595
4598	4597
4600	4599
4602	4601
4604	4603
4606	4605
4608	4607
4610	4609
4612	4611
4614	4613
4616	4615
4618	4617
4620	4619
4622	4621
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, cashprice, date, exchangeprice, sellprice) FROM stdin;
1	40	2019-12-09 17:57:55.852	36	50
3	40	2019-12-09 17:57:55.927	36	50
5	33	2019-12-09 17:57:55.942	29	45
7	31	2019-12-09 17:57:55.956	26	45
9	36	2019-12-09 17:57:55.969	32	45
1125	21	2019-12-10 16:24:10.18	15	32
1127	23	2019-12-10 16:24:10.356	16	35
1129	20	2019-12-10 16:24:10.372	14	30
1131	21	2019-12-10 16:24:10.382	15	32
1133	26	2019-12-10 16:24:10.391	22	38
1135	18	2019-12-10 16:24:10.399	13	28
1137	20	2019-12-10 16:24:10.408	14	30
1139	21	2019-12-10 16:24:10.416	17	30
1141	16	2019-12-10 16:24:10.425	11	25
1143	25	2019-12-10 16:24:10.433	17	38
1145	21	2019-12-10 16:24:10.441	15	32
1147	13	2019-12-10 16:24:10.449	9	20
1149	14	2019-12-10 16:24:10.457	10	22
1151	52	2019-12-10 16:24:10.465	47	65
1153	21	2019-12-10 16:24:10.474	17	30
1155	18	2019-12-10 16:24:10.481	13	28
1157	24	2019-12-10 16:24:10.488	20	35
1159	23	2019-12-10 16:24:10.497	16	35
1161	19	2019-12-10 16:24:10.504	16	28
1163	20	2019-12-10 16:24:10.513	14	30
1165	21	2019-12-10 16:24:10.523	17	30
1167	16	2019-12-10 16:24:10.532	11	25
1169	7	2019-12-10 16:24:10.541	4	18
1171	16	2019-12-10 16:24:10.55	11	25
1173	21	2019-12-10 16:24:10.559	17	30
1175	18	2019-12-10 16:24:10.567	13	28
1177	16	2019-12-10 16:24:10.576	11	25
1179	13	2019-12-10 16:24:10.586	9	20
1181	18	2019-12-10 16:24:10.595	13	28
1183	19	2019-12-10 16:24:10.604	16	28
1185	19	2019-12-10 16:24:10.613	16	28
1187	13	2019-12-10 16:24:10.623	9	20
1189	16	2019-12-10 16:24:10.632	11	25
1191	18	2019-12-10 16:24:10.646	13	28
1193	16	2019-12-10 16:24:10.655	11	25
1195	3	2019-12-10 16:24:10.663	2	8
1197	20	2019-12-10 16:24:10.673	14	30
1199	31	2019-12-10 16:24:10.68	27	42
1201	23	2019-12-10 16:24:10.688	16	35
1203	16	2019-12-10 16:24:10.699	11	25
1205	10	2019-12-10 16:24:10.71	7	15
1207	8	2019-12-10 16:24:10.72	5	12
1209	21	2019-12-10 16:24:10.729	17	30
1211	18	2019-12-10 16:24:11.088	13	28
1213	23	2019-12-10 16:24:11.097	16	35
1215	16	2019-12-10 16:24:11.105	11	25
1217	14	2019-12-10 16:24:11.113	10	22
1219	13	2019-12-10 16:24:11.121	9	20
1221	16	2019-12-10 16:24:11.129	11	25
1223	18	2019-12-10 16:24:11.136	13	28
1225	20	2019-12-10 16:24:11.146	14	30
1227	14	2019-12-10 16:24:11.155	10	22
1229	4	2019-12-10 16:24:11.165	3	12
1231	10	2019-12-10 16:24:11.174	7	15
1233	20	2019-12-10 16:24:11.181	14	30
1235	16	2019-12-10 16:24:11.19	11	25
1237	16	2019-12-10 16:24:11.198	11	25
1239	21	2019-12-10 16:24:11.206	15	32
1241	16	2019-12-10 16:24:11.213	11	25
1243	11	2019-12-10 16:24:11.222	7	28
1245	18	2019-12-10 16:24:11.231	13	28
1247	16	2019-12-10 16:24:11.24	11	25
1249	20	2019-12-10 16:24:11.249	14	30
1251	12	2019-12-10 16:24:11.259	8	18
1253	20	2019-12-10 16:24:11.267	14	30
1255	14	2019-12-10 16:24:11.276	10	22
1257	13	2019-12-10 16:24:11.284	9	20
1259	16	2019-12-10 16:24:11.294	11	25
1261	13	2019-12-10 16:24:11.303	9	20
1263	16	2019-12-10 16:24:11.312	11	25
1265	20	2019-12-10 16:24:11.319	14	30
1267	20	2019-12-10 16:24:11.328	14	30
1269	19	2019-12-10 16:24:11.338	16	28
1271	14	2019-12-10 16:24:11.345	10	22
1273	18	2019-12-10 16:24:11.352	13	28
1275	12	2019-12-10 16:24:11.361	8	18
1277	8	2019-12-10 16:24:11.371	5	20
1279	13	2019-12-10 16:24:11.38	9	20
1281	21	2019-12-10 16:24:11.388	17	30
1283	19	2019-12-10 16:24:11.397	16	28
1285	12	2019-12-10 16:24:11.407	8	18
1287	18	2019-12-10 16:24:11.416	13	28
1289	14	2019-12-10 16:24:11.428	10	22
1291	18	2019-12-10 16:24:11.437	13	28
1293	21	2019-12-10 16:24:11.446	17	30
1295	17	2019-12-10 16:24:11.456	14	25
1297	14	2019-12-10 16:24:11.464	10	22
1299	10	2019-12-10 16:24:11.472	7	15
1301	12	2019-12-10 16:24:11.482	8	18
1303	8	2019-12-10 16:24:11.492	5	12
1305	10	2019-12-10 16:24:11.501	7	15
1307	18	2019-12-10 16:24:11.51	13	28
1309	13	2019-12-10 16:24:11.518	9	20
1311	56	2019-12-10 16:24:11.837	48	75
1313	18	2019-12-10 16:24:11.847	13	28
1315	16	2019-12-10 16:24:11.856	11	25
1317	14	2019-12-10 16:24:11.865	10	22
1319	12	2019-12-10 16:24:11.874	8	18
1321	16	2019-12-10 16:24:11.883	11	25
1323	13	2019-12-10 16:24:11.893	9	20
1325	13	2019-12-10 16:24:11.901	9	20
1327	16	2019-12-10 16:24:11.91	11	25
1329	18	2019-12-10 16:24:11.92	13	28
1331	23	2019-12-10 16:24:11.93	16	35
1333	10	2019-12-10 16:24:11.94	7	15
1335	21	2019-12-10 16:24:11.949	15	32
1337	32	2019-12-10 16:24:11.96	22	48
1339	20	2019-12-10 16:24:11.969	14	30
1341	18	2019-12-10 16:24:11.978	13	28
1343	14	2019-12-10 16:24:11.985	10	22
1345	14	2019-12-10 16:24:11.994	10	22
1347	7	2019-12-10 16:24:12.005	4	18
1349	21	2019-12-10 16:24:12.017	15	32
1351	26	2019-12-10 16:24:12.027	18	40
1353	16	2019-12-10 16:24:12.036	11	25
1355	21	2019-12-10 16:24:12.046	15	32
1357	12	2019-12-10 16:24:12.054	8	18
1359	10	2019-12-10 16:24:12.063	7	15
1361	22	2019-12-10 16:24:12.073	18	32
1363	13	2019-12-10 16:24:12.08	9	20
1365	12	2019-12-10 16:24:12.088	8	18
1367	14	2019-12-10 16:24:12.097	10	22
1369	10	2019-12-10 16:24:12.106	7	15
1371	12	2019-12-10 16:24:12.115	8	18
1373	23	2019-12-10 16:24:12.126	16	35
1375	18	2019-12-10 16:24:12.134	13	28
1377	12	2019-12-10 16:24:12.143	8	18
1379	10	2019-12-10 16:24:12.151	7	15
1381	18	2019-12-10 16:24:12.16	13	28
1383	18	2019-12-10 16:24:12.168	13	28
1385	10	2019-12-10 16:24:12.177	7	15
1387	13	2019-12-10 16:24:12.185	9	20
1389	14	2019-12-10 16:24:12.193	10	22
1391	6	2019-12-10 16:24:12.2	4	10
1393	18	2019-12-10 16:24:12.208	13	28
1395	18	2019-12-10 16:24:12.216	13	28
1397	25	2019-12-10 16:24:12.224	17	38
1399	30	2019-12-10 16:24:12.232	21	45
1401	13	2019-12-10 16:24:12.24	9	20
1403	14	2019-12-10 16:24:12.248	10	22
1405	14	2019-12-10 16:24:12.257	10	22
1407	1.6	2019-12-10 16:24:12.265	1	4
1409	12	2019-12-10 16:24:12.274	8	18
1411	12	2019-12-10 16:24:12.574	8	18
1413	18	2019-12-10 16:24:12.582	13	28
1415	10	2019-12-10 16:24:12.59	7	15
1417	8	2019-12-10 16:24:12.598	5	12
1419	16	2019-12-10 16:24:12.605	11	25
1421	20	2019-12-10 16:24:12.611	14	30
1423	8	2019-12-10 16:24:12.617	5	12
1425	12	2019-12-10 16:24:12.623	8	18
1427	12	2019-12-10 16:24:12.63	8	18
1429	16	2019-12-10 16:24:12.636	11	25
1431	10	2019-12-10 16:24:12.643	7	15
1433	13	2019-12-10 16:24:12.649	9	20
1435	10	2019-12-10 16:24:12.655	7	15
1437	12	2019-12-10 16:24:12.662	8	18
1439	8	2019-12-10 16:24:12.67	5	12
1441	10	2019-12-10 16:24:12.677	7	15
1443	18	2019-12-10 16:24:12.684	13	28
1445	10	2019-12-10 16:24:12.692	7	15
1447	23	2019-12-10 16:24:12.701	16	35
1449	16	2019-12-10 16:24:12.71	11	25
1451	28	2019-12-10 16:24:12.718	19	42
1453	13	2019-12-10 16:24:12.727	9	20
1455	14	2019-12-10 16:24:12.736	10	22
1457	10	2019-12-10 16:24:12.744	7	15
1459	13	2019-12-10 16:24:12.753	9	20
1461	35	2019-12-10 16:24:12.761	29	50
1463	16	2019-12-10 16:24:12.769	11	25
1465	13	2019-12-10 16:24:12.777	9	20
1467	2	2019-12-10 16:24:12.789	1.3	5
1469	10	2019-12-10 16:24:12.798	7	15
1471	12	2019-12-10 16:24:12.807	8	18
1473	18	2019-12-10 16:24:12.817	13	28
1475	42	2019-12-10 16:24:12.824	34	60
1477	14	2019-12-10 16:24:12.83	10	22
1479	59	2019-12-10 16:24:12.837	49	85
1481	16	2019-12-10 16:24:12.844	11	25
1483	10	2019-12-10 16:24:12.851	7	15
1485	20	2019-12-10 16:24:12.858	14	30
1487	25	2019-12-10 16:24:12.864	17	38
1489	10	2019-12-10 16:24:12.87	7	15
1491	23	2019-12-10 16:24:12.877	16	35
1493	23	2019-12-10 16:24:12.883	16	35
1495	16	2019-12-10 16:24:12.89	11	25
1497	16	2019-12-10 16:24:12.897	11	25
1499	10	2019-12-10 16:24:12.904	7	15
1501	25	2019-12-10 16:24:12.912	17	38
1503	21	2019-12-10 16:24:12.918	15	32
1505	16	2019-12-10 16:24:12.926	11	25
1507	12	2019-12-10 16:24:12.932	8	18
1509	16	2019-12-10 16:24:12.939	11	25
1511	18	2019-12-10 16:24:13.297	13	28
1513	20	2019-12-10 16:24:13.306	14	30
1515	10	2019-12-10 16:24:13.315	7	15
1517	16	2019-12-10 16:24:13.323	11	25
1519	12	2019-12-10 16:24:13.332	8	18
1521	14	2019-12-10 16:24:13.343	10	22
1523	16	2019-12-10 16:24:13.353	11	25
1525	8	2019-12-10 16:24:13.362	5	12
1527	6	2019-12-10 16:24:13.373	4	10
1529	12	2019-12-10 16:24:13.385	8	18
1531	12	2019-12-10 16:24:13.395	8	18
1533	8	2019-12-10 16:24:13.405	5	12
1535	6	2019-12-10 16:24:13.416	4	10
1537	25	2019-12-10 16:24:13.427	17	38
1539	16	2019-12-10 16:24:13.439	11	25
1541	20	2019-12-10 16:24:13.45	14	30
1543	12	2019-12-10 16:24:13.46	8	18
1545	20	2019-12-10 16:24:13.47	14	30
1547	12	2019-12-10 16:24:13.485	8	18
1549	23	2019-12-10 16:24:13.495	16	35
1551	14	2019-12-10 16:24:13.504	10	22
1553	8	2019-12-10 16:24:13.515	5	12
1555	14	2019-12-10 16:24:13.528	10	22
1557	10	2019-12-10 16:24:13.54	7	15
1559	12	2019-12-10 16:24:13.551	8	18
1561	28	2019-12-10 16:24:13.562	23	40
1563	14	2019-12-10 16:24:13.572	10	22
1565	77	2019-12-10 16:24:13.582	63	110
1567	18	2019-12-10 16:24:13.591	13	28
1569	14	2019-12-10 16:24:13.601	10	22
1571	25	2019-12-10 16:24:13.61	17	38
1573	6	2019-12-10 16:24:13.619	4	10
1575	35	2019-12-10 16:24:13.629	29	50
1577	2	2019-12-10 16:24:13.639	1.5	6
1579	21	2019-12-10 16:24:13.65	15	32
1581	26	2019-12-10 16:24:13.66	22	38
1583	12	2019-12-10 16:24:13.67	8	18
1585	24	2019-12-10 16:24:13.681	20	35
1587	16	2019-12-10 16:24:13.69	11	25
1589	12	2019-12-10 16:24:13.701	8	18
1591	32	2019-12-10 16:24:13.712	22	48
1593	16	2019-12-10 16:24:13.724	11	25
1595	12	2019-12-10 16:24:13.736	8	18
1597	16	2019-12-10 16:24:13.747	11	25
1599	21	2019-12-10 16:24:13.758	15	32
1601	23	2019-12-10 16:24:13.769	16	35
1603	20	2019-12-10 16:24:13.779	14	30
1605	12	2019-12-10 16:24:13.79	8	18
1607	28	2019-12-10 16:24:13.801	23	40
1609	8	2019-12-10 16:24:13.811	5	12
1611	12	2019-12-10 16:24:14.126	8	18
1613	14	2019-12-10 16:24:14.134	10	22
1615	25	2019-12-10 16:24:14.143	17	38
1617	14	2019-12-10 16:24:14.151	10	22
1619	8	2019-12-10 16:24:14.159	5	12
1621	18	2019-12-10 16:24:14.167	13	28
1623	20	2019-12-10 16:24:14.175	14	30
1625	20	2019-12-10 16:24:14.182	14	30
1627	16	2019-12-10 16:24:14.19	11	25
1629	10	2019-12-10 16:24:14.198	7	15
1631	8	2019-12-10 16:24:14.205	5	12
1633	8	2019-12-10 16:24:14.212	5	12
1635	20	2019-12-10 16:24:14.219	14	30
1637	7	2019-12-10 16:24:14.227	4	18
1639	52	2019-12-10 16:24:14.236	43	75
1641	26	2019-12-10 16:24:14.244	18	40
1643	16	2019-12-10 16:24:14.252	11	25
1645	18	2019-12-10 16:24:14.26	13	28
1647	21	2019-12-10 16:24:14.267	15	32
1649	10	2019-12-10 16:24:14.275	7	15
1651	16	2019-12-10 16:24:14.283	11	25
1653	18	2019-12-10 16:24:14.292	13	28
1655	13	2019-12-10 16:24:14.299	9	20
1657	20	2019-12-10 16:24:14.307	14	30
1659	28	2019-12-10 16:24:14.314	19	42
1661	16	2019-12-10 16:24:14.322	11	25
1663	14	2019-12-10 16:24:14.33	10	22
1665	18	2019-12-10 16:24:14.338	13	28
1667	12	2019-12-10 16:24:14.347	8	18
1669	20	2019-12-10 16:24:14.355	14	30
1671	32	2019-12-10 16:24:14.363	22	48
1673	16	2019-12-10 16:24:14.375	11	25
1675	13	2019-12-10 16:24:14.384	9	20
1677	18	2019-12-10 16:24:14.392	13	28
1679	16	2019-12-10 16:24:14.401	11	25
1681	12	2019-12-10 16:24:14.41	8	18
1683	12	2019-12-10 16:24:14.419	8	18
1685	12	2019-12-10 16:24:14.429	8	18
1687	12	2019-12-10 16:24:14.437	8	18
1689	8	2019-12-10 16:24:14.446	5	12
1691	14	2019-12-10 16:24:14.453	10	22
1693	23	2019-12-10 16:24:14.461	16	35
1695	24	2019-12-10 16:24:14.468	20	35
1697	8	2019-12-10 16:24:14.476	5	12
1699	20	2019-12-10 16:24:14.484	14	30
1701	10	2019-12-10 16:24:14.491	7	15
1703	14	2019-12-10 16:24:14.499	10	22
1705	13	2019-12-10 16:24:14.507	9	20
1707	12	2019-12-10 16:24:14.515	8	18
1709	26	2019-12-10 16:24:14.524	18	40
1711	13	2019-12-10 16:24:14.841	9	20
1713	33	2019-12-10 16:24:14.849	27	48
1715	8	2019-12-10 16:24:14.857	5	12
1717	12	2019-12-10 16:24:14.866	8	18
1719	13	2019-12-10 16:24:14.874	9	20
1721	12	2019-12-10 16:24:14.882	8	18
1723	16	2019-12-10 16:24:14.89	11	25
1725	20	2019-12-10 16:24:14.898	14	30
1727	16	2019-12-10 16:24:14.906	11	25
1729	33	2019-12-10 16:24:14.915	27	48
1731	16	2019-12-10 16:24:14.922	11	25
1733	12	2019-12-10 16:24:14.93	8	18
1735	25	2019-12-10 16:24:14.94	17	38
1737	26	2019-12-10 16:24:14.948	18	40
1739	13	2019-12-10 16:24:14.956	9	20
1741	12	2019-12-10 16:24:14.964	8	18
1743	16	2019-12-10 16:24:14.971	11	25
1745	16	2019-12-10 16:24:14.979	11	25
1747	14	2019-12-10 16:24:14.987	10	22
1749	78	2019-12-10 16:24:14.995	68	105
1751	30	2019-12-10 16:24:15.003	21	45
1753	28	2019-12-10 16:24:15.011	23	40
1755	16	2019-12-10 16:24:15.019	11	25
1757	16	2019-12-10 16:24:15.029	11	25
1759	28	2019-12-10 16:24:15.039	19	42
1761	20	2019-12-10 16:24:15.049	14	30
1763	12	2019-12-10 16:24:15.056	8	18
1765	18	2019-12-10 16:24:15.064	13	28
1767	16	2019-12-10 16:24:15.072	11	25
1769	26	2019-12-10 16:24:15.08	22	38
1771	23	2019-12-10 16:24:15.088	16	35
1773	10	2019-12-10 16:24:15.097	7	15
1775	67	2019-12-10 16:24:15.105	58	90
1777	10	2019-12-10 16:24:15.114	7	15
1779	10	2019-12-10 16:24:15.122	7	15
1781	25	2019-12-10 16:24:15.131	17	38
1783	16	2019-12-10 16:24:15.139	11	25
1785	16	2019-12-10 16:24:15.147	11	25
1787	18	2019-12-10 16:24:15.155	13	28
1789	16	2019-12-10 16:24:15.163	11	25
1791	48	2019-12-10 16:24:15.17	42	65
1793	33	2019-12-10 16:24:15.178	27	48
1795	33	2019-12-10 16:24:15.186	27	48
1797	13	2019-12-10 16:24:15.194	9	20
1799	23	2019-12-10 16:24:15.202	16	35
1801	30	2019-12-10 16:24:15.209	26	40
1803	16	2019-12-10 16:24:15.217	11	25
1805	21	2019-12-10 16:24:15.225	15	32
1807	18	2019-12-10 16:24:15.232	13	28
1809	0	2019-12-10 16:24:15.24	0	25
1811	20	2019-12-10 16:24:15.557	14	30
1813	52	2019-12-10 16:24:15.566	43	75
1815	20	2019-12-10 16:24:15.575	14	30
1817	18	2019-12-10 16:24:15.585	13	28
1819	17	2019-12-10 16:24:15.594	14	25
1821	23	2019-12-10 16:24:15.604	16	35
1823	24	2019-12-10 16:24:15.614	20	35
1825	20	2019-12-10 16:24:15.625	14	30
1827	20	2019-12-10 16:24:15.634	14	30
1829	16	2019-12-10 16:24:15.645	11	25
1831	50	2019-12-10 16:24:15.654	35	75
1833	12	2019-12-10 16:24:15.665	8	18
1835	10	2019-12-10 16:24:15.674	7	15
1837	18	2019-12-10 16:24:15.685	13	28
1839	22	2019-12-10 16:24:15.694	18	32
1841	18	2019-12-10 16:24:15.705	13	28
1843	67	2019-12-10 16:24:15.716	58	90
1845	67	2019-12-10 16:24:15.726	58	90
1847	49	2019-12-10 16:24:15.737	40	70
1849	49	2019-12-10 16:24:15.748	40	70
1851	42	2019-12-10 16:24:15.758	34	60
1853	31	2019-12-10 16:24:15.77	26	45
1855	42	2019-12-10 16:24:15.781	34	60
1857	35	2019-12-10 16:24:15.792	29	50
1859	52	2019-12-10 16:24:15.801	43	75
1861	21	2019-12-10 16:24:15.811	15	32
1863	38	2019-12-10 16:24:15.82	31	55
1865	21	2019-12-10 16:24:15.829	15	32
1867	29	2019-12-10 16:24:15.839	24	42
1869	28	2019-12-10 16:24:15.849	23	40
1871	31	2019-12-10 16:24:15.859	26	45
1873	70	2019-12-10 16:24:15.868	58	100
1875	26	2019-12-10 16:24:15.876	18	40
1877	20	2019-12-10 16:24:15.885	14	30
1879	33	2019-12-10 16:24:15.894	27	48
1881	26	2019-12-10 16:24:15.903	18	40
1883	12	2019-12-10 16:24:15.91	8	18
1885	14	2019-12-10 16:24:15.919	10	22
1887	16	2019-12-10 16:24:15.927	11	25
1889	20	2019-12-10 16:24:15.935	14	30
1891	20	2019-12-10 16:24:15.946	14	30
1893	20	2019-12-10 16:24:15.957	14	30
1895	49	2019-12-10 16:24:15.966	40	70
1897	13	2019-12-10 16:24:15.976	9	20
1899	21	2019-12-10 16:24:15.989	15	32
1901	52	2019-12-10 16:24:15.998	45	70
1903	18	2019-12-10 16:24:16.008	13	28
1905	5	2019-12-10 16:24:16.017	3	8
1907	56	2019-12-10 16:24:16.026	48	75
1909	16	2019-12-10 16:24:16.037	11	25
1911	0	2019-12-10 16:24:16.334	0	38
1913	20	2019-12-10 16:24:16.344	14	30
1915	21	2019-12-10 16:24:16.353	15	32
1917	12	2019-12-10 16:24:16.363	8	18
1919	23	2019-12-10 16:24:16.373	16	35
1921	50	2019-12-10 16:24:16.384	35	75
1923	23	2019-12-10 16:24:16.394	16	35
1925	24	2019-12-10 16:24:16.405	20	35
1927	14	2019-12-10 16:24:16.417	10	22
1929	10	2019-12-10 16:24:16.428	7	15
1931	39	2019-12-10 16:24:16.438	33	52
1933	8	2019-12-10 16:24:16.447	5	12
1935	26	2019-12-10 16:24:16.456	18	40
1937	32	2019-12-10 16:24:16.465	22	48
1939	25	2019-12-10 16:24:16.474	17	38
2077	10	2019-12-10 16:33:24.118	7	15
2079	8	2019-12-10 16:33:24.13	5	12
2081	5	2019-12-10 16:33:24.144	3	8
2083	4	2019-12-10 16:33:24.154	2	6
2085	5	2019-12-10 16:33:24.163	3	8
2087	6	2019-12-10 16:33:24.172	3	15
2089	1.4	2019-12-10 16:33:24.182	0.9	3.5
2091	4	2019-12-10 16:33:24.191	2	6
2093	8	2019-12-10 16:33:24.202	5	12
2095	6	2019-12-10 16:33:24.212	4	10
2097	0.6	2019-12-10 16:33:24.222	0.3	2
2099	8	2019-12-10 16:33:24.232	5	12
2101	20	2019-12-10 16:33:24.242	14	30
2103	6	2019-12-10 16:33:24.251	4	10
2105	3	2019-12-10 16:33:24.261	2	8
2107	8	2019-12-10 16:33:24.271	5	12
2109	8	2019-12-10 16:33:24.283	5	12
2111	4	2019-12-10 16:33:24.293	2	6
2113	10	2019-12-10 16:33:24.304	7	15
2115	8	2019-12-10 16:33:24.335	5	12
2117	3	2019-12-10 16:33:24.345	2	5
2119	5	2019-12-10 16:33:24.354	3	8
2121	10	2019-12-10 16:33:24.363	7	15
2123	0.01	2019-12-10 16:33:24.372	0.01	0.5
2125	10	2019-12-10 16:33:24.381	7	15
2127	13	2019-12-10 16:33:24.391	9	20
2129	6	2019-12-10 16:33:24.399	4	10
2131	10	2019-12-10 16:33:24.409	7	15
2133	6	2019-12-10 16:33:24.419	4	10
2135	16	2019-12-10 16:33:24.429	11	25
2137	12	2019-12-10 16:33:24.439	8	18
2139	2	2019-12-10 16:33:24.447	1.3	5
2141	5	2019-12-10 16:33:24.924	3	8
2143	16	2019-12-10 16:33:24.933	11	25
2145	4	2019-12-10 16:33:24.942	2	6
2147	10	2019-12-10 16:33:24.95	7	15
2149	1.8	2019-12-10 16:33:24.96	1.1	4.5
2151	6	2019-12-10 16:33:24.968	4	10
2153	6	2019-12-10 16:33:24.977	4	10
2155	13	2019-12-10 16:33:24.986	9	20
2157	10	2019-12-10 16:33:24.994	7	15
2159	10	2019-12-10 16:33:25.003	7	15
2161	6	2019-12-10 16:33:25.011	4	10
2163	5	2019-12-10 16:33:25.02	3	8
2165	6	2019-12-10 16:33:25.027	4	10
2167	6	2019-12-10 16:33:25.036	4	10
2169	3	2019-12-10 16:33:25.045	2	5
2171	6	2019-12-10 16:33:25.053	4	10
2173	1.8	2019-12-10 16:33:25.061	1.1	4.5
2175	4	2019-12-10 16:33:25.07	2	6
2177	16	2019-12-10 16:33:25.078	11	25
2179	6	2019-12-10 16:33:25.087	4	10
2181	12	2019-12-10 16:33:25.099	8	18
2183	8	2019-12-10 16:33:25.111	5	12
2185	10	2019-12-10 16:33:25.122	7	15
2187	5	2019-12-10 16:33:25.131	3	8
2189	4	2019-12-10 16:33:25.14	2	6
2191	3	2019-12-10 16:33:25.148	2	5
2193	6	2019-12-10 16:33:25.157	4	10
2195	16	2019-12-10 16:33:25.166	14	22
2197	10	2019-12-10 16:33:25.175	7	15
2199	12	2019-12-10 16:33:25.185	8	18
2201	23	2019-12-10 16:33:25.193	16	35
2203	14	2019-12-10 16:33:25.202	10	22
2205	20	2019-12-10 16:33:25.21	14	30
2207	6	2019-12-10 16:33:25.22	4	10
2209	2	2019-12-10 16:33:25.229	1.5	6
1941	31	2019-12-10 16:33:22.982	26	45
1943	12	2019-12-10 16:33:22.995	8	18
1945	33	2019-12-10 16:33:23.005	27	48
1947	12	2019-12-10 16:33:23.015	8	18
1949	28	2019-12-10 16:33:23.026	19	42
1951	13	2019-12-10 16:33:23.037	9	20
1953	4	2019-12-10 16:33:23.049	2	6
1955	4	2019-12-10 16:33:23.059	2	10
1957	1.3	2019-12-10 16:33:23.068	0.6	4
1959	10	2019-12-10 16:33:23.077	7	15
1961	4	2019-12-10 16:33:23.087	2	6
1963	26	2019-12-10 16:33:23.096	18	40
1965	18	2019-12-10 16:33:23.105	13	28
1967	0.2	2019-12-10 16:33:23.114	0.1	2.5
1969	3	2019-12-10 16:33:23.122	2	8
1971	1.8	2019-12-10 16:33:23.131	1.1	4.5
1973	1.6	2019-12-10 16:33:23.141	1	4
1975	13	2019-12-10 16:33:23.153	9	20
1977	1.6	2019-12-10 16:33:23.162	1	4
1979	6	2019-12-10 16:33:23.171	4	10
1981	6	2019-12-10 16:33:23.181	4	10
1983	13	2019-12-10 16:33:23.19	9	20
1985	1.6	2019-12-10 16:33:23.199	1	4
1987	6	2019-12-10 16:33:23.208	4	10
1989	0.01	2019-12-10 16:33:23.216	0.01	0.75
1991	10	2019-12-10 16:33:23.225	7	15
1993	6	2019-12-10 16:33:23.234	4	10
1995	5	2019-12-10 16:33:23.242	3	8
1997	10	2019-12-10 16:33:23.25	7	15
1021	26	2019-12-10 16:24:09.308	18	40
1023	33	2019-12-10 16:24:09.319	29	45
1025	25	2019-12-10 16:24:09.33	17	38
1027	28	2019-12-10 16:24:09.341	24	38
1029	18	2019-12-10 16:24:09.351	13	28
1031	29	2019-12-10 16:24:09.362	24	42
1033	23	2019-12-10 16:24:09.373	16	35
1035	33	2019-12-10 16:24:09.383	29	45
1037	21	2019-12-10 16:24:09.393	15	32
1039	31	2019-12-10 16:24:09.403	27	42
1041	21	2019-12-10 16:24:09.413	17	30
1043	25	2019-12-10 16:24:09.423	17	38
1045	21	2019-12-10 16:24:09.432	15	32
1047	25	2019-12-10 16:24:09.441	17	38
1049	25	2019-12-10 16:24:09.45	17	38
1051	30	2019-12-10 16:24:09.459	26	40
1053	28	2019-12-10 16:24:09.468	23	40
1055	20	2019-12-10 16:24:09.477	14	30
1057	20	2019-12-10 16:24:09.485	14	30
1059	23	2019-12-10 16:24:09.494	16	35
1061	24	2019-12-10 16:24:09.503	20	35
1063	31	2019-12-10 16:24:09.511	27	42
1065	11	2019-12-10 16:24:09.519	7	28
1067	36	2019-12-10 16:24:09.528	32	45
1069	14	2019-12-10 16:24:09.537	10	22
1071	20	2019-12-10 16:24:09.547	14	30
1073	28	2019-12-10 16:24:09.558	23	40
1075	29	2019-12-10 16:24:09.567	24	42
1077	28	2019-12-10 16:24:09.577	24	38
1079	20	2019-12-10 16:24:09.585	14	30
1081	8	2019-12-10 16:24:09.594	5	20
1083	16	2019-12-10 16:24:09.603	11	25
1085	20	2019-12-10 16:24:09.612	14	30
1087	8	2019-12-10 16:24:09.62	5	20
1089	12	2019-12-10 16:24:09.628	8	32
1091	20	2019-12-10 16:24:09.636	14	30
1093	19	2019-12-10 16:24:09.645	16	28
1095	20	2019-12-10 16:24:09.652	14	30
1097	19	2019-12-10 16:24:09.661	16	28
1099	23	2019-12-10 16:24:09.67	16	35
1101	16	2019-12-10 16:24:09.68	11	25
1103	18	2019-12-10 16:24:09.69	13	28
1105	16	2019-12-10 16:24:09.701	11	25
1107	16	2019-12-10 16:24:09.711	11	25
1109	14	2019-12-10 16:24:09.721	10	22
1111	16	2019-12-10 16:24:10.116	11	25
1113	26	2019-12-10 16:24:10.124	22	38
1115	20	2019-12-10 16:24:10.134	14	30
1117	21	2019-12-10 16:24:10.143	15	32
1119	28	2019-12-10 16:24:10.151	23	40
1121	18	2019-12-10 16:24:10.161	13	28
1123	21	2019-12-10 16:24:10.17	15	32
1999	16	2019-12-10 16:33:23.259	11	25
2001	6	2019-12-10 16:33:23.269	4	10
2003	2	2019-12-10 16:33:23.277	1.3	5
2005	0.6	2019-12-10 16:33:23.286	0.3	2
2007	6	2019-12-10 16:33:23.296	4	10
2009	1.8	2019-12-10 16:33:23.306	1.1	4.5
2011	13	2019-12-10 16:33:23.314	9	20
2013	8	2019-12-10 16:33:23.323	5	12
2015	6	2019-12-10 16:33:23.333	4	10
2017	5	2019-12-10 16:33:23.342	3	8
2019	3	2019-12-10 16:33:23.351	2	5
2021	4	2019-12-10 16:33:23.36	2	6
2023	4	2019-12-10 16:33:23.368	2	6
2025	23	2019-12-10 16:33:23.378	16	35
2027	8	2019-12-10 16:33:23.388	5	12
2029	33	2019-12-10 16:33:23.397	29	45
2031	10	2019-12-10 16:33:23.407	7	15
2033	14	2019-12-10 16:33:23.424	10	22
2035	6	2019-12-10 16:33:23.433	4	10
2037	18	2019-12-10 16:33:23.444	13	28
2039	23	2019-12-10 16:33:23.453	16	35
2041	6	2019-12-10 16:33:23.949	4	10
2043	8	2019-12-10 16:33:23.959	5	12
2045	0.01	2019-12-10 16:33:23.968	0.01	0.5
2047	4	2019-12-10 16:33:23.977	2	6
2049	3	2019-12-10 16:33:23.985	2	8
2051	4	2019-12-10 16:33:23.994	2	6
2053	12	2019-12-10 16:33:24.004	8	18
2055	1.4	2019-12-10 16:33:24.012	0.9	3.5
2057	4	2019-12-10 16:33:24.021	2	6
2059	6	2019-12-10 16:33:24.029	4	10
2061	6	2019-12-10 16:33:24.039	4	10
2063	3	2019-12-10 16:33:24.048	2	5
2065	10	2019-12-10 16:33:24.057	7	15
2067	10	2019-12-10 16:33:24.069	7	15
2069	5	2019-12-10 16:33:24.078	3	8
2071	4	2019-12-10 16:33:24.088	2	6
2073	20	2019-12-10 16:33:24.098	14	30
2075	8	2019-12-10 16:33:24.108	5	12
2211	10	2019-12-10 16:33:25.238	7	15
2213	8	2019-12-10 16:33:25.248	5	12
2215	1.6	2019-12-10 16:33:25.257	1	4
2217	3	2019-12-10 16:33:25.265	2	8
2219	3	2019-12-10 16:33:25.274	2	5
2221	14	2019-12-10 16:33:25.281	10	22
2223	3	2019-12-10 16:33:25.29	2	5
2225	23	2019-12-10 16:33:25.3	16	35
2227	10	2019-12-10 16:33:25.31	7	15
2229	4	2019-12-10 16:33:25.321	2	6
2231	8	2019-12-10 16:33:25.329	5	12
2233	4	2019-12-10 16:33:25.338	2	6
2235	13	2019-12-10 16:33:25.347	9	20
2237	10	2019-12-10 16:33:25.356	7	15
2239	13	2019-12-10 16:33:25.365	9	20
2241	10	2019-12-10 16:33:25.757	7	15
2243	8	2019-12-10 16:33:25.767	5	12
2245	8	2019-12-10 16:33:25.777	5	12
2247	10	2019-12-10 16:33:25.788	7	15
2249	3	2019-12-10 16:33:25.798	2	5
2251	1.8	2019-12-10 16:33:25.807	1.1	4.5
2253	4	2019-12-10 16:33:25.816	2	6
2255	20	2019-12-10 16:33:25.826	14	30
2257	6	2019-12-10 16:33:25.835	4	10
2259	0.01	2019-12-10 16:33:25.845	0.01	0.5
2261	5	2019-12-10 16:33:25.854	3	8
2263	1.6	2019-12-10 16:33:25.863	1	4
2265	8	2019-12-10 16:33:25.872	5	12
2267	6	2019-12-10 16:33:25.88	4	10
2269	10	2019-12-10 16:33:25.89	7	15
2271	5	2019-12-10 16:33:25.898	3	8
2273	10	2019-12-10 16:33:25.907	7	15
2275	6	2019-12-10 16:33:25.916	4	10
2277	23	2019-12-10 16:33:25.926	16	35
2279	3	2019-12-10 16:33:25.934	1.9	12
2281	3	2019-12-10 16:33:25.942	2	5
2283	12	2019-12-10 16:33:25.95	8	18
2285	4	2019-12-10 16:33:25.959	2	6
2287	8	2019-12-10 16:33:25.967	5	12
2289	6	2019-12-10 16:33:25.975	4	10
2291	10	2019-12-10 16:33:25.986	7	15
2293	10	2019-12-10 16:33:25.998	7	15
2295	8	2019-12-10 16:33:26.008	5	12
2297	10	2019-12-10 16:33:26.017	7	15
2299	18	2019-12-10 16:33:26.026	13	28
2301	3	2019-12-10 16:33:26.035	2	5
2303	6	2019-12-10 16:33:26.046	4	10
2305	8	2019-12-10 16:33:26.056	5	12
2307	8	2019-12-10 16:33:26.066	5	12
2309	12	2019-12-10 16:33:26.075	8	18
2311	13	2019-12-10 16:33:26.084	9	20
2313	10	2019-12-10 16:33:26.093	7	15
2315	8	2019-12-10 16:33:26.107	5	12
2317	8	2019-12-10 16:33:26.121	5	12
2319	1.6	2019-12-10 16:33:26.132	1	4
2321	13	2019-12-10 16:33:26.143	9	20
2323	5	2019-12-10 16:33:26.153	3	8
2325	3	2019-12-10 16:33:26.164	2	5
2327	14	2019-12-10 16:33:26.174	10	22
2329	6	2019-12-10 16:33:26.185	4	10
2331	13	2019-12-10 16:33:26.196	9	20
2333	13	2019-12-10 16:33:26.207	9	20
2335	5	2019-12-10 16:33:26.218	3	8
2337	8	2019-12-10 16:33:26.229	5	12
2339	31	2019-12-10 16:33:26.241	27	42
2341	1.6	2019-12-10 16:33:26.665	1	4
2343	25	2019-12-10 16:33:26.674	17	38
2345	20	2019-12-10 16:33:26.683	14	30
2347	16	2019-12-10 16:33:26.693	11	25
2349	8	2019-12-10 16:33:26.704	5	12
2351	1.6	2019-12-10 16:33:26.714	1	4
2353	15	2019-12-10 16:33:26.724	12	22
2355	23	2019-12-10 16:33:26.734	16	35
2357	10	2019-12-10 16:33:26.744	7	15
2359	12	2019-12-10 16:33:26.754	8	18
2361	10	2019-12-10 16:33:26.763	7	15
2363	1.2	2019-12-10 16:33:26.772	0.7	3
2365	8	2019-12-10 16:33:26.782	5	12
2367	3	2019-12-10 16:33:26.792	2	5
2369	3	2019-12-10 16:33:26.803	2	5
2371	10	2019-12-10 16:33:26.813	7	15
2373	12	2019-12-10 16:33:26.823	8	18
2375	20	2019-12-10 16:33:26.833	14	30
2377	8	2019-12-10 16:33:26.844	5	12
2379	14	2019-12-10 16:33:26.854	10	22
2381	10	2019-12-10 16:33:26.863	7	15
2383	8	2019-12-10 16:33:26.873	5	12
2385	6	2019-12-10 16:33:26.883	4	10
2387	14	2019-12-10 16:33:26.891	10	22
2389	8	2019-12-10 16:33:26.9	5	12
2391	14	2019-12-10 16:33:26.909	10	22
2393	14	2019-12-10 16:33:26.918	10	22
2395	15	2019-12-10 16:33:26.929	12	22
2397	10	2019-12-10 16:33:26.939	7	15
2399	13	2019-12-10 16:33:26.949	9	20
2401	5	2019-12-10 16:33:26.959	3	8
2403	12	2019-12-10 16:33:26.968	8	18
2405	5	2019-12-10 16:33:26.982	3	8
2407	18	2019-12-10 16:33:26.992	13	28
2409	4	2019-12-10 16:33:27.002	2	6
2411	6	2019-12-10 16:33:27.012	4	10
2413	19	2019-12-10 16:33:27.024	16	28
2415	10	2019-12-10 16:33:27.033	7	15
2417	4	2019-12-10 16:33:27.044	2	6
2419	1.4	2019-12-10 16:33:27.054	0.9	3.5
2421	6	2019-12-10 16:33:27.065	4	10
2423	1.8	2019-12-10 16:33:27.075	1.1	4.5
2425	12	2019-12-10 16:33:27.085	8	18
2427	12	2019-12-10 16:33:27.097	8	18
2429	3	2019-12-10 16:33:27.108	2	5
2431	14	2019-12-10 16:33:27.117	10	22
2433	4	2019-12-10 16:33:27.128	2	6
2435	21	2019-12-10 16:33:27.139	15	32
2437	2	2019-12-10 16:33:27.149	1.3	5
2439	14	2019-12-10 16:33:27.159	10	22
2441	12	2019-12-10 16:33:28.794	8	18
2443	10	2019-12-10 16:33:28.804	7	15
2445	1.6	2019-12-10 16:33:28.814	1	4
2447	21	2019-12-10 16:33:28.825	15	32
2449	1.2	2019-12-10 16:33:28.836	0.7	3
2451	14	2019-12-10 16:33:28.846	10	22
2453	8	2019-12-10 16:33:28.858	5	12
2455	6	2019-12-10 16:33:28.868	4	10
2457	5	2019-12-10 16:33:28.879	3	8
2459	20	2019-12-10 16:33:28.89	14	30
2461	5	2019-12-10 16:33:28.9	3	8
2463	12	2019-12-10 16:33:28.91	8	18
2465	16	2019-12-10 16:33:28.92	11	25
2467	31	2019-12-10 16:33:28.93	26	45
2469	10	2019-12-10 16:33:28.939	7	15
2471	6	2019-12-10 16:33:28.949	4	10
2473	5	2019-12-10 16:33:28.959	3	8
2475	18	2019-12-10 16:33:28.968	13	28
2477	0.2	2019-12-10 16:33:28.978	0.1	0.75
2479	5	2019-12-10 16:33:28.988	3	8
2481	8	2019-12-10 16:33:28.998	5	12
2483	21	2019-12-10 16:33:29.008	15	32
2485	5	2019-12-10 16:33:29.017	3	8
2487	12	2019-12-10 16:33:29.026	8	18
2489	3	2019-12-10 16:33:29.037	1.9	12
2491	5	2019-12-10 16:33:29.048	3	8
2493	3	2019-12-10 16:33:29.058	2	5
2495	5	2019-12-10 16:33:29.068	3	8
2497	4	2019-12-10 16:33:29.077	2	6
2499	10	2019-12-10 16:33:29.087	7	15
2501	10	2019-12-10 16:33:29.098	7	15
2503	3	2019-12-10 16:33:29.109	2	5
2505	6	2019-12-10 16:33:29.119	4	10
2507	8	2019-12-10 16:33:29.13	5	12
2509	3	2019-12-10 16:33:29.14	2	5
2511	8	2019-12-10 16:33:29.15	5	12
2513	14	2019-12-10 16:33:29.161	10	22
2515	23	2019-12-10 16:33:29.171	16	35
2517	6	2019-12-10 16:33:29.182	4	10
2519	16	2019-12-10 16:33:29.192	11	25
2521	10	2019-12-10 16:33:29.202	7	15
2523	10	2019-12-10 16:33:29.213	7	15
2525	8	2019-12-10 16:33:29.223	5	12
2527	8	2019-12-10 16:33:29.232	5	12
2529	14	2019-12-10 16:33:29.243	10	22
2531	0.8	2019-12-10 16:33:29.253	0.4	2.5
2533	18	2019-12-10 16:33:29.262	13	28
2535	10	2019-12-10 16:33:29.271	7	15
2537	20	2019-12-10 16:33:29.281	14	30
2539	5	2019-12-10 16:33:29.298	3	8
2541	13	2019-12-10 16:33:31.385	9	20
2543	25	2019-12-10 16:33:31.396	17	38
2545	10	2019-12-10 16:33:31.407	7	15
2547	6	2019-12-10 16:33:31.421	4	10
2549	10	2019-12-10 16:33:31.439	7	15
2551	13	2019-12-10 16:33:31.449	9	20
2553	10	2019-12-10 16:33:31.46	7	15
2555	8	2019-12-10 16:33:31.473	5	12
2557	0.8	2019-12-10 16:33:31.488	0.5	2
2559	2	2019-12-10 16:33:31.498	1.5	6
2561	13	2019-12-10 16:33:31.509	9	20
2563	10	2019-12-10 16:33:31.521	7	15
2565	3	2019-12-10 16:33:31.531	2	5
2567	5	2019-12-10 16:33:31.541	3	8
2569	12	2019-12-10 16:33:31.551	8	18
2571	8	2019-12-10 16:33:31.56	5	12
2573	6	2019-12-10 16:33:31.569	4	10
2575	8	2019-12-10 16:33:31.578	5	12
2577	13	2019-12-10 16:33:31.587	9	20
2579	5	2019-12-10 16:33:31.597	3	8
2581	12	2019-12-10 16:33:31.607	8	18
2583	5	2019-12-10 16:33:31.616	3	8
2585	8	2019-12-10 16:33:31.626	5	12
2587	5	2019-12-10 16:33:31.635	3	8
2589	8	2019-12-10 16:33:31.644	5	12
2591	10	2019-12-10 16:33:31.654	7	15
2593	10	2019-12-10 16:33:31.664	7	15
2595	3	2019-12-10 16:33:31.674	2	5
2597	3	2019-12-10 16:33:31.683	1.6	10
2599	5	2019-12-10 16:33:31.7	3	8
2601	4	2019-12-10 16:33:31.712	2	6
2603	13	2019-12-10 16:33:31.724	9	20
2605	8	2019-12-10 16:33:31.735	5	12
2607	10	2019-12-10 16:33:31.747	7	15
2609	5	2019-12-10 16:33:31.758	3	8
2611	0.8	2019-12-10 16:33:31.771	0.4	2.5
2613	16	2019-12-10 16:33:31.785	11	25
2615	5	2019-12-10 16:33:31.796	3	8
2617	8	2019-12-10 16:33:31.807	5	12
2619	6	2019-12-10 16:33:31.817	4	10
2621	16	2019-12-10 16:33:31.827	11	25
2623	6	2019-12-10 16:33:31.838	4	10
2625	26	2019-12-10 16:33:31.85	22	38
2627	4	2019-12-10 16:33:31.863	2	6
2629	8	2019-12-10 16:33:31.873	5	12
2631	10	2019-12-10 16:33:31.884	7	15
2633	1.6	2019-12-10 16:33:31.895	1	4
2635	6	2019-12-10 16:33:31.906	4	10
2637	5	2019-12-10 16:33:31.917	3	8
2639	1.6	2019-12-10 16:33:31.927	0.8	5
2641	8	2019-12-10 16:33:32.309	5	12
2643	3	2019-12-10 16:33:32.321	2	5
2645	12	2019-12-10 16:33:32.338	8	18
2647	8	2019-12-10 16:33:32.349	5	12
2649	13	2019-12-10 16:33:32.359	9	20
2651	8	2019-12-10 16:33:32.37	5	12
2653	10	2019-12-10 16:33:32.381	7	15
2655	5	2019-12-10 16:33:32.392	3	8
2657	4	2019-12-10 16:33:32.403	2	6
2659	10	2019-12-10 16:33:32.414	7	15
2661	0.01	2019-12-10 16:33:32.426	0.01	0.5
2663	8	2019-12-10 16:33:32.437	5	12
2665	8	2019-12-10 16:33:32.448	5	12
2667	1.6	2019-12-10 16:33:32.459	1	4
2669	26	2019-12-10 16:33:32.471	18	40
2671	8	2019-12-10 16:33:32.482	5	12
2673	6	2019-12-10 16:33:32.493	4	10
2675	16	2019-12-10 16:33:32.504	11	25
2677	10	2019-12-10 16:33:32.515	7	15
2679	10	2019-12-10 16:33:32.526	7	15
2681	8	2019-12-10 16:33:32.536	5	12
2683	8	2019-12-10 16:33:32.55	5	12
2685	21	2019-12-10 16:33:32.561	15	32
2687	8	2019-12-10 16:33:32.572	5	12
2689	3	2019-12-10 16:33:32.583	2	5
2691	13	2019-12-10 16:33:32.594	9	20
2693	5	2019-12-10 16:33:32.604	3	8
2695	4	2019-12-10 16:33:32.614	2	6
2697	3	2019-12-10 16:33:32.623	2	5
2699	8	2019-12-10 16:33:32.633	5	12
2701	10	2019-12-10 16:33:32.643	7	15
2703	16	2019-12-10 16:33:32.655	11	25
2705	12	2019-12-10 16:33:32.666	8	18
2707	0	2019-12-10 16:33:32.677	0	1.5
2709	8	2019-12-10 16:33:32.688	5	12
2711	0.8	2019-12-10 16:33:32.702	0.4	2.5
2713	12	2019-12-10 16:33:32.713	8	18
2715	13	2019-12-10 16:33:32.725	9	20
2717	12	2019-12-10 16:33:32.736	8	18
2719	8	2019-12-10 16:33:32.748	5	12
2721	6	2019-12-10 16:33:32.759	4	10
2723	4	2019-12-10 16:33:32.77	2	6
2725	8	2019-12-10 16:33:32.781	5	12
2727	16	2019-12-10 16:33:32.792	11	25
2729	6	2019-12-10 16:33:32.803	4	10
2731	12	2019-12-10 16:33:32.815	8	18
2733	2	2019-12-10 16:33:32.826	1.2	8
2735	10	2019-12-10 16:33:32.836	7	15
2737	6	2019-12-10 16:33:32.848	4	10
2739	6	2019-12-10 16:33:32.859	4	10
2741	8	2019-12-10 16:33:33.201	5	12
2743	4	2019-12-10 16:33:33.211	2	6
2745	14	2019-12-10 16:33:33.221	10	22
2747	13	2019-12-10 16:33:33.232	9	20
2749	5	2019-12-10 16:33:33.243	3	8
2751	12	2019-12-10 16:33:33.255	8	18
2753	5	2019-12-10 16:33:33.267	3	8
2755	8	2019-12-10 16:33:33.28	5	12
2757	10	2019-12-10 16:33:33.294	7	15
2759	10	2019-12-10 16:33:33.306	7	15
2761	16	2019-12-10 16:33:33.316	11	25
2763	4	2019-12-10 16:33:33.326	2	6
2765	10	2019-12-10 16:33:33.336	7	15
2767	6	2019-12-10 16:33:33.346	4	10
2769	13	2019-12-10 16:33:33.357	9	20
2771	1	2019-12-10 16:33:33.368	0.6	2.5
2773	6	2019-12-10 16:33:33.379	4	10
2775	13	2019-12-10 16:33:33.39	9	20
2777	10	2019-12-10 16:33:33.401	7	15
2779	10	2019-12-10 16:33:33.414	7	15
2781	13	2019-12-10 16:33:33.427	9	20
2783	13	2019-12-10 16:33:33.441	9	20
2785	14	2019-12-10 16:33:33.453	10	22
2787	5	2019-12-10 16:33:33.464	3	8
2789	10	2019-12-10 16:33:33.476	7	15
2791	6	2019-12-10 16:33:33.487	4	10
2793	12	2019-12-10 16:33:33.499	8	18
2795	10	2019-12-10 16:33:33.511	7	15
2797	6	2019-12-10 16:33:33.522	4	10
2799	3	2019-12-10 16:33:33.536	2	5
2801	23	2019-12-10 16:33:33.548	16	35
2803	12	2019-12-10 16:33:33.559	8	18
2805	6	2019-12-10 16:33:33.571	4	10
2807	12	2019-12-10 16:33:33.582	8	18
2809	12	2019-12-10 16:33:33.593	8	18
2811	13	2019-12-10 16:33:33.605	9	20
2813	8	2019-12-10 16:33:33.621	5	12
2815	26	2019-12-10 16:33:33.635	18	40
2817	4	2019-12-10 16:33:33.658	2	6
2819	10	2019-12-10 16:33:33.683	7	15
2821	6	2019-12-10 16:33:33.7	4	10
2823	8	2019-12-10 16:33:33.717	5	12
2825	6	2019-12-10 16:33:33.733	4	10
2827	4	2019-12-10 16:33:33.747	2	6
2829	13	2019-12-10 16:33:33.762	9	20
2831	8	2019-12-10 16:33:33.776	5	12
2833	12	2019-12-10 16:33:33.789	8	18
2835	8	2019-12-10 16:33:33.803	5	12
2837	8	2019-12-10 16:33:33.815	5	12
2839	5	2019-12-10 16:33:33.827	3	8
2841	5	2019-12-10 16:33:34.187	3	8
2843	4	2019-12-10 16:33:34.198	2	6
2845	5	2019-12-10 16:33:34.208	3	8
2847	4	2019-12-10 16:33:34.219	2	6
2849	10	2019-12-10 16:33:34.23	7	15
2851	4	2019-12-10 16:33:34.24	2	6
2853	10	2019-12-10 16:33:34.251	7	15
2855	4	2019-12-10 16:33:34.262	2	6
2857	10	2019-12-10 16:33:34.274	7	15
2859	16	2019-12-10 16:33:34.286	11	25
2861	10	2019-12-10 16:33:34.298	7	15
2863	5	2019-12-10 16:33:34.31	3	8
2865	8	2019-12-10 16:33:34.321	5	12
2867	8	2019-12-10 16:33:34.333	5	12
2869	5	2019-12-10 16:33:34.347	3	8
2871	1.9	2019-12-10 16:33:34.359	0.9	6
2873	13	2019-12-10 16:33:34.371	9	20
2875	8	2019-12-10 16:33:34.384	5	12
2877	21	2019-12-10 16:33:34.409	15	32
2879	18	2019-12-10 16:33:34.429	13	28
2881	5	2019-12-10 16:33:34.443	3	8
2883	4	2019-12-10 16:33:34.458	2	6
2885	21	2019-12-10 16:33:34.472	15	32
2887	10	2019-12-10 16:33:34.485	7	15
2889	10	2019-12-10 16:33:34.498	7	15
2891	6	2019-12-10 16:33:34.512	3	15
2893	8	2019-12-10 16:33:34.525	5	12
2895	12	2019-12-10 16:33:34.543	8	18
2897	6	2019-12-10 16:33:34.558	4	10
2899	10	2019-12-10 16:33:34.582	7	15
2901	15	2019-12-10 16:33:34.604	12	22
2903	5	2019-12-10 16:33:34.623	3	8
2905	5	2019-12-10 16:33:34.64	3	8
2907	6	2019-12-10 16:33:34.652	4	10
2909	10	2019-12-10 16:33:34.665	7	15
2911	14	2019-12-10 16:33:34.677	10	22
2913	6	2019-12-10 16:33:34.688	4	10
2915	6	2019-12-10 16:33:34.699	4	10
2917	10	2019-12-10 16:33:34.713	7	15
2919	5	2019-12-10 16:33:34.724	3	8
2921	8	2019-12-10 16:33:34.734	5	12
2923	14	2019-12-10 16:33:34.745	10	22
2925	5	2019-12-10 16:33:34.756	3	8
2927	12	2019-12-10 16:33:34.769	8	18
2929	16	2019-12-10 16:33:34.781	11	25
2931	1.6	2019-12-10 16:33:34.792	1	4
2933	10	2019-12-10 16:33:34.802	7	15
2935	8	2019-12-10 16:33:34.814	5	12
2937	4	2019-12-10 16:33:34.826	2	6
2939	4	2019-12-10 16:33:34.837	2	6
2941	10	2019-12-10 16:33:35.163	7	15
2943	21	2019-12-10 16:33:35.179	15	32
2945	13	2019-12-10 16:33:35.195	9	20
2947	5	2019-12-10 16:33:35.213	3	8
2949	5	2019-12-10 16:33:35.23	3	8
2951	13	2019-12-10 16:33:35.246	9	20
2953	5	2019-12-10 16:33:35.26	3	8
2955	13	2019-12-10 16:33:35.274	9	20
2957	5	2019-12-10 16:33:35.289	3	8
2959	3	2019-12-10 16:33:35.303	2	5
2961	10	2019-12-10 16:33:35.315	7	15
2963	12	2019-12-10 16:33:35.329	8	18
2965	4	2019-12-10 16:33:35.344	2	6
2967	3	2019-12-10 16:33:35.357	2	5
2969	10	2019-12-10 16:33:35.371	7	15
2971	1.4	2019-12-10 16:33:35.383	0.9	3.5
2973	5	2019-12-10 16:33:35.397	3	8
2975	12	2019-12-10 16:33:35.411	8	18
2977	13	2019-12-10 16:33:35.459	9	20
2979	10	2019-12-10 16:33:35.473	7	15
2981	8	2019-12-10 16:33:35.485	5	12
2983	25	2019-12-10 16:33:35.498	17	38
2985	6	2019-12-10 16:33:35.511	4	10
2987	8	2019-12-10 16:33:35.524	5	12
2989	8	2019-12-10 16:33:35.537	5	12
2991	5	2019-12-10 16:33:35.549	3	8
2993	5	2019-12-10 16:33:35.564	3	8
2995	6	2019-12-10 16:33:35.575	4	10
2997	16	2019-12-10 16:33:35.588	11	25
2999	3	2019-12-10 16:33:35.6	2	5
3001	8	2019-12-10 16:33:35.615	5	12
3003	8	2019-12-10 16:33:35.627	5	12
3005	8	2019-12-10 16:33:35.64	5	12
3007	5	2019-12-10 16:33:35.652	3	8
3009	26	2019-12-10 16:33:35.665	22	38
3011	3	2019-12-10 16:33:35.677	2	5
3013	8	2019-12-10 16:33:35.689	5	12
3015	6	2019-12-10 16:33:35.701	4	10
3017	3	2019-12-10 16:33:35.717	2	5
3019	4	2019-12-10 16:33:35.732	2	6
3021	18	2019-12-10 16:33:35.747	13	28
3023	5	2019-12-10 16:33:35.762	3	8
3025	4	2019-12-10 16:33:35.778	2	6
3027	12	2019-12-10 16:33:35.794	8	18
3029	6	2019-12-10 16:33:35.808	4	10
3031	5	2019-12-10 16:33:35.824	3	8
3033	3	2019-12-10 16:33:35.837	2	5
3035	10	2019-12-10 16:33:35.851	7	15
3037	14	2019-12-10 16:33:35.865	10	22
3039	3	2019-12-10 16:33:35.878	2	5
3041	5	2019-12-10 16:33:36.221	3	8
3043	12	2019-12-10 16:33:36.233	8	18
3045	10	2019-12-10 16:33:36.245	7	15
3047	6	2019-12-10 16:33:36.258	4	10
3049	6	2019-12-10 16:33:36.271	4	10
3051	5	2019-12-10 16:33:36.284	3	8
3053	13	2019-12-10 16:33:36.297	9	20
3055	4	2019-12-10 16:33:36.31	2	6
3057	5	2019-12-10 16:33:36.323	3	8
3059	4	2019-12-10 16:33:36.335	2	6
3061	2	2019-12-10 16:33:36.348	1.3	5
3063	0.6	2019-12-10 16:33:36.36	0.3	2
3065	4	2019-12-10 16:33:36.375	2	6
3067	6	2019-12-10 16:33:36.392	4	10
3069	8	2019-12-10 16:33:36.405	5	12
3071	3	2019-12-10 16:33:36.418	2	5
3073	5	2019-12-10 16:33:36.432	3	8
3075	21	2019-12-10 16:33:36.446	15	32
3077	5	2019-12-10 16:33:36.46	3	8
3079	5	2019-12-10 16:33:36.473	3	8
3081	4	2019-12-10 16:33:36.484	2	6
3083	6	2019-12-10 16:33:36.495	4	10
3085	13	2019-12-10 16:33:36.511	9	20
3087	3	2019-12-10 16:33:36.523	2	5
3089	5	2019-12-10 16:33:36.536	3	8
3091	5	2019-12-10 16:33:36.549	3	8
3093	18	2019-12-10 16:33:36.561	13	28
3095	8	2019-12-10 16:33:36.577	5	12
3097	10	2019-12-10 16:33:36.591	7	15
3099	6	2019-12-10 16:33:36.605	4	10
3101	5	2019-12-10 16:33:36.619	3	8
3103	14	2019-12-10 16:33:36.635	10	22
3105	5	2019-12-10 16:33:36.65	3	8
3107	5	2019-12-10 16:33:36.666	3	8
3109	5	2019-12-10 16:33:36.679	3	8
3111	25	2019-12-10 16:33:36.691	17	38
3113	23	2019-12-10 16:33:36.703	16	35
3115	3	2019-12-10 16:33:36.717	2	5
3117	8	2019-12-10 16:33:36.731	5	12
3119	4	2019-12-10 16:33:36.743	2	6
3121	8	2019-12-10 16:33:36.756	5	12
3123	5	2019-12-10 16:33:36.769	3	8
3125	6	2019-12-10 16:33:36.781	4	10
3127	20	2019-12-10 16:33:36.795	14	30
3129	3	2019-12-10 16:33:36.808	2	5
3131	17	2019-12-10 16:33:36.823	14	25
3133	5	2019-12-10 16:33:36.84	3	8
3135	5	2019-12-10 16:33:36.855	3	8
3137	16	2019-12-10 16:33:36.867	11	25
3139	8	2019-12-10 16:33:36.88	5	12
3141	8	2019-12-10 16:33:37.365	5	12
3143	4	2019-12-10 16:33:37.381	2	6
3145	3	2019-12-10 16:33:37.397	2	5
3147	16	2019-12-10 16:33:37.41	11	25
3149	5	2019-12-10 16:33:37.423	3	8
3151	0.6	2019-12-10 16:33:37.436	0.3	2
3153	13	2019-12-10 16:33:37.45	9	20
3155	4	2019-12-10 16:33:37.465	2	6
3157	0.6	2019-12-10 16:33:37.478	0.3	2
3159	13	2019-12-10 16:33:37.491	9	20
3161	2	2019-12-10 16:33:37.503	1.3	5
3163	8	2019-12-10 16:33:37.516	5	12
3165	25	2019-12-10 16:33:37.529	17	38
3167	5	2019-12-10 16:33:37.542	3	8
3169	3	2019-12-10 16:33:37.555	2	5
3171	6	2019-12-10 16:33:37.57	4	10
3173	10	2019-12-10 16:33:37.584	7	15
3175	40	2019-12-10 16:33:37.599	33	58
3177	12	2019-12-10 16:33:37.613	8	18
3179	4	2019-12-10 16:33:37.626	2	6
3181	8	2019-12-10 16:33:37.639	5	12
3183	26	2019-12-10 16:33:37.653	18	40
3185	18	2019-12-10 16:33:37.666	13	28
3187	8	2019-12-10 16:33:37.68	5	12
3189	6	2019-12-10 16:33:37.693	4	10
3191	23	2019-12-10 16:33:37.708	16	35
3193	8	2019-12-10 16:33:37.725	5	12
3195	4	2019-12-10 16:33:37.742	2	6
3197	12	2019-12-10 16:33:37.757	8	18
3199	13	2019-12-10 16:33:37.771	9	20
3201	10	2019-12-10 16:33:37.787	7	15
3203	5	2019-12-10 16:33:37.8	3	8
3205	5	2019-12-10 16:33:37.812	3	8
3207	4	2019-12-10 16:33:37.824	2	6
3209	5	2019-12-10 16:33:37.835	3	8
3211	8	2019-12-10 16:33:37.848	5	12
3213	2	2019-12-10 16:33:37.86	1.5	6
3215	23	2019-12-10 16:33:37.871	16	35
3217	4	2019-12-10 16:33:37.883	2	6
3219	6	2019-12-10 16:33:37.894	4	10
3221	21	2019-12-10 16:33:37.905	15	32
3223	1.6	2019-12-10 16:33:37.916	1	4
3225	5	2019-12-10 16:33:37.927	3	8
3227	5	2019-12-10 16:33:37.939	3	8
3229	14	2019-12-10 16:33:37.95	10	22
3231	12	2019-12-10 16:33:37.961	8	18
3233	10	2019-12-10 16:33:37.973	7	15
3235	5	2019-12-10 16:33:37.985	3	8
3237	8	2019-12-10 16:33:37.998	5	12
3239	8	2019-12-10 16:33:38.01	5	12
3241	2	2019-12-10 16:33:38.425	1.3	5
3243	8	2019-12-10 16:33:38.437	5	12
3245	2	2019-12-10 16:33:38.448	1.5	6
3247	4	2019-12-10 16:33:38.461	2	6
3249	8	2019-12-10 16:33:38.472	5	12
3251	20	2019-12-10 16:33:38.484	14	30
3253	5	2019-12-10 16:33:38.496	3	8
3255	4	2019-12-10 16:33:38.509	2	6
3257	4	2019-12-10 16:33:38.523	2	6
3259	16	2019-12-10 16:33:38.539	11	25
3261	5	2019-12-10 16:33:38.553	3	8
3263	5	2019-12-10 16:33:38.564	3	8
3265	8	2019-12-10 16:33:38.575	5	12
3267	10	2019-12-10 16:33:38.587	7	15
3269	8	2019-12-10 16:33:38.599	5	12
3271	5	2019-12-10 16:33:38.611	3	8
3273	14	2019-12-10 16:33:38.623	10	22
3275	12	2019-12-10 16:33:38.636	8	18
3277	4	2019-12-10 16:33:38.648	2	6
3279	5	2019-12-10 16:33:38.661	3	8
3281	5	2019-12-10 16:33:38.673	3	8
3283	8	2019-12-10 16:33:38.685	5	12
3285	13	2019-12-10 16:33:38.698	9	20
3287	10	2019-12-10 16:33:38.712	7	15
3289	13	2019-12-10 16:33:38.726	9	20
3291	6	2019-12-10 16:33:38.74	4	10
3293	21	2019-12-10 16:33:38.755	15	32
3295	4	2019-12-10 16:33:38.768	2	6
3297	49	2019-12-10 16:33:38.785	40	70
3299	10	2019-12-10 16:33:38.799	7	15
3301	8	2019-12-10 16:33:38.815	5	12
3303	6	2019-12-10 16:33:38.828	4	10
3305	16	2019-12-10 16:33:38.84	11	25
3307	3	2019-12-10 16:33:38.853	2	5
3309	12	2019-12-10 16:33:38.865	8	18
3311	12	2019-12-10 16:33:38.878	8	18
3313	6	2019-12-10 16:33:38.891	4	10
3315	6	2019-12-10 16:33:38.902	4	10
3317	4	2019-12-10 16:33:38.915	2	6
3319	12	2019-12-10 16:33:38.929	8	18
3321	10	2019-12-10 16:33:38.941	7	15
3323	2	2019-12-10 16:33:38.954	1.5	6
3325	14	2019-12-10 16:33:38.968	10	22
3327	16	2019-12-10 16:33:38.98	11	25
3329	60	2019-12-10 16:33:38.993	42	90
3331	10	2019-12-10 16:33:39.006	7	15
3333	5	2019-12-10 16:33:39.018	3	8
3335	4	2019-12-10 16:33:39.031	2	6
3337	14	2019-12-10 16:33:39.043	10	22
3339	18	2019-12-10 16:33:39.055	13	28
3341	12	2019-12-10 16:33:39.411	8	18
3343	8	2019-12-10 16:33:39.427	5	12
3345	8	2019-12-10 16:33:39.441	5	12
3347	10	2019-12-10 16:33:39.454	7	15
3349	13	2019-12-10 16:33:39.467	9	20
3351	10	2019-12-10 16:33:39.48	7	15
3353	5	2019-12-10 16:33:39.492	3	8
3355	5	2019-12-10 16:33:39.505	3	8
3357	12	2019-12-10 16:33:39.518	8	18
3359	5	2019-12-10 16:33:39.532	3	8
3361	8	2019-12-10 16:33:39.545	5	12
3363	6	2019-12-10 16:33:39.558	4	10
3365	2	2019-12-10 16:33:39.571	1.3	5
3367	8	2019-12-10 16:33:39.584	5	12
3369	5	2019-12-10 16:33:39.6	3	8
3371	12	2019-12-10 16:33:39.615	8	18
3373	5	2019-12-10 16:33:39.632	3	8
3375	28	2019-12-10 16:33:39.648	19	42
3377	4	2019-12-10 16:33:39.662	2	6
3379	3	2019-12-10 16:33:39.68	2	5
3381	4	2019-12-10 16:33:39.695	2	6
3383	4	2019-12-10 16:33:39.714	2	6
3385	5	2019-12-10 16:33:39.734	3	8
3387	5	2019-12-10 16:33:39.75	3	8
3389	13	2019-12-10 16:33:39.765	9	20
3391	13	2019-12-10 16:33:39.781	9	20
3393	3	2019-12-10 16:33:39.798	2	5
3395	5	2019-12-10 16:33:39.813	3	8
3397	4	2019-12-10 16:33:39.83	2	6
3399	8	2019-12-10 16:33:39.844	5	12
3401	12	2019-12-10 16:33:39.858	8	18
3403	1.2	2019-12-10 16:33:39.87	0.7	3
3405	4	2019-12-10 16:33:39.883	2	6
3407	12	2019-12-10 16:33:39.897	8	18
3409	5	2019-12-10 16:33:39.915	3	8
3411	5	2019-12-10 16:33:39.928	3	8
3413	6	2019-12-10 16:33:39.942	4	10
3415	14	2019-12-10 16:33:39.955	10	22
3417	4	2019-12-10 16:33:39.97	2	6
3419	16	2019-12-10 16:33:39.982	11	25
3421	13	2019-12-10 16:33:39.995	9	20
3423	22	2019-12-10 16:33:40.008	18	32
3425	2	2019-12-10 16:33:40.021	1.3	5
3427	13	2019-12-10 16:33:40.033	9	20
3429	6	2019-12-10 16:33:40.046	4	10
3431	5	2019-12-10 16:33:40.059	3	8
3433	5	2019-12-10 16:33:40.071	3	8
3435	2	2019-12-10 16:33:40.083	1.3	5
3437	2	2019-12-10 16:33:40.098	1.3	5
3439	14	2019-12-10 16:33:40.114	11	20
3441	8	2019-12-10 16:33:40.473	5	12
3443	13	2019-12-10 16:33:40.486	9	20
3445	3	2019-12-10 16:33:40.498	2	5
3447	17	2019-12-10 16:33:40.511	14	25
3449	5	2019-12-10 16:33:40.524	3	8
3451	6	2019-12-10 16:33:40.537	4	10
3453	4	2019-12-10 16:33:40.55	2	6
3455	13	2019-12-10 16:33:40.564	9	20
3457	2	2019-12-10 16:33:40.577	1.3	5
3459	6	2019-12-10 16:33:40.59	4	10
3461	8	2019-12-10 16:33:40.603	5	12
3463	8	2019-12-10 16:33:40.617	5	12
3465	6	2019-12-10 16:33:40.631	4	10
3467	12	2019-12-10 16:33:40.646	8	18
3469	3	2019-12-10 16:33:40.661	2	5
3471	5	2019-12-10 16:33:40.677	3	8
3473	8	2019-12-10 16:33:40.691	5	12
3475	192	2019-12-10 16:33:40.704	175	240
3477	6	2019-12-10 16:33:40.718	4	10
3479	4	2019-12-10 16:33:40.731	2	6
3481	26	2019-12-10 16:33:40.745	18	40
3483	5	2019-12-10 16:33:40.759	3	8
3485	18	2019-12-10 16:33:40.772	13	28
3487	5	2019-12-10 16:33:40.786	3	8
3489	14	2019-12-10 16:33:40.8	10	22
3491	5	2019-12-10 16:33:40.814	3	8
3493	3	2019-12-10 16:33:40.828	2	8
3495	1.8	2019-12-10 16:33:40.843	1.1	4.5
3497	3	2019-12-10 16:33:40.857	2	5
3499	6	2019-12-10 16:33:40.87	4	10
3501	4	2019-12-10 16:33:40.884	2	6
3503	6	2019-12-10 16:33:40.898	4	10
3505	6	2019-12-10 16:33:40.911	4	10
3507	8	2019-12-10 16:33:40.924	5	12
3509	8	2019-12-10 16:33:40.939	5	12
3511	6	2019-12-10 16:33:40.953	4	10
3513	10	2019-12-10 16:33:40.968	7	15
3515	5	2019-12-10 16:33:40.983	3	8
3517	10	2019-12-10 16:33:40.997	7	15
3519	13	2019-12-10 16:33:41.011	9	20
3521	4	2019-12-10 16:33:41.033	2	6
3523	10	2019-12-10 16:33:41.045	7	15
3525	38	2019-12-10 16:33:41.057	31	55
3527	5	2019-12-10 16:33:41.069	3	8
3529	8	2019-12-10 16:33:41.082	5	12
3531	10	2019-12-10 16:33:41.095	7	15
3533	1.8	2019-12-10 16:33:41.109	1.1	4.5
3535	4	2019-12-10 16:33:41.122	2	6
3537	4	2019-12-10 16:33:41.137	2	6
3539	8	2019-12-10 16:33:41.149	5	12
3541	12	2019-12-10 16:33:41.492	8	18
3543	4	2019-12-10 16:33:41.506	2	6
3545	10	2019-12-10 16:33:41.518	7	15
3547	3	2019-12-10 16:33:41.53	2	5
3549	4	2019-12-10 16:33:41.543	2	6
3551	8	2019-12-10 16:33:41.554	5	12
3553	5	2019-12-10 16:33:41.565	3	8
3555	6	2019-12-10 16:33:41.576	4	10
3557	8	2019-12-10 16:33:41.587	5	12
3559	0.9	2019-12-10 16:33:41.598	0.4	3
3561	4	2019-12-10 16:33:41.609	2	6
3563	13	2019-12-10 16:33:41.621	9	20
3565	2	2019-12-10 16:33:41.632	1.5	6
3567	1.8	2019-12-10 16:33:41.644	1.1	4.5
3569	10	2019-12-10 16:33:41.656	7	15
3571	0.01	2019-12-10 16:33:41.666	0.01	0.5
3573	2	2019-12-10 16:33:41.677	1.3	5
3575	13	2019-12-10 16:33:41.689	9	20
3577	16	2019-12-10 16:33:41.7	11	25
3579	6	2019-12-10 16:33:41.716	4	10
3581	4	2019-12-10 16:33:41.731	2	6
3583	3	2019-12-10 16:33:41.745	2	5
3585	6	2019-12-10 16:33:41.759	4	10
3587	6	2019-12-10 16:33:41.774	4	10
3589	5	2019-12-10 16:33:41.789	3	8
3591	8	2019-12-10 16:33:41.804	5	12
3593	1.6	2019-12-10 16:33:41.818	1	4
3595	6	2019-12-10 16:33:41.831	4	10
3597	2	2019-12-10 16:33:41.843	1.3	5
3599	18	2019-12-10 16:33:41.854	13	28
3601	5	2019-12-10 16:33:41.865	3	8
3603	6	2019-12-10 16:33:41.876	4	10
3605	6	2019-12-10 16:33:41.887	4	10
3607	3	2019-12-10 16:33:41.898	2	5
3609	5	2019-12-10 16:33:41.91	3	8
3611	4	2019-12-10 16:33:41.92	2	6
3613	14	2019-12-10 16:33:41.932	10	22
3615	8	2019-12-10 16:33:41.944	5	12
3617	4	2019-12-10 16:33:41.955	2	6
3619	5	2019-12-10 16:33:41.967	3	8
3621	18	2019-12-10 16:33:41.979	13	28
3623	4	2019-12-10 16:33:41.991	2	6
3625	4	2019-12-10 16:33:42.003	2	6
3627	6	2019-12-10 16:33:42.015	4	10
3629	20	2019-12-10 16:33:42.027	14	30
3631	6	2019-12-10 16:33:42.039	4	10
3633	10	2019-12-10 16:33:42.051	7	15
3635	12	2019-12-10 16:33:42.063	8	18
3637	6	2019-12-10 16:33:42.075	4	10
3639	3	2019-12-10 16:33:42.088	2	5
3641	5	2019-12-10 16:33:42.959	3	8
3643	25	2019-12-10 16:33:42.971	17	38
3645	56	2019-12-10 16:33:42.984	46	80
3647	6	2019-12-10 16:33:42.998	4	10
3649	5	2019-12-10 16:33:43.011	3	8
3651	21	2019-12-10 16:33:43.024	15	32
3653	4	2019-12-10 16:33:43.039	2	6
3655	10	2019-12-10 16:33:43.052	7	15
3657	10	2019-12-10 16:33:43.065	7	15
3659	5	2019-12-10 16:33:43.078	3	8
3661	8	2019-12-10 16:33:43.092	5	12
3663	6	2019-12-10 16:33:43.105	4	10
3665	13	2019-12-10 16:33:43.117	9	20
3667	5	2019-12-10 16:33:43.13	3	8
3669	8	2019-12-10 16:33:43.143	5	12
3671	8	2019-12-10 16:33:43.156	5	12
3673	13	2019-12-10 16:33:43.168	9	20
3675	6	2019-12-10 16:33:43.181	4	10
3677	5	2019-12-10 16:33:43.194	3	8
3679	14	2019-12-10 16:33:43.207	10	22
3681	10	2019-12-10 16:33:43.22	7	15
3683	6	2019-12-10 16:33:43.232	4	10
3685	8	2019-12-10 16:33:43.244	5	12
3687	13	2019-12-10 16:33:43.256	9	20
3689	21	2019-12-10 16:33:43.268	15	32
3691	6	2019-12-10 16:33:43.281	4	10
3693	10	2019-12-10 16:33:43.295	7	15
3695	8	2019-12-10 16:33:43.308	5	12
3697	6	2019-12-10 16:33:43.32	4	10
3699	12	2019-12-10 16:33:43.334	8	18
3701	1.6	2019-12-10 16:33:43.347	1	4
3703	8	2019-12-10 16:33:43.364	5	12
3705	35	2019-12-10 16:33:43.378	29	50
3707	12	2019-12-10 16:33:43.395	8	18
3709	4	2019-12-10 16:33:43.407	2	6
3711	6	2019-12-10 16:33:43.422	4	10
3713	13	2019-12-10 16:33:43.436	9	20
3715	5	2019-12-10 16:33:43.449	3	8
3717	2	2019-12-10 16:33:43.462	1.5	6
3719	20	2019-12-10 16:33:43.475	14	30
3721	12	2019-12-10 16:33:43.488	8	18
3723	5	2019-12-10 16:33:43.5	3	8
3725	5	2019-12-10 16:33:43.513	3	8
3727	5	2019-12-10 16:33:43.525	3	8
3729	12	2019-12-10 16:33:43.538	8	18
3731	12	2019-12-10 16:33:43.552	8	18
3733	1.2	2019-12-10 16:33:43.564	0.7	3
3735	5	2019-12-10 16:33:43.577	3	8
3737	5	2019-12-10 16:33:43.59	3	8
3739	20	2019-12-10 16:33:43.603	14	30
3741	14	2019-12-10 16:33:43.982	10	22
3743	25	2019-12-10 16:33:43.997	17	38
3745	16	2019-12-10 16:33:44.011	11	25
3747	16	2019-12-10 16:33:44.025	11	25
3749	12	2019-12-10 16:33:44.039	8	18
3751	10	2019-12-10 16:33:44.053	7	15
3753	10	2019-12-10 16:33:44.065	7	15
3755	16	2019-12-10 16:33:44.078	11	25
3757	4	2019-12-10 16:33:44.093	2	6
3759	6	2019-12-10 16:33:44.108	4	10
3761	6	2019-12-10 16:33:44.122	4	10
3763	10	2019-12-10 16:33:44.135	7	15
3765	13	2019-12-10 16:33:44.147	9	20
3767	14	2019-12-10 16:33:44.16	10	22
3769	5	2019-12-10 16:33:44.173	3	8
3771	10	2019-12-10 16:33:44.188	7	15
3773	2	2019-12-10 16:33:44.202	1.3	5
3775	1.4	2019-12-10 16:33:44.215	0.9	3.5
3777	13	2019-12-10 16:33:44.229	9	20
3779	86	2019-12-10 16:33:44.241	74	115
3781	3	2019-12-10 16:33:44.254	2	5
3783	12	2019-12-10 16:33:44.266	8	18
3785	5	2019-12-10 16:33:44.279	3	8
3787	10	2019-12-10 16:33:44.292	7	15
3789	1.6	2019-12-10 16:33:44.305	1	4
3791	8	2019-12-10 16:33:44.318	5	12
3793	4	2019-12-10 16:33:44.33	2	6
3795	21	2019-12-10 16:33:44.343	15	32
3797	10	2019-12-10 16:33:44.357	7	15
3799	8	2019-12-10 16:33:44.37	5	12
3801	3	2019-12-10 16:33:44.384	2	5
3803	3	2019-12-10 16:33:44.397	2	5
3805	6	2019-12-10 16:33:44.411	4	10
3807	10	2019-12-10 16:33:44.426	7	15
3809	41	2019-12-10 16:33:44.441	29	62
3811	4	2019-12-10 16:33:44.454	2	6
3813	6	2019-12-10 16:33:44.467	4	10
3815	2	2019-12-10 16:33:44.481	1.3	5
3817	56	2019-12-10 16:33:44.493	48	75
3819	5	2019-12-10 16:33:44.506	3	8
3821	6	2019-12-10 16:33:44.518	4	10
3823	6	2019-12-10 16:33:44.53	4	10
3825	10	2019-12-10 16:33:44.543	7	15
3827	18	2019-12-10 16:33:44.559	13	28
3829	13	2019-12-10 16:33:44.575	9	20
3831	2	2019-12-10 16:33:44.589	1.5	6
3833	23	2019-12-10 16:33:44.603	16	35
3835	8	2019-12-10 16:33:44.618	5	12
3837	5	2019-12-10 16:33:44.631	3	8
3839	6	2019-12-10 16:33:44.644	4	10
3841	16	2019-12-10 16:33:45.024	11	25
3843	6	2019-12-10 16:33:45.036	4	10
3845	26	2019-12-10 16:33:45.05	18	40
3847	8	2019-12-10 16:33:45.062	5	12
3849	4	2019-12-10 16:33:45.075	2	6
3851	10	2019-12-10 16:33:45.089	7	15
3853	26	2019-12-10 16:33:45.103	22	38
3855	52	2019-12-10 16:33:45.117	43	75
3857	10	2019-12-10 16:33:45.13	7	15
3859	12	2019-12-10 16:33:45.142	8	18
3861	56	2019-12-10 16:33:45.155	39	85
3863	4	2019-12-10 16:33:45.167	2	6
3865	75	2019-12-10 16:33:45.179	65	100
3867	34	2019-12-10 16:33:45.192	24	52
3869	8	2019-12-10 16:33:45.208	5	12
3871	4	2019-12-10 16:33:45.222	2	6
3873	14	2019-12-10 16:33:45.238	10	22
3875	10	2019-12-10 16:33:45.251	7	15
3877	5	2019-12-10 16:33:45.264	3	8
3879	6	2019-12-10 16:33:45.278	4	10
3881	4	2019-12-10 16:33:45.292	2	6
3883	5	2019-12-10 16:33:45.306	3	8
3885	12	2019-12-10 16:33:45.32	8	18
3887	12	2019-12-10 16:33:45.334	8	18
3889	18	2019-12-10 16:33:45.348	13	28
3891	13	2019-12-10 16:33:45.361	9	20
3893	12	2019-12-10 16:33:45.376	8	18
3895	3	2019-12-10 16:33:45.39	2	5
3897	5	2019-12-10 16:33:45.405	3	8
3899	5	2019-12-10 16:33:45.42	3	8
3901	16	2019-12-10 16:33:45.434	11	25
3903	2	2019-12-10 16:33:45.449	1.3	5
3905	13	2019-12-10 16:33:45.462	9	20
3907	16	2019-12-10 16:33:45.476	11	25
3909	3	2019-12-10 16:33:45.489	2	5
3911	13	2019-12-10 16:33:45.502	9	20
3913	1.6	2019-12-10 16:33:45.515	1	4
3915	6	2019-12-10 16:33:45.528	4	10
3917	50	2019-12-10 16:33:45.542	35	75
3919	42	2019-12-10 16:33:45.555	34	60
3921	4	2019-12-10 16:33:45.568	2	6
3923	4	2019-12-10 16:33:45.584	2	6
3925	14	2019-12-10 16:33:45.598	10	22
3927	5	2019-12-10 16:33:45.611	3	8
3929	8	2019-12-10 16:33:45.625	5	12
3931	18	2019-12-10 16:33:45.639	13	28
3933	13	2019-12-10 16:33:45.652	9	20
3935	59	2019-12-10 16:33:45.666	49	85
3937	13	2019-12-10 16:33:45.684	9	20
3939	5	2019-12-10 16:33:45.698	3	8
3941	14	2019-12-10 16:33:46.069	10	22
3943	6	2019-12-10 16:33:46.082	4	10
3945	6	2019-12-10 16:33:46.096	4	10
3947	4	2019-12-10 16:33:46.111	2	6
3949	5	2019-12-10 16:33:46.127	3	8
3951	10	2019-12-10 16:33:46.14	7	15
3953	23	2019-12-10 16:33:46.153	16	35
3955	8	2019-12-10 16:33:46.166	5	12
3957	77	2019-12-10 16:33:46.179	63	110
3959	16	2019-12-10 16:33:46.192	11	25
3961	10	2019-12-10 16:33:46.206	7	15
3963	236	2019-12-10 16:33:46.221	204	315
3965	6	2019-12-10 16:33:46.237	4	10
3967	4	2019-12-10 16:33:46.25	2	6
3969	4	2019-12-10 16:33:46.263	2	6
3971	12	2019-12-10 16:33:46.276	8	18
3973	8	2019-12-10 16:33:46.289	5	12
3975	25	2019-12-10 16:33:46.304	17	38
3977	63	2019-12-10 16:33:46.317	52	90
3979	12	2019-12-10 16:33:46.331	8	18
3981	28	2019-12-10 16:33:46.345	23	40
3983	14	2019-12-10 16:33:46.358	10	22
3985	12	2019-12-10 16:33:46.371	8	18
3987	23	2019-12-10 16:33:46.386	16	35
3989	25	2019-12-10 16:33:46.4	17	38
3991	8	2019-12-10 16:33:46.415	5	12
3993	10	2019-12-10 16:33:46.431	7	15
3995	20	2019-12-10 16:33:46.446	14	30
3997	13	2019-12-10 16:33:46.46	9	20
3999	17	2019-12-10 16:33:46.475	14	25
4001	14	2019-12-10 16:33:46.489	10	22
4003	16	2019-12-10 16:33:46.502	11	25
4005	127	2019-12-10 16:33:46.516	110	170
4007	3	2019-12-10 16:33:46.528	2	5
4009	12	2019-12-10 16:33:46.542	8	18
4011	10	2019-12-10 16:33:46.555	7	15
4013	20	2019-12-10 16:33:46.568	14	30
4015	12	2019-12-10 16:33:46.582	8	18
4017	8	2019-12-10 16:33:46.594	5	12
4019	5	2019-12-10 16:33:46.607	3	8
4021	30	2019-12-10 16:33:46.621	21	45
4023	18	2019-12-10 16:33:46.635	13	28
4025	12	2019-12-10 16:33:46.65	8	18
4027	3	2019-12-10 16:33:46.664	2	5
4029	23	2019-12-10 16:33:46.678	16	35
4031	14	2019-12-10 16:33:46.692	10	22
4033	25	2019-12-10 16:33:46.706	17	38
4035	10	2019-12-10 16:33:46.72	7	15
4037	20	2019-12-10 16:33:46.734	14	30
4039	12	2019-12-10 16:33:46.747	8	18
4041	18	2019-12-10 16:33:47.124	13	28
4043	28	2019-12-10 16:33:47.138	23	40
4045	126	2019-12-10 16:33:47.152	104	180
4047	10	2019-12-10 16:33:47.165	7	15
4049	8	2019-12-10 16:33:47.177	5	12
4051	6	2019-12-10 16:33:47.19	4	10
4053	3	2019-12-10 16:33:47.203	2	5
4055	8	2019-12-10 16:33:47.216	5	12
4057	21	2019-12-10 16:33:47.229	15	32
4059	5	2019-12-10 16:33:47.243	3	8
4061	2	2019-12-10 16:33:47.256	1.5	6
4063	35	2019-12-10 16:33:47.27	29	50
4065	5	2019-12-10 16:33:47.283	3	8
4067	53	2019-12-10 16:33:47.297	37	80
4069	12	2019-12-10 16:33:47.312	8	18
4071	13	2019-12-10 16:33:47.326	9	20
4073	10	2019-12-10 16:33:47.34	7	15
4075	5	2019-12-10 16:33:47.354	3	8
4077	3	2019-12-10 16:33:47.367	2	5
4079	5	2019-12-10 16:33:47.382	3	8
4081	5	2019-12-10 16:33:47.397	3	8
4083	13	2019-12-10 16:33:47.411	9	20
4085	6	2019-12-10 16:33:47.429	4	10
4087	1.8	2019-12-10 16:33:47.445	1.1	4.5
4089	5	2019-12-10 16:33:47.461	3	8
4091	120	2019-12-10 16:33:47.476	109	150
4093	12	2019-12-10 16:33:47.491	8	18
4095	18	2019-12-10 16:33:47.507	13	28
4097	87	2019-12-10 16:33:47.522	72	125
4099	5	2019-12-10 16:33:47.536	3	8
4101	5	2019-12-10 16:33:47.55	3	8
4103	20	2019-12-10 16:33:47.564	14	30
4105	30	2019-12-10 16:33:47.579	21	45
4107	73	2019-12-10 16:33:47.592	60	105
4109	30	2019-12-10 16:33:47.607	21	45
4111	5	2019-12-10 16:33:47.621	3	8
4113	20	2019-12-10 16:33:47.635	14	30
4115	8	2019-12-10 16:33:47.649	5	12
4117	14	2019-12-10 16:33:47.663	10	22
4119	4	2019-12-10 16:33:47.677	2	6
4121	4	2019-12-10 16:33:47.697	2	6
4123	28	2019-12-10 16:33:47.714	19	42
4125	23	2019-12-10 16:33:47.731	16	35
4127	166	2019-12-10 16:33:47.749	117	250
4129	12	2019-12-10 16:33:47.765	8	18
4131	13	2019-12-10 16:33:47.781	9	20
4133	82	2019-12-10 16:33:47.797	71	110
4135	5	2019-12-10 16:33:47.811	3	8
4137	140	2019-12-10 16:33:47.825	116	200
4139	28	2019-12-10 16:33:47.839	19	42
4141	14	2019-12-10 16:33:48.221	10	22
4143	115	2019-12-10 16:33:48.235	95	165
4145	24	2019-12-10 16:33:48.249	20	35
4147	6	2019-12-10 16:33:48.263	4	10
4149	5	2019-12-10 16:33:48.277	3	8
4151	21	2019-12-10 16:33:48.291	15	32
4153	18	2019-12-10 16:33:48.305	13	28
4155	10	2019-12-10 16:33:48.319	7	15
4157	18	2019-12-10 16:33:48.333	13	28
4159	13	2019-12-10 16:33:48.347	9	20
4161	14	2019-12-10 16:33:48.36	10	22
4163	13	2019-12-10 16:33:48.373	9	20
4165	25	2019-12-10 16:33:48.388	17	38
4167	23	2019-12-10 16:33:48.403	16	35
4169	40	2019-12-10 16:33:48.417	28	60
4171	5	2019-12-10 16:33:48.432	3	8
4173	32	2019-12-10 16:33:48.447	22	48
4175	6	2019-12-10 16:33:48.464	4	10
4177	6	2019-12-10 16:33:48.478	4	10
4179	6	2019-12-10 16:33:48.492	4	10
4181	20	2019-12-10 16:33:48.505	14	30
4183	8	2019-12-10 16:33:48.518	5	12
4185	5	2019-12-10 16:33:48.531	3	8
4187	13	2019-12-10 16:33:48.545	9	20
4189	8	2019-12-10 16:33:48.559	5	12
4191	10	2019-12-10 16:33:48.572	7	15
4193	16	2019-12-10 16:33:48.585	11	25
4195	35	2019-12-10 16:33:48.607	29	50
4197	13	2019-12-10 16:33:48.621	9	20
4199	10	2019-12-10 16:33:48.635	7	15
4201	12	2019-12-10 16:33:48.648	8	18
4203	40	2019-12-10 16:33:48.662	28	60
4205	14	2019-12-10 16:33:48.676	10	22
4207	18	2019-12-10 16:33:48.69	13	28
4209	10	2019-12-10 16:33:48.704	7	15
4211	122	2019-12-10 16:33:48.719	101	175
4213	20	2019-12-10 16:33:48.733	14	30
4215	6	2019-12-10 16:33:48.747	4	10
4217	10	2019-12-10 16:33:48.761	7	15
4219	3	2019-12-10 16:33:48.775	2	5
4221	26	2019-12-10 16:33:48.79	18	40
4223	8	2019-12-10 16:33:48.804	5	12
4225	10	2019-12-10 16:33:48.818	7	15
4227	14	2019-12-10 16:33:48.832	10	22
4229	18	2019-12-10 16:33:48.847	13	28
4231	25	2019-12-10 16:33:48.861	17	38
4233	10	2019-12-10 16:33:48.875	7	15
4235	4	2019-12-10 16:33:48.889	2	6
4237	10	2019-12-10 16:33:48.903	7	15
4239	8	2019-12-10 16:33:48.916	5	12
4241	10	2019-12-10 16:33:49.293	7	15
4243	10	2019-12-10 16:33:49.308	7	15
4245	13	2019-12-10 16:33:49.321	9	20
4247	52	2019-12-10 16:33:49.335	43	75
4249	4	2019-12-10 16:33:49.349	2	6
4251	12	2019-12-10 16:33:49.364	8	18
4253	43	2019-12-10 16:33:49.378	30	65
4255	13	2019-12-10 16:33:49.393	9	20
4257	45	2019-12-10 16:33:49.414	37	65
4259	6	2019-12-10 16:33:49.43	4	10
4261	30	2019-12-10 16:33:49.445	21	45
4263	30	2019-12-10 16:33:49.461	21	45
4265	23	2019-12-10 16:33:49.475	16	35
4267	16	2019-12-10 16:33:49.489	11	25
4269	6	2019-12-10 16:33:49.503	4	10
4271	6	2019-12-10 16:33:49.517	4	10
4273	8	2019-12-10 16:33:49.531	5	12
4275	10	2019-12-10 16:33:49.545	7	15
4277	16	2019-12-10 16:33:49.559	11	25
4279	34	2019-12-10 16:33:49.573	24	52
4281	2	2019-12-10 16:33:49.587	1.3	5
4283	21	2019-12-10 16:33:49.601	15	32
4285	21	2019-12-10 16:33:49.615	15	32
4287	26	2019-12-10 16:33:49.63	18	40
4289	5	2019-12-10 16:33:49.644	3	8
4291	4	2019-12-10 16:33:49.662	2	6
4293	25	2019-12-10 16:33:49.679	17	38
4295	0	2019-12-10 16:33:49.694	0	10
4297	0	2019-12-10 16:33:49.709	0	30
4299	0	2019-12-10 16:33:49.726	0	20
4301	6	2019-12-10 16:33:49.744	4	10
4303	8	2019-12-10 16:33:49.76	5	12
4305	8	2019-12-10 16:33:49.778	5	12
4307	5	2019-12-10 16:33:49.796	3	8
4309	23	2019-12-10 16:33:49.811	16	35
4311	32	2019-12-10 16:33:49.828	22	48
4313	59	2019-12-10 16:33:49.844	49	85
4315	20	2019-12-10 16:33:49.859	14	30
4317	5	2019-12-10 16:33:49.875	3	8
4319	43	2019-12-10 16:33:49.907	30	65
4321	18	2019-12-10 16:33:49.922	13	28
4323	46	2019-12-10 16:33:49.938	32	70
4325	14	2019-12-10 16:33:49.954	10	22
4327	16	2019-12-10 16:33:49.969	11	25
4329	33	2019-12-10 16:33:50	23	50
4331	20	2019-12-10 16:33:50.017	14	30
4333	40	2019-12-10 16:33:50.034	28	60
4335	26	2019-12-10 16:33:50.051	18	40
4337	52	2019-12-10 16:33:50.066	43	75
4339	5	2019-12-10 16:33:50.082	3	8
4341	25	2019-12-10 16:33:50.499	17	38
4343	46	2019-12-10 16:33:50.518	32	70
4345	8	2019-12-10 16:33:50.537	5	12
4347	8	2019-12-10 16:33:50.557	5	12
4349	73	2019-12-10 16:33:50.576	51	110
4351	16	2019-12-10 16:33:50.594	11	25
4353	16	2019-12-10 16:33:50.612	11	25
4355	63	2019-12-10 16:33:50.632	52	90
4357	6	2019-12-10 16:33:50.649	4	10
4359	6	2019-12-10 16:33:50.665	4	10
4361	43	2019-12-10 16:33:50.682	30	65
4363	30	2019-12-10 16:33:50.698	21	45
4365	49	2019-12-10 16:33:50.716	40	70
4367	13	2019-12-10 16:33:50.733	9	20
4369	84	2019-12-10 16:33:50.749	69	120
4371	28	2019-12-10 16:33:50.766	19	42
4373	43	2019-12-10 16:33:50.783	30	65
4375	8	2019-12-10 16:33:50.8	5	12
4377	56	2019-12-10 16:33:50.818	46	80
4379	65	2019-12-10 16:33:50.835	46	98
4381	6	2019-12-10 16:33:50.852	4	10
4383	6	2019-12-10 16:33:50.869	4	10
4385	14	2019-12-10 16:33:50.886	10	22
4387	38	2019-12-10 16:33:50.903	27	58
4389	23	2019-12-10 16:33:50.92	16	35
4391	18	2019-12-10 16:33:50.937	13	28
4393	8	2019-12-10 16:33:50.953	5	12
4395	6	2019-12-10 16:33:50.969	4	10
4397	16	2019-12-10 16:33:50.984	11	25
4399	20	2019-12-10 16:33:50.999	14	30
4401	5	2019-12-10 16:33:51.015	3	8
4403	40	2019-12-10 16:33:51.029	28	60
4405	49	2019-12-10 16:33:51.055	40	70
4407	14	2019-12-10 16:33:51.068	11	20
4409	29	2019-12-10 16:33:51.081	24	42
4411	6	2019-12-10 16:33:51.096	4	10
4413	4	2019-12-10 16:33:51.11	2	6
4415	19	2019-12-10 16:33:51.123	16	28
4417	16	2019-12-10 16:33:51.138	11	25
4419	6	2019-12-10 16:33:51.152	4	10
4421	14	2019-12-10 16:33:51.166	10	22
4423	98	2019-12-10 16:33:51.18	81	140
4425	59	2019-12-10 16:33:51.193	49	85
4427	10	2019-12-10 16:33:51.206	7	15
4429	8	2019-12-10 16:33:51.22	5	12
4431	52	2019-12-10 16:33:51.234	36	78
4433	77	2019-12-10 16:33:51.247	63	110
4435	6	2019-12-10 16:33:51.26	4	10
4437	31	2019-12-10 16:33:51.274	26	45
4439	13	2019-12-10 16:33:51.288	9	20
4441	5	2019-12-10 16:33:51.667	3	8
4443	5	2019-12-10 16:33:51.683	3	8
4445	13	2019-12-10 16:33:51.696	9	20
4447	13	2019-12-10 16:33:51.709	9	20
4449	24	2019-12-10 16:33:51.726	20	35
4451	13	2019-12-10 16:33:51.741	9	20
4453	8	2019-12-10 16:33:51.757	5	12
4455	3	2019-12-10 16:33:51.774	2	5
4457	6	2019-12-10 16:33:51.791	4	10
4459	6	2019-12-10 16:33:51.806	4	10
4461	10	2019-12-10 16:33:51.822	7	15
4463	25	2019-12-10 16:33:51.837	17	38
4465	18	2019-12-10 16:33:51.852	13	28
4467	4	2019-12-10 16:33:51.867	2	6
4469	26	2019-12-10 16:33:51.881	18	40
4471	105	2019-12-10 16:33:51.895	87	150
4473	70	2019-12-10 16:33:51.91	58	100
4475	12	2019-12-10 16:33:51.924	8	18
4477	3	2019-12-10 16:33:51.938	2	5
4479	52	2019-12-10 16:33:51.951	43	75
4481	18	2019-12-10 16:33:51.965	13	28
4483	26	2019-12-10 16:33:51.979	18	40
4485	13	2019-12-10 16:33:51.993	9	20
4487	23	2019-12-10 16:33:52.007	16	35
4489	52	2019-12-10 16:33:52.022	43	75
4491	21	2019-12-10 16:33:52.039	15	32
4493	6	2019-12-10 16:33:52.057	4	10
4495	16	2019-12-10 16:33:52.072	11	25
4497	18	2019-12-10 16:33:52.089	13	28
4499	16	2019-12-10 16:33:52.103	11	25
4501	14	2019-12-10 16:33:52.117	10	22
4503	49	2019-12-10 16:33:52.131	40	70
4505	12	2019-12-10 16:33:52.148	8	18
4507	63	2019-12-10 16:33:52.163	52	90
4509	112	2019-12-10 16:33:52.178	97	150
4511	16	2019-12-10 16:33:52.192	11	25
4513	16	2019-12-10 16:33:52.206	11	25
4515	6	2019-12-10 16:33:52.221	4	10
4517	4	2019-12-10 16:33:52.236	2	6
4519	10	2019-12-10 16:33:52.253	7	15
4521	6	2019-12-10 16:33:52.266	4	10
4523	4	2019-12-10 16:33:52.28	2	6
4525	23	2019-12-10 16:33:52.295	16	35
4527	6	2019-12-10 16:33:52.311	4	10
4529	8	2019-12-10 16:33:52.325	5	12
4531	36	2019-12-10 16:33:52.34	25	55
4533	8	2019-12-10 16:33:52.354	5	12
4535	16	2019-12-10 16:33:52.368	11	25
4537	56	2019-12-10 16:33:52.384	39	85
4539	75	2019-12-10 16:33:52.399	65	100
4541	8	2019-12-10 16:33:52.806	5	12
4543	71	2019-12-10 16:33:52.821	61	95
4545	14	2019-12-10 16:33:52.836	10	22
4547	52	2019-12-10 16:33:52.852	43	75
4549	77	2019-12-10 16:33:52.866	63	110
4551	23	2019-12-10 16:33:52.881	16	35
4553	14	2019-12-10 16:33:52.896	10	22
4555	8	2019-12-10 16:33:52.91	5	12
4557	28	2019-12-10 16:33:52.924	19	42
4559	32	2019-12-10 16:33:52.938	22	48
4561	48	2019-12-10 16:33:52.952	33	72
4563	73	2019-12-10 16:33:52.967	60	105
4565	24	2019-12-10 16:33:52.981	20	35
4567	70	2019-12-10 16:33:52.995	58	100
4569	1.6	2019-12-10 16:33:53.01	1	4
4571	91	2019-12-10 16:33:53.025	75	130
4573	17	2019-12-10 16:33:53.039	14	25
4575	16	2019-12-10 16:33:53.056	11	25
4577	49	2019-12-10 16:33:53.073	40	70
4579	80	2019-12-10 16:33:53.09	56	120
4581	23	2019-12-10 16:33:53.104	16	35
4583	33	2019-12-10 16:33:53.12	27	48
4585	66	2019-12-10 16:33:53.137	55	95
4587	52	2019-12-10 16:33:53.154	43	75
4589	36	2019-12-10 16:33:53.169	25	55
4591	13	2019-12-10 16:33:53.184	9	20
4593	5	2019-12-10 16:33:53.199	3	8
4595	32	2019-12-10 16:33:53.214	22	48
4597	12	2019-12-10 16:33:53.229	8	18
4599	63	2019-12-10 16:33:53.244	52	90
4601	12	2019-12-10 16:33:53.258	8	18
4603	12	2019-12-10 16:33:53.272	8	18
4605	18	2019-12-10 16:33:53.286	13	28
4607	45	2019-12-10 16:33:53.301	37	65
4609	6	2019-12-10 16:33:53.316	4	10
4611	12	2019-12-10 16:33:53.331	8	18
4613	13	2019-12-10 16:33:53.346	9	20
4615	23	2019-12-10 16:33:53.361	16	35
4617	33	2019-12-10 16:33:53.377	23	50
4619	14	2019-12-10 16:33:53.393	10	22
4621	38	2019-12-10 16:33:53.409	31	55
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 4622, true);


--
-- Name: box box_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box
    ADD CONSTRAINT box_pkey PRIMARY KEY (id);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- Name: item_price uk_4lxgg9lnudewi3ch01o5ywljv; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_price
    ADD CONSTRAINT uk_4lxgg9lnudewi3ch01o5ywljv UNIQUE (prices_id);


--
-- Name: item_price fk1r3pr1lhtyu06burwslf4b3m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_price
    ADD CONSTRAINT fk1r3pr1lhtyu06burwslf4b3m FOREIGN KEY (item_id) REFERENCES public.item(id);


--
-- Name: item_price fk6fwefhke9wex9mtbgwse7cbgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_price
    ADD CONSTRAINT fk6fwefhke9wex9mtbgwse7cbgc FOREIGN KEY (prices_id) REFERENCES public.price(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--


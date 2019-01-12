--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-01-12 17:14:49 -02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16385)
-- Name: wristwatch; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA wristwatch;


ALTER SCHEMA wristwatch OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16386)
-- Name: brand; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.brand (
    name character varying(20) NOT NULL,
    country character varying(20) NOT NULL,
    creation character varying(15) NOT NULL
);


ALTER TABLE wristwatch.brand OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16491)
-- Name: collection; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.collection (
    name character varying(50) NOT NULL,
    brand_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.collection OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16443)
-- Name: purchase; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.purchase (
    salesman_name character varying(20) NOT NULL,
    brand_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.purchase OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16506)
-- Name: sale; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.sale (
    id_wristwatch integer NOT NULL,
    salesman_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.sale OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16389)
-- Name: salesman; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.salesman (
    name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.salesman OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16397)
-- Name: user; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch."user" (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50),
    name character varying(50)
);


ALTER TABLE wristwatch."user" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16395)
-- Name: user_id_seq; Type: SEQUENCE; Schema: wristwatch; Owner: postgres
--

CREATE SEQUENCE wristwatch.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wristwatch.user_id_seq OWNER TO postgres;

--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 199
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: wristwatch; Owner: postgres
--

ALTER SEQUENCE wristwatch.user_id_seq OWNED BY wristwatch."user".id;


--
-- TOC entry 202 (class 1259 OID 16427)
-- Name: wristwatch; Type: TABLE; Schema: wristwatch; Owner: postgres
--

CREATE TABLE wristwatch.wristwatch (
    id integer NOT NULL,
    name character varying(150),
    qtd_plots integer,
    brand_name character varying(20),
    price numeric(8,2),
    plots_price numeric(8,2),
    collection_name character varying(50) NOT NULL
);


ALTER TABLE wristwatch.wristwatch OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16425)
-- Name: wristwatch_id_seq; Type: SEQUENCE; Schema: wristwatch; Owner: postgres
--

CREATE SEQUENCE wristwatch.wristwatch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wristwatch.wristwatch_id_seq OWNER TO postgres;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 201
-- Name: wristwatch_id_seq; Type: SEQUENCE OWNED BY; Schema: wristwatch; Owner: postgres
--

ALTER SEQUENCE wristwatch.wristwatch_id_seq OWNED BY wristwatch.wristwatch.id;


--
-- TOC entry 2813 (class 2604 OID 16400)
-- Name: user id; Type: DEFAULT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch."user" ALTER COLUMN id SET DEFAULT nextval('wristwatch.user_id_seq'::regclass);


--
-- TOC entry 2814 (class 2604 OID 16430)
-- Name: wristwatch id; Type: DEFAULT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch ALTER COLUMN id SET DEFAULT nextval('wristwatch.wristwatch_id_seq'::regclass);


--
-- TOC entry 2957 (class 0 OID 16386)
-- Dependencies: 197
-- Data for Name: brand; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

COPY wristwatch.brand (name, country, creation) FROM stdin;
Condor	Suiça	2013
Technos	Suiça	1900
Montblanc	Alemanha	1906
\.


--
-- TOC entry 2964 (class 0 OID 16491)
-- Dependencies: 204
-- Data for Name: collection; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

COPY wristwatch.collection (name, brand_name) FROM stdin;
Civic	Condor
Speed	Condor
Casual	Condor
Traqveller	Condor
Anadigi	Condor
Ferragens	Condor
Casual Metal	Condor
Casual Couro	Condor
Metal E Couro	Condor
Neon	Condor
Xadrez	Condor
Gradeados	Condor
Ritmo Envolvente	Condor
Militar	Condor
3D Geométrico	Condor
Urbano	Condor
Prata	Condor
Calotas	Condor
Metal	Condor
Couro	Condor
Star Legacy	Montblanc
Star Classique	Montblanc
TimeWalker	Montblanc
Villeret	Montblanc
Steel	Technos
Performance Racer	Technos
Racer	Technos
Golf	Technos
Unissex Classic Slim	Technos
Calendário Lunar	Technos
Unissex Classic	Technos
Unissex Slim	Technos
Skymaster	Technos
Legacy	Technos
Ts Digiana	Technos
Classic Steel	Technos
Militar	Technos
Executive	Technos
Grandtech	Technos
Ts Carbon	Technos
Performance	Technos
Classic Legacy	Technos
Slim	Technos
Riviera	Technos
Classic Ceramic/Saphire	Technos
Classic Automatico	Technos
Essence	Technos
Automatico	Technos
Skydiver	Technos
Carbon	Technos
Ceramic	Technos
Vitra	Technos
Acqua	Technos
Solar	Technos
\.


--
-- TOC entry 2963 (class 0 OID 16443)
-- Dependencies: 203
-- Data for Name: purchase; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

COPY wristwatch.purchase (salesman_name, brand_name) FROM stdin;
Technos	Technos
Condor	Condor
Montblanc	Montblanc
\.


--
-- TOC entry 2965 (class 0 OID 16506)
-- Dependencies: 205
-- Data for Name: sale; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

COPY wristwatch.sale (id_wristwatch, salesman_name) FROM stdin;
819	Montblanc
820	Montblanc
821	Montblanc
822	Montblanc
823	Montblanc
824	Montblanc
825	Condor
826	Condor
827	Condor
828	Condor
829	Condor
830	Condor
831	Condor
832	Condor
833	Condor
834	Condor
835	Condor
836	Condor
837	Condor
838	Condor
839	Condor
840	Condor
841	Condor
842	Condor
843	Condor
844	Condor
845	Condor
846	Condor
847	Condor
848	Condor
849	Condor
850	Condor
851	Condor
852	Condor
853	Condor
854	Condor
855	Condor
856	Condor
857	Condor
858	Condor
859	Condor
860	Condor
861	Condor
862	Condor
863	Condor
864	Condor
865	Condor
866	Condor
867	Condor
868	Condor
869	Condor
870	Condor
871	Condor
872	Condor
873	Condor
874	Condor
875	Condor
876	Condor
877	Condor
878	Condor
879	Condor
880	Condor
881	Condor
882	Condor
883	Condor
884	Condor
885	Condor
886	Condor
887	Condor
888	Condor
889	Condor
890	Condor
891	Condor
892	Condor
893	Condor
894	Condor
895	Condor
896	Condor
897	Condor
898	Condor
899	Condor
900	Condor
901	Condor
902	Condor
903	Condor
904	Condor
905	Condor
906	Condor
907	Condor
908	Condor
909	Condor
910	Condor
911	Condor
912	Condor
913	Condor
914	Condor
915	Condor
916	Condor
917	Condor
918	Condor
919	Condor
920	Condor
921	Condor
922	Condor
923	Condor
924	Condor
925	Condor
926	Condor
927	Condor
928	Condor
929	Condor
930	Condor
931	Condor
932	Condor
933	Condor
934	Condor
935	Condor
936	Condor
937	Condor
938	Condor
939	Condor
940	Condor
941	Condor
942	Condor
943	Condor
944	Condor
945	Condor
946	Condor
947	Condor
948	Condor
949	Condor
950	Condor
951	Condor
952	Condor
953	Condor
954	Condor
955	Condor
956	Condor
957	Condor
958	Condor
959	Condor
960	Condor
961	Condor
962	Condor
963	Condor
964	Condor
965	Condor
966	Condor
967	Condor
968	Condor
969	Condor
970	Condor
971	Condor
972	Condor
973	Condor
974	Condor
975	Condor
976	Condor
977	Condor
978	Condor
979	Condor
980	Condor
981	Condor
982	Condor
983	Condor
984	Condor
985	Condor
986	Condor
987	Condor
988	Condor
989	Condor
990	Condor
991	Condor
992	Condor
993	Condor
994	Condor
995	Condor
996	Condor
997	Condor
998	Condor
999	Condor
1000	Condor
1001	Condor
1002	Condor
1003	Condor
1004	Condor
1005	Condor
1006	Condor
1007	Condor
1008	Condor
1009	Condor
1010	Condor
1011	Condor
1012	Condor
1013	Condor
1014	Condor
1015	Condor
1016	Condor
1017	Condor
1018	Condor
1019	Condor
1020	Condor
1021	Condor
1022	Condor
1023	Condor
1024	Condor
1025	Condor
1026	Condor
1027	Condor
1028	Condor
1029	Condor
1030	Condor
1031	Condor
1032	Condor
1033	Condor
1034	Condor
1035	Condor
1036	Condor
1037	Condor
1038	Condor
1039	Condor
1040	Condor
1041	Condor
1042	Condor
1043	Condor
1044	Condor
1045	Condor
1046	Condor
1047	Condor
1048	Condor
1049	Condor
1050	Condor
1051	Condor
1052	Condor
1053	Condor
1054	Condor
1055	Condor
1056	Condor
1057	Condor
1058	Condor
1059	Condor
1060	Condor
1061	Condor
1062	Condor
1063	Condor
1064	Condor
1065	Condor
1066	Condor
1067	Condor
1068	Condor
1069	Condor
1070	Condor
1071	Condor
1072	Condor
1073	Condor
1074	Condor
1075	Condor
1076	Condor
1077	Condor
1078	Condor
1079	Condor
1080	Condor
1081	Condor
1082	Condor
1083	Condor
1084	Condor
1085	Condor
1086	Condor
1087	Condor
1088	Condor
1089	Condor
1090	Condor
1091	Condor
1092	Condor
1093	Condor
1094	Condor
1095	Condor
1096	Condor
1097	Condor
1098	Condor
1099	Condor
1100	Condor
1101	Condor
1102	Condor
1103	Condor
1104	Condor
1105	Condor
1106	Condor
1107	Condor
1108	Condor
1109	Condor
1110	Condor
1111	Condor
1112	Condor
1113	Condor
1114	Condor
1115	Condor
1116	Condor
1117	Condor
1118	Condor
1119	Condor
1120	Condor
1121	Condor
1122	Condor
1123	Condor
1124	Technos
1125	Technos
1126	Technos
1127	Technos
1128	Technos
1129	Technos
1130	Technos
1131	Technos
1132	Technos
1133	Technos
1134	Technos
1135	Technos
1136	Technos
1137	Technos
1138	Technos
1139	Technos
1140	Technos
1141	Technos
1142	Technos
1143	Technos
1144	Technos
1145	Technos
1146	Technos
1147	Technos
1148	Technos
1149	Technos
1150	Technos
1151	Technos
1152	Technos
1153	Technos
1154	Technos
1155	Technos
1156	Technos
1157	Technos
1158	Technos
1159	Technos
1160	Technos
1161	Technos
1162	Technos
1163	Technos
1164	Technos
1165	Technos
1166	Technos
1167	Technos
1168	Technos
1169	Technos
1170	Technos
1171	Technos
1172	Technos
1173	Technos
1174	Technos
1175	Technos
1176	Technos
1177	Technos
1178	Technos
1179	Technos
1180	Technos
1181	Technos
1182	Technos
1183	Technos
1184	Technos
1185	Technos
1186	Technos
1187	Technos
1188	Technos
1189	Technos
1190	Technos
1191	Technos
1192	Technos
1193	Technos
1194	Technos
1195	Technos
1196	Technos
1197	Technos
1198	Technos
1199	Technos
1200	Technos
1201	Technos
1202	Technos
1203	Technos
1204	Technos
1205	Technos
1206	Technos
1207	Technos
1208	Technos
1209	Technos
1210	Technos
1211	Technos
1212	Technos
1213	Technos
1214	Technos
1215	Technos
1216	Technos
1217	Technos
1218	Technos
1219	Technos
1220	Technos
1221	Technos
1222	Technos
1223	Technos
1224	Technos
1225	Technos
1226	Technos
1227	Technos
1228	Technos
1229	Technos
1230	Technos
1231	Technos
1232	Technos
1233	Technos
1234	Technos
1235	Technos
1236	Technos
1237	Technos
1238	Technos
1239	Technos
1240	Technos
1241	Technos
1242	Technos
1243	Technos
1244	Technos
1245	Technos
1246	Technos
1247	Technos
1248	Technos
1249	Technos
1250	Technos
1251	Technos
1252	Technos
1253	Technos
1254	Technos
1255	Technos
1256	Technos
1257	Technos
1258	Technos
1259	Technos
1260	Technos
1261	Technos
1262	Technos
1263	Technos
1264	Technos
1265	Technos
1266	Technos
1267	Technos
1268	Technos
1269	Technos
1270	Technos
1271	Technos
1272	Technos
1273	Technos
1274	Technos
1275	Technos
1276	Technos
1277	Technos
1278	Technos
1279	Technos
1280	Technos
1281	Technos
1282	Technos
1283	Technos
1284	Technos
1285	Technos
1286	Technos
1287	Technos
1288	Technos
1289	Technos
1290	Technos
1291	Technos
1292	Technos
1293	Technos
1294	Technos
1295	Technos
1296	Technos
1297	Technos
1298	Technos
1299	Technos
1300	Technos
1301	Technos
1302	Technos
1303	Technos
1304	Technos
1305	Technos
1306	Technos
1307	Technos
1308	Technos
1309	Technos
1310	Technos
1311	Technos
1312	Technos
1313	Technos
1314	Technos
1315	Technos
1316	Technos
1317	Technos
1318	Technos
1319	Technos
1320	Technos
1321	Technos
1322	Technos
1323	Technos
1324	Technos
1325	Technos
1326	Technos
1327	Technos
1328	Technos
1329	Technos
1330	Technos
1331	Technos
1332	Technos
1333	Technos
1334	Technos
1335	Technos
1336	Technos
1337	Technos
1338	Technos
1339	Technos
1340	Technos
1341	Technos
1342	Technos
1343	Technos
1344	Technos
1345	Technos
1346	Technos
1347	Technos
1348	Technos
1349	Technos
1350	Technos
1351	Technos
1352	Technos
1353	Technos
1354	Technos
1355	Technos
1356	Technos
1357	Technos
1358	Technos
1359	Technos
1360	Technos
1361	Technos
1362	Technos
1363	Technos
1364	Technos
1365	Technos
1366	Technos
1367	Technos
1368	Technos
1369	Technos
1370	Technos
1371	Technos
1372	Technos
1373	Technos
1374	Technos
1375	Technos
1376	Technos
1377	Technos
1378	Technos
1379	Technos
1380	Technos
1381	Technos
1382	Technos
1383	Technos
1384	Technos
1385	Technos
1386	Technos
1387	Technos
1388	Technos
1389	Technos
1390	Technos
1391	Technos
1392	Technos
1393	Technos
1394	Technos
1395	Technos
1396	Technos
1397	Technos
1398	Technos
1399	Technos
1400	Technos
1401	Technos
1402	Technos
1403	Technos
1404	Technos
1405	Technos
1406	Technos
1407	Technos
1408	Technos
1409	Technos
1410	Technos
1411	Technos
1412	Technos
1413	Technos
1414	Technos
1415	Technos
1416	Technos
1417	Technos
1418	Technos
1419	Technos
1420	Technos
1421	Technos
1422	Technos
1423	Technos
1424	Technos
1425	Technos
1426	Technos
1427	Technos
1428	Technos
1429	Technos
1430	Technos
1431	Technos
1432	Technos
1433	Technos
1434	Technos
1435	Technos
1436	Technos
1437	Technos
1438	Technos
1439	Technos
1440	Technos
1441	Technos
1442	Technos
1443	Technos
1444	Technos
1445	Technos
1446	Technos
1447	Technos
1448	Technos
1449	Technos
1450	Technos
1451	Technos
1452	Technos
1453	Technos
1454	Technos
1455	Technos
1456	Technos
1457	Technos
1458	Technos
1459	Technos
1460	Technos
1461	Technos
1462	Technos
1463	Technos
1464	Technos
1465	Technos
1466	Technos
1467	Technos
1468	Technos
1469	Technos
1470	Technos
1471	Technos
1472	Technos
1473	Technos
1474	Technos
1475	Technos
1476	Technos
1477	Technos
1478	Technos
1479	Technos
1480	Technos
1481	Technos
1482	Technos
1483	Technos
1484	Technos
1485	Technos
1486	Technos
1487	Technos
1488	Technos
1489	Technos
1490	Technos
1491	Technos
1492	Technos
1493	Technos
1494	Technos
1495	Technos
1496	Technos
1497	Technos
1498	Technos
1499	Technos
1500	Technos
1501	Technos
1502	Technos
1503	Technos
1504	Technos
1505	Technos
1506	Technos
1507	Technos
1508	Technos
1509	Technos
1510	Technos
1511	Technos
1512	Technos
\.


--
-- TOC entry 2958 (class 0 OID 16389)
-- Dependencies: 198
-- Data for Name: salesman; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

COPY wristwatch.salesman (name) FROM stdin;
Condor
Technos
Montblanc
\.


--
-- TOC entry 2960 (class 0 OID 16397)
-- Dependencies: 200
-- Data for Name: user; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

COPY wristwatch."user" (id, email, password, name) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 16427)
-- Dependencies: 202
-- Data for Name: wristwatch; Type: TABLE DATA; Schema: wristwatch; Owner: postgres
--

COPY wristwatch.wristwatch (id, name, qtd_plots, brand_name, price, plots_price, collection_name) FROM stdin;
819	Montblanc Star Legacy Automatic Date 42 mm	10	Montblanc	12060.00	1570.00	Star Legacy
820	Montblanc Star Classique Automatic	10	Montblanc	11871.00	1540.00	Star Classique
821	Montblanc Star Classique Automatic	10	Montblanc	17460.00	2270.00	Star Classique
822	Montblanc TimeWalker ChronoVoyager UTC	10	Montblanc	19890.00	2580.00	TimeWalker
823	Vintage Tachydate	10	Montblanc	172260.00	22400.00	Villeret
824	Vintage Tachydate	10	Montblanc	179550.00	23300.00	Villeret
825	Relógio Condor Masculino Civic Dourado COVD54BD/4P	10	Condor	359.90	35.99	Civic
826	Relógio Condor Masculino Civic Dourado COVD54BE/2K	10	Condor	339.90	33.99	Civic
827	Relógio Condor Masculino Civic Dourado COVD54BD/4A	10	Condor	359.90	35.99	Civic
828	Relógio Condor Masculino Metal Prata CO2115KUC/3P	10	Condor	179.90	17.99	Metal
829	Relógio Condor Masculino Digital Prata COBJ3463AD/3K	10	Condor	239.90	23.99	Prata
830	Relógio Condor Masculino Couro Bicolor CO2035MPJ/K5C	10	Condor	199.90	19.99	Couro
831	Relógio Condor Masculino Metal Prata CO2035MPH/K3B	10	Condor	199.90	19.99	Metal
832	Relógio Condor Masculino Metal Dourado CO2035MPI/K4P	10	Condor	219.90	21.99	Metal
833	Relógio Condor Masculino Metal Dourado CO2035MPI/K4D	10	Condor	219.90	21.99	Metal
834	Relógio Condor Masculino Speed Prata CO2115KUP/K3K	10	Condor	229.90	22.99	Prata
835	Relógio Condor Masculino Speed Dourado CO2115KUO/K4D	10	Condor	239.90	23.99	Speed
836	Relógio Condor Masculino Speed Bicolor CO2115KUN/K2A	10	Condor	229.90	22.99	Speed
837	Relógio Condor Masculino Speed Prata CO2115KUM/K2C	10	Condor	219.90	21.99	Prata
838	Relógio Condor Masculino Civic Dourado COVD54BB/2D	10	Condor	339.90	33.99	Civic
839	Relógio Condor Masculino Couro Bicolor CO2035KYM/2B	10	Condor	179.90	17.99	Couro
840	Relógio Condor Masculino Speed Prata CO2115KUH/2K	10	Condor	199.90	19.99	Prata
841	Relógio Condor Masculino Speed Prata CO2115KUG/3C	10	Condor	219.90	21.99	Prata
842	Relógio Condor Masculino Metal Prata CO2035MPM/3V	10	Condor	179.90	17.99	Metal
843	Relógio Condor Masculino Metal Prata CO2035MPN/3F	10	Condor	179.90	17.99	Metal
844	Relógio Condor Masculino Metal Prata CO2035KYL/3A	10	Condor	179.90	17.99	Metal
845	Relógio Condor Masculino Couro Preto CO2035MPE/2D	10	Condor	189.90	18.99	Couro
846	Relógio Condor Masculino Civic Prata COVD54BC/3K	10	Condor	339.90	33.99	Prata
847	Relógio Condor Masculino Metal Dourado CO2035MPG/4A	10	Condor	199.90	19.99	Metal
848	Relógio Condor Masculino Couro Dourado CO2035MPF/2B	10	Condor	179.90	17.99	Couro
849	Relógio Condor Masculino Couro Preto CO2035MPE/2P	10	Condor	189.90	18.99	Couro
850	Relógio Condor Masculino Civic Bicolor COVD54AY/4P	10	Condor	369.90	36.99	Civic
851	Relógio Condor Masculino Civic Dourado COJP25AA/4D	10	Condor	359.90	35.99	Civic
852	Relógio Condor Masculino Casual Digital Dourado COBJ3463AA/4D	10	Condor	259.90	25.99	Casual
853	Relógio Condor Masculino Casual Digital Prata COBJ3463AC/3K	10	Condor	219.90	21.99	Prata
854	Relógio Condor Masculino Civic Prata COVD54AX/3B	10	Condor	339.90	33.99	Prata
855	Relógio Condor Masculino Civic Dourado COVD54AW/4K	10	Condor	359.90	35.99	Civic
856	Relógio Condor Masculino Casual Bicolor CO2035KYG/K5M	10	Condor	219.90	21.99	Casual
857	Relógio Condor Masculino Casual Dourado CO2035KYE/K2B	10	Condor	199.90	19.99	Casual
858	Relógio Condor Masculino Casual Bicolor CO2115KTR/K3C	10	Condor	219.90	21.99	Casual
859	Relógio Condor Masculino Casual Bicolor CO2115KTQ/K3K	10	Condor	209.90	20.99	Casual
860	Relógio Condor Masculino Casual Digital Prata COBJ3463AB/2K	10	Condor	239.90	23.99	Prata
861	Relógio Condor Masculino Speed Dourado CO2115KTY/2C	10	Condor	209.90	20.99	Speed
862	Relógio Condor Masculino Speed Prata CO2115KTX/3P	10	Condor	219.90	21.99	Prata
863	Relógio Condor Masculino Speed Prata CO2115KTX/3C	10	Condor	219.90	21.99	Prata
864	Relógio Condor Masculino Speed Dourado CO2115KTW/4P	10	Condor	229.90	22.99	Speed
865	Relógio Condor Masculino Civic Prata CO2115KUA/T3A	10	Condor	329.90	32.99	Prata
866	Relógio Condor Masculino Civic Dourado CO2115KTZ/4K	10	Condor	319.90	31.99	Civic
867	Relógio Condor Masculino Traveller Prata CO6P29IS/3A	10	Condor	229.90	22.99	Prata
868	Relógio Condor Masculino Traveller Prata CO6P29IR/3P	10	Condor	249.90	24.99	Prata
869	Relógio Condor Masculino Casual Dourado CO2115KTT/4D	10	Condor	199.90	19.99	Casual
870	Relógio Condor Masculino Casual Prata CO2115KTV/3V	10	Condor	179.90	17.99	Prata
871	Relógio Condor Masculino Casual Prata CO2115KTU/3P	10	Condor	179.00	17.90	Prata
872	Relógio Condor Masculino Casual Dourado CO2115KTT/4A	10	Condor	199.90	19.99	Casual
873	Relógio Condor Masculino Casual Dourado CO2035KYF/4C	10	Condor	219.90	21.99	Casual
874	Relógio Condor Masculino Casual Prata CO2035KYD/3A	10	Condor	199.90	19.99	Prata
875	Relógio Condor Masculino Casual Bicolor CO2115KTP/2C	10	Condor	179.90	17.99	Casual
876	Relógio Condor Masculino Casual Bicolor CO2115KTS/4P	10	Condor	209.90	20.99	Casual
877	Relógio Condor Masculino Civic Prata COVD54AV/2K	10	Condor	319.90	31.99	Prata
878	Relógio Condor Masculino Civic Dourado COVD54AW/4P	10	Condor	359.90	35.99	Civic
879	Relógio Condor Masculino Casual Dourado CO2035KXD/K4C	10	Condor	219.90	21.99	Casual
880	Relógio Condor Masculino Metal Prata - CO2115KTO/T3P	10	Condor	219.90	21.99	Metal
881	Relógio Condor Masculino Metal Dourado - CO2115KTN/T4A	10	Condor	239.90	23.99	Metal
882	Relógio Condor Masculino Metal Dourado - CO2115KTN/4D	10	Condor	199.90	19.99	Metal
883	Relógio Condor Masculino Metal Prata - CO2115KTO/3C	10	Condor	179.90	17.99	Metal
884	Relógio Condor Masculino Metal Dourado - CO2039AZ/4A	10	Condor	199.90	19.99	Metal
885	Relógio Condor Masculino Metal Prata - CO2039BA/3C	10	Condor	179.90	17.99	Metal
886	Relógio Condor Masculino Metal Dourado - CO2039AZ/4D	10	Condor	199.90	19.99	Metal
887	Relógio Condor Masculino Couro Dourado - CO2039BB/2K	10	Condor	179.90	17.99	Couro
888	Relógio Condor Masculino Couro Dourado - CO2035KWV/K2D	10	Condor	199.90	19.99	Couro
889	Relógio Condor Masculino Civic Prata - CO2317AD/2K	10	Condor	289.90	28.99	Prata
890	Relógio Condor Masculino Couro Dourado - CO2036KUO/K4V	10	Condor	219.90	21.99	Couro
891	Relógio Condor Masculino Couro Prata - CO2036KUL/K2P	10	Condor	179.90	17.99	Couro
892	Relógio Condor Masculino Couro Dourado - CO2036KUM/2A	10	Condor	179.90	17.99	Couro
893	Relógio Condor Masculino Couro Prata - CO2036KUN/3C	10	Condor	179.90	17.99	Couro
894	Relógio Condor Masculino Civic Prata - CO2317AB/3K	10	Condor	309.90	30.99	Prata
895	Relógio Condor Masculino Civic Dourado - CO2317AA/4A	10	Condor	319.90	31.99	Civic
896	Relógio Condor Masculino Speed Prata - CO2115KTH/3C	10	Condor	219.90	21.99	Prata
897	Relógio Condor Masculino Speed Prata - CO2115KTI/2K	10	Condor	199.90	19.99	Prata
898	Relógio Condor Masculino Civic Dourado - CO2317AC/2P	10	Condor	299.90	29.99	Civic
899	Relógio Condor Masculino Speed Dourado - CO2115KTJ/4D	10	Condor	229.90	22.99	Speed
900	Relógio Condor Masculino Metal Dourado - CO2035KWT/4P	10	Condor	199.90	19.99	Metal
901	Relógio Condor Masculino Couro Dourado - CO2035KWV/2A	10	Condor	179.90	17.99	Couro
902	Relógio Condor Masculino Anadigi Dourado - COY121E6AD/3P	10	Condor	289.90	28.99	Anadigi
903	Relógio Condor Masculino Anadigi Dourado - COY121E6AA/4P	10	Condor	299.90	29.99	Anadigi
904	Relógio Condor Masculino Anadigi Grafite - COY121E6AB/4P	10	Condor	309.90	30.99	Anadigi
905	Relógio Condor Masculino Anadigi Prata - COY121E6AC/3P	10	Condor	289.90	28.99	Prata
906	Relógio Condor Masculino Anadigi Grafite - COY121E6AE/2P	10	Condor	299.90	29.99	Anadigi
907	Relógio Condor Masculino Speed Grafite - CO2115KTL/K2C	10	Condor	239.90	23.99	Speed
908	Relógio Condor Masculino Metal Prata - CO2035KWU/K3C	10	Condor	199.90	19.99	Metal
909	Relógio Condor Masculino Speed Prata - CO2115KTK/K3K	10	Condor	229.90	22.99	Prata
910	Relógio Condor Masculino Speed Prata - CO2115KTK/K3C	10	Condor	229.90	22.99	Prata
911	Relógio Condor Masculino Speed Dourado - CO2115KTM/K4A	10	Condor	239.90	23.99	Speed
912	Relógio Condor Masculino Speed Dourado - CO2115KTJ/4C	10	Condor	229.90	22.99	Speed
913	Relógio Condor Masculino Casual Prata - CO2115KTD/2A	10	Condor	169.90	16.99	Prata
914	Relógio Condor Masculino Casual Dourado - CO2115KTF/4D	10	Condor	199.90	19.99	Casual
915	Relógio Condor Masculino Casual Dourado - CO2115KTE/K2P	10	Condor	199.90	19.99	Casual
916	Relógio Condor Masculino Casual Prata - CO2115KTG/K3K	10	Condor	199.90	19.99	Prata
917	Relógio Condor Masculino Traveller Prata - CO6P29IO/2A	10	Condor	229.90	22.99	Prata
918	Relógio Condor Masculino Traveller Prata - CO6P29IM/3B	10	Condor	249.90	24.99	Prata
919	Relógio Condor Masculino Speed Prata - CO2115KSY/K3K	10	Condor	229.90	22.99	Prata
920	Relógio Condor Masculino Speed Prata - CO2115KSY/K3C	10	Condor	229.90	22.99	Prata
921	Relógio Condor Masculino Ferragens Preto - COVD54AVUL/8P	10	Condor	349.90	34.99	Ferragens
922	Relógio Condor Masculino Ferragens Dourado - COVD54AU/4D	10	Condor	359.90	35.99	Ferragens
923	Relógio Condor Masculino Ferragens Dourado - COVD54AU/4C	10	Condor	359.90	35.99	Ferragens
924	Relógio Condor Masculino Ferragens Prata - COVD54AT/3K	10	Condor	339.90	33.99	Prata
925	Relógio Condor Masculino Ferragens Prata - CO2415BM/3C	10	Condor	309.90	30.99	Prata
926	Relógio Condor Masculino Ferragens Prata - CO2415BM/3A	10	Condor	309.90	30.99	Prata
927	Relógio Condor Masculino Ferragens Dourado - CO2415BL/4P	10	Condor	319.90	31.99	Ferragens
928	Relógio Condor Masculino Ferragens Dourado - CO2415BL/4K	10	Condor	319.90	31.99	Ferragens
929	Relógio Condor Masculino Speed Dourado - CO2115KSZ/K8K	10	Condor	229.90	22.99	Speed
930	Relógio Condor Masculino Speed Prata - CO2115KSY/K3A	10	Condor	229.90	22.99	Prata
931	Relógio Condor Masculino Casual Bicolor - CO2036KTZ/K5C	10	Condor	219.90	21.99	Casual
932	Relógio Condor Masculino Casual Dourado - CO2036KTY/4P	10	Condor	199.90	19.99	Casual
933	Relógio Condor Masculino Speed Dourado - CO2115KTA/4C	10	Condor	229.90	22.99	Speed
934	Relógio Condor Masculino Speed Dourado - CO2115KTA/K4D	10	Condor	239.90	23.99	Speed
935	Relógio Condor Masculino Speed Dourado - CO2115KTA/K4P	10	Condor	239.90	23.99	Speed
936	Relógio Condor Masculino Casual Grafite - CO2036KTW/2C	10	Condor	189.90	18.99	Casual
937	Relógio Condor Masculino Metal - CO2315AH/K4X	10	Condor	219.90	21.99	Metal
938	Relógio Condor Masculino Casual Metal Prata - CO2115KSU/3K	10	Condor	179.90	17.99	Metal
939	Relógio Condor Masculino Casual Metal Prata - CO2115KSR/3C	10	Condor	179.90	17.99	Metal
940	Relógio Condor Masculino Casual Metal Prata - CO2115KSR/3K	10	Condor	179.90	17.99	Metal
941	Relógio Condor Masculino Casual Metal Prata - COGL10BQ/3P	10	Condor	199.90	19.99	Metal
942	Relógio Condor Masculino Casual Couro Dourado - COGL10BS/2B	10	Condor	189.90	18.99	Couro
943	Relógio Condor Masculino Casual Metal Dourado - CO2115KSS/K4P	10	Condor	219.90	21.99	Metal
944	Relógio Condor Masculino Casual Couro Dourado - COGM10AB/2A	10	Condor	219.90	21.99	Couro
945	Relógio Condor Masculino Casual Metal Dourado - COGM10AA/4K	10	Condor	239.90	23.99	Metal
946	Relógio Condor Masculino Casual Couro Prata - CO2115KSV/K2P	10	Condor	179.90	17.99	Couro
947	Relógio Condor Masculino Casual Couro Bicolor - CO2115KSW/5D	10	Condor	179.90	17.99	Couro
948	Relógio Condor Masculino Casual Couro Dourado - CO2115KSX/2D	10	Condor	179.90	17.99	Couro
949	Relógio Condor Masculino Casual Couro Dourado - CO2115KSX/2C	10	Condor	179.90	17.99	Couro
950	Relógio Condor Masculino Casual Couro Dourado - CO2115KST/K2P	10	Condor	199.90	19.99	Couro
951	Relógio Condor Masculino Casual Couro Dourado - CO2115KSO/2C	10	Condor	179.90	17.99	Couro
952	Relógio Condor Masculino Casual Couro Prata - CO2115KSP/0K	10	Condor	169.90	16.99	Couro
953	Relógio Condor Masculino Casual Couro Dourado - CO2115KSO/2A	10	Condor	179.90	17.99	Couro
954	Relógio Condor Masculino Casual Metal Dourado - CO2035KVE/K4M	10	Condor	175.00	17.50	Metal
955	Relógio Condor Masculino Casual Metal Dourado - CO2035KVB/4A	10	Condor	199.90	19.99	Metal
956	Relógio Condor Masculino Casual Couro Dourado - CO2035KVD/2D	10	Condor	179.90	17.99	Couro
957	Relógio Condor Masculino Casual Metal Dourado - CO2035KVE/4D	10	Condor	159.00	15.90	Metal
958	Relógio Condor Masculino Casual Metal Dourado - CO2035KVB/4K	10	Condor	199.90	19.99	Metal
959	Relógio Condor Masculino Casual Metal Bicolor - CO2035KVG/5C	10	Condor	159.00	15.90	Metal
960	Relógio Condor Masculino Casual Metal Prata - CO2035KVH/3V	10	Condor	143.00	14.30	Metal
961	Relógio Condor Masculino Speed - CO2115YF/KS3C	10	Condor	229.90	22.99	Speed
962	Relógio Condor Masculino Metal - CO2035KUH/KS4A	10	Condor	219.90	21.99	Metal
963	Relógio Condor Masculino Metal - CO2115VO/K3K	10	Condor	199.90	19.99	Metal
964	Relógio Condor Masculino Metal - CO2115XN/4K	10	Condor	199.90	19.99	Metal
965	Relógio Condor Masculino Metal - CO2115WI/K3A	10	Condor	199.90	19.99	Metal
966	Relógio Condor Masculino Speed - CO2115TR/K3C	10	Condor	174.92	17.49	Speed
967	Relógio Condor Masculino Metal - CO2036DC/K4C	10	Condor	219.90	21.99	Metal
968	Relógio Condor Masculino Metal - CO2035KOT/K3P	10	Condor	152.10	15.21	Metal
969	Relógio Condor Masculino Metal - CO2035KNI/3K	10	Condor	129.27	12.92	Metal
970	Relógio Condor Masculino Anadigi - COAD1146AA/3P	10	Condor	289.90	28.99	Anadigi
971	Relógio Condor Masculino Anadigi - COAD1146AA/3R	10	Condor	289.90	28.99	Anadigi
972	Relógio Condor Masculino Anadigi - COAD1146AA/3A	10	Condor	231.00	23.10	Anadigi
973	Relógio Condor Masculino Anadigi - COAD1146AB/8P	10	Condor	279.90	27.99	Anadigi
974	Relógio Condor Masculino Metal - CO2035KNL/3B	10	Condor	143.00	14.30	Metal
975	Relógio Condor Masculino Prata - KC20985/3R	10	Condor	219.90	21.99	Prata
976	Relógio Condor Masculino Civic COVD33BB/8C	10	Condor	339.90	33.99	Civic
977	Relógio Condor Masculino Civic COVD33AV/8P - Preto	10	Condor	339.90	33.99	Civic
978	Relógio Condor Masculino Speed - CO2115YC/3A	10	Condor	219.90	21.99	Speed
979	Relógio Condor Masculino Speed - CO2115YD/8P	10	Condor	199.90	19.99	Speed
980	Relógio Condor Masculino Civic CO2415BG/3A - Prata	10	Condor	309.90	30.99	Prata
981	Relógio Condor Masculino Civic - COVD33AZ/4D	10	Condor	359.90	35.99	Civic
982	Relógio Condor Masculino Civic - CO2415BK/8P	10	Condor	219.89	21.98	Civic
983	Relógio Condor Masculino Civic - COVD33BA/3A	10	Condor	339.90	33.99	Civic
984	Relógio Condor Masculino Metal CO2115XB/5K - 0	10	Condor	199.90	19.99	Metal
985	Relógio Condor Masculino Speed CO2115YB/4P - Dourado	10	Condor	229.90	22.99	Speed
986	Relógio Condor Masculino Civic CO2415BF/4K - Dourado	10	Condor	319.90	31.99	Civic
987	Relógio Condor Masculino Civic CO2415BF/4C - Dourado	10	Condor	319.90	31.99	Civic
988	Relógio Condor Masculino Civic CO2415BH/8K - Preto	10	Condor	299.90	29.99	Civic
989	Relógio Condor Masculino Civic CO2415BJ/3K - Prata	10	Condor	247.00	24.70	Prata
990	Relógio Condor Masculino Metal CO2115XC/3M - 0	10	Condor	179.90	17.99	Metal
991	Relógio Condor Masculino Couro CO2115XD/2P - Preto	10	Condor	169.90	16.99	Couro
992	Relógio Condor Masculino Metal E Couro CO2115XW/K4D - Dourado, Marrom	10	Condor	239.90	23.99	Couro
993	Relógio Condor Masculino Metal E Couro CO2039AF/3P - Prata	10	Condor	179.90	17.99	Couro
994	Relógio Condor Masculino Metal E Couro CO2115XV/K5A - Prata, Jeans	10	Condor	249.90	24.99	Couro
995	Relógio Condor Masculino Metal E Couro CO2039AE/2M - Marrom	10	Condor	136.20	13.62	Couro
996	Relógio Condor Masculino Metal E Couro CO2039AG/4C - Dourado	10	Condor	139.00	13.90	Couro
997	Relógio Condor Masculino Civic COVD54AR/4D - Dourado	10	Condor	359.90	35.99	Civic
998	Relógio Condor Masculino Neon CO1161B/8P - Preto	10	Condor	223.00	22.30	Neon
999	Relógio Condor Masculino Neon CO1161A/3A - Prata	10	Condor	289.90	28.99	Prata
1000	Relógio Condor Masculino Neon CO1161A/3V - Prata	10	Condor	279.90	27.99	Prata
1001	Relógio Condor Masculino Neon CO1161B/8K - Preto	10	Condor	279.90	27.99	Neon
1002	Relógio Condor Masculino Civic CO2315BC/4D - Dourado	10	Condor	319.90	31.99	Civic
1003	Relógio Condor Masculino Civic CO2315BC/4P - Dourado	10	Condor	319.90	31.99	Civic
1004	Relógio Condor Masculino Civic CO2315BD/2A - Azul	10	Condor	299.90	29.99	Civic
1005	Relógio Condor Masculino Civic CO2315BB/3A - Prata	10	Condor	309.90	30.99	Prata
1006	Relógio Condor Masculino Civic COVD54AQ/3K - Prata	10	Condor	339.90	33.99	Prata
1007	Kit Relógio Condor Masculino Xadrez CO2115XQ/K3V - Prata	10	Condor	146.96	14.69	Prata
1008	Relógio Condor Masculino Xadrez CO2115XO/3A - Jeans	10	Condor	169.90	16.99	Xadrez
1009	Relógio Condor Masculino Xadrez CO2115XN/4C - Dourado	10	Condor	199.90	19.99	Xadrez
1010	Relógio Condor Masculino Anadigi CO1154BR/3K - Prata	10	Condor	195.00	19.50	Prata
1011	Relógio Condor Masculino Anadigi CO1154BR/3R - Prata	10	Condor	195.00	19.50	Prata
1012	Relógio Condor Masculino Speed CO2115XI/3K - Prata	10	Condor	176.00	17.60	Prata
1013	Relógio Condor Masculino Gradeados COVD33AR/4D - Dourado	10	Condor	359.90	35.99	Gradeados
1014	Relógio Condor Masculino Gradeados COVD33AR/4C - Dourado	10	Condor	359.90	35.99	Gradeados
1015	Relógio Condor Masculino Gradeados CO2415BE/8P - Preto	10	Condor	299.90	29.99	Gradeados
1016	Relógio Condor Masculino Gradeados CO2415BC/3K - Prata	10	Condor	249.90	24.99	Prata
1017	Relógio Condor Masculino Speed CO2115XM/8P - Preto	10	Condor	209.90	20.99	Speed
1018	Relógio Condor Masculino Speed CO2115XL/3C - Prata	10	Condor	175.00	17.50	Prata
1019	Relógio Condor Masculino Speed CO2115XK/4D - Dourado	10	Condor	229.90	22.99	Speed
1020	Relógio Condor Masculino Speed CO2115XJ/8K - Preto	10	Condor	139.00	13.90	Speed
1021	Relógio Condor Masculino Speed CO2115XI/3A - Prata	10	Condor	153.00	15.30	Prata
1022	Kit Relógio Condor Masculino Metal E Couro CO2035KSR/K4D - Dourado	10	Condor	219.90	21.99	Couro
1023	Kit Relógio Condor Masculino Metal E Couro CO2035KSQ/K3K - Prata	10	Condor	199.90	19.99	Couro
1024	Relógio Condor Masculino Metal E Couro CO2035KSP/3A - Azul	10	Condor	179.90	17.99	Couro
1025	Relógio Condor Masculino Metal E Couro CO2035KSO/2P - Preto	10	Condor	179.90	17.99	Couro
1026	Relógio Condor Masculino Metal E Couro CO2035KSN/4D - Dourado	10	Condor	199.90	19.99	Couro
1027	Kit Relógio Condor Masculino Metal E Couro CO2115XE/K3A - Prata	10	Condor	199.90	19.99	Couro
1028	Kit Relógio Condor Masculino Metal E Couro CO2115XF/K4K - Dourado	10	Condor	175.00	17.50	Couro
1029	Kit Relógio Condor Masculino Metal E Couro CO2115XG/K3K - Preto	10	Condor	179.90	17.99	Couro
1030	Relógio Condor Masculino Ritmo Envolvente CO2036DF/2M - Marrom	10	Condor	143.00	14.30	Ritmo Envolvente
1031	Relógio Condor Masculino Ritmo Envolvente CO2115WV/3K - Prata	10	Condor	175.00	17.50	Prata
1032	Relógio Condor Masculino Ritmo Envolvente CO2115UV/3A - Prata	10	Condor	219.90	21.99	Prata
1033	Relógio Condor Masculino Ritmo Envolvente COVD54AP/8A - Preto	10	Condor	349.90	34.99	Ritmo Envolvente
1034	Relógio Condor Masculino Ritmo Envolvente COVD54AO/3C - Prata	10	Condor	339.90	33.99	Prata
1035	Relógio Condor Masculino Ritmo Envolvente CO2115WZ/8P - Preto	10	Condor	299.90	29.99	Ritmo Envolvente
1036	Relógio Condor Masculino Ritmo Envolvente CO2115WY/3K - Prata	10	Condor	309.90	30.99	Prata
1037	Relógio Condor Masculino Ritmo Envolvente CO2115WP/4P - Dourado	10	Condor	229.90	22.99	Ritmo Envolvente
1038	Relógio Condor Masculino Ritmo Envolvente CO2115WX/4P - Dourado	10	Condor	319.90	31.99	Ritmo Envolvente
1039	Relógio Condor Masculino Ritmo Envolvente CO2115WX/4A - Dourado	10	Condor	319.90	31.99	Ritmo Envolvente
1040	Relógio Condor Masculino Ritmo Envolvente CO2036DD/3K - Prata	10	Condor	179.90	17.99	Prata
1041	Relógio Condor Masculino Ritmo Envolvente CO2036DC/4C - Dourado	10	Condor	199.90	19.99	Ritmo Envolvente
1042	Relógio Condor Masculino Ritmo Envolvente CO2115WW/8C - Preto	10	Condor	199.90	19.99	Ritmo Envolvente
1043	Relógio Condor Masculino Ritmo Envolvente CO2115WU/4P - Dourado	10	Condor	229.90	22.99	Ritmo Envolvente
1044	Relógio Condor Masculino Ritmo Envolvente CO2115WT/8C - Preto	10	Condor	209.90	20.99	Ritmo Envolvente
1045	Relógio Condor Masculino Ritmo Envolvente CO2115WS/3P - Prata	10	Condor	219.90	21.99	Prata
1046	Relógio Condor Masculino Ritmo Envolvente CO2036KRV/5K - Prata	10	Condor	199.90	19.99	Prata
1047	Relógio Condor Masculino Metal E Couro CO2115WL/4A - Dourado	10	Condor	199.90	19.99	Couro
1048	Relógio Condor Masculino Metal E Couro CO2115WI/3A - Prata	10	Condor	179.90	17.99	Couro
1049	Relógio Condor Masculino Casual CO2115VR/2K - Cinza	10	Condor	135.00	13.50	Casual
1050	Relógio Condor Masculino Casual CO2035KOT/3K - Prata	10	Condor	179.90	17.99	Prata
1051	Relógio Condor Masculino Casual CO2035KQN/4K - Dourado	10	Condor	199.90	19.99	Casual
1052	Relógio Condor Masculino Casual CO2115VP/4D - Dourado	10	Condor	199.90	19.99	Casual
1053	Relógio Condor Masculino Civic CO2315AV/3C - Prata	10	Condor	247.00	24.70	Prata
1054	Relógio Condor Masculino Casual CO2035KOT/3P - Prata	10	Condor	179.90	17.99	Prata
1055	Relógio Condor Masculino Casual CO2115VY/3K - Prata	10	Condor	179.90	17.99	Prata
1056	Relógio Condor Masculino Casual CO2115VQ/4A - Dourado	10	Condor	199.90	19.99	Casual
1057	Relógio Condor Masculino Civic CO2315AW/4X - Dourado	10	Condor	243.40	24.34	Civic
1058	Relógio Condor Masculino Civic CO2315AX/8C - Preto	10	Condor	299.90	29.99	Civic
1059	Relógio Condor Masculino Casual CO2115VP/4M - Dourado	10	Condor	199.90	19.99	Casual
1060	Relógio Condor Masculino Casual CO2035KOS/4X - Dourado	10	Condor	199.90	19.99	Casual
1061	Relógio Condor Masculino Casual CO2035KOS/4K - Dourado	10	Condor	199.90	19.99	Casual
1062	Relógio Condor Masculino Civic CO2315AT/8C - Cinza	10	Condor	209.00	20.90	Civic
1063	Relógio Condor Masculino Civic CO2415AY/4C - Dourado	10	Condor	243.40	24.34	Civic
1064	Relógio Condor Masculino Civic CO2315AU/3K - Prata	10	Condor	268.70	26.87	Prata
1065	Relógio Condor Masculino Civic CO2415AZ/3A - Prata	10	Condor	247.00	24.70	Prata
1066	Relógio Condor Masculino Civic CO2315AY/3K - Prata	10	Condor	309.90	30.99	Prata
1067	Relógio Condor Masculino Casual CO2115WB/8C - Preto	10	Condor	209.90	20.99	Casual
1068	Relógio Condor Masculino Casual CO2115WA/3K - Prata	10	Condor	219.90	21.99	Prata
1069	Relógio Condor Masculino Casual CO2115VZ/4P - Dourado	10	Condor	229.90	22.99	Casual
1070	Relógio Condor Masculino Civic COVD54AE/4A - Dourado	10	Condor	359.90	35.99	Civic
1071	Kit Relógio Condor Masculino Calotas CO2115VV/K8A - Cinza	10	Condor	125.93	12.59	Calotas
1072	Relógio Condor Masculino Civic COVD54AM/2M - Marrom	10	Condor	339.90	33.99	Civic
1073	Relógio Condor Masculino Calotas CO2115VW/3A - Prata	10	Condor	149.90	14.99	Calotas
1074	Relógio Condor Masculino Civic COVD54AD/3P - Prata	10	Condor	339.90	33.99	Prata
1075	Relógio Condor Masculino Casual CO2115VO/3K - Prata	10	Condor	179.90	17.99	Prata
1076	Relógio Condor Masculino Casual CO2115VN/4P - Dourado	10	Condor	199.90	19.99	Casual
1077	Relógio Condor Masculino Casual CO2115VJ/4C - Dourado	10	Condor	199.90	19.99	Casual
1078	Relógio Condor Masculino Casual CO2115VM/4X - Dourado	10	Condor	199.90	19.99	Casual
1079	Relógio Condor Masculino Casual CO2115VL/2K - Marrom	10	Condor	143.00	14.30	Casual
1080	Relógio Condor Coleção Urbano CO2415AS/3C - Prata	10	Condor	216.00	21.60	Prata
1081	Relógio Condor Coleção Urbano CO2415AT/4A - Dourado	10	Condor	243.40	24.34	Urbano
1082	Kit Relógio Condor Casual Prata - CO2035KNL/K3C	10	Condor	167.32	16.73	Prata
1083	Kit Relógio Condor Casual Prata - CO2035KNL/K3B	10	Condor	139.93	13.99	Prata
1084	Relógio Condor Casual Prata - CO2035KNI/3C	10	Condor	129.27	12.92	Prata
1085	Relógio Condor Esportivo Prata - CO2115UY/3C	10	Condor	247.00	24.70	Prata
1086	Relógio Condor Esportivo Prata - CO2415AO/3A	10	Condor	249.90	24.99	Prata
1087	Relógio Condor Esportivo Prata - COVD33AK/3P	10	Condor	242.72	24.27	Prata
1088	Relógio Condor Masculino 3D Geométrico - Preto CO2036DF/2P	10	Condor	179.90	17.99	3D Geométrico
1089	Relógio Condor Masculino 3D Geométrico - Dourado CO2036DE/4B	10	Condor	199.90	19.99	3D Geométrico
1090	Relógio Condor Masculino 3D Geométrico - Prata CO2036DJ/3C	10	Condor	179.90	17.99	Prata
1091	Relógio Condor Masculino 3D Geométrico - Dourado CO2036DE/4M	10	Condor	199.90	19.99	3D Geométrico
1092	Relógio Condor Masculino 3D Geométrico - Dourado CO2036DC/4A	10	Condor	199.90	19.99	3D Geométrico
1093	Relógio Condor Masculino 3D Geométrico - Dourado CO2036DC/4X	10	Condor	199.90	19.99	3D Geométrico
1094	Relógio Condor Masculino 3D Geométrico - Prata CO2036DD/3P	10	Condor	149.90	14.99	Prata
1095	Troca Pulseiras Condor Coleção Militar - CO2115UM/3C	10	Condor	153.93	15.39	Militar
1096	Troca pulseiras Condor Coleção Militar - CO2115UM/3B	10	Condor	153.93	15.39	Militar
1097	Relógio Condor Masculino Prata CO2115TQ/3C	10	Condor	198.90	19.89	Prata
1098	Relógio Condor Masculino Speed - CO2115UT/8C	10	Condor	199.90	19.99	Speed
1099	Relógio Condor Masculino Esportivo Anadigi - CO1101AD/3P	10	Condor	212.97	21.29	Anadigi
1100	Relógio Condor Masculino Esportivo Anadigi - CO1101AG/8K	10	Condor	259.90	25.99	Anadigi
1101	Relógio Condor Casual Metal - CO2115UX/4D	10	Condor	199.90	19.99	Metal
1102	Relógio Condor Masculino Militar - CO2115UI/3B	10	Condor	129.27	12.92	Militar
1103	Relógio Condor Masculino Militar - CO2115UI/3C	10	Condor	169.90	16.99	Militar
1104	Relógio Condor Masculino Militar - CO2115UH/3B	10	Condor	118.93	11.89	Militar
1105	Relógio Condor Masculino Prata - KC20869/3B	10	Condor	259.90	25.99	Prata
1106	Relógio Condor Masculino Casual CO2035KQO/5K - Dourado	10	Condor	199.90	19.99	Casual
1107	Relógio Condor Masculino Casual CO2035KQP/K4X - Dourado	10	Condor	219.90	21.99	Casual
1108	Relógio Condor Masculino Metal   CO2035KQB/4C - Dourado	10	Condor	199.90	19.99	Metal
1109	Relógio Condor Masculino Metal   CO2035KQA/2D - Marrom	10	Condor	179.90	17.99	Metal
1110	Kit Relógio Condor Masculino Metal   CO2115WH/K5K - Dourado, Prata	10	Condor	219.90	21.99	Metal
1111	Kit Relógio Condor Masculino Metal   CO2115WG/K4P - Dourado	10	Condor	219.90	21.99	Metal
1112	Kit Relógio Condor Masculino Metal   CO2115WF/K3D - Prata	10	Condor	159.00	15.90	Metal
1113	Relógio Condor Masculino Anadigi COAD0912A/8C - Azul	10	Condor	143.04	14.30	Anadigi
1114	Relógio Condor Masculino Anadigi COAD0912A/8A - Preto	10	Condor	279.90	27.99	Anadigi
1115	Relógio Condor Masculino Anadigi COAD0912/3P - Prata	10	Condor	231.00	23.10	Prata
1116	Relógio Condor Masculino Anadigi COAD0912/3C - Prata	10	Condor	195.00	19.50	Prata
1117	Relógio Condor Coleção Casual CO2035KNV/4X - Dourado	10	Condor	199.90	19.99	Casual
1118	Relógio Condor Masculino Anadigi COAD0912/3A - Prata	10	Condor	195.00	19.50	Prata
1119	Relógio Condor Coleção Casual CO2035KNU/3K - Prata	10	Condor	179.90	17.99	Prata
1120	Relógio Condor Coleção Casual CO2035KNT/2A - Azul	10	Condor	179.90	17.99	Casual
1121	Relógio Condor Coleção Casual CO2035KNR/3C - Prata	10	Condor	179.90	17.99	Prata
1122	Relógio Condor Coleção Casual CO2035KNQ/4V - Dourado	10	Condor	159.90	15.99	Casual
1123	Relógio Condor Masculino Prata - KY20250/B	10	Condor	319.90	31.99	Prata
1124	Relógio Technos Masculino Steel Preto - 2115MOU/2P	10	Technos	279.90	27.99	Steel
1125	Relógio Technos Masculino Performance Racer Dourado - 2115MNZ/4A	10	Technos	299.90	29.99	Performance
1126	Relógio Technos Masculino Racer 2115MKS/8P	10	Technos	249.90	24.99	Racer
1127	Relógio Technos Racer Masculino 6P25BN/8P	10	Technos	299.90	29.99	Racer
1128	Relógio Technos Golf 2315ACF/5P Bicolor	10	Technos	300.00	30.00	Golf
1129	Relógio Technos Masculino Steel Preto - 6P29AJP/2A	10	Technos	319.90	31.99	Steel
1130	Relógio Technos Calendário Lunar Masculino Preto - 6P21AA/4P	10	Technos	459.90	45.99	Calendário Lunar
1131	Relógio Technos Unissex Slim GM10YI/1P	10	Technos	439.90	43.99	Slim
1132	Relógio Technos Masculino Racer 2315KZP/4P - Dourado	10	Technos	379.90	37.99	Racer
1133	Relógio Technos Masculino Steel 2115MLB/0P	10	Technos	259.90	25.99	Steel
1134	Relógio Technos Masculino Steel 2115LAN/4P	10	Technos	299.90	29.99	Steel
1135	Relógio Technos Masculino Racer 2117LAH/1P	10	Technos	259.90	25.99	Racer
1136	Relógio Technos Masculino Racer 2315ACQ/4A - Dourado	10	Technos	339.90	33.99	Racer
1137	Relógio Technos Executive Masculino Marrom 2115KZD/2K	10	Technos	359.90	35.99	Executive
1138	Relógio Technos Riviera Prata/Dourado 2415CG/5B	10	Technos	479.90	47.99	Riviera
1139	Relógio Technos Masculino Racer Analógico - 2115KSW/1R	10	Technos	299.90	29.99	Racer
1140	Relógio Technos Skymaster Masculino JS25BG/0M Dourado	10	Technos	649.90	64.99	Skymaster
1141	Relógio Technos Legacy Masculino Ana Digi  - T205FJ/8P	10	Technos	719.90	71.99	Legacy
1142	Relógio Technos Masculino Steel Prata - 2305AX/1P	10	Technos	259.90	25.99	Steel
1143	Relógio Technos Unissex Slim Rosé - 9T13AA/2A	10	Technos	459.90	45.99	Slim
1144	Relógio Technos Masculino Ts Digiana Prata - BJK203AAC/1P	10	Technos	599.90	59.99	Ts Digiana
1145	Relógio Technos Masculino Ts Digiana Dourado - BJK203AAD/4P	10	Technos	639.90	63.99	Ts Digiana
1146	Relógio Technos Masculino Ts Digiana Azul - BJK203AAE/4A	10	Technos	659.90	65.99	Ts Digiana
1147	Relógio Technos Calendário Lunar Masculino Couro - 6P80AD/2B	10	Technos	379.90	37.99	Calendário Lunar
1148	Relógio Technos Masculino Performance Racer Prata - 2305AW/1K	10	Technos	259.90	25.99	Performance
1149	Relógio Technos Masculino Classic Steel Prata - 2115MNU/1B	10	Technos	259.90	25.99	Classic Steel
1150	Relógio Technos Automatico Masculino 8205NW/0P	10	Technos	599.90	59.99	Automatico
1151	Relógio Technos Golf Masculino 2115LAQ/2C	10	Technos	379.90	37.99	Golf
1152	Relógio Technos Masculino Racer 2315ACP/1A	10	Technos	259.90	25.99	Racer
1153	Relógio Technos Masculino Militar 2115MLJ/1P	10	Technos	272.00	27.20	Militar
1154	Relógio Technos Masculino Militar Prata	10	Technos	272.00	27.20	Militar
1155	Relógio Technos Masculino Steel 2115MNI/0P	10	Technos	259.90	25.99	Steel
1156	Relógio Technos Racer Masculino 2115MGO/1P	10	Technos	259.90	25.99	Racer
1157	Relógio Technos Executive Masculino 2115KTE/2X Dourado	10	Technos	233.94	23.39	Executive
1158	Relógio Technos Skymaster JS25BF/4P Dourado	10	Technos	689.90	68.99	Skymaster
1159	Relógio Technos Masculino Ts Carbon Prata - 6P27CB/1T	10	Technos	589.90	58.99	Carbon
1160	Relógio Technos Performance - 2115KQB/8L	10	Technos	249.90	24.99	Performance
1161	Relógio Technos Steel Masculino Analógico - 2115KNL/1K	10	Technos	259.90	25.99	Steel
1162	Relógio Technos Executive Masculino Analógico - 1N12MQ/5B	10	Technos	379.90	37.99	Executive
1163	Relógio Technos Steel Masculino Analógico - 2115GY/1P	10	Technos	249.90	24.99	Steel
1164	Relógio Technos Steel Masculino Analógico - 2115GY/1K	10	Technos	239.90	23.99	Steel
1165	Relógio Technos Masculino Classic Ceramic/Saphire Dourado - JS15FI/4P	10	Technos	839.90	83.99	Ceramic
1166	Relógio Technos Masculino Riviera Preto - 2350AC/4P	10	Technos	479.90	47.99	Riviera
1167	Relógio Technos Masculino Racer Prata - 6P22AE/1P	10	Technos	339.90	33.99	Racer
1168	Relógio Technos Masculino Classic Legacy Dourado - JS15BE/4K	10	Technos	759.90	75.99	Classic Legacy
1169	Relógio Technos Unissex Classic Slim Dourado - 9T22AK/4X	10	Technos	479.90	47.99	Slim
1170	Relógio Technos Unissex Slim Preto - 9U13AA/4P	10	Technos	539.90	53.99	Slim
1171	Relógio Technos Masculino Racer Dourado - 2115MOK/4A	10	Technos	299.90	29.99	Racer
1172	Relógio Technos Masculino Steel Dourado - 2115MPA/4P	10	Technos	299.90	29.99	Steel
1173	Relógio Technos Masculino Steel Prata - 6P29AJO/1K	10	Technos	299.90	29.99	Steel
1174	Relógio Technos Masculino Steel Prata - 2115MOT/1P	10	Technos	259.90	25.99	Steel
1175	Relógio Technos Masculino Steel Prata - 6P29AJK/1P	10	Technos	299.90	29.99	Steel
1176	Relógio Technos Masculino Classic Steel Prata - 2115MNR/1A	10	Technos	259.90	25.99	Classic Steel
1177	Relógio Technos Slim Masculino GL15AN/4A	10	Technos	479.90	47.99	Slim
1178	Relógio Technos Grandtech Masculino 6P57AC/2C	10	Technos	559.90	55.99	Grandtech
1179	Relógio Technos Unissex Slim GL20HJ/2M	10	Technos	439.90	43.99	Slim
1180	Relógio Technos Legacy Masculino OS2ABE/1C	10	Technos	736.00	73.60	Legacy
1181	Relógio Technos Steel Masculino 2315KZM/1A	10	Technos	269.90	26.99	Steel
1182	Relógio Technos Masculino Racer 2315ACP/1P - Prata	10	Technos	299.90	29.99	Racer
1183	Relógio Technos Masculino Racer 2115MGR/1P - Prata	10	Technos	259.90	25.99	Racer
1184	Relógio Technos Masculino Slim GM10YH/2A	10	Technos	459.90	45.99	Slim
1185	Relógio Technos Legacy Masculino OS2ABF/4A	10	Technos	769.90	76.99	Legacy
1186	Relógio Technos Riviera Prata 2415CI/1A	10	Technos	399.90	39.99	Riviera
1187	Relógio Technos Steel Masculino 2115LAN/4A	10	Technos	299.90	29.99	Steel
1188	Relógio Technos Legacy Masculino Preto JS26AG/4P	10	Technos	779.90	77.99	Legacy
1189	Relógio Technos Legacy Masculino Dourado JS26AE/4X	10	Technos	759.90	75.99	Legacy
1190	Relógio Technos Masculino Racer 6P29AIQ/K8P	10	Technos	349.90	34.99	Racer
1191	Relógio Technos Golf 6P25BK/1B Prata	10	Technos	383.92	38.39	Golf
1192	Relógio Technos Racer  6P25BI/8P Prata	10	Technos	299.90	29.99	Racer
1193	Relógio Technos Racer 2115KTD/1A Prata	10	Technos	299.90	29.99	Racer
1194	Relógio Technos Legacy Masculino Cronógrafo - OS20IB/4X	10	Technos	759.90	75.99	Legacy
1195	Relógio Technos Legacy Masculino Cronógrafo - OS1AAP/4P	10	Technos	759.90	75.99	Legacy
1196	Relógio Technos Executive Masculino Analógico - 1N12MP/4X	10	Technos	359.90	35.99	Executive
1197	Relógio Technos Masculino Classic Ceramic/Saphire Prata - JS15FJ/1A	10	Technos	799.90	79.99	Ceramic
1198	Relógio Technos Masculino Racer Dourado - 2115MPI/4A	10	Technos	299.90	29.99	Racer
1199	Relógio Technos Masculino Classic Steel Prata - 2115MOG/K0A	10	Technos	269.90	26.99	Classic Steel
1200	Relógio Technos Masculino Classic Steel Prata - 2115MNX/K1P	10	Technos	269.90	26.99	Classic Steel
1201	Relógio Technos Masculino Classic Automatico Dourado - 8205OG/2P	10	Technos	592.00	59.20	Automatico
1202	Relógio Technos Masculino Classic Automatico Prata - 8205OE/1K	10	Technos	739.90	73.99	Automatico
1203	Relógio Technos Masculino Performance Racer Prata - 2117LAN/1P	10	Technos	259.90	25.99	Performance
1204	Relógio Technos Masculino Steel Prata - 2115MPK/1A	10	Technos	259.90	25.99	Steel
1205	Relógio Technos Masculino Classic Automatico Dourado - 8205NL/4K	10	Technos	779.90	77.99	Automatico
1206	Relógio Technos Masculino Classic Steel Dourado - 2305AM/4C	10	Technos	439.90	43.99	Classic Steel
1207	Relógio Technos Masculino Steel Dourado - 2305AY/4X	10	Technos	299.90	29.99	Steel
1208	Relógio Technos Masculino Steel Dourado - 2305AZ/2B	10	Technos	259.90	25.99	Steel
1209	Relógio Technos Masculino Steel Preto - 2305BA/2A	10	Technos	279.90	27.99	Steel
1210	Relógio Technos Masculino Racer Prata - 2115MOL/1B	10	Technos	259.90	25.99	Racer
1211	Relógio Technos Masculino Racer Dourado - 2115MOM/8B	10	Technos	259.90	25.99	Racer
1212	Relógio Technos Masculino Skymaster Dourado - JS15FE/4P	10	Technos	679.90	67.99	Skymaster
1213	Relógio Technos Masculino Skymaster Prata - JS15FF/1A	10	Technos	639.90	63.99	Skymaster
1214	Relógio Technos Masculino Skymaster Dourado - JS15FE/4C	10	Technos	680.90	68.09	Skymaster
1215	Relógio Technos Masculino Riviera Dourado - 2350AD/4X	10	Technos	459.90	45.99	Riviera
1216	Relógio Technos Masculino Racer Prata - 2117LAR/1P	10	Technos	299.90	29.99	Racer
1217	Relógio Technos Masculino Racer Dourado - 2117LAS/4X	10	Technos	339.90	33.99	Racer
1218	Relógio Technos Masculino Legacy Dourado - JS16AB/4P	10	Technos	899.90	89.99	Legacy
1219	Relógio Technos Masculino Legacy Grafite - JS16AA/4C	10	Technos	919.90	91.99	Legacy
1220	Relógio Technos Masculino Classic Legacy Dourado - JS15BE/4X	10	Technos	959.90	95.99	Classic Legacy
1221	Relógio Technos Masculino Performance Racer Prata - 2115KSX/1A	10	Technos	259.90	25.99	Performance
1222	Relógio Technos Masculino Performance Racer Prata - 2115KSX/1P	10	Technos	259.90	25.99	Performance
1223	Relógio Technos Masculino Classic Steel Dourado - 2115KPR/4A	10	Technos	439.90	43.99	Classic Steel
1224	Relógio Technos Masculino Racer Prata - 2315ACI/1A	10	Technos	319.90	31.99	Racer
1225	Relógio Technos Masculino Racer Dourado - 2315ACK/4P	10	Technos	299.90	29.99	Racer
1226	Relógio Technos Masculino Racer Prata - 2315KZO/1P	10	Technos	319.90	31.99	Racer
1227	Relógio Technos Masculino Racer Dourado - 2315KZP/4B	10	Technos	299.90	29.99	Racer
1228	Relógio Technos Masculino Racer Prata - 2315KZN/8R	10	Technos	249.90	24.99	Racer
1229	Relógio Technos Masculino Racer Dourado - 2315KZP/4A	10	Technos	359.90	35.99	Racer
1230	Relógio Technos Masculino Classic Steel Dourado - 2115MOF/4P	10	Technos	299.90	29.99	Classic Steel
1231	Relógio Technos Unissex Classic Slim Prata - 9T22AI/1A	10	Technos	479.90	47.99	Slim
1232	Relógio Technos Unissex Slim Dourado - 9T22AJ/2B	10	Technos	479.90	47.99	Slim
1233	Relógio Technos Unissex Classic Slim Rosé - 9T22AL/4C	10	Technos	499.90	49.99	Slim
1234	Relógio Technos Unissex Slim Dourado - 9T13AB/4B	10	Technos	479.90	47.99	Slim
1235	Relógio Technos Unissex Slim Prata - 9U13AC/1B	10	Technos	439.90	43.99	Slim
1236	Relógio Technos Masculino Essence Dourado - F06111AA/4W	10	Technos	999.90	99.99	Essence
1237	Relógio Technos Masculino Essence Prata - F06111AB/1W	10	Technos	959.90	95.99	Essence
1238	Relógio Technos Masculino Essence Preto - F06111AC/4W	10	Technos	1019.90	101.99	Essence
1239	Relógio Technos Masculino Steel Prata - 2115MOZ/1A	10	Technos	259.90	25.99	Steel
1240	Relógio Technos Masculino Racer Dourado - 2115MPC/4K	10	Technos	299.90	29.99	Racer
1241	Relógio Technos Masculino Steel Dourado - 6P29AJN/4X	10	Technos	339.90	33.99	Steel
1242	Relógio Technos Masculino Racer Prata - 2115MPD/1A	10	Technos	259.90	25.99	Racer
1243	Relógio Technos Masculino Automatico Prata - 82S7AA/1A	10	Technos	759.90	75.99	Automatico
1244	Relógio Technos Masculino Automatico Preto - 82S7AC/4P	10	Technos	819.90	81.99	Automatico
1245	Relógio Technos Unissex Slim Rosé - 1L45AY/4C	10	Technos	499.90	49.99	Slim
1246	Relógio Technos Masculino Automatico Dourado - 82S7AB/4X	10	Technos	799.90	79.99	Automatico
1247	Relógio Technos Unissex Slim Dourado - 1L45AZ/4B	10	Technos	479.90	47.99	Slim
1248	Relógio Technos Unissex Classic Slim Dourado - 2025LTK/4A	10	Technos	519.90	51.99	Slim
1249	Relógio Technos Unissex Classic Slim Prata - 2025LTL/1K	10	Technos	439.90	43.99	Slim
1250	Relógio Technos Unissex Classic Slim Preto - 2025LTM/4P	10	Technos	499.90	49.99	Slim
1251	Relógio Technos Calendário Lunar Masculino Dourado - 6P80AC/4P	10	Technos	399.90	39.99	Calendário Lunar
1252	Relógio Technos Masculino Racer Prata - 2115MOW/1B	10	Technos	259.90	25.99	Racer
1253	Relógio Technos Masculino Steel Dourado - 2115MOS/4A	10	Technos	299.90	29.99	Steel
1254	Relógio Technos Masculino Skydiver Prata - T20562/1R	10	Technos	519.90	51.99	Skydiver
1255	Relógio Technos Masculino Skydiver Prata - T20562/1L	10	Technos	519.90	51.99	Skydiver
1256	Relógio Technos Masculino Skydiver Prata - T20562/1B	10	Technos	519.90	51.99	Skydiver
1257	Relógio Technos Masculino Classic Steel Prata - 2115KQK/1C	10	Technos	259.90	25.99	Classic Steel
1258	Relógio Technos Masculino Skydiver Prata - T20562/1P	10	Technos	519.90	51.99	Skydiver
1259	Relógio Technos Masculino Classic Steel Dourado - 6P29AJI/4K	10	Technos	339.90	33.99	Classic Steel
1260	Relógio Technos Masculino Performance Acqua Prata - JS25BP/0P	10	Technos	899.90	89.99	Acqua
1261	Relógio Technos Masculino Racer 2115MGT/1A	10	Technos	299.90	29.99	Racer
1262	Relógio Technos Masculino Performance Racer Dourado - 2115MOD/4D	10	Technos	359.90	35.99	Performance
1263	Relógio Technos Masculino Performance Skymaster Prata - 6S21AC/0P	10	Technos	639.90	63.99	Performance
1264	Relógio Technos Masculino Performance Skymaster Dourado - 6S21AB/1D	10	Technos	679.90	67.99	Performance
1265	Relógio Technos Masculino Skymaster Prata - 6S21AA/1A	10	Technos	639.90	63.99	Skymaster
1266	Relógio Technos Masculino Skymaster Prata - JS26AH/1P	10	Technos	639.90	63.99	Skymaster
1267	Relógio Technos Masculino Skymaster Dourado - JS26AJ/4A	10	Technos	679.90	67.99	Skymaster
1268	Relógio Technos Masculino Skymaster Dourado - JS26AK/4X	10	Technos	679.90	67.99	Skymaster
1269	Relógio Technos Masculino Performance Racer Prata - 2115MOC/1A	10	Technos	279.90	27.99	Performance
1270	Relógio Technos Masculino Performance Racer Prata - 2115MOB/1P	10	Technos	319.90	31.99	Performance
1271	Relógio Technos Masculino Performance Racer Dourado - 2115MNZ/4P	10	Technos	299.90	29.99	Performance
1272	Relógio Technos Masculino Performance Racer Prata - 2115MNY/1B	10	Technos	259.90	25.99	Performance
1273	Relógio Technos Masculino Performance Racer Dourado - 2305AV/4X	10	Technos	319.90	31.99	Performance
1274	Relógio Technos Masculino Performance Racer Prata - 2305AU/1A	10	Technos	279.90	27.99	Performance
1275	Relógio Technos Masculino Performance Racer Dourado - 2305AT/8P	10	Technos	279.90	27.99	Performance
1276	Relógio Technos Masculino Classic Steel Dourado - 2115MNW/4P	10	Technos	299.90	29.99	Classic Steel
1277	Relógio Technos Masculino Classic Steel Prata - 2115MNV/1P	10	Technos	279.90	27.99	Classic Steel
1278	Relógio Technos Masculino Classic Automatico Dourado - 8205OF/4P	10	Technos	779.90	77.99	Automatico
1279	Relógio Technos Automatico Masculino 8205NX/4A	10	Technos	779.00	77.90	Automatico
1280	Relógio Technos Masculino Legacy Dourado - JS25BI/4B	10	Technos	959.00	95.90	Legacy
1281	Relógio Technos Masculino Steel 2115MLC/1C	10	Technos	269.90	26.99	Steel
1282	Relógio Technos Masculino Classic Steel Dourado - 2115MNP/1D	10	Technos	299.90	29.99	Classic Steel
1283	Relógio Technos Masculino Classic Steel Dourado - 2115MNQ/0D	10	Technos	259.90	25.99	Classic Steel
1284	Relógio Technos Masculino Performance Racer Dourado - 2117LAK/1P	10	Technos	299.90	29.99	Performance
1285	Relógio Technos Masculino Performance Racer Dourado - 2117LAL/1B	10	Technos	299.90	29.99	Performance
1286	Relógio Technos Masculino Steel 2115KNQ/1K	10	Technos	269.90	26.99	Steel
1287	Relógio Technos Automatico Masculino 8205NX/4B	10	Technos	624.00	62.40	Automatico
1288	Relógio Technos Masculino Performance Acqua Prata - 2315KZQ/0A	10	Technos	688.00	68.80	Acqua
1289	Relógio Technos Masculino Racer 2115MGS/4P	10	Technos	299.90	29.99	Racer
1290	Relógio Technos Masculino Racer 2115MGS/4B	10	Technos	299.90	29.99	Racer
1291	Relógio Technos Masculino Racer 2115MGR/1B	10	Technos	259.90	25.99	Racer
1292	Relógio Technos Ceramic Masculino JS15EU/1P	10	Technos	720.00	72.00	Ceramic
1293	Relógio Technos Slim Masculino GL15AO/1C	10	Technos	416.00	41.60	Slim
1294	Relógio Technos Unissex Slim 1L22WI/4P	10	Technos	479.90	47.99	Slim
1295	Relógio Technos Unissex Slim GL20AQ/4P	10	Technos	479.90	47.99	Slim
1296	Relógio Technos Masculino Racer 2315KZN/8P - Preto	10	Technos	249.90	24.99	Racer
1297	Relógio Technos Masculino Performance Acqua Prata - JS25BQ/8P	10	Technos	859.90	85.99	Acqua
1298	Relógio Technos Masculino Legacy JS15ER/4A	10	Technos	759.90	75.99	Legacy
1299	Relógio Technos Masculino Steel Prata - 2115MLA/1P	10	Technos	259.90	25.99	Steel
1300	Relógio Technos Steel Masculino 2115MMJ/0B	10	Technos	269.90	26.99	Steel
1301	Relógio Technos Masculino Racer 2115MLO/1K - Prata	10	Technos	309.90	30.99	Racer
1302	Relógio Technos Masculino Racer 2115MGU/8K	10	Technos	175.00	17.50	Racer
1303	Relógio Technos Masculino Racer 2115MGT/1P	10	Technos	249.90	24.99	Racer
1304	Relógio Technos Steel Masculino 2115MMH/1B	10	Technos	259.90	25.99	Steel
1305	Relógio Technos Masculino Steel 2115MKW/1V	10	Technos	269.90	26.99	Steel
1306	Relógio Technos Carbon Masculino JS15EW/4P	10	Technos	829.90	82.99	Carbon
1307	Relógio Technos Riviera Feminino 2115KQQ/4X	10	Technos	459.90	45.99	Riviera
1308	Relógio Technos Racer Masculino 2117LAI/1P	10	Technos	299.90	29.99	Racer
1309	Relógio Technos Racer Masculino 2117LAH/1B	10	Technos	229.90	22.99	Racer
1310	Relógio Technos Executive Masculino 2115LAT/4C	10	Technos	429.90	42.99	Executive
1311	Relógio Technos Executive Masculino 2115LAS/4K	10	Technos	399.90	39.99	Executive
1312	Relógio Technos Executive Masculino 2115LAU/1A	10	Technos	359.90	35.99	Executive
1313	Relógio Technos Executive Masculino 2115LAR/4P	10	Technos	399.90	39.99	Executive
1314	Relógio Technos Carbon Masculino JS15EX/4P	10	Technos	839.90	83.99	Carbon
1315	Relógio Technos Ceramic Masculino JS15ET/4P	10	Technos	839.90	83.99	Ceramic
1316	Relógio Technos Golf Masculino 2115LAP/4X	10	Technos	399.90	39.99	Golf
1317	Relógio Technos Racer Masculino 2115LAK/1P	10	Technos	299.90	29.99	Racer
1318	Relógio Technos Racer Masculino 2115LAK/1B	10	Technos	299.90	29.99	Racer
1319	Relógio Technos Carbon Masculino JS15EV/1P	10	Technos	789.90	78.99	Carbon
1320	Relógio Technos Masculino Steel 2115LAN/4X	10	Technos	299.90	29.99	Steel
1321	Relógio Technos Masculino Steel 2115MMU/5B	10	Technos	279.90	27.99	Steel
1322	Relógio Technos Masculino Racer 2115MMV/4P	10	Technos	299.90	29.99	Racer
1323	Relógio Technos Masculino Racer 2115MMW/1K	10	Technos	256.00	25.60	Racer
1324	Relógio Technos Masculino Racer 2115MMX/8A	10	Technos	249.90	24.99	Racer
1325	Relógio Technos Masculino Racer 2115MMY/4K	10	Technos	299.90	29.99	Racer
1326	Relógio Technos Masculino Skymaster JS15EY/4P	10	Technos	689.90	68.99	Skymaster
1327	Relógio Technos Masculino Skymaster JS15EZ/5B	10	Technos	709.90	70.99	Skymaster
1328	Relógio Technos Masculino Skymaster JS15FA/1A	10	Technos	649.90	64.99	Skymaster
1329	Relógio Technos Masculino Skymaster JS15FB/4P	10	Technos	699.90	69.99	Skymaster
1330	Relógio Technos Masculino Racer 2117LAF/8B	10	Technos	249.90	24.99	Racer
1331	Relógio Technos Masculino Racer 2117LAJ/8B	10	Technos	259.90	25.99	Racer
1332	Relógio Technos Masculino Steel 2115MNG/4C	10	Technos	329.90	32.99	Steel
1333	Relógio Technos Masculino Steel 2115MNG/4X	10	Technos	299.90	29.99	Steel
1334	Relógio Technos Masculino Legacy 2035MLA/4P	10	Technos	759.90	75.99	Legacy
1335	Relógio Technos Masculino Legacy 2035MLB/4A	10	Technos	779.90	77.99	Legacy
1336	Relógio Technos Masculino Legacy 2035MLC/1P	10	Technos	752.00	75.20	Legacy
1337	Relógio Technos Masculino Ceramic/Saphire JS25BR/4P	10	Technos	759.90	75.99	Ceramic
1338	Relógio Technos Masculino Ceramic/Saphire JS25BS/1A	10	Technos	720.00	72.00	Ceramic
1339	Relógio Technos Masculino Racer 2315ACO/8R - Preto	10	Technos	249.90	24.99	Racer
1340	Relógio Technos Masculino Racer 2115MGS/4A - Dourado	10	Technos	299.90	29.99	Racer
1341	Relógio Technos Masculino Racer 2115MGS/4K - Dourado	10	Technos	299.90	29.99	Racer
1342	Relógio Technos Masculino Racer 2115MGR/1K - Prata	10	Technos	249.90	24.99	Racer
1343	Relógio Technos Skymaster Masculino JS15FC/4P	10	Technos	689.90	68.99	Skymaster
1344	Relógio Technos Skymaster Masculino JS15FC/4X	10	Technos	689.90	68.99	Skymaster
1345	Relógio Technos Skymaster Masculino JS15FD/1A	10	Technos	649.90	64.99	Skymaster
1346	Relógio Technos Vitra Masculino Prata JS15EO/1P	10	Technos	869.90	86.99	Vitra
1347	Relógio Technos Steel Masculino 2315KZM/1P	10	Technos	269.90	26.99	Steel
1348	Relógio Technos Steel Masculino 2315KZL/4B	10	Technos	299.90	29.99	Steel
1349	Relógio Technos Masculino Steel 2115MKW/1M	10	Technos	269.90	26.99	Steel
1350	Relógio Technos Masculino Steel Prata - 2115MKY/1A	10	Technos	260.90	26.09	Steel
1351	Relógio Technos Masculino Carbon OS20HM/8P	10	Technos	829.90	82.99	Carbon
1352	Relógio Technos Legacy Masculino Azul JS26AF/4A	10	Technos	779.90	77.99	Legacy
1353	Relógio Technos Vitra Masculino Dourado JS15EP/4X	10	Technos	909.90	90.99	Vitra
1354	Relógio Technos Masculino Carbon OS20HM/1B	10	Technos	869.90	86.99	Carbon
1355	Relógio Technos Steel Masculino 2115LAM/4K	10	Technos	299.90	29.99	Steel
1356	Relógio Technos Masculino Slim GM10YG/1P	10	Technos	439.90	43.99	Slim
1357	Relógio Technos Masculino Slim GM10YF/4X	10	Technos	479.90	47.99	Slim
1358	Relógio Technos Grandtech OS10CR/4A Dourado	10	Technos	639.90	63.99	Grandtech
1359	Relógio Technos Racer 2115KZA/8P Preto	10	Technos	299.90	29.99	Racer
1360	Relógio Technos Racer 2115KYZ/4A Dourado	10	Technos	339.90	33.99	Racer
1361	Relógio Technos Racer 2115KYY/8K Preto	10	Technos	269.90	26.99	Racer
1362	Relógio Technos Racer 2115KYX/1P Prata	10	Technos	299.90	29.99	Racer
1363	Relógio Technos Legacy Masculino OS2ABH/4P	10	Technos	800.00	80.00	Legacy
1364	Relógio Technos Legacy Masculino OS2ABG/8P	10	Technos	719.90	71.99	Legacy
1365	Relógio Technos Racer Masculino 2115MGQ/4A	10	Technos	299.90	29.99	Racer
1366	Relógio Technos Racer Masculino 2115MGO/1B	10	Technos	259.90	25.99	Racer
1367	Relógio Technos Golf Masculino 2115LAO/1A	10	Technos	359.90	35.99	Golf
1368	Relógio Technos Grandtech OS10CR/4K Dourado	10	Technos	639.90	63.99	Grandtech
1369	Relógio Technos Skymaster Masculino 6P25BM/1K	10	Technos	439.90	43.99	Skymaster
1370	Relógio Technos Skymaster Masculino 2415CL/4P	10	Technos	639.90	63.99	Skymaster
1371	Relógio Technos Skymaster Masculino 2415CK/4A	10	Technos	629.90	62.99	Skymaster
1372	Relógio Technos Skymaster Masculino 2415CJ/0P	10	Technos	589.90	58.99	Skymaster
1373	Relógio Technos Steel Masculino 2115LAY/1V	10	Technos	269.90	26.99	Steel
1374	Relógio Technos Steel Masculino 2115LAL/0P	10	Technos	269.90	26.99	Steel
1375	Relógio Technos Golf 2305AS/5K Bicolor	10	Technos	509.90	50.99	Golf
1376	Relógio Technos Legacy Masculino Prata JS26AD/1P	10	Technos	949.90	94.99	Legacy
1377	Relógio Technos Executive Masculino Dourado 2115KZC/4X	10	Technos	399.90	39.99	Executive
1378	Relógio Technos Executive Masculino Dourado 2115KZC/4A	10	Technos	429.90	42.99	Executive
1379	Relógio Technos Skydiver Masculino T20565/1P	10	Technos	599.90	59.99	Skydiver
1380	Relógio Technos Racer 2115KTM/1P Prata	10	Technos	259.90	25.99	Racer
1381	Relógio Technos Racer 2115KTM/1C Prata	10	Technos	289.90	28.99	Racer
1382	Relógio Technos Skydiver T205IX/0P Marrom	10	Technos	559.90	55.99	Skydiver
1383	Relógio Technos Racer Masculino Prata 2115KZB/1B	10	Technos	259.90	25.99	Racer
1384	Relógio Technos Racer Masculino Prata 2115KZB/1P	10	Technos	259.90	25.99	Racer
1385	Relógio Technos Racer Masculino Prata 2115KZB/1A	10	Technos	259.90	25.99	Racer
1386	Relógio Technos Automatico 8205NO/5A Bicolor	10	Technos	518.00	51.80	Automatico
1387	Relógio Technos Automatico 8205NM/1B Prata	10	Technos	476.00	47.60	Automatico
1388	Relógio Technos Racer 2115KZZ/1C Prata	10	Technos	289.90	28.99	Racer
1389	Relógio Technos Racer 2115KZZ/1A Prata	10	Technos	289.90	28.99	Racer
1390	Relógio Technos Racer 2115KTM/1B Prata	10	Technos	259.90	25.99	Racer
1391	Relógio Technos Racer 2315ACL/4P Dourado	10	Technos	409.90	40.99	Racer
1392	Relógio Technos Skydiver T205IW/1P Prata	10	Technos	512.00	51.20	Skydiver
1393	Relógio Technos Racer 2315ACH/8P Preto	10	Technos	289.90	28.99	Racer
1394	Relógio Technos Legacy JS15EM/4A Dourado	10	Technos	759.90	75.99	Legacy
1395	Relógio Technos Legacy JS15EL/4C Bicolor	10	Technos	779.90	77.99	Legacy
1396	Relógio Technos Legacy JS15EK/8P Preto	10	Technos	719.90	71.99	Legacy
1397	Relógio Technos Riviera Dourado 2415CH/4X	10	Technos	459.90	45.99	Riviera
1398	Relógio Technos Steel 2115KTP/4P Dourado	10	Technos	299.90	29.99	Steel
1399	Relógio Technos Masculino Racer Analógico - 2115KTC/1P	10	Technos	299.90	29.99	Racer
1400	Relógio Technos Masculino Racer Analógico - 2115KTB/8P	10	Technos	259.90	25.99	Racer
1401	Relógio Technos Masculino Racer Analógico - 2115KSS/1P	10	Technos	299.90	29.99	Racer
1402	Relógio Technos Masculino Golf Analógico - 2115KSP/0K	10	Technos	279.90	27.99	Golf
1403	Relógio Technos Masculino Golf Analógico - 2115KSO/2C	10	Technos	216.93	21.69	Golf
1404	Relógio Technos Skymaster JS15EN/1C Prata	10	Technos	489.90	48.99	Skymaster
1405	Relógio Technos Executive Masculino 2115KTH/4M Dourado	10	Technos	399.90	39.99	Executive
1406	Relógio Technos Executive Masculino 2115KTG/1P Prata	10	Technos	359.90	35.99	Executive
1407	Relógio Technos Skydiver Masculino T205FX/1B Prata	10	Technos	639.90	63.99	Skydiver
1408	Relógio Technos Masculino Golf Analógico - 2115KSO/2A	10	Technos	309.90	30.99	Golf
1409	Relógio Technos Carbon Masculino OS1AAU/1C Prata	10	Technos	539.90	53.99	Carbon
1410	Relógio Technos Masculino Executive 2115KSC/K1C	10	Technos	359.90	35.99	Executive
1411	Relógio Technos Masculino Legacy Analógico - T205FU/4X	10	Technos	759.90	75.99	Legacy
1412	Relógio Technos Masculino Grandtech Analógico - 6P25BA/1C	10	Technos	324.00	32.40	Grandtech
1413	Relógio Technos Masculino Grandtech Analógico - 6P25AZ/0M	10	Technos	324.00	32.40	Grandtech
1414	Relógio Technos Masculino Grandtech Analógico - 6P25AY/4C	10	Technos	245.94	24.59	Grandtech
1415	Relógio Technos Masculino Legacy Analógico - JS15BE/8X	10	Technos	909.90	90.99	Legacy
1416	Relógio Technos Masculino Racer Analógico - 2115KSR/8L	10	Technos	289.90	28.99	Racer
1417	Relógio Technos Masculino Racer Analógico - 2115KSR/8Y	10	Technos	259.90	25.99	Racer
1418	Relógio Technos Masculino Steel Analógico - 2035MFC/1A	10	Technos	175.00	17.50	Steel
1419	Relógio Technos Masculino Racer Analógico - 2115KTD/1K	10	Technos	299.90	29.99	Racer
1420	Relógio Technos Racer 2115KSU/1R Prata	10	Technos	259.90	25.99	Racer
1421	Relógio Technos Racer 2115KSU/1Y Prata	10	Technos	259.90	25.99	Racer
1422	Relógio Technos Masculino Racer Analógico - 2115KSZ/8A	10	Technos	259.90	25.99	Racer
1423	Relógio Technos Masculino Racer Analógico - 6P29AIR/8P	10	Technos	299.90	29.99	Racer
1424	Relógio Technos Masculino Slim Analógico - 6P29AIS/5B	10	Technos	449.90	44.99	Slim
1425	Relógio Technos Racer 2115KSX/1Y Prata	10	Technos	299.90	29.99	Racer
1426	Relógio Technos Racer 2115KSX/1R Prata	10	Technos	299.90	29.99	Racer
1427	Relógio Technos Racer 2115KSY/1A Prata	10	Technos	309.90	30.99	Racer
1428	Relógio Technos Skymaster JS25BH/1P Prata	10	Technos	649.90	64.99	Skymaster
1429	Relógio Technos Racer 2115KSQ/1Y Prata	10	Technos	299.90	29.99	Racer
1430	Relógio Technos Masculino Racer Analógico - 2115KSV/1R	10	Technos	259.90	25.99	Racer
1431	Relógio Technos Masculino Racer Analógico - 2115KSV/1Y	10	Technos	259.90	25.99	Racer
1432	Relógio Technos Masculino Skymaster Analógico - 2415CE/4D	10	Technos	496.00	49.60	Skymaster
1433	Relógio Technos Masculino Skymaster Analógico - 6P25BF/4P	10	Technos	559.90	55.99	Skymaster
1434	Relógio Technos Masculino Skymaster Analógico - 6P25BG/1A	10	Technos	528.00	52.80	Skymaster
1435	Relógio Technos Masculino Skymaster Analógico - 6P25BG/1P	10	Technos	528.00	52.80	Skymaster
1436	Relógio Technos Masculino Steel 1S13BCTDY/1C	10	Technos	309.90	30.99	Steel
1437	Relógio Technos Masculino Steel 1S13BCTDY/1B	10	Technos	309.90	30.99	Steel
1438	Relógio Technos Legacy 6P29AIM/8A Prata	10	Technos	532.00	53.20	Legacy
1439	Relógio Technos Racer 2115KSL/1Y Prata	10	Technos	299.90	29.99	Racer
1440	Relógio Technos Racer 2115KSL/1R Prata	10	Technos	299.90	29.99	Racer
1441	Relógio Technos Racer 2115KSL/1P Prata	10	Technos	299.90	29.99	Racer
1442	Relógio Technos Racer 2115KSL/1A Prata	10	Technos	299.90	29.99	Racer
1443	Relógio Technos Steel 2115KSK/1C Prata	10	Technos	269.90	26.99	Steel
1444	Relógio Technos Steel 2115KSA/1P Prata	10	Technos	269.90	26.99	Steel
1445	Relógio Technos Masculino Steel 1S13BWTDY/4X	10	Technos	299.90	29.99	Steel
1446	Relógio Technos Steel Masculino Analógico - 2035MCW/1P	10	Technos	269.90	26.99	Steel
1447	Relógio Technos Skydiver Masculino Ana Digi  - T205FQ/5B	10	Technos	599.90	59.99	Skydiver
1448	Relógio Technos Executive Masculino Analógico - 2115KRP/3V	10	Technos	269.90	26.99	Executive
1449	Relógio Technos Skydiver Masculino Ana Digi  - T205FQ/5P	10	Technos	599.90	59.99	Skydiver
1450	Relógio Technos Racer Masculino Analógico - 2315ABZ/8R	10	Technos	269.90	26.99	Racer
1451	Relógio Technos Racer Masculino Analógico - 2315ABY/1P	10	Technos	259.90	25.99	Racer
1452	Relógio Technos Golf Masculino Analógico - 2115KQU/4C	10	Technos	399.90	39.99	Golf
1453	Relógio Technos Golf Masculino Analógico - 2115KQU/4A	10	Technos	399.90	39.99	Golf
1454	Relógio Technos Grandtech Masculino Multifunção - 6P29AIC/4C	10	Technos	449.90	44.99	Grandtech
1455	Relógio Technos Skydiver Masculino Ana Digi  - T205FL/4P	10	Technos	639.90	63.99	Skydiver
1456	Relógio Technos Skydiver Masculino Ana Digi  - T205FL/4A	10	Technos	639.90	63.99	Skydiver
1457	Relógio Technos Skydiver Masculino Ana Digi  - T205FM/1C	10	Technos	599.90	59.99	Skydiver
1458	Relógio Technos Skydiver Masculino Ana Digi  - T205FM/1A	10	Technos	599.90	59.99	Skydiver
1459	Relógio Technos Golf Masculino Analógico - 2115KRM/4C	10	Technos	399.90	39.99	Golf
1460	Relógio Technos Golf Masculino Analógico - 2115KRO/1M	10	Technos	369.90	36.99	Golf
1461	Relógio Technos Golf Masculino Analógico - 2115KRN/5A	10	Technos	419.90	41.99	Golf
1462	Relógio Technos Legacy Masculino Prata 2115KOV/MK1P	10	Technos	469.90	46.99	Legacy
1463	Relógio Technos Masculino Riviera - GL10IA/M4P	10	Technos	336.00	33.60	Riviera
1464	Relógio Technos Grandtech Masculino Multifunção - 6P22AD/1P	10	Technos	439.90	43.99	Grandtech
1465	Relógio Technos Grandtech Masculino Multifunção - 6P29AIF/4P	10	Technos	449.90	44.99	Grandtech
1466	Relógio Technos Golf Masculino Analógico - 2115KQS/4K	10	Technos	399.90	39.99	Golf
1467	Relógio Technos Racer Masculino Analógico - 2036LNV/1R	10	Technos	197.94	19.79	Racer
1468	Relógio Technos Performance - 6P29AHW/1Y	10	Technos	339.90	33.99	Performance
1469	Relógio Technos Grandtech Masculino Multifunção - 6P25AP/1M	10	Technos	347.94	34.79	Grandtech
1470	Relógio Technos Golf Masculino Analógico - 2115KPR/4X	10	Technos	489.90	48.99	Golf
1471	Relógio Technos Militar Masculino Analógico - 2035LYE/1U	10	Technos	359.90	35.99	Militar
1472	Relógio Technos Ts Carbon Masculino - 0527AD/8P	10	Technos	729.90	72.99	Carbon
1473	Relógio Technos Ts Carbon Masculino Cronógrafo - OS1AAZ/0C	10	Technos	949.90	94.99	Carbon
1474	Relógio Technos Skydiver Masculino Ana Digi  - T20557/9B	10	Technos	519.90	51.99	Skydiver
1475	Relógio Technos Golf Masculino Analógico - 2115RV/4M	10	Technos	489.90	48.99	Golf
1476	Relógio Technos Steel Masculino Analógico - 2115GW/5K	10	Technos	349.90	34.99	Steel
1477	Relógio Technos Skymaster Masculino Analógico - 2115GS/1P	10	Technos	379.90	37.99	Skymaster
1478	Relógio Technos Racer Masculino Analógico - 2115GU/1R	10	Technos	259.90	25.99	Racer
1479	Relógio Technos Skydiver Masculino Ana Digi  - T20557/1P	10	Technos	519.90	51.99	Skydiver
1480	Relógio Technos Solar Masculino Cronógrafo - VS75AA/1C	10	Technos	659.90	65.99	Solar
1481	Relógio Technos Legacy Masculino Cronógrafo - OS20IK/4X	10	Technos	759.90	75.99	Legacy
1482	Relógio Technos Ts Carbon Masculino Cronógrafo - OS1AAS/1P	10	Technos	639.90	63.99	Carbon
1483	Relógio Technos Acqua Masculino Cronógrafo - OS10EV/8L	10	Technos	619.90	61.99	Acqua
1484	Relógio Technos Acqua Masculino Cronógrafo - OS10EP/8P	10	Technos	619.90	61.99	Acqua
1485	Relógio Technos Legacy Masculino Cronógrafo - JS15BA/3C	10	Technos	969.90	96.99	Legacy
1486	Relógio Technos Legacy Masculino Cronógrafo - JS15AO/4X	10	Technos	759.90	75.99	Legacy
1487	Relógio Technos Solar  Masculino Dourado - AS37AB/4B	10	Technos	969.90	96.99	Solar
1488	Relógio Technos Legacy Masculino Analógico - 2315ABL/4P	10	Technos	569.90	56.99	Legacy
1489	Relógio Technos Acqua Masculino Analógico - 2115KPA/1Y	10	Technos	529.90	52.99	Acqua
1490	Relógio Technos Executive Masculino Analógico - 2115KOW/4K	10	Technos	529.90	52.99	Executive
1491	Relógio Technos Racer Masculino Analógico - 2115KOU/1P	10	Technos	259.90	25.99	Racer
1492	Relógio Technos Steel Masculino Analógico - 2115KNO/2P	10	Technos	259.90	25.99	Steel
1493	Relógio Technos Acqua Masculino Analógico - 2115KMB/1P	10	Technos	528.00	52.80	Acqua
1494	Relógio Technos Golf Masculino Analógico - 2105AU/4X	10	Technos	399.90	39.99	Golf
1495	Relógio Technos Steel Masculino Analógico - 2035LRU/5K	10	Technos	259.90	25.99	Steel
1496	Relógio Technos Steel Masculino Analógico - 2015BYYTD/4B	10	Technos	299.90	29.99	Steel
1497	Relógio Technos Ts Digiana Masculino Ana Digi  - 0527AB/4P	10	Technos	849.90	84.99	Ts Digiana
1498	Relógio Technos Ts Carbon Masculino Cronógrafo - OS1AAU/1A	10	Technos	559.90	55.99	Carbon
1499	Relógio Technos Skydiver Masculino Ana Digi  - T205FG/4P	10	Technos	809.90	80.99	Skydiver
1500	Relógio Technos Ts Carbon Masculino Cronógrafo - OS2AAK/1K	10	Technos	809.90	80.99	Carbon
1501	Relógio Technos Racer Masculino Multifunção - 6P29AHL/1P	10	Technos	469.90	46.99	Racer
1502	Relógio Technos Racer Masculino Multifunção - 6P29AHJ/1A	10	Technos	369.90	36.99	Racer
1503	Relógio Technos Golf Masculino Analógico - 2115TT/4P	10	Technos	489.90	48.99	Golf
1504	Relógio Technos Steel Masculino Analógico - 2015BZE/2B	10	Technos	309.90	30.99	Steel
1505	Relógio Technos Golf Masculino Analógico - 2305AF/4X	10	Technos	489.90	48.99	Golf
1506	Relógio Technos Golf Masculino Analógico - 2315YJ/4P	10	Technos	399.90	39.99	Golf
1507	Relógio Technos Steel Masculino Analógico - 2115TF/4X	10	Technos	299.90	29.99	Steel
1508	Relógio Technos Racer Masculino Analógico - 2035XH/1P	10	Technos	259.90	25.99	Racer
1509	Relógio Technos Steel Masculino Analógico - 2115GR/4X	10	Technos	299.90	29.99	Steel
1510	Relógio Technos Steel Masculino Analógico - 2035JE/1P	10	Technos	269.90	26.99	Steel
1511	Relógio Technos Riviera Masculino Analógico - 2115EF/4X	10	Technos	459.90	45.99	Riviera
1512	Relógio Technos Executive Masculino Analógico - 1S13BB/5K	10	Technos	221.94	22.19	Executive
\.


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 199
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: wristwatch; Owner: postgres
--

SELECT pg_catalog.setval('wristwatch.user_id_seq', 1, false);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 201
-- Name: wristwatch_id_seq; Type: SEQUENCE SET; Schema: wristwatch; Owner: postgres
--

SELECT pg_catalog.setval('wristwatch.wristwatch_id_seq', 1512, true);


--
-- TOC entry 2816 (class 2606 OID 16408)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (name);


--
-- TOC entry 2826 (class 2606 OID 16495)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (name, brand_name);


--
-- TOC entry 2824 (class 2606 OID 16485)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (salesman_name, brand_name);


--
-- TOC entry 2828 (class 2606 OID 16510)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id_wristwatch, salesman_name);


--
-- TOC entry 2818 (class 2606 OID 16410)
-- Name: salesman salesman_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.salesman
    ADD CONSTRAINT salesman_pkey PRIMARY KEY (name);


--
-- TOC entry 2820 (class 2606 OID 16412)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id, email);


--
-- TOC entry 2822 (class 2606 OID 16432)
-- Name: wristwatch wristwatch_pkey; Type: CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch
    ADD CONSTRAINT wristwatch_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 16433)
-- Name: wristwatch fk_brand_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch
    ADD CONSTRAINT fk_brand_name FOREIGN KEY (brand_name) REFERENCES wristwatch.brand(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2833 (class 2606 OID 16496)
-- Name: collection fk_collection_brand_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.collection
    ADD CONSTRAINT fk_collection_brand_name FOREIGN KEY (brand_name) REFERENCES wristwatch.brand(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2832 (class 2606 OID 16451)
-- Name: purchase fk_purchase_brand_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.purchase
    ADD CONSTRAINT fk_purchase_brand_name FOREIGN KEY (brand_name) REFERENCES wristwatch.brand(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2831 (class 2606 OID 16446)
-- Name: purchase fk_purchase_salesman_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.purchase
    ADD CONSTRAINT fk_purchase_salesman_name FOREIGN KEY (salesman_name) REFERENCES wristwatch.salesman(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2834 (class 2606 OID 16511)
-- Name: sale fk_sale_id_wristwatch; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.sale
    ADD CONSTRAINT fk_sale_id_wristwatch FOREIGN KEY (id_wristwatch) REFERENCES wristwatch.wristwatch(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2835 (class 2606 OID 16516)
-- Name: sale fk_sale_salesman_name; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.sale
    ADD CONSTRAINT fk_sale_salesman_name FOREIGN KEY (salesman_name) REFERENCES wristwatch.salesman(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2830 (class 2606 OID 16501)
-- Name: wristwatch fk_wristwatch_id_collection; Type: FK CONSTRAINT; Schema: wristwatch; Owner: postgres
--

ALTER TABLE ONLY wristwatch.wristwatch
    ADD CONSTRAINT fk_wristwatch_id_collection FOREIGN KEY (collection_name, brand_name) REFERENCES wristwatch.collection(name, brand_name);


-- Completed on 2019-01-12 17:14:49 -02

--
-- PostgreSQL database dump complete
--


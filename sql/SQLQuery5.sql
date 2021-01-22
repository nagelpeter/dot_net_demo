IF OBJECT_ID('Recipe', 'U') IS NOT NULL DROP TABLE Recipe;
IF OBJECT_ID('AllergensCT', 'U') IS NOT NULL DROP TABLE AllergensCT;
IF OBJECT_ID('Ingredient', 'U') IS NOT NULL DROP TABLE Ingredient;
IF OBJECT_ID('Food', 'U') IS NOT NULL DROP TABLE Food;
IF OBJECT_ID('Allergen', 'U') IS NOT NULL DROP TABLE Allergen;


CREATE TABLE Food 
    (FoodID             NUMERIC(5) NOT NULL,
     Name               VARCHAR(30),
     Servings           NUMERIC(1),
     BestB4             NUMERIC(1),
     Type               VARCHAR(10),
  CONSTRAINT f_pk PRIMARY KEY (FoodID));

CREATE TABLE Ingredient
    (IngredientID       NUMERIC (5) NOT NULL,
     Name               VARCHAR(30),
     Unit               VARCHAR(15),
	 Type				VARCHAR(10),
  CONSTRAINT i_pk PRIMARY KEY(IngredientID));

CREATE TABLE Recipe
    (RecipeID 			NUMERIC(5) NOT NULL,
	 FoodID 			NUMERIC(5) NOT NULL,
     IngredientID 		NUMERIC(5) NOT NULL,
     Quantity 			NUMERIC(5,2),
  CONSTRAINT r_pk PRIMARY KEY(RecipeID),
  CONSTRAINT r_fk1 FOREIGN KEY(FoodID) REFERENCES Food(FoodID),
  CONSTRAINT r_fk2 FOREIGN KEY(IngredientID) REFERENCES Ingredient(IngredientID));

CREATE TABLE Allergen
    (AllergenID       	NUMERIC (5) NOT NULL,
     Name               VARCHAR(30),
  CONSTRAINT a_pk PRIMARY KEY(AllergenID));

CREATE TABLE AllergensCT
    (AllergensCTID 		NUMERIC(5) NOT NULL,
	 FoodID 			NUMERIC(5) NOT NULL,
     AllergenID 		NUMERIC(5) NOT NULL,
  CONSTRAINT as_pk PRIMARY KEY(AllergensCTID),
  CONSTRAINT as_fk1 FOREIGN KEY(FoodID) REFERENCES Food(FoodID),
  CONSTRAINT as_fk2 FOREIGN KEY(AllergenID) REFERENCES Allergen(AllergenID));

--hozzávalók
INSERT INTO Ingredient VALUES (00001,'kifli','db','péksüti');
INSERT INTO Ingredient VALUES (00002,'zsömle','db','péksüti');
INSERT INTO Ingredient VALUES (00003,'kenyér','kg','péksüti');
INSERT INTO Ingredient VALUES (00004,'sajtos pogácsa','db','péksüti');
INSERT INTO Ingredient VALUES (00005,'sajtos stangli','db','péksüti');
INSERT INTO Ingredient VALUES (00006,'tepertős pogácsa','db','péksüti');
INSERT INTO Ingredient VALUES (00007,'vajas croissant','db','péksüti');
INSERT INTO Ingredient VALUES (00008,'kakaós csiga','db','péksüti');
INSERT INTO Ingredient VALUES (00009,'pizzás csiga','db','péksüti');
INSERT INTO Ingredient VALUES (00010,'túrós táska','db','péksüti');
INSERT INTO Ingredient VALUES (00011,'szeletelt kenyér','szelet','péksüti');
INSERT INTO Ingredient VALUES (00012,'alma','db','gyümölcs');
INSERT INTO Ingredient VALUES (00013,'banán','db','gyümölcs');
INSERT INTO Ingredient VALUES (00014,'narancs','db','gyümölcs');
INSERT INTO Ingredient VALUES (00015,'citrom','db','gyümölcs');
INSERT INTO Ingredient VALUES (00016,'lime','db','gyümölcs');
INSERT INTO Ingredient VALUES (00017,'szilva','kg','gyümölcs');
INSERT INTO Ingredient VALUES (00018,'körte','db','gyümölcs');
INSERT INTO Ingredient VALUES (00019,'szőlő','dkg','gyümölcs');
INSERT INTO Ingredient VALUES (00020,'ananász','db','gyümölcs');
INSERT INTO Ingredient VALUES (00021,'kivi','db','gyümölcs');
INSERT INTO Ingredient VALUES (00022,'eper','dkg','gyümölcs');
INSERT INTO Ingredient VALUES (00023,'málna','dkg','gyümölcs');
INSERT INTO Ingredient VALUES (00024,'gránátalma','db','gyümölcs');
INSERT INTO Ingredient VALUES (00025,'sárgabarack','db','gyümölcs');
INSERT INTO Ingredient VALUES (00026,'őszibarack','db','gyümölcs');
INSERT INTO Ingredient VALUES (00027,'sárgadinnye','db','gyümölcs');
INSERT INTO Ingredient VALUES (00028,'paprika','db','zöldség');
INSERT INTO Ingredient VALUES (00029,'paradicsom','db','zöldség');
INSERT INTO Ingredient VALUES (00030,'lilahagyma','db','zöldség');
INSERT INTO Ingredient VALUES (00031,'vöröshagyma','db','zöldség');
INSERT INTO Ingredient VALUES (00032,'padlizsán','db','zöldség');
INSERT INTO Ingredient VALUES (00033,'cukkini','db','zöldség');
INSERT INTO Ingredient VALUES (00034,'burgonya','kg','zöldség');
INSERT INTO Ingredient VALUES (00035,'cékla','db','zöldség');
INSERT INTO Ingredient VALUES (00036,'édesburgonya','dkg','zöldség');
INSERT INTO Ingredient VALUES (00037,'karfiol','db','zöldség');
INSERT INTO Ingredient VALUES (00038,'karalábé','db','zöldség');
INSERT INTO Ingredient VALUES (00039,'retek','db','zöldség');
INSERT INTO Ingredient VALUES (00040,'sárgrépa','db','zöldség');
INSERT INTO Ingredient VALUES (00041,'fehérrépa','kg','zöldség');
INSERT INTO Ingredient VALUES (00042,'spenót','dkg','zöldség');
INSERT INTO Ingredient VALUES (00043,'sütőtök','db','zöldség');
INSERT INTO Ingredient VALUES (00044,'uborka','dkg','zöldség');
INSERT INTO Ingredient VALUES (00045,'salátakeverék','db','zöldség');
INSERT INTO Ingredient VALUES (00046,'fokhagyma','db','zöldség');
INSERT INTO Ingredient VALUES (00047,'napraforgó olaj','dl','olaj');
INSERT INTO Ingredient VALUES (00048,'kukorica olaj','dl','olaj');
INSERT INTO Ingredient VALUES (00049,'olivaolaj','dl','olaj');
INSERT INTO Ingredient VALUES (00050,'ecet','dl','olaj');
INSERT INTO Ingredient VALUES (00051,'virsli','db','felvágott');
INSERT INTO Ingredient VALUES (00052,'kolbász','dkg','felvágott');
INSERT INTO Ingredient VALUES (00053,'párizsi','dkg','felvágott');
INSERT INTO Ingredient VALUES (00054,'sonka','dkg','felvágott');
INSERT INTO Ingredient VALUES (00055,'debreceni','db','felvágott');
INSERT INTO Ingredient VALUES (00056,'barna csiperke','dkg','gomba');
INSERT INTO Ingredient VALUES (00057,'fehér csiperke','dkg','gomba');
INSERT INTO Ingredient VALUES (00058,'shiitake','dkg','gomba');
INSERT INTO Ingredient VALUES (00059,'laska','dkg','gomba');
INSERT INTO Ingredient VALUES (00060,'portobello','dkg','gomba');
INSERT INTO Ingredient VALUES (00061,'tej (kék)','dl','tejtermék');
INSERT INTO Ingredient VALUES (00062,'tej (piros)','dl','tejtermék');
INSERT INTO Ingredient VALUES (00063,'tej (fekete)','l','tejtermék');
INSERT INTO Ingredient VALUES (00064,'laktózmentes tej','dl','tejtermék');
INSERT INTO Ingredient VALUES (00065,'natúr joghurt','db','tejtermék');
INSERT INTO Ingredient VALUES (00066,'gyümölcsös joghurt','db','tejtermék');
INSERT INTO Ingredient VALUES (00067,'kefír','dl','tejtermék');
INSERT INTO Ingredient VALUES (00068,'görög joghurt','db','tejtermék');
INSERT INTO Ingredient VALUES (00069,'tejföl','g','tejtermék');
INSERT INTO Ingredient VALUES (00070,'túró','dkg','tejtermék');
INSERT INTO Ingredient VALUES (00071,'trapista sajt','dkg','tejtermék');
INSERT INTO Ingredient VALUES (00072,'karaván sajt','dkg','tejtermék');
INSERT INTO Ingredient VALUES (00073,'kecskesajt','dkg','tejtermék');
INSERT INTO Ingredient VALUES (00074,'mozzarella','zacskó','tejtermék');
INSERT INTO Ingredient VALUES (00075,'vaj','dkg','tejtermék');
INSERT INTO Ingredient VALUES (00076,'margarin','dkg','tejtermék');
INSERT INTO Ingredient VALUES (00077,'tejszín','dl','tejtermék');
INSERT INTO Ingredient VALUES (00078,'mirelit zöldségkeverés','zacskó','mirelit');
INSERT INTO Ingredient VALUES (00079,'mirelit brokkoli','dkg','mirelit');
INSERT INTO Ingredient VALUES (00080,'wok zöldség','zacskó','mirelit');
INSERT INTO Ingredient VALUES (00081,'mirelit spenót','doboz','mirelit');
INSERT INTO Ingredient VALUES (00082,'halrudak','db','mirelit');
INSERT INTO Ingredient VALUES (00083,'pizza','db','mirelit');
INSERT INTO Ingredient VALUES (00084,'fagyi','doboz','mirelit');
INSERT INTO Ingredient VALUES (00085,'hasábburgonya','zacskó','mirelit');
INSERT INTO Ingredient VALUES (00086,'morzsolt kukorica','konzerv','tartós');
INSERT INTO Ingredient VALUES (00087,'passzírozott paradicsom','doboz','tartós');
INSERT INTO Ingredient VALUES (00088,'vörösbab','konzerv','tartós');
INSERT INTO Ingredient VALUES (00089,'zöldborsó','konzerv','tartós');
INSERT INTO Ingredient VALUES (00090,'fehérbab','konzerv','tartós');
INSERT INTO Ingredient VALUES (00091,'lencse','konzerv','tartós');
INSERT INTO Ingredient VALUES (00092,'kristálycukor','dkg','egyéb');
INSERT INTO Ingredient VALUES (00093,'nádcukor','dkg','egyéb');
INSERT INTO Ingredient VALUES (00094,'porcukor','dkg','egyéb');
INSERT INTO Ingredient VALUES (00095,'só','kg','egyéb');
INSERT INTO Ingredient VALUES (00096,'jázmin rizs','zacskó','egyéb');
INSERT INTO Ingredient VALUES (00097,'barna rizs','zacskó','egyéb');
INSERT INTO Ingredient VALUES (00098,'fehér rizs','zacskó','egyéb');
INSERT INTO Ingredient VALUES (00099,'basmati rizs','zacskó','egyéb');
INSERT INTO Ingredient VALUES (00100,'búza finomliszt','dkg','egyéb');
INSERT INTO Ingredient VALUES (00101,'búza rétesliszt','dkg','egyéb');
INSERT INTO Ingredient VALUES (00102,'búzadara','dkg','egyéb');
INSERT INTO Ingredient VALUES (00103,'zabliszt','dkg','egyéb');
INSERT INTO Ingredient VALUES (00104,'rizsliszt','dkg','egyéb');
INSERT INTO Ingredient VALUES (00105,'teljes kiörlésű búzaliszt','dkg','egyéb');
INSERT INTO Ingredient VALUES (00106,'tönkölybúzaliszt','dkg','egyéb');
INSERT INTO Ingredient VALUES (00107,'köles','dkg','egyéb');
INSERT INTO Ingredient VALUES (00108,'zabpehely','dkg','egyéb');
INSERT INTO Ingredient VALUES (00109,'gabonapehely','dkg','egyéb');
INSERT INTO Ingredient VALUES (00110,'kukoricapehely','dkg','egyéb');
INSERT INTO Ingredient VALUES (00111,'müzli','dkg','egyéb');
INSERT INTO Ingredient VALUES (00112,'lekvár','db','egyéb');
INSERT INTO Ingredient VALUES (00113,'méz','db','egyéb');
INSERT INTO Ingredient VALUES (00114,'nutella','dkg','egyéb');
INSERT INTO Ingredient VALUES (00115,'tojás','db','egyéb');
INSERT INTO Ingredient VALUES (00116,'kakaópor','g','egyéb');
INSERT INTO Ingredient VALUES (00117,'ketchup','g','egyéb');
INSERT INTO Ingredient VALUES (00118,'majonéz','g','egyéb');
INSERT INTO Ingredient VALUES (00119,'mustár','g','egyéb');
INSERT INTO Ingredient VALUES (00120,'zsemlemorzsa','dkg','egyéb');
INSERT INTO Ingredient VALUES (00121,'kukoricadara','dkg','egyéb');
INSERT INTO Ingredient VALUES (00122,'mandulabél','g','mag');
INSERT INTO Ingredient VALUES (00123,'földimogyoró','g','mag');
INSERT INTO Ingredient VALUES (00124,'kesudió','g','mag');
INSERT INTO Ingredient VALUES (00125,'pisztácia','g','mag');
INSERT INTO Ingredient VALUES (00126,'pekándió','g','mag');
INSERT INTO Ingredient VALUES (00127,'spaghetti','g','tészta');
--
INSERT INTO Ingredient VALUES (00129,'penne','g','tészta');
INSERT INTO Ingredient VALUES (00130,'farfalle','g','tészta');
INSERT INTO Ingredient VALUES (00131,'fusilli','g','tészta');
INSERT INTO Ingredient VALUES (00132,'maccheroni','g','tészta');
INSERT INTO Ingredient VALUES (00133,'lasegne','g','tészta');
INSERT INTO Ingredient VALUES (00134,'csirke mellfilé','dkg','hús');
INSERT INTO Ingredient VALUES (00135,'csirke máj','dkg','hús');
INSERT INTO Ingredient VALUES (00136,'csirke comb (egész)','db','hús');
INSERT INTO Ingredient VALUES (00137,'csirke comb (felső)','db','hús');
INSERT INTO Ingredient VALUES (00138,'csirke comb (alsó)','db','hús');
INSERT INTO Ingredient VALUES (00139,'csirke comb (filé)','db','hús');
INSERT INTO Ingredient VALUES (00140,'csirke szárny','dkg','hús');
INSERT INTO Ingredient VALUES (00141,'csirke nyak','dkg','hús');
INSERT INTO Ingredient VALUES (00142,'sertés karaj','dkg','hús');
INSERT INTO Ingredient VALUES (00143,'sertés tarja','dkg','hús');
INSERT INTO Ingredient VALUES (00144,'sertés fehérpecsenye','dkg','hús');
INSERT INTO Ingredient VALUES (00145,'sertés darálthús','dkg','hús');
INSERT INTO Ingredient VALUES (00146,'sertés oldalas','dkg','hús');
INSERT INTO Ingredient VALUES (00147,'sertés szűzpecsenye','dkg','hús');
INSERT INTO Ingredient VALUES (00148,'marha gulyáshús','dkg','hús');
INSERT INTO Ingredient VALUES (00149,'marha lábszár','dkg','hús');
INSERT INTO Ingredient VALUES (00150,'marha nyak','dkg','hús');
INSERT INTO Ingredient VALUES (00151,'füstölt lazac','dkg','hal');
INSERT INTO Ingredient VALUES (00152,'garnéla','dkg','hal');
INSERT INTO Ingredient VALUES (00153,'ponty','dkg','hal');
INSERT INTO Ingredient VALUES (00154,'afrikai harcsa','dkg','hal');
INSERT INTO Ingredient VALUES (00155,'pisztráng','dkg','hal');
INSERT INTO Ingredient VALUES (00156,'tőkehal','dkg','hal');
INSERT INTO Ingredient VALUES (00157,'lazacfilé','dkg','hal');
INSERT INTO Ingredient VALUES (00158,'afrikai harcsa','dkg','hal');
INSERT INTO Ingredient VALUES (00159,'pirospaprika','g','fűszer');
INSERT INTO Ingredient VALUES (00160,'szárnyas fűszerkeverék','csomag','fűszer');
INSERT INTO Ingredient VALUES (00161,'mexikói fűszerkeverék','csomag','fűszer');
INSERT INTO Ingredient VALUES (00162,'olasz fűszerkeverék','csomag','fűszer');
INSERT INTO Ingredient VALUES (00163,'petrezselyem','csomag','fűszer');
INSERT INTO Ingredient VALUES (00164,'kakukkfű','csomag','fűszer');
INSERT INTO Ingredient VALUES (00165,'bazsalikom','csomag','fűszer');
INSERT INTO Ingredient VALUES (00166,'rozmaring','csomag','fűszer');
INSERT INTO Ingredient VALUES (00167,'chilli','csomag','fűszer');
INSERT INTO Ingredient VALUES (00168,'narancslé','l','ital');
INSERT INTO Ingredient VALUES (00169,'almalé','l','ital');
INSERT INTO Ingredient VALUES (00170,'baracklé','l','ital');
INSERT INTO Ingredient VALUES (00171,'kóla','l','ital');
INSERT INTO Ingredient VALUES (00172,'jegestea','l','ital');
INSERT INTO Ingredient VALUES (00173,'ásványvíz','l','ital');
INSERT INTO Ingredient VALUES (00174,'sör','dl','ital');
INSERT INTO Ingredient VALUES (00175,'vörösbor','dl','ital');
INSERT INTO Ingredient VALUES (00176,'fehérbor','l','ital');

--Allergének
INSERT INTO Allergen VALUES (00001,'gluten');
INSERT INTO Allergen VALUES (00002,'crab');
INSERT INTO Allergen VALUES (00003,'egg');
INSERT INTO Allergen VALUES (00004,'fish');
INSERT INTO Allergen VALUES (00005,'peanut');
INSERT INTO Allergen VALUES (00006,'soy');
INSERT INTO Allergen VALUES (00007,'lactose');
INSERT INTO Allergen VALUES (00008,'nut');
INSERT INTO Allergen VALUES (00009,'celery');
INSERT INTO Allergen VALUES (00010,'mustard');
INSERT INTO Allergen VALUES (00011,'sesame');

--Kaják
--reggelik
INSERT INTO Food VALUES(00001,'kemény tojás',1,1,'reggeli');
INSERT INTO Recipe VALUES(00001,00001,00115,3);--tojás
INSERT INTO Recipe VALUES(00002,00001,00002,2);--zsömle
INSERT INTO Recipe VALUES(00003,00001,00029,1);--paradicsom
--allergének
INSERT INTO AllergensCT VALUES(00001,00001,00001);--glutén
INSERT INTO AllergensCT VALUES(00002,00001,00003);--tojás

INSERT INTO Food VALUES(00002,'rántotta',1,1,'reggeli');
INSERT INTO Recipe VALUES(00004,00002,00115,3);--tojás
INSERT INTO Recipe VALUES(00005,00002,00002,2);--zsömle
INSERT INTO Recipe VALUES(00006,00002,00029,1);--paradicsom
--allergének
INSERT INTO AllergensCT VALUES(00003,00002,00001);--glutén
INSERT INTO AllergensCT VALUES(00004,00002,00003);--tojás

INSERT INTO Food VALUES(00003,'zabkása (banános)', 1, 1,'reggeli');
INSERT INTO Recipe VALUES(00007,00003,00013,1);--banán
INSERT INTO Recipe VALUES(00008,00003,00108,5);--zabpehely
INSERT INTO Recipe VALUES(00009,00003,00064,3);--laktimentes tej
--allergének
INSERT INTO AllergensCT VALUES(00005,00003,00001);--glutén

INSERT INTO Food VALUES(00004,'zabkása (kakós)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00010,00004,00116,NULL);--kakaópor
INSERT INTO Recipe VALUES(00011,00004,00108,5);--zabpehely
INSERT INTO Recipe VALUES(00012,00004,00064,3);--laktimentes tej
--allergének
INSERT INTO AllergensCT VALUES(00006,00004,00001);--glutén

INSERT INTO Food VALUES(00005,'zabkása (málnás)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00013,00005,00023,3);--málna
INSERT INTO Recipe VALUES(00014,00005,00108,5);--zabpehely
INSERT INTO Recipe VALUES(00015,00005,00064,3);--laktimentes tej
--allergének
INSERT INTO AllergensCT VALUES(00007,00005,00001);--glutén

INSERT INTO Food VALUES(00006,'zabkása (almás)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00016,00006,00012,1);--alma
INSERT INTO Recipe VALUES(00017,00006,00108,5);--zabpehely
INSERT INTO Recipe VALUES(00018,00006,00064,3);--laktimentes tej
--allergének
INSERT INTO AllergensCT VALUES(00056,00006,00001);--glutén

INSERT INTO Food VALUES(00007,'zabkása (epres)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00019,00007,00022,3);--eper
INSERT INTO Recipe VALUES(00020,00007,00108,5);--zabpehely
INSERT INTO Recipe VALUES(00021,00007,00064,3);--laktimentes tej
--allergének
INSERT INTO AllergensCT VALUES(00008,00007,00001);--glutén

INSERT INTO Food VALUES(00008,'zabkása (nutellás)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00022,00008,00114,NULL);--nutella
INSERT INTO Recipe VALUES(00023,00008,00108,5);--zabpehely
INSERT INTO Recipe VALUES(00024,00008,00064,3);--laktimentes tej
--allergének
INSERT INTO AllergensCT VALUES(00009,00008,00001);--glutén

INSERT INTO Food VALUES(00009,'melegszendvics (sonkás)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00025,00009,00010,4);--szeletelt kenyér
INSERT INTO Recipe VALUES(00026,00009,00054,1);--sonka
INSERT INTO Recipe VALUES(00027,00009,00071,2);--trapista
INSERT INTO Recipe VALUES(00028,00009,00117,NULL);--ketchup
--allergének
INSERT INTO AllergensCT VALUES(00010,00009,00001);--glutén
INSERT INTO AllergensCT VALUES(00011,00009,00007);--laktóz

INSERT INTO Food VALUES(00010,'melegszendvics (kolbászos)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00029,00010,00010,4);--szeletelt kenyér
INSERT INTO Recipe VALUES(00030,00010,00052,1);--kolbász
INSERT INTO Recipe VALUES(00031,00010,00071,2);--trapista
INSERT INTO Recipe VALUES(00032,00010,00117,NULL);--ketchup
--allergének
INSERT INTO AllergensCT VALUES(00012,00010,00001);--glutén
INSERT INTO AllergensCT VALUES(00013,00010,00007);--laktóz

INSERT INTO Food VALUES(00011,'melegszendvics (párizsis)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00033,00011,00010,4);--szeletelt kenyér
INSERT INTO Recipe VALUES(00034,00011,00053,1);--párizsi
INSERT INTO Recipe VALUES(00035,00011,00071,2);--trapista
INSERT INTO Recipe VALUES(00036,00011,00117,NULL);--ketchup
--allergének
INSERT INTO AllergensCT VALUES(00014,00011,00001);--glutén
INSERT INTO AllergensCT VALUES(00015,00011,00007);--laktóz

INSERT INTO Food VALUES(00012,'melegszendvics (sajtos)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00037,00012,00010,4);--szeletelt kenyér
INSERT INTO Recipe VALUES(00038,00012,00072,2);--karaván
INSERT INTO Recipe VALUES(00039,00012,00071,2);--trapista
INSERT INTO Recipe VALUES(00040,00012,00117,NULL);--ketchup
--allergének
INSERT INTO AllergensCT VALUES(00016,00012,00001);--glutén
INSERT INTO AllergensCT VALUES(00017,00012,00007);--laktóz

INSERT INTO Food VALUES(00013,'szendvics (sonkás)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00041,00013,00005,2);--sajtos stangli
INSERT INTO Recipe VALUES(00042,00013,00054,1);--sonka
INSERT INTO Recipe VALUES(00043,00013,00071,2);--trapista
INSERT INTO Recipe VALUES(00044,00013,00076,NULL);--margrin
INSERT INTO Recipe VALUES(00045,00013,00028,1);--paprika
--allergének
INSERT INTO AllergensCT VALUES(00018,00013,00001);--glutén
INSERT INTO AllergensCT VALUES(00019,00013,00007);--laktóz

INSERT INTO Food VALUES(00014,'szendvics (kolbászos)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00046,00014,00005,2);--sajtos stangli
INSERT INTO Recipe VALUES(00047,00014,00052,1);--kolbász
INSERT INTO Recipe VALUES(00048,00014,00071,2);--trapista
INSERT INTO Recipe VALUES(00049,00014,00076,NULL);--margrin
INSERT INTO Recipe VALUES(00050,00014,00028,1);--paprika
--allergének
INSERT INTO AllergensCT VALUES(00020,00014,00001);--glutén
INSERT INTO AllergensCT VALUES(00021,00014,00007);--laktóz

INSERT INTO Food VALUES(00015,'szendvics (párizsis)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00051,00015,00005,2);--sajtos stangli
INSERT INTO Recipe VALUES(00052,00015,00053,1);--párizsi
INSERT INTO Recipe VALUES(00053,00015,00071,2);--trapista
INSERT INTO Recipe VALUES(00054,00015,00076,NULL);--margrin
INSERT INTO Recipe VALUES(00055,00015,00028,1);--paprik
--allergének
INSERT INTO AllergensCT VALUES(00022,00015,00001);--glutén
INSERT INTO AllergensCT VALUES(00023,00015,00007);--laktóz

INSERT INTO Food VALUES(00016,'szendvics (sajtos)',1,1,'reggeli');
INSERT INTO Recipe VALUES(00056,00016,00005,2);--sajtos stangli
INSERT INTO Recipe VALUES(00057,00016,00072,2);--karaván
INSERT INTO Recipe VALUES(00058,00016,00071,2);--trapista
INSERT INTO Recipe VALUES(00059,00016,00076,NULL);--margrin
INSERT INTO Recipe VALUES(00060,00016,00028,1);--paprika
--allergének
INSERT INTO AllergensCT VALUES(00024,00016,00001);--glutén
INSERT INTO AllergensCT VALUES(00025,00016,00007);--laktóz

INSERT INTO Food VALUES(00017,'virsli',1,1,'reggeli');
INSERT INTO Recipe VALUES(00061,00017,00002,2);--zsömle
INSERT INTO Recipe VALUES(00062,00017,00051,4);--virsli
INSERT INTO Recipe VALUES(00063,00017,00029,1);--paradicsom
INSERT INTO Recipe VALUES(00064,00017,00119,NULL);--mustár
--allergének
INSERT INTO AllergensCT VALUES(00026,00017,00001);--glutén
INSERT INTO AllergensCT VALUES(00027,00017,000010);--mustár

INSERT INTO Food VALUES(00018,'debreceni',1,1,'reggeli');
INSERT INTO Recipe VALUES(00065,00018,00002,2);--zsömle
INSERT INTO Recipe VALUES(00066,00018,00055,2);--debreceni
INSERT INTO Recipe VALUES(00067,00018,00029,1);--paradicsom
INSERT INTO Recipe VALUES(00068,00018,00119,NULL);--mustár
--allergének
INSERT INTO AllergensCT VALUES(00028,00018,00001);--glutén
INSERT INTO AllergensCT VALUES(00029,00018,000010);--mustár

INSERT INTO Food VALUES(00019,'gyümlcsös joghurt',1,1,'reggeli');
INSERT INTO Recipe VALUES(00069,00019,00001,1);--kifli
INSERT INTO Recipe VALUES(00070,00019,00066,1);--gyümijoghurt
INSERT INTO Recipe VALUES(00071,00019,00012,1);--alma
--allergének
INSERT INTO AllergensCT VALUES(00030,00019,00001);--glutén
INSERT INTO AllergensCT VALUES(00031,00019,00007);--laktóz

INSERT INTO Food VALUES(00020,'görög joghurt',1,1,'reggeli');
INSERT INTO Recipe VALUES(00072,00020,00001,1);--kifli
INSERT INTO Recipe VALUES(00073,00020,00066,1);--görög joghurt
INSERT INTO Recipe VALUES(00074,00020,00013,1);--banán
--allergének
INSERT INTO AllergensCT VALUES(00032,00020,00001);--glutén
INSERT INTO AllergensCT VALUES(00033,00020,00007);--laktóz

INSERT INTO Food VALUES(00021,'körözött',2,1,'reggeli');
INSERT INTO Recipe VALUES(00075,00021,00005,4);--sajtos stangli
INSERT INTO Recipe VALUES(00076,00021,00069,200);--tejföl
INSERT INTO Recipe VALUES(00077,00021,00070,250);--túró
INSERT INTO Recipe VALUES(00078,00021,00030,1);--lilahagyma
INSERT INTO Recipe VALUES(00079,00021,00159,NULL);--pirospaprika
--allergének
INSERT INTO AllergensCT VALUES(00034,00021,00001);--glutén
INSERT INTO AllergensCT VALUES(00035,00021,00007);--laktóz

INSERT INTO Food VALUES(00022,'péksüti',1,1,'reggeli');
INSERT INTO Recipe VALUES(00080,00022,00007,4);--vajas croissant
INSERT INTO Recipe VALUES(00081,00022,00062,2);--tej
INSERT INTO Recipe VALUES(00082,00022,00076,NULL);--margrin
--allergének
INSERT INTO AllergensCT VALUES(00036,00022,00001);--glutén
INSERT INTO AllergensCT VALUES(00037,00022,00007);--laktóz

INSERT INTO Food VALUES(00023,'kifli+kefir',1,1,'reggeli');
INSERT INTO Recipe VALUES(00083,00023,00001,2);--kifli
INSERT INTO Recipe VALUES(00084,00023,00067,2);--kefir
INSERT INTO Recipe VALUES(00085,00023,00012,1);--alma
--allergének
INSERT INTO AllergensCT VALUES(00038,00023,00001);--glutén
INSERT INTO AllergensCT VALUES(00039,00023,00007);--laktóz

--ebédek
INSERT INTO Food VALUES(00024,'fűszeres csirkemell',1,5,'feltét');
INSERT INTO Recipe VALUES(00086,00024,00134,2);--csirkemell
INSERT INTO Recipe VALUES(00087,00024,00160,NULL);--szárnyasfűszer
--allergének

INSERT INTO Food VALUES(00025,'natúr csirkemell',1,5,'feltét');
INSERT INTO Recipe VALUES(00088,00025,00134,2);--csirkemell
INSERT INTO Recipe VALUES(00089,00025,00075,NULL);--vaj
--allergének
INSERT INTO AllergensCT VALUES(00057,00025,00007);--laktóz

INSERT INTO Food VALUES(00026,'mézes-mustáros tarja',1,5,'feltét');
INSERT INTO Recipe VALUES(00090,00026,00143,2);--tarja
INSERT INTO Recipe VALUES(00091,00026,00113,NULL);--méz
INSERT INTO Recipe VALUES(00092,00026,00119,NULL);--mustár
INSERT INTO Recipe VALUES(00093,00026,00047,NULL);--olaj
INSERT INTO Recipe VALUES(00094,00026,00046,NULL);--fokhagyma
--allergének
INSERT INTO AllergensCT VALUES(00040,00026,000010);--mustár

INSERT INTO Food VALUES(00027,'cukkini fasírt',1,5,'feltét');
INSERT INTO Recipe VALUES(00095,00027,00115,1);--tojás
INSERT INTO Recipe VALUES(00096,00027,00033,1);--cukkini
INSERT INTO Recipe VALUES(00097,00027,00046,NULL);--fokhagyma
INSERT INTO Recipe VALUES(00098,00027,00071,10);--trapista sajt
INSERT INTO Recipe VALUES(00099,00027,00100,3);--list
INSERT INTO Recipe VALUES(00100,00027,00120,NULL);--zsemlemorzsa
--allergének
INSERT INTO AllergensCT VALUES(00041,00027,00001);--glutén
INSERT INTO AllergensCT VALUES(00042,00027,00003);--tojás
INSERT INTO AllergensCT VALUES(00043,00027,00007);--laktóz

INSERT INTO Food VALUES(00028,'tojásos rizs(kukoricás)',2,5,'főétel');
INSERT INTO Recipe VALUES(00101,00028,00115,2);--tojás
INSERT INTO Recipe VALUES(00102,00028,00096,1);--rizs
INSERT INTO Recipe VALUES(00103,00028,00086,1);--konzerv kukorica
INSERT INTO Recipe VALUES(00104,00028,00074,1);--mozzarella
--allergének
INSERT INTO AllergensCT VALUES(00044,00028,00003);--tojás
INSERT INTO AllergensCT VALUES(00045,00028,00007);--laktóz

INSERT INTO Food VALUES(00029,'tojásos rizs(wokos)',2,5,'főétel');
INSERT INTO Recipe VALUES(00105,00029,00115,2);--tojás
INSERT INTO Recipe VALUES(00106,00029,00096,1);--rizs
INSERT INTO Recipe VALUES(00107,00029,00080,1);--wok zöldség
INSERT INTO Recipe VALUES(00108,00029,00074,1);--mozzarella
--allergének
INSERT INTO AllergensCT VALUES(00046,00029,00003);--tojás
INSERT INTO AllergensCT VALUES(00047,00029,00007);--laktóz

INSERT INTO Food VALUES(00030,'tojásos rizs(vegyes zöldséges)',2,5,'főétel');
INSERT INTO Recipe VALUES(00109,00030,00115,2);--tojás
INSERT INTO Recipe VALUES(00110,00030,00096,1);--rizs
INSERT INTO Recipe VALUES(00111,00030,00078,1);--vegyes zöld
INSERT INTO Recipe VALUES(00112,00030,00074,1);--mozzarella
--allergének
INSERT INTO AllergensCT VALUES(00048,00030,00003);--tojás
INSERT INTO AllergensCT VALUES(00049,00030,00007);--laktóz

INSERT INTO Food VALUES(00031,'spenótos tészta',2,3,'tészta');
INSERT INTO Recipe VALUES(00113,00031,00081,1);--spenót
INSERT INTO Recipe VALUES(00114,00031,00115,1);--tojás
INSERT INTO Recipe VALUES(00115,00031,00069,NULL);--tejföl
INSERT INTO Recipe VALUES(00116,00031,00046,NULL);--fokhagyma
INSERT INTO Recipe VALUES(00117,00031,00131,250);--fusilli
INSERT INTO Recipe VALUES(00118,00031,00047,NULL);--olaj
INSERT INTO Recipe VALUES(00119,00031,00103,NULL);--zablisz
--allergének
INSERT INTO AllergensCT VALUES(00050,00031,00001);--glutén
INSERT INTO AllergensCT VALUES(00051,00031,00003);--tojás

INSERT INTO Food VALUES(00032,'chilis bab',2,5,'főétel');
INSERT INTO Recipe VALUES(00140,00032,00145,3);--sertés darálthús
INSERT INTO Recipe VALUES(00121,00032,00049,NULL);--olivaolaj
INSERT INTO Recipe VALUES(00122,00032,00031,1);--vöröshagyma
INSERT INTO Recipe VALUES(00123,00032,00046,NULL);--fokhagyma
INSERT INTO Recipe VALUES(00124,00032,00087,1);--paradicsomlé
INSERT INTO Recipe VALUES(00125,00032,00086,1);--kukorica
INSERT INTO Recipe VALUES(00126,00032,00088,1);--vörösbab
INSERT INTO Recipe VALUES(00127,00032,00161,1);--mexikói fűszer
--allergének

INSERT INTO Food VALUES(00033,'gombás tejszínes tészta',1,3,'tészta');
INSERT INTO Recipe VALUES(00128,00033,00057,1);--csiperke
INSERT INTO Recipe VALUES(00129,00033,00077,1);--tejszín
INSERT INTO Recipe VALUES(00130,00033,00049,NULL);--olivaolaj
INSERT INTO Recipe VALUES(00131,00033,00046,NULL);--fokhagyma
INSERT INTO Recipe VALUES(00132,00033,00164,NULL);--kakukkfű
INSERT INTO Recipe VALUES(00133,00033,00071,1);--trapista
INSERT INTO Recipe VALUES(00134,00033,00163,NULL);--petrezselyem
INSERT INTO Recipe VALUES(00135,00033,00129,150);--penne
--allergének
INSERT INTO AllergensCT VALUES(00052,00033,00001);--glutén
INSERT INTO AllergensCT VALUES(00053,00033,00007);--laktóz

INSERT INTO Food VALUES(00034,'halrúd',1,5,'feltét');
INSERT INTO Recipe VALUES(00136,00034,00082,6);--halrúd
INSERT INTO Recipe VALUES(00137,00034,00047,NULL);--olaj
--allergének
INSERT INTO AllergensCT VALUES(00054,00034,00001);--glutén
INSERT INTO AllergensCT VALUES(00055,00034,00004);--hal

INSERT INTO Food VALUES(00035,'jázmin rizs',1,5,'köret');
INSERT INTO Recipe VALUES(00138,00035,00096,1);--jázmin rizs
--allergének

INSERT INTO Food VALUES(00036,'basmati rizs',1,5,'köret');
INSERT INTO Recipe VALUES(00139,00036,00099,1);--basmati rizs
--allergének

INSERT INTO Food VALUES(00037,'barna rizs',1,5,'köret');
INSERT INTO Recipe VALUES(00141,00037,00097,1);--barna rizs
--allergének

INSERT INTO Food VALUES(00038,'fehér rizs',1,5,'köret');
INSERT INTO Recipe VALUES(00142,00038,00098,1);--fehér rizs
--allergének

INSERT INTO Food VALUES(00039,'wok zöldség',2,5,'köret');
INSERT INTO Recipe VALUES(00143,00039,00080,1);--wok zöldég
--allergének

INSERT INTO Food VALUES(00040,'vegyes zöldség',2,5,'köret');
INSERT INTO Recipe VALUES(00144,00040,00078,1);--vegyes zöld
--allergének

INSERT INTO Food VALUES(00041,'hasáb burgonya',1,5,'köret');
INSERT INTO Recipe VALUES(00145,00041,00085,NULL);--hasáb
--allergének

INSERT INTO Food VALUES(00042,'vegyes saláta',2,5,'köret');
INSERT INTO Recipe VALUES(00146,00042,00045,1);--salátakeverék
--allergének

INSERT INTO Food VALUES(00043,'édesburgonya',2,5,'köret');
INSERT INTO Recipe VALUES(00147,00043,00036,5);--édesburgonya
INSERT INTO Recipe VALUES(00148,00043,00049,NULL);--olivaolaj
INSERT INTO Recipe VALUES(00149,00043,00167,NULL);--chili
--allergének



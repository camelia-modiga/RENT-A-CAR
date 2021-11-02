--inserare date in tabela masini
insert into masini values(null,'IS 01 RNT');
insert into masini values(null,'IS 02 RNT');
insert into masini values(null,'IS 03 RNT');
insert into masini values(null,'IS 04 RNT');
insert into masini values(null,'IS 05 RNT');
insert into masini values(null,'IS 06 RNT');
insert into masini values(null,'IS 07 RNT');
insert into masini values(null,'IS 08 RNT');
insert into masini values(null,'IS 09 RNT');
insert into masini values(null,'IS 10 RNT');
insert into masini values(null,'IS 11 RNT');
insert into masini values(null,'IS 12 RNT');
insert into masini values(null,'IS 13 RNT');
insert into masini values(null,'IS 14 RNT');
insert into masini values(null,'IS 15 RNT');
insert into masini values(null,'IS 16 RNT');
insert into masini values(null,'IS 17 RNT');
insert into masini values(null,'IS 18 RNT');
insert into masini values(null,'IS 19 RNT');
insert into masini values(null,'IS 20 RNT');

--inserare date in tabela detalii_masini
insert into detalii_masini values('volkswagen','compact',2019,'benzina','negru','automata',4.9,22,(select id_masina from masini where nr_inmatriculare='IS 01 RNT'));
insert into detalii_masini values('renault','compact',2018,'motorina','maro','automata',4,18,(select id_masina from masini where nr_inmatriculare='IS 02 RNT'));
insert into detalii_masini values('opel','compact',2019,'benzina','maro','manuala',4.7,28,(select id_masina from masini where nr_inmatriculare='IS 03 RNT'));
insert into detalii_masini values('chevrolet','mini',2019,'benzina','argintiu','manuala',5.2,12,(select id_masina from masini where nr_inmatriculare='IS 04 RNT'));
insert into detalii_masini values('mercedes','premium',2020,'benzina','galben','automata',4.4,54,(select id_masina from masini where nr_inmatriculare='IS 05 RNT'));
insert into detalii_masini values('BMW','premium',2018,'motorina','negru','automata',9.2,134,(select id_masina from masini where nr_inmatriculare='IS 06 RNT'));
insert into detalii_masini values('dacia','economic',2017,'benzina','rosu','manuala',4.5,14,(select id_masina from masini where nr_inmatriculare='IS 07 RNT'));
insert into detalii_masini values('skoda','economic',2019,'motorina','albastru','automata',4.6,16,(select id_masina from masini where nr_inmatriculare='IS 08 RNT'));
insert into detalii_masini values('BMW','SUV',2019,'motorina','albastru','automata',8.9,90,(select id_masina from masini where nr_inmatriculare='IS 09 RNT'));
insert into detalii_masini values('BMW','SUV',2016,'benzina','rosu','manuala',6.8,92,(select id_masina from masini where nr_inmatriculare='IS 10 RNT'));
insert into detalii_masini values('suzuki','crossover',2018,'benzina','gri','manuala',5.1,30,(select id_masina from masini where nr_inmatriculare='IS 11 RNT'));
insert into detalii_masini values('volkswagen','crossover',2017,'motorina','burgundy','manuala',5.9,75,(select id_masina from masini where nr_inmatriculare='IS 12 RNT'));
insert into detalii_masini values('skoda','combi',2019,'benzina','albastru','automata',4.3,38,(select id_masina from masini where nr_inmatriculare='IS 13 RNT'));
insert into detalii_masini values('volkswagen','combi',2019,'motorina','alb','manuala',5.2,42,(select id_masina from masini where nr_inmatriculare='IS 14 RNT'));
insert into detalii_masini values('mercedes','bus',2016,'benzina','alb','manuala',8.5,52,(select id_masina from masini where nr_inmatriculare='IS 15 RNT'));
insert into detalii_masini values('renault','bus',2019,'motorina','alb','automata',9,68,(select id_masina from masini where nr_inmatriculare='IS 16 RNT'));
insert into detalii_masini values('dacia','economic',2016,'motorina','alb','manuala',6.5,14,(select id_masina from masini where nr_inmatriculare='IS 17 RNT'));
insert into detalii_masini values('ford','economic',2019,'benzina','alb','automata',5.1,24,(select id_masina from masini where nr_inmatriculare='IS 18 RNT'));
insert into detalii_masini values('skoda','premium',2016,'motorina','gri','automata',5.2,42,(select id_masina from masini where nr_inmatriculare='IS 19 RNT'));
insert into detalii_masini values('mercedes','premium',2019,'benzina','maro','manuala',4.5,100,(select id_masina from masini where nr_inmatriculare='IS 20 RNT'));

--inserare date in tabela dotari
insert into dotari values(null,'scaun copil',4);
insert into dotari values(null,'gps',3);
insert into dotari values(null,'lanturi zapada',3);
insert into dotari values(null,'suport biciclete',5);
insert into dotari values(null,'porturi USB',3);
insert into dotari values(null,'camera video',4);

--inserare date tabela masini_dotari
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 11 RNT'),(select id_dotare from dotari where denumire_dotare='gps'));
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 02 RNT'),(select id_dotare from dotari where denumire_dotare='scaun copil'));
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 03 RNT'),(select id_dotare from dotari where denumire_dotare='lanturi zapada'));
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 03 RNT'),(select id_dotare from dotari where denumire_dotare='gps'));
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 05 RNT'),(select id_dotare from dotari where denumire_dotare='lanturi zapada'));
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 05 RNT'),(select id_dotare from dotari where denumire_dotare='suport biciclete'));
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 10 RNT'),(select id_dotare from dotari where denumire_dotare='scaun copil'));


--inserare date in tabela clienti
insert into clienti values(null,'BV183916','CI','Popescu','Matei','popescumatei@yahoo.com','0786903009',to_date('10.03.2010','DD.MM.YYYY'),to_date('13.09.1973','DD.MM.YYYY'));
insert into clienti values(null,'MX129056','CI','Pavel','Maria','maria.pavel@gmail.com','0750976725',to_date('01.03.2016','DD.MM.YYYY'),to_date('08.02.1990','DD.MM.YYYY'));
insert into clienti values(null,'MX456009','CI','Marinescu','Ioana','marinescu_io03@yahoo.com','0786762900',to_date('10.01.2018','DD.MM.YYYY'),to_date('10.09.1995','DD.MM.YYYY'));
insert into clienti values(null,'TM889012','CI','Cristea','Alexandru','alex_crst9@gmail.com','0728900156',to_date('17.08.2017','DD.MM.YYYY'),to_date('15.10.1991','DD.MM.YYYY'));
insert into clienti values(null,'040000314','Pasaport','Alexandrescu','Cristina','cristinaaalx@gmail.com','0759007689',to_date('19.01.2019','DD.MM.YYYY'),to_date('12.12.1998','DD.MM.YYYY'));
insert into clienti values(null,'BV871245','CI','Ionescu','George','george078@gmail.com','0783009851',to_date('20.05.2019','DD.MM.YYYY'),to_date('12.05.1998','DD.MM.YYYY'));
insert into clienti values(null,'MX651490','CI','Enachi','Anca',null,'0732751200',to_date('12.07.2016','DD.MM.YYYY'),to_date('24.12.1988','DD.MM.YYYY'));
insert into clienti values(null,'183916987','Pasaport','Thompson','Sandra','sandra_th@gmail.com','0786502635',to_date('10.03.2014','DD.MM.YYYY'),to_date('10.06.1980','DD.MM.YYYY'));
insert into clienti values(null,'861082569','Pasaport','Gomez','Allison','gomez_allison@yahoo.com','0787114907',to_date('12.12.2016','DD.MM.YYYY'),to_date('12.12.1980','DD.MM.YYYY'));
insert into clienti values(null,'XC783916','CI','Popa','Andrei','popa1234@yahoo.com','0786903012',to_date('11.10.2015','DD.MM.YYYY'),to_date('13.09.1985','DD.MM.YYYY'));
insert into clienti values(null,'MX183916','CI','Grecu','Marius','grecu.mar@yahoo.com','0736913009',to_date('10.03.2019','DD.MM.YYYY'),to_date('13.09.1990','DD.MM.YYYY'));
insert into clienti values(null,'MX183016','CI','Vasiliu','Daniela','dana_vasiliu@gmail.com','0745903349',to_date('03.03.2013','DD.MM.YYYY'),to_date('23.12.1990','DD.MM.YYYY'));
insert into clienti values(null,'MZ183916','CI','Morosanu','Dan','dan78_moro@gmail.com','0722345799',to_date('06.06.2016','DD.MM.YYYY'),to_date('24.10.1991','DD.MM.YYYY'));
insert into clienti values(null,'8614989028','Pasaport','Anton','Teodora','teo1234@yahoo.com','0755098123',to_date('12.05.2016','DD.MM.YYYY'),to_date('21.08.1991','DD.MM.YYYY'));
insert into clienti values(null,'977261182','Pasaport','Georgescu','Marian','georgescu@yahoo.com','0786998109',to_date('14.10.2016','DD.MM.YYYY'),to_date('22.08.1993','DD.MM.YYYY'));
insert into clienti values(null,'VS187255','CI','Hanganu','Alice','alicehng@yahoo.com','0786876510',to_date('14.12.2018','DD.MM.YYYY'),to_date('13.09.1997','DD.MM.YYYY'));
insert into clienti values(null,'BV123887','CI','Iacob','Sebastian','sebi_iacob@yahoo.com','0755198667',to_date('15.10.2018','DD.MM.YYYY'),to_date('13.09.1996','DD.MM.YYYY'));
insert into clienti values(null,'XC986120','CI','Iosub','Luca',null,'0721900817',to_date('10.03.2018','DD.MM.YYYY'),to_date('23.09.1996','DD.MM.YYYY'));


--inserare date in tabela contracte_inchirieri
insert into contracte_inchirieri values(null,to_date('02.11.2020','DD.MM.YYYY'),to_date('17.11.2020','DD.MM.YYYY'),
((to_date('17.11.2020','DD.MM.YYYY')-to_date('02.11.2020','DD.MM.YYYY'))*(select tarif from detalii_masini where id_masina=2)
+(select nvl(sum(dotari.tarif_dotare),0) from dotari,masini_dotari where dotari.id_dotare in masini_dotari.id_dotare and masini_dotari.id_masina=2)),2,2);

insert into contracte_inchirieri values(null,to_date('29.11.2020','DD.MM.YYYY'),to_date('30.11.2020','DD.MM.YYYY'),
((to_date('30.11.2020','DD.MM.YYYY')-to_date('29.11.2020','DD.MM.YYYY'))*((select tarif from detalii_masini where id_masina=3)
+(select nvl(sum(dotari.tarif_dotare),0) from dotari,masini_dotari where dotari.id_dotare in masini_dotari.id_dotare and masini_dotari.id_masina=3))),3,3);

insert into contracte_inchirieri values(null,to_date('01.12.2020','DD.MM.YYYY'),to_date('04.12.2020','DD.MM.YYYY'),
((to_date('04.12.2020','DD.MM.YYYY')-to_date('01.12.2020','DD.MM.YYYY'))*((select tarif from detalii_masini where id_masina=5)
+(select nvl(sum(dotari.tarif_dotare),0) from dotari,masini_dotari where dotari.id_dotare in masini_dotari.id_dotare and masini_dotari.id_masina=5))),4,5);

insert into contracte_inchirieri values(null,to_date('01.12.2020','DD.MM.YYYY'),to_date('12.12.2020','DD.MM.YYYY'),
((to_date('12.12.2020','DD.MM.YYYY')-to_date('01.12.2020','DD.MM.YYYY'))*((select tarif from detalii_masini where id_masina=11)
+(select nvl(sum(dotari.tarif_dotare),0) from dotari,masini_dotari where dotari.id_dotare=masini_dotari.id_dotare and masini_dotari.id_masina=11))),5,11);

insert into contracte_inchirieri values(null,to_date('02.12.2020','DD.MM.YYYY'),to_date('03.12.2020','DD.MM.YYYY'),
((to_date('03.12.2020','DD.MM.YYYY')-to_date('02.12.2020','DD.MM.YYYY'))*((select tarif from detalii_masini where id_masina=8)
+(select nvl(sum(dotari.tarif_dotare),0) from dotari,masini_dotari where dotari.id_dotare=masini_dotari.id_dotare and masini_dotari.id_masina=8))),13,8);

insert into contracte_inchirieri values(null,to_date('06.12.2020','DD.MM.YYYY'),to_date('24.12.2020','DD.MM.YYYY'),
((to_date('24.12.2020','DD.MM.YYYY')-to_date('06.12.2020','DD.MM.YYYY'))*((select tarif from detalii_masini where id_masina=10)
+(select nvl(sum(dotari.tarif_dotare),0) from dotari,masini_dotari where dotari.id_dotare=masini_dotari.id_dotare and masini_dotari.id_masina=10))),6,10);





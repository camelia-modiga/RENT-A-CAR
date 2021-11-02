--Verificare constrangere nr_inmatriculare unic
update masini set nr_inmatriculare='IS 01 RNT' where id_masina=3;

--Verificare constrangere nr_inmatriculare
update masini set nr_inmatriculare='I0S 01 RT' where id_masina=3;

--Verificare constrangere marca
update detalii_masini set marca='opel88' where id_masina=3;

--Verificare constrangere clasa
update detalii_masini set clasa='SU6V' where id_masina=3;

--Verificare constrangere culoare
update detalii_masini set culoare='8rosu7' where id_masina=3;

--Verificare constrangere tarif
update detalii_masini set tarif='8' where id_masina=3;

--Verificare constrangere transmisie
update detalii_masini set transmisie='manua' where id_masina=3;

--Verificare constrangere carburant
update detalii_masini set carburant='rosu' where id_masina=3;

--Validare constrangere an_fabricatie
update detalii_masini set an_fabricatie=2021 where id_masina=3;

--Validare constrangere denumire_dotare
update dotari set denumire_dotare='aaa123' where id_dotare=1;

--Validare constrangere tarif_dotare
update dotari set tarif_dotare='9' where id_dotare=1;

--Validare constrangere data_retur>data_inchiriere
update contracte_inchirieri set data_retur=to_date('09.10.2020','DD.MM.YYYY') where nr_contract=3;

--Validare constrangere data_retur<data_inchiriere+30
update contracte_inchirieri set data_retur=to_date('14.12.2020','DD.MM.YYYY') where nr_contract=3;

--Validare constrangere serie_act_identitate unica
update clienti set serie_act_identitate='MX 129056' where id_client=1;

--Verificare constrangeri format nume/prenume
update clienti set nume='Pope5scu' where id_client=3;
update clienti set prenume='Mari9ana' where id_client=3;

--Validare constrangere format email
update clienti set email='a123' where id_client=1;

--Validare constrangere format numar de telefon
update clienti set nr_telefon='a123' where id_client=1;

--Validare constrangere data_obt_permis
update clienti set data_obt_permis=to_date('13.09.1983','DD.MM.YYYY') where id_client=1;


--Validare constrangere varsta>=21 si data_obt_permis >= 1 an
insert into clienti values(null,'BV 183914','CI','Vasiliu','Teodora','teov@yahoo.com','0786903909',to_date('10.11.2020','DD.MM.YYYY'),to_date('13.12.1999','DD.MM.YYYY'));
insert into contracte_inchirieri values(null,to_date('20.11.2020'),to_date('21.11.2020'),
(select tarif from detalii_masini where id_masina=4),28,4);

insert into clienti values(null,'BV 183988','CI','Vasiliu','Mara','mara078@yahoo.com','0786976112',to_date('10.11.2020','DD.MM.YYYY'),to_date('13.12.1999','DD.MM.YYYY'));
insert into contracte_inchirieri values(null,to_date('27.12.2020'),to_date('28.12.2020'),
(select tarif from detalii_masini where id_masina=4),29,4);

--Verificam faptul ca nu putem sa inchiriem o masina care nu a fost returnata
insert into contracte_inchirieri values(null,to_date('28.10.2020'),to_date('29.10.2020'),
(select tarif from detalii_masini where id_masina=1),1,1);

--Vizualizarea tuturor masinilor pe care le are firma
select * from masini;

--Vizualizarea tuturor detaliilor masinilor pe care le are firma
select * from detalii_masini;

--Vizualizarea tuturor clientilor
select nume,prenume from clienti;

--Afisarea tuturor masinilor inchiriate si tariful acestora pe perioada inchirierii
select masini.nr_inmatriculare,masini.id_masina,tarif,data_inchiriere,data_retur from masini,contracte_inchirieri
where masini.id_masina=contracte_inchirieri.id_masina order by id_masina;

--Afisarea masinilor inchiriare care au tariful mai mare de 400 euro
select masini.nr_inmatriculare,masini.id_masina,tarif from masini,contracte_inchirieri
where masini.id_masina=contracte_inchirieri.id_masina
and contracte_inchirieri.tarif>=400;

--Afisarea tuturor clientilor a caror nume incep cu 'a'
select nume,prenume from clienti where nume like '%A%';

--Afisarea tuturor masinilor care nu sunt inchiriate
select nr_inmatriculare,id_masina from masini 
where id_masina not in (select id_masina from contracte_inchirieri) order by id_masina;

--Afisarea masinilor care au dotarea 'lanturi zapada'
select masini_dotari.id_masina,masini.nr_inmatriculare from masini_dotari,masini 
where masini.id_masina=masini_dotari.id_masina and 
id_dotare=(select id_dotare from dotari where denumire_dotare='lanturi zapada');

--Afisarea masinilor care au cel putin 2 dotari
select id_masina, nr_inmatriculare from masini 
where 2<=(select count(*) from masini_dotari where masini.id_masina=masini_dotari.id_masina);

--Afisarea sumei totale obtinuta din inchirieri
select sum(tarif) from contracte_inchirieri;

--Afisarea numarului de masini care au marca BMW
select count(*) from detalii_masini where marca='BMW';

--Afisarea clientilor care nu au email
select nume,prenume from clienti where email  is null;

--Afisarea masinilor care nu au dotari
select id_masina, nr_inmatriculare from masini 
where 0=(select count(*) from masini_dotari where masini.id_masina=masini_dotari.id_masina) order by id_masina;

--Afisarea clientilor care au inchiriat mai multe masini
select nume,prenume from clienti 
where 2<=(select count(*) from contracte_inchirieri where clienti.id_client=contracte_inchirieri.id_client);

--Afisarea clientilor care au mai putin de 30 de ani la momentul curent
select nume,prenume,data_nasterii from clienti where sysdate-data_nasterii<30*365;

--Afisarea masinilor inchiriate dupa data de 10.10.2020
select masini.nr_inmatriculare,data_inchiriere from masini,contracte_inchirieri 
where masini.id_masina = contracte_inchirieri.id_masina and data_inchiriere>to_date('10.10.2020','DD.MM.YYYY');

--Afisarea clientilor care trebuie sa plateasca mai mult de 100 euro
select nume,prenume,tarif from clienti,contracte_inchirieri 
where clienti.id_client=contracte_inchirieri.id_client
and contracte_inchirieri.tarif>100;

--Afisarea clientilor care au inchiriat o masina cu cel putin 2 dotari
select nume,prenume,nr_inmatriculare from clienti,contracte_inchirieri,masini 
where clienti.id_client=contracte_inchirieri.id_client and masini.id_masina=contracte_inchirieri.id_masina
and 2<=(select count(*) from masini_dotari where masini.id_masina=masini_dotari.id_masina);

--Afisarea masinilor care nu sunt returnate la data curenta
select nr_inmatriculare,data_retur from masini,contracte_inchirieri
where masini.id_masina=contracte_inchirieri.id_masina and data_retur>sysdate;

--Afisarea numarului de masini pe motorina
select count(*) from detalii_masini where carburant='motorina';

--Afisarea masinilor care au anul fabricatiei intre 2014 si 2017
select nr_inmatriculare,an_fabricatie from masini,detalii_masini 
where masini.id_masina=detalii_masini.id_masina and an_fabricatie BETWEEN 2014 and 2017;

--Afisarea numelui,prenumelui si numarului de telefon pentru clientii care au inchiriat o masina
select distinct nume,prenume,nr_telefon from clienti cross join 
contracte_inchirieri where clienti.id_client=contracte_inchirieri.id_client;

--Adaugarea unei noi masini in tabela Masini
insert into masini values(null,'IS 21 RNT');

--Adaugarea unei noi masini in tabela detalii_masini
insert into detalii_masini values('opel','compact',2014,'benzina','rosu','manuala',10,35,(select id_masina from masini where nr_inmatriculare='IS 21 RNT'));

--Adaugarea unei noi dotari masinii IS 03 RNT
insert into masini_dotari values((select id_masina from masini where nr_inmatriculare='IS 03 RNT'),(select id_dotare from dotari where denumire_dotare='porturi USB'));

--Adaugarea unui nou client in tabela Clienti
insert into clienti values(null,'BV 183616','CI','Hutanu','Teodora','teom@yahoo.com','0783903119',to_date('10.03.2017','DD.MM.YYYY'),to_date('13.09.1997','DD.MM.YYYY'));

--Modificarea data_retur pentru masina cu numarul de inmatriculare IS 03 RNT
update contracte_inchirieri set data_retur=to_date('15.10.2020','DD.MM.YYYY') where id_masina=( select id_masina from masini where nr_inmatriculare='IS 03 RNT');

--Actualizarea numarului de telefon pentru clienta cu numele Pavel Maria
update clienti set nr_telefon='0765902138' where nume='Pavel' and prenume='Maria';

--Modificarea tarifului pentru dotarea scaun copil
update dotari set tarif_dotare=5 where denumire_dotare='scaun copil';

--Stergerea dotarii cu id-ul 3 de pe masina cu id-ul 5
delete from masini_dotari where id_dotare=3 and id_masina=5;
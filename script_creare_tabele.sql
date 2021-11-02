-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2020-12-17 21:55:31 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE clienti (
    id_client             NUMBER(4) NOT NULL,
    serie_act_identitate  VARCHAR2(20) NOT NULL,
    tip_act               VARCHAR2(15) NOT NULL,
    nume                  VARCHAR2(20) NOT NULL,
    prenume               VARCHAR2(20) NOT NULL,
    email                 VARCHAR2(40),
    nr_telefon            CHAR(10) NOT NULL,
    data_obt_permis       DATE NOT NULL,
    data_nasterii         DATE NOT NULL
)
LOGGING;

ALTER TABLE clienti
    ADD CONSTRAINT clienti_serie_act_ck CHECK ( REGEXP_LIKE ( serie_act_identitate,
                                                              '^[A-Z0-9 ]*$' ) );

ALTER TABLE clienti
    ADD CONSTRAINT clienti_ti_act_ck CHECK ( tip_act IN ( 'Altele', 'CI', 'Pasaport' ) );

ALTER TABLE clienti
    ADD CONSTRAINT clienti_nume_ck CHECK ( length(nume) >= 2
                                           AND REGEXP_LIKE ( nume,
                                                             '^[a-zA-Z ]*$' ) );

ALTER TABLE clienti
    ADD CONSTRAINT clienti_prenume_ck CHECK ( length(prenume) >= 2
                                              AND REGEXP_LIKE ( prenume,
                                                                '^[a-zA-Z ]*$' ) );

ALTER TABLE clienti
    ADD CONSTRAINT clienti_email_ck CHECK ( REGEXP_LIKE ( email,
                                                          '[a-z0-9._%-]+@[a-z0-9._%-]+\.[a-z]{2,4}' ) );

ALTER TABLE clienti
    ADD CONSTRAINT clienti_nr_telefon_ck CHECK ( length(nr_telefon) = 10
                                                 AND REGEXP_LIKE ( nr_telefon,
                                                                   '^[0][:7:3:2][0-9 ]*$' ) );

ALTER TABLE clienti
    ADD CONSTRAINT data_permis_ck CHECK ( data_obt_permis >= add_months(data_nasterii, 12 * 18) );

ALTER TABLE clienti ADD CONSTRAINT clienti_pk PRIMARY KEY ( id_client );

ALTER TABLE clienti ADD CONSTRAINT clienti_nr_telefon_uk UNIQUE ( nr_telefon );

ALTER TABLE clienti ADD CONSTRAINT clienti_serie_act_uk UNIQUE ( serie_act_identitate );

ALTER TABLE clienti ADD CONSTRAINT clienti_email_uk UNIQUE ( email );

CREATE TABLE contracte_inchirieri (
    nr_contract      NUMBER(4) NOT NULL,
    data_inchiriere  DATE NOT NULL,
    data_retur       DATE NOT NULL,
    tarif            NUMBER(4) NOT NULL,
    id_client        NUMBER(4) NOT NULL,
    id_masina        NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE contracte_inchirieri
    ADD CONSTRAINT contracte_data_inchiriere_ck CHECK ( to_char(data_inchiriere, 'YYYY-MM-DD') >= '2020-10-01' );

ALTER TABLE contracte_inchirieri
    ADD CONSTRAINT contracte_data_retur_ck CHECK ( data_retur > data_inchiriere
                                                   AND data_retur < add_months(data_inchiriere, 1) );

ALTER TABLE contracte_inchirieri ADD CONSTRAINT contracte_inchirieri_pk PRIMARY KEY ( nr_contract,
                                                                                      id_masina );
                                                                                      
ALTER TABLE contracte_inchirieri ADD CONSTRAINT contracte_inchirieri_tarif_ck CHECK ( tarif > 10 );

CREATE TABLE detalii_masini (
    marca          VARCHAR2(20) NOT NULL,
    clasa          VARCHAR2(20) NOT NULL,
    an_fabricatie  NUMBER(4) NOT NULL,
    carburant      VARCHAR2(10) NOT NULL,
    culoare        VARCHAR2(10) NOT NULL,
    transmisie     VARCHAR2(15) NOT NULL,
    consum         NUMBER(3, 1) NOT NULL,
    tarif          NUMBER(3) NOT NULL,
    id_masina      NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE detalii_masini
    ADD CONSTRAINT detalii_masini_marca_ck CHECK ( length(marca) >= 2
                                                   AND REGEXP_LIKE ( marca,
                                                                     '^[a-zA-Z ]*$' ) );

ALTER TABLE detalii_masini
    ADD CONSTRAINT detalii_masini_clasa_ck CHECK ( length(clasa) >= 2
                                                   AND REGEXP_LIKE ( clasa,
                                                                     '^[a-zA-Z ]*$' ) );

ALTER TABLE detalii_masini
    ADD CONSTRAINT detalii_an_fabricatie_ck CHECK ( an_fabricatie BETWEEN 2010 AND 2020 );

ALTER TABLE detalii_masini
    ADD CONSTRAINT detalii_masini_carburant_ck CHECK ( carburant IN ( 'benzina', 'motorina' ) );

ALTER TABLE detalii_masini
    ADD CONSTRAINT detalii_masini_culoare_ck CHECK ( length(culoare) >= 2
                                                     AND REGEXP_LIKE ( culoare,
                                                                       '^[a-zA-Z ]*$' ) );

ALTER TABLE detalii_masini
    ADD CONSTRAINT detalii_masini_transmisie_ck CHECK ( transmisie IN ( 'automata', 'manuala' ) );

ALTER TABLE detalii_masini
    ADD CONSTRAINT detalii_masini_consum_ck CHECK ( consum BETWEEN 3 AND 15 );

ALTER TABLE detalii_masini ADD CONSTRAINT detalii_masini_tarif_ck CHECK ( tarif > 10 );

ALTER TABLE detalii_masini ADD CONSTRAINT detalii_masini_pk PRIMARY KEY ( id_masina );

CREATE TABLE dotari (
    id_dotare        NUMBER(2) NOT NULL,
    denumire_dotare  VARCHAR2(20) NOT NULL,
    tarif_dotare     NUMBER(1) NOT NULL
)
LOGGING;

ALTER TABLE dotari
    ADD CONSTRAINT dotari_denumire_dotare_ck CHECK ( length(denumire_dotare) >= 2
                                                     AND REGEXP_LIKE ( denumire_dotare,
                                                                       '^[a-zA-Z ]*$' ) );

ALTER TABLE dotari
    ADD CONSTRAINT dotari_tarif_dotare_ck CHECK ( tarif_dotare BETWEEN 3 AND 5 );

ALTER TABLE dotari ADD CONSTRAINT dotari_pk PRIMARY KEY ( id_dotare );

CREATE TABLE masini (
    id_masina         NUMBER(4) NOT NULL,
    nr_inmatriculare  VARCHAR2(9) NOT NULL
)
LOGGING;

ALTER TABLE masini
    ADD CONSTRAINT masini_nr_inmatriculare_ck CHECK ( length(nr_inmatriculare) = 9
                                                      AND REGEXP_LIKE ( nr_inmatriculare,
                                                                        '[A-Z_ ]{1,2}+[0-9_ ]{2,3}+[A-Z]{3}*$' ) );

ALTER TABLE masini ADD CONSTRAINT masini_pk PRIMARY KEY ( id_masina );

ALTER TABLE masini ADD CONSTRAINT masini_nr_inmatriculare_uk UNIQUE ( nr_inmatriculare );

CREATE TABLE masini_dotari (
    id_masina  NUMBER(4) NOT NULL,
    id_dotare  NUMBER(2) NOT NULL
)
LOGGING;

ALTER TABLE masini_dotari ADD CONSTRAINT masini_dotari_pk PRIMARY KEY ( id_masina,
                                                                        id_dotare );

ALTER TABLE contracte_inchirieri
    ADD CONSTRAINT clienti_contracte_fk FOREIGN KEY ( id_client )
        REFERENCES clienti ( id_client )
    NOT DEFERRABLE;

ALTER TABLE contracte_inchirieri
    ADD CONSTRAINT masini_contracte_inchirieri_fk FOREIGN KEY ( id_masina )
        REFERENCES masini ( id_masina )
    NOT DEFERRABLE;

ALTER TABLE detalii_masini
    ADD CONSTRAINT masini_detalii_masini FOREIGN KEY ( id_masina )
        REFERENCES masini ( id_masina )
    NOT DEFERRABLE;

ALTER TABLE masini_dotari
    ADD CONSTRAINT masini_dotari_dotari_fk FOREIGN KEY ( id_dotare )
        REFERENCES dotari ( id_dotare )
    NOT DEFERRABLE;

ALTER TABLE masini_dotari
    ADD CONSTRAINT masini_dotari_masini_fk FOREIGN KEY ( id_masina )
        REFERENCES masini ( id_masina )
    NOT DEFERRABLE;

CREATE OR REPLACE TRIGGER contracte_data_inchiriere_trg 
    BEFORE INSERT ON Contracte_inchirieri 
    FOR EACH ROW 
DECLARE
    ultima_data_retur DATE;
    v_nr_de_inchirieri NUMBER(4);
BEGIN  
    SELECT COUNT(*) INTO v_nr_de_inchirieri FROM Contracte_inchirieri WHERE id_masina = :new.id_masina;
    IF v_nr_de_inchirieri > 0 
    THEN
        SELECT MAX(data_retur) INTO ultima_data_retur FROM Contracte_inchirieri WHERE id_masina = :new.id_masina;
        IF (:new.data_inchiriere < ultima_data_retur)
        THEN
            RAISE_APPLICATION_ERROR( -20001,
                    'Data invalida: ' || TO_CHAR( :new.data_inchiriere, 'DD.MM.YYYY' ) || ' trebuie sa fie mai mare decat data_retur anterioara.' );
        END IF;
    END IF;
END; 
/

CREATE OR REPLACE TRIGGER contracte_data_nastere_trg 
    BEFORE INSERT OR UPDATE ON Contracte_inchirieri 
    FOR EACH ROW 
DECLARE
	aux_date DATE;
BEGIN
	SELECT Clienti.data_nasterii
	INTO aux_date
	FROM Clienti
	WHERE Clienti.id_client=:new.id_client;
	IF( :new.data_inchiriere - aux_date < 21*365)
	THEN
		RAISE_APPLICATION_ERROR(-20001,
			'Data invalida: ' || TO_CHAR(aux_date,'DD.MM.YYYY') ||('Clientul nu are 21 de ani!!'));
	END IF;
	IF( :new.data_inchiriere - aux_date > 70*365)
	THEN
		RAISE_APPLICATION_ERROR(-20001,
			'Data invalida: ' || TO_CHAR(aux_date,'DD.MM.YYYY') ||('Clientul are 70 de ani!!'));
	END IF;
END; 
/

CREATE OR REPLACE TRIGGER contracte_data_permis_trg 
    BEFORE INSERT OR UPDATE ON Contracte_inchirieri 
    FOR EACH ROW 
DECLARE
	aux_date DATE;
BEGIN
	SELECT Clienti.data_obt_permis
	INTO aux_date
	FROM Clienti
	WHERE Clienti.id_client=:new.id_client;
	IF( :new.data_inchiriere - aux_date < 365)
	THEN
		RAISE_APPLICATION_ERROR(-20001,
			'Data invalida: ' || TO_CHAR(aux_date,'DD.MM.YYYY') ||('Clientul nu are permisul de conducere de cel putin un an!!'));
	END IF;
END; 
/

CREATE OR REPLACE TRIGGER clienti_data_permis_trg 
    BEFORE INSERT OR UPDATE ON Clienti 
    FOR EACH ROW 
BEGIN
	IF( :new.data_obt_permis >= SYSDATE )
    THEN
        RAISE_APPLICATION_ERROR( -20001,
        'Data invalida: ' || TO_CHAR( :new.data_obt_permis, 'DD.MM.YYYY ' ) || ' trebuie sa fie mai mica decat data curenta.' );
END IF;
END;
/


CREATE OR REPLACE TRIGGER clienti_data_nasterii_trg 
    BEFORE INSERT OR UPDATE ON Clienti 
    FOR EACH ROW 
BEGIN
	IF( :new.data_nasterii >= SYSDATE )
    THEN
        RAISE_APPLICATION_ERROR( -20001,
        'Data invalida: ' || TO_CHAR( :new.data_nasterii, 'DD.MM.YYYY ' ) || ' trebuie sa fie mai mica decat data curenta.' );
END IF;
END;
/

CREATE SEQUENCE clienti_id_client_seq START WITH 1 MAXVALUE 9999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER clienti_id_client_trg BEFORE
    INSERT ON clienti
    FOR EACH ROW
    WHEN ( new.id_client IS NULL )
BEGIN
    :new.id_client := clienti_id_client_seq.nextval;
END;
/

CREATE SEQUENCE contracte_nr_contract_seq START WITH 1 MAXVALUE 9999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER contracte_nr_contract_trg BEFORE
    INSERT ON contracte_inchirieri
    FOR EACH ROW
    WHEN ( new.nr_contract IS NULL )
BEGIN
    :new.nr_contract := contracte_nr_contract_seq.nextval;
END;
/

CREATE SEQUENCE dotari_id_dotare_seq START WITH 1 MAXVALUE 99 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER dotari_id_dotare_trg BEFORE
    INSERT ON dotari
    FOR EACH ROW
    WHEN ( new.id_dotare IS NULL )
BEGIN
    :new.id_dotare := dotari_id_dotare_seq.nextval;
END;
/

CREATE SEQUENCE masini_id_masina_seq START WITH 1 MAXVALUE 9999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER masini_id_masina_trg BEFORE
    INSERT ON masini
    FOR EACH ROW
    WHEN ( new.id_masina IS NULL )
BEGIN
    :new.id_masina := masini_id_masina_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             35
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           7
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          4
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
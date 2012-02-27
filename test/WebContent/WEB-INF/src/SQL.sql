-- Creazione dello schema della base di dati di Car+
-- 
-- Creazione: 2011-12-16
-- Ultima modifica 2012-01-12
-- Autore: EcoGuys (ecoguys@gmail.com)
-- Versione 2.11
--
-- Copyright (c) 2012, Università degli Studi di Padova, Italia


--########################################################
--###                   CUSTOM DOMAINS                 ###
--########################################################

CREATE DOMAIN IDENTIFICATORE AS INTEGER NOT NULL;

CREATE DOMAIN CODICEFISCALE AS CHAR(16);

CREATE DOMAIN VALUTA AS DECIMAL (7, 2) DEFAULT 0 CHECK ( VALUE >= 0 );

CREATE DOMAIN TARGA AS VARCHAR(15);

CREATE TYPE ALIMENTAZIONE AS ENUM ('Benzina', 'Disel', 'GPL', 'Metano', 'Elettrica');

--########################################################
--###                       TABLES                     ###
--########################################################

--
-- Questa tabella rappresenta una localita
--
-- Versione 2.11
CREATE TABLE localita (
    id SERIAL,
    citta VARCHAR(50) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    regione VARCHAR(30) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(provincia, citta)
);

COMMENT ON TABLE localita IS 'Rappresenta una localita.';
COMMENT ON COLUMN localita.id IS 'Identificatore della localita';
COMMENT ON COLUMN localita.citta IS 'Nome della citta';
COMMENT ON COLUMN localita.provincia IS 'Nome della provincia';
COMMENT ON COLUMN localita.regione IS 'Nome della regione';

--
-- Questa tabella rappresenta un utente
--
-- Versione 2.11
CREATE TABLE utente(
    codice_utente SERIAL,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    sesso CHAR(1) NOT NULL,
    indirizzo VARCHAR(50) NOT NULL,
    id_localita IDENTIFICATORE,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(320) NOT NULL UNIQUE,
    password CHAR(32) NOT NULL,
    account_sospeso BOOLEAN DEFAULT FALSE,
    account_verificato BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (codeice_utente),
    FOREIGN KEY(id_localita) REFERENCES localita(id)
);

COMMENT ON TABLE utente IS 'Rappresenta un utente.';
COMMENT ON COLUMN utente.codice_utente IS 'Codice utente';
COMMENT ON COLUMN utente.nome IS 'Nome dell\'utente';
COMMENT ON COLUMN utente.cognome IS 'Cognome dell\'utente';
COMMENT ON COLUMN utente.sesso IS 'Sesso dell\'utente';
COMMENT ON COLUMN utente.indirizzo IS 'Indirizzo residenza dell\'utente';
COMMENT ON COLUMN utente.id_localita IS 'Identificatore della localita di residenza ddell\'utente';
COMMENT ON COLUMN utente.telefono IS 'Numero di telefono dell\'utente';
COMMENT ON COLUMN utente.email IS 'Email dell\'utente';
COMMENT ON COLUMN utente.password IS 'Password dell\'account utente';
COMMENT ON COLUMN utente.account_sospeso IS 'Account sospeso per inosservanze alle regole';
COMMENT ON COLUMN utente.account_verificato IS 'Verifica della mail fornita in fase di registrazione';

--
-- Questa tabella rappresenta Messaggio privato
--
-- Versione 2.11
CREATE TABLE messaggio_privato (
    id SERIAL,
    cu_mittente IDENTIFICATORE,
    cu_destinatario IDENTIFICATORE,
    data DATE NOT NULL,
    titolo VARCHAR(50) NOT NULL,
    testo TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cu_mittente) REFERENCES utente(codice_utente),
    FOREIGN KEY (cu_destinatario) REFERENCES utente(codice_utente)
);

COMMENT ON TABLE messaggio_privato IS 'Messaggio privato.';
COMMENT ON COLUMN messaggio_privato.id IS 'Identificatore del messsaggio';
COMMENT ON COLUMN messaggio_privato.cu_mittente IS 'Identificatore del mittente del messaggio';
COMMENT ON COLUMN messaggio_privato.cu_destinatario IS 'Identificatore del destinatario del messaggio';
COMMENT ON COLUMN messaggio_privato.data IS 'Data di invio del messaggio';
COMMENT ON COLUMN messaggio_privato.titolo IS 'Titolo del messaggio';
COMMENT ON COLUMN messaggio_privato.testo IS 'Corpo del messaggio';

--
-- Questa tabella rappresenta un cliente
--
-- Versione 2.11
CREATE TABLE cliente (
    cu_utente IDENTIFICATORE,
    cf CODICEFISCALE NOT NULL UNIQUE,
    PRIMARY KEY (cu_utente),
    FOREIGN KEY (cu_utente) REFERENCES utente(codice_utente)
);

COMMENT ON TABLE cliente IS 'Rappresenta un cliente.';
COMMENT ON COLUMN cliente.cu_utente IS 'Identificatore utente associato';
COMMENT ON COLUMN cliente.cf IS 'Codice fiscale del cliente';

--
-- Questa tabella rappresenta un Cliente Business
--
-- Versione 2.11
CREATE TABLE cliente_business (
    cu_utente IDENTIFICATORE,
    partita_iva CHAR(11) NOT NULL UNIQUE,
    nome_attivita VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (cu_utente),
    FOREIGN KEY (cu_utente) REFERENCES utente(codice_utente)
);

COMMENT ON TABLE cliente_business IS 'Rappresenta un cliente business.';
COMMENT ON COLUMN cliente_business.cu_utente IS 'Identificatore utente associato';
COMMENT ON COLUMN cliente_business.partita_iva IS 'Partita iva del cliente business';
COMMENT ON COLUMN cliente_business.nome_attivita IS 'Nome dell\'attivita del cliente business';

--
-- Questa tabella rappresenta un abbonamento del carsharing
--
-- Versione 2.11
CREATE TABLE abbonamento(
    nome VARCHAR(30),
    descrizione TEXT,
    tariffa_magg_100km VALUTA,
    tariffa_min_100km VALUTA,
    tariffa_notturna VALUTA,
    tariffa_diurna VALUTA,
    costo_mensile VALUTA,
    num_max_tessere SMALLINT CHECK (num_max_tessere > 0),
    num_min_tessere SMALLINT CHECK (num_min_tessere > 0),
    CHECK (num_max_tessere>num_min_tessere),
    PRIMARY KEY (nome)
);

COMMENT ON TABLE abbonamento IS 'Rappresenta un abbonamento del carsharing.';
COMMENT ON COLUMN abbonamento.nome IS 'Nome dell\'abbonamento';
COMMENT ON COLUMN abbonamento.descrizione IS 'Descrizione dell\'abbonamento';
COMMENT ON COLUMN abbonamento.tariffa_magg_100km IS 'Tariffa in €/km applicata per distanze maggiori di 100km';
COMMENT ON COLUMN abbonamento.tariffa_min_100km IS 'Tariffa in €/km applicata per distanze minori di 100km';
COMMENT ON COLUMN abbonamento.tariffa_notturna IS 'Tariffa in €/h applicata per percorsi notturni';
COMMENT ON COLUMN abbonamento.tariffa_diurna IS 'Tariffa in €/h applicata per percorsi diurni';
COMMENT ON COLUMN abbonamento.costo_mensile IS 'Costo mensile dell\'abbonamento';
COMMENT ON COLUMN abbonamento.num_max_tessere IS 'Numero di tessere massimo fruibili dall\'abbonamento';
COMMENT ON COLUMN abbonamento.num_min_tessere IS 'Numero di tessere minimo fruibili dall\'abbonamento';

--
-- Questa tabella rappresenta un contratto del carsharing
--
-- Versione 2.11
CREATE TABLE contratto (
    id SERIAL,
    data_stipula DATE,
    data_scadenza DATE,
    cu_cliente IDENTIFICATORE,
    nome_abbonamento VARCHAR(30) NOT NULL,
    CHECK (data_stipula < data_scadenza),
    PRIMARY KEY (id),
    FOREIGN KEY (cu_cliente) REFERENCES cliente(codice_utente),
    FOREIGN KEY (nome_abbonamento) REFERENCES abbonamento(nome)
);

COMMENT ON TABLE contratto IS 'Rappresenta un contratto del carsharing.';
COMMENT ON COLUMN contratto.id IS 'Identificatore del contratto';
COMMENT ON COLUMN contratto.data_stipula IS 'Data di stipula del contratto';
COMMENT ON COLUMN contratto.data_scadenza IS 'Data di scadenza del contratto';
COMMENT ON COLUMN contratto.cu_cliente IS 'Identificatore cliente associato';
COMMENT ON COLUMN contratto.nome_abbonamento IS 'Nome abbonamento associato al contratto';

--
-- Questa tabella rappresenta una tessera del carsharing
--
-- Versione 2.11
CREATE TABLE tessera (
    id SERIAL,
    id_contratto IDENTIFICATORE,
    PRIMARY KEY (id),
    FOREIGN KEY (id_contratto) REFERENCES contratto(id)
);

COMMENT ON TABLE tessera IS 'Rappresenta una tessera del carsharing.';
COMMENT ON COLUMN tessera.id IS 'Identificatore della tessera';
COMMENT ON COLUMN tessera.id_contratto IS 'Identificatore del contratto associato alla tessera';

--
-- Questa tabella rappresenta il modello di un autovettura
--
-- Versione 2.11
CREATE TABLE modello_macchina (
    id SERIAL,
    marca VARCHAR(30) NOT NULL,
    modello VARCHAR(50) NOT NULL,
    cilindrata SMALLINT CHECK (cilindrata > 0),
    anno SMALLINT CHECK (anno > 0),
    alimentazione ALIMENTAZIONE NOT NULL,
    emissioni_co2 SMALLINT DEFAULT 120, --g/km Ho inserito DEFAULT!!!!va bene?
    num_posti SMALLINT NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE modello_macchina IS 'Rappresenta il modello di un autoveicolo.';
COMMENT ON COLUMN modello_macchina.id IS 'Identificatore dell\'autoveicolo';
COMMENT ON COLUMN modello_macchina.marca IS 'Brand dell\'autoveicolo';
COMMENT ON COLUMN modello_macchina.cilindrata IS 'Cilindrata dell\'autoveicolo';
COMMENT ON COLUMN modello_macchina.anno IS 'Anno di produzione dell\'autoveicolo';
COMMENT ON COLUMN modello_macchina.alimentazione IS 'Tipo di carburante utilizzato dall\'autoveicolo';
COMMENT ON COLUMN modello_macchina.emissioni_co2 IS 'Emissioni medie prodotte dall\'autoveicolo al km';
COMMENT ON COLUMN modello_macchina.num_posti IS 'Numero posti a sedere dell\'autoveicolo';

--
-- Questa tabella rappresenta le autovetture fruibili con una dato abbonamento
--
-- Versione 2.11
CREATE TABLE disponibilita (
    modello_macchina IDENTIFICATORE,
    nome_abbonamento VARCHAR(30),
    PRIMARY KEY (modello_macchina, nome_abbonamento),
    FOREIGN KEY (modello_macchina) REFERENCES modello_macchina(id),
    FOREIGN KEY (nome_abbonamento) REFERENCES abbonamento(nome)
);

COMMENT ON TABLE disponibilita IS 'Rappresenta le autovetture fruibili con una dato abbonamento.';
COMMENT ON COLUMN disponibilita.modello_macchina IS '';
COMMENT ON COLUMN disponibilita.nome_abbonamento IS '';

--
-- Questa tabella rappresenta un' autovettura del carpooling
--
-- Versione 2.11
CREATE TABLE macchina_CP (
    targa TARGA,
    modello_macchina IDENTIFICATORE,
    PRIMARY KEY (targa),
    FOREIGN KEY (modello_macchina) REFERENCES modello_macchina(id)
);

COMMENT ON TABLE macchina_CP IS 'Rappresenta autovettura del carpooling.';
COMMENT ON COLUMN macchina_CP.targa IS '';
COMMENT ON COLUMN macchina_CP.modello_macchina IS '';

--
-- Questa tabella rappresenta un tragitto del car pooling
--
-- Versione 2.11
CREATE TABLE tragitto_CP(
    id SERIAL,
    fumatori BOOLEAN NOT NULL,
    num_posti SMALLINT NOT NULL CHECK (num_posti > 0),
    note TEXT,
    id_localita_partenza IDENTIFICATORE,
    id_localita_arrivo IDENTIFICATORE,
    cu_utente IDENTIFICATORE,
    targa_CP TARGA NOT NULL,
    tempo_arrivo TIMESTAMP NOT NULL,
    tempo_partenza TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_localita_partenza) REFERENCES localita(id),
    FOREIGN KEY (id_localita_arrivo) REFERENCES localita(id),
    FOREIGN KEY (cu_utente) REFERENCES utente(codice_utente),
    FOREIGN KEY (targa_CP) REFERENCES macchina_CP(targa)
);

COMMENT ON TABLE tragitto_CP IS 'Rappresenta un tragitto del car pooling.';
COMMENT ON COLUMN tragitto_CP.id IS '';
COMMENT ON COLUMN tragitto_CP.fumatori IS '';
COMMENT ON COLUMN tragitto_CP.num_posti IS '';
COMMENT ON COLUMN tragitto_CP.note IS '';
COMMENT ON COLUMN tragitto_CP.id_localita_partenza IS '';
COMMENT ON COLUMN tragitto_CP.id_localita_arrivo IS '';
COMMENT ON COLUMN tragitto_CP.cu_utente IS '';
COMMENT ON COLUMN tragitto_CP.targa_CP IS '';
COMMENT ON COLUMN tragitto_CP.tempo_arrivo IS '';
COMMENT ON COLUMN tragitto_CP.tempo_partenza IS '';

--
-- Questa tabella rappresenta Feedback
--
-- Versione 2.11
CREATE TABLE feedback_tragitto (
    tragitto_id IDENTIFICATORE,
    cu_valutante IDENTIFICATORE,
    cu_valutato IDENTIFICATORE,
    data DATE NOT NULL,
    titolo VARCHAR(30) NOT NULL,
    commento TEXT NOT NULL,
    valutazione SMALLINT CHECK (valutazione BETWEEN 1 AND 5),
    PRIMARY KEY (tragitto_id),
    FOREIGN KEY (cu_valutante) REFERENCES utente(codice_utente),
    FOREIGN KEY (cu_valutato) REFERENCES utente(codice_utente)
);

COMMENT ON TABLE feedback_tragitto IS 'Feedback.';
COMMENT ON COLUMN feedback_tragitto.tragitto_id IS '';
COMMENT ON COLUMN feedback_tragitto.cu_valutante IS '';
COMMENT ON COLUMN feedback_tragitto.cu_valutato IS '';
COMMENT ON COLUMN feedback_tragitto.data IS '';
COMMENT ON COLUMN feedback_tragitto.titolo IS '';
COMMENT ON COLUMN feedback_tragitto.commento IS '';
COMMENT ON COLUMN feedback_tragitto.valutazione IS '';

--
-- Questa tabella rappresenta la partecipazione di un utente ad un tragitto car pooling
--
-- Versione 2.11
CREATE TABLE partecipazione (
    id_tragitto_CP IDENTIFICATORE,
    cu_utente IDENTIFICATORE,
    num_posti SMALLINT CHECK (num_posti >0),
    PRIMARY KEY (id_tragitto_CP,cu_utente),
    FOREIGN KEY (id_tragitto_CP) REFERENCES tragitto_CP(id),
    FOREIGN KEY (cu_utente) REFERENCES utente(codice_utente)
);

COMMENT ON TABLE partecipazione IS 'Rappresenta la partecipazione di un utente ad un tragitto car pooling.';
COMMENT ON COLUMN partecipazione.id_tragitto_CP IS '';
COMMENT ON COLUMN partecipazione.cu_utente IS '';
COMMENT ON COLUMN partecipazione.num_posti IS '';

--
-- Questa tabella rappresenta una stazione (parcheggio) del car sharing
--
-- Versione 2.11
CREATE TABLE stazione_CS(
    id_localita IDENTIFICATORE,
    nome VARCHAR(30) NOT NULL,
    indirizzo VARCHAR(50) NOT NULL,
    num_posti SMALLINT CHECK (num_posti > 0),
    PRIMARY KEY(id_localita, nome),
    FOREIGN KEY(id_localita) REFERENCES localita(id)
);

COMMENT ON TABLE stazione_CS IS 'Rappresenta una stazione (parcheggio) del car sharing.';
COMMENT ON COLUMN stazione_CS.id_localita IS '';
COMMENT ON COLUMN stazione_CS.nome IS '';
COMMENT ON COLUMN stazione_CS.indirizzo IS '';
COMMENT ON COLUMN stazione_CS.num_posti IS '';

--
-- Questa tabella rappresenta autovettura del car sharing
--
-- Versione 2.11
CREATE TABLE macchina_CS (
    targa TARGA,
    id_modello IDENTIFICATORE,
    id_localita IDENTIFICATORE,
    nome_stazione_CS VARCHAR(30) NOT NULL,
    anno_acquisto SMALLINT NOT NULL CHECK (anno_acquisto > 0),
    scad_bollo DATE,
    scad_assicurazione DATE,
    scad_revisione DATE,
    km_totali INTEGER NOT NULL CHECK (km_totali > 0),
    prenotabile BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (targa),
    FOREIGN KEY(id_modello) REFERENCES modello_macchina(id),
    FOREIGN KEY(id_localita, nome_stazione_cs) REFERENCES stazione_CS(id_localita, nome)
);

COMMENT ON TABLE macchina_CS IS 'Rappresenta autovettura del car sharing.';
COMMENT ON COLUMN macchina_CS.targa IS '';
COMMENT ON COLUMN macchina_CS.id_modello IS '';
COMMENT ON COLUMN macchina_CS.id_localita IS '';
COMMENT ON COLUMN macchina_CS.nome_stazione_CS IS '';
COMMENT ON COLUMN macchina_CS.anno_acquisto IS '';
COMMENT ON COLUMN macchina_CS.scad_bollo IS '';
COMMENT ON COLUMN macchina_CS.scad_assicurazione IS '';
COMMENT ON COLUMN macchina_CS.scad_revisione IS '';
COMMENT ON COLUMN macchina_CS.km_totali IS '';
COMMENT ON COLUMN macchina_CS.prenotabile IS '';

--
-- Questa tabella rappresenta un tragitto del car sharing
--
-- Versione 2.11
CREATE TABLE tragitto_CS (
    id SERIAL,
    id_tessera IDENTIFICATORE,
    targa_CS TARGA NOT NULL,
    tempo_prelievo TIMESTAMP,
    tempo_consegna TIMESTAMP,
    km_totali SMALLINT CHECK(km_totali > 0),
    pagato BOOLEAN NOT NULL DEFAULT FALSE,
    CHECK (tempo_prelievo < tempo_consegna),
    PRIMARY KEY(id),
    FOREIGN KEY(id_tessera) REFERENCES tessera(id),
    FOREIGN KEY(targa_CS) REFERENCES macchina_CS(targa)
);

COMMENT ON TABLE tragitto_CS IS 'Rappresenta un tragitto del car sharing.';
COMMENT ON COLUMN tragitto_CS.id IS '';
COMMENT ON COLUMN tragitto_CS.id_tessera IS '';
COMMENT ON COLUMN tragitto_CS.targa_CS IS '';
COMMENT ON COLUMN tragitto_CS.tempo_prelievo IS '';
COMMENT ON COLUMN tragitto_CS.tempo_consegna IS '';
COMMENT ON COLUMN tragitto_CS.km_totali IS '';
COMMENT ON COLUMN tragitto_CS.pagato IS '';

--
-- Questa tabella rappresenta una vettura dismessa del car sharing
--
-- Versione 2.11
CREATE TABLE macchina_dismessa (
    targa_CS TARGA,
    causa TEXT,
    data DATE NOT NULL,
    PRIMARY KEY(targa_CS),
    FOREIGN KEY(targa_CS) REFERENCES macchina_CS(targa)
);

COMMENT ON TABLE macchina_dismessa IS 'Rappresenta una vettura dismessa del car sharing.';
COMMENT ON COLUMN macchina_dismessa.targa_CS IS '';
COMMENT ON COLUMN macchina_dismessa.causa IS '';
COMMENT ON COLUMN macchina_dismessa.data IS '';

--
-- Questa tabella rappresenta un guasto di una vettura del car sharing
--
-- Versione 2.11
CREATE TABLE guasto (
    id SERIAL,
    id_tragitto_CS IDENTIFICATORE,
    danno VARCHAR(140) NOT NULL,
    causa TEXT,
    data_invio_riparazione DATE,
    data_segnalazione TIMESTAMP NOT NULL,
    grave BOOLEAN,
    CHECK (data_invio_riparazione > (CAST(data_segnalazione AS DATE))),
    PRIMARY KEY (id),
    FOREIGN KEY (id_tragitto_CS) REFERENCES tragitto_CS(id)
);

COMMENT ON TABLE guasto IS 'Rappresenta un guasto di una vettura del car sharing.';
COMMENT ON COLUMN guasto.id IS '';
COMMENT ON COLUMN guasto.id_tragitto_CS IS '';
COMMENT ON COLUMN guasto.danno IS '';
COMMENT ON COLUMN guasto.causa IS '';
COMMENT ON COLUMN guasto.data_invio_riparazione IS '';
COMMENT ON COLUMN guasto.data_segnalazione IS '';
COMMENT ON COLUMN guasto.grave IS '';

--
-- Questa tabella rappresenta la riparazione di una vettura del car sharing
--
-- Versione 2.11
CREATE TABLE riparato (
    id_guasto IDENTIFICATORE,
    officina_riparazione VARCHAR(50) NOT NULL,
    data_riparazione DATE,
    costo_riparazione VALUTA,
    PRIMARY KEY (id_guasto),
    FOREIGN KEY (id_guasto) REFERENCES guasto(id)
);

COMMENT ON TABLE riparato IS 'Rappresenta la riparazione di una vettura del car sharing.';
COMMENT ON COLUMN riparato.id_guasto IS '';
COMMENT ON COLUMN riparato.officina_riparazione IS '';
COMMENT ON COLUMN riparato.data_riparazione IS '';
COMMENT ON COLUMN riparato.costo_riaprazione IS '';

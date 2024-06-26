LV3


CREATE TABLE osobe_Tina (
ime varchar(30),
prezime varchar(30),
jmbg char(13) primary key,
datum_rod datetime,
spol char(1) default('Ž'),
visina dec(5,2),
slika image,
broj_cipela smallint,
CONSTRAINT spol_Tina CHECK(spol IN('M','Ž'))
);

SET DATEFORMAT dmy

INSERT INTO osobe_Tina (ime, prezime, jmbg, datum_rod, spol, visina, slika, broj_cipela)
VALUES ('Ana','Aniæ','1234567891254','06/01/1987','Ž',163,'',39)
INSERT INTO osobe_Tina (ime, prezime, jmbg, datum_rod, spol, visina, slika, broj_cipela)
VALUES ('Marko','Periæ','1234545891254','08/02/1995','M',180,'',43)
INSERT INTO osobe_Tina (ime, prezime, jmbg, datum_rod, spol, visina, slika, broj_cipela)
VALUES ('Jasna','Janiæ','1234567891114','05/11/1990','Ž',173,'',41)
INSERT INTO osobe_Tina (ime, prezime, jmbg, datum_rod, spol, visina, slika, broj_cipela)
VALUES ('Minja','Klepetalo','4444567891254','18/05/1994','M',195,'',46)
INSERT INTO osobe_Tina (ime, prezime, jmbg, datum_rod, spol, visina, slika, broj_cipela)
VALUES ('Mateja','Zeliæ','5555567891254','23/04/1992','Ž',164,'',38)

SELECT * FROM osobe_Tina




UPDATE osobe_Tina SET
ime='Periæ',
prezime='Marko'
WHERE jmbg='1234545891254';

UPDATE osobe_Tina SET broj_cipela='44';

DELETE FROM osobe_Tina WHERE ime='Jasna';



Ispisati sve podatke o studentima prema uzlaznom 
redoslijedu datuma upisa na fakultet. Za atribute 
koristiti opisne nazive (AS). Ispisati ime i prezime
svih studenata koji su roðeni prije 01.01.1978. godine.


SELECT * FROM student ORDER BY god_upis ASC

SELECT ime_stud AS 'ime',prez_stud AS 'prezime' FROM student where dat_rod<'01.01.1978'


Ispisati ime i prezime studenta i naziv predmeta za 
sve one ispite koji su položeni s ocjenom 4 ili veæom.

SELECT p.naz_pred AS kolegij, s.ime_stud AS ime, s.prez_stud AS prezime
FROM student AS s, predmet AS p, ispit AS i
WHERE s.mbr_stud = i.mbr_stud AND 
p.sif_pred = i.sif_pred AND
i.ocjena>=4

Ispisati sve podatke iz tablice mjesto poredano uzlazno 
prema poštanskom broju.

SELECT * FROM mjesto order by pbr ASC

Ispisati ime, prezime i koeficijent svih nastavnika i 
naziv organizacijske jedinice kojoj svaki pojedini 
nastavnik pripada. Podaci trebaju biti poredani 
silazno prema vrijednosti koeficijenta.

select n.ime_nstvnk AS ime_nastavnika, n.prez_nstvnk AS prezime_nastavnika, n.koef AS koeficijent, o.naz_orgjed AS naziv_organizacijske_jedinice
FROM nastavnik AS n, orgjed AS o
where n.sif_orgjed = o.sif_orgjed
order by n.koef DESC

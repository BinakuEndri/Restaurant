CREATE DATABASE Restaurant;

/*  FAZA 3 Fillon tek reshti 410  */


use Restaurant;

create table Tavolina(
tavolina_id integer not null,
statusi nvarchar(10),
primary key(tavolina_id)
);

create table Stafi(
stafi_id integer not null,
stafi_emri nvarchar(40),
stafi_mbiemri nvarchar(40),
stafi_roli nvarchar(40),
stafi_paga integer,
stafi_adresa nvarchar(40),
stafi_telefoni integer,
primary key(stafi_id)
);

create table Konsumatori(
konsumatori_id integer not null,
konsumatori_emri nvarchar(40),
konsumatori_mbiemri nvarchar(40),
konsumatori_adresa nvarchar(40),
konsumatori_telefoni integer,
primary key(konsumatori_id)
);

create table Rezervimi(
rezervimi_id integer not null unique,
rezervimi_data date,
rezervuar date,
punetori integer not null,
klienti integer not null,
tavolina integer not null,
anuluar Boolean,
primary key(rezervimi_id),
foreign key(punetori) references Stafi(stafi_id),
foreign key(klienti) references Konsumatori(konsumatori_id),
foreign key(tavolina) references Tavolina(tavolina_id)

);

create table Menu(
menu_id integer not null unique,
kategoria nvarchar(40),
ushqimi nvarchar(40),
pershkrimi nvarchar(100),
cmimi integer,
primary key(menu_id)
);

create table Porosia(
porosia_id integer not null ,
tavolina integer not null,
punetori integer not null,
klienti integer not null,
artikuj integer not null,
sasia integer,
porosia_data date,
primary key(porosia_id, artikuj),
foreign key(tavolina) references Tavolina(tavolina_id),
foreign key(punetori) references Stafi(stafi_id),
foreign key(artikuj) references Menu(menu_id)
);

create table Pagesa(
pagesa_id integer not null unique,
konsumatori integer not null,
punetori integer not null,
porosia integer not null,
forma nvarchar(10),
primary key(pagesa_id),
foreign key(konsumatori) references Konsumatori(konsumatori_id),
foreign key(punetori) references Stafi(stafi_id),
foreign key(porosia) references Porosia(porosia_id, artikuj)
);

create table Furnizuesi(
furnizuesi_id integer not null unique,
emri nvarchar(40),
kontakti integer not null,
primary key(furnizuesi_id)
);

create table Furnizimi(
furnizimi_id integer not null unique,
perberesit nvarchar(40),
furnizuesi integer not null,
punetori integer not null,
data_e_furnizimit date,
data_e_skadimit date,
qmimi integer,
sasia integer,
primary key(furnizimi_id),
foreign key(furnizuesi) references Furnizuesi(furnizuesi_id),
foreign key(punetori) references Stafi(stafi_id)
);

create table Stoqet(
stoqe_id integer not null unique,
produkti nvarchar(40),
sasia nvarchar(40),
vendi nvarchar(10),
furnizimi integer,
primary key(stoqe_id),
foreign key(furnizimi) references Furnizimi(furnizimi_id)
);

insert into Tavolina(
tavolina_id,
statusi
)
VALUES
(1, 'E Lire'),
(2, 'E Lire'),
(3, 'E Zene'),
(4, 'E Lire'),
(5, 'E Zene'),
(6, 'E Lire'),
(7, 'E Zene'),
(8, 'E Lire'),
(9, 'E Zene'),
(10, 'E Zene');

insert into Stafi(
stafi_id,
stafi_emri,
stafi_mbiemri,
stafi_roli,
stafi_paga,
stafi_adresa,
stafi_telefoni
)
VALUES
(1, 'Gabi', 'Stevens', 'Menaxher', 1150, 'Drenas', 49271596),
(2, 'Denise', 'Blooman', 'Recepsionit', 500, 'Prishtine', 49528431),
(3, 'Lutero', 'Soldi', 'Kamarier', 500, 'Prizren', 49900960),
(4, 'Zita', 'Mandres', 'Krye-Kamarier', 650, 'Malisheve', 49136737),
(5, 'Fernanda', 'Limpenny', 'Kuzhinier', 800, 'Peje', 49145741),
(6, 'Inge', 'Anstiss', 'Ndihmes Kuzhinier', 600, 'Kline', 49772449),
(7, 'Rianon', 'Bunch', 'Krye Kuzhinier', 1200, 'Mitrovice', 49117298),
(8, 'Starlin', 'Fennell', 'Recepsionit', 500, 'Prishtine', 49289592),
(9, 'Auberta', 'Tiler', 'Kuzhinier', 800, 'Drenas', 49729998),
(10, 'Anthiathia', 'Fern', 'Kamarier', 411, 'Malisheve', 49148062);

insert into Konsumatori(konsumatori_id,
konsumatori_emri,
konsumatori_mbiemri,
konsumatori_adresa,
konsumatori_telefoni
)
VALUES
(182628905, 'Farrel', 'Houten', 'Prishtine', 49867123),
(329205740, 'Tanya', 'Bissett', 'Drenas', 49312838),
(454035610, 'Kelsey', 'Pibworth', 'Malisheve', 49622172),
(173157921, 'Even', 'Ranshaw', 'Peje', 49208401),
(557467478, 'Christoper', 'Alf', 'Prizren', 49177000),
(437644808, 'Chloris', 'Hallowes', 'Drenas', 49970004),
(402863845, 'Tallou', 'Denman', 'Prishtine', 49775717),
(412480259, 'Helga', 'Gimbart', 'Gjakove', 49261991),
(268247245, 'Aldis', 'Manns', 'Prizren', 49741071),
(953324644, 'Polly', 'Revelle', 'Malisheve', 49987526);

insert into Rezervimi(
rezervimi_id,
rezervimi_data,
rezervuar,
punetori,
klienti,
tavolina,
anuluar
)
VALUES
(1, '2022-10-27', date '2022-10-29', 2, 329205740, 3, false),
(2, '2021-03-23', date '2021-03-28', 8, 557467478, 4, false),
(3, '2021-10-15', date '2021-10-18', 2, 402863845, 1, false),
(4, '2022-09-17', date '2022-09-18', 8, 412480259, 2, true),
(5, '2022-03-23', date '2022-03-28', 8, 329205740, 3, true),
(6, '2021-08-28', date '2021-09-11', 2, 268247245, 2, false),
(7, '2022-05-23', date '2022-05-25', 2, 557467478, 3, true),
(8, '2021-01-18', date '2021-01-21', 8, 437644808, 7, false),
(9, '2022-04-15', date '2022-04-15', 2, 329205740, 8, false),
(10, '2022-10-15', date '2022-10-15', 8, 173157921, 10, false),
(11, '2022-6-15', date '2022-8-1', 8, 173157921, 10, false),
(12, '2022-7-7', date '2022-7-2', 8, 173157921, 10, false),
(13, '2022-8-11', date '2022-8-3', 8, 173157921, 10, false),
(14, '2022-5-12', date '2022-7-2', 8, 173157921, 10, false),
(15, '2022-8-16', date '2022-8-1', 8, 173157921, 10, false),
(16, '2022-7-13', date '2022-7-13', 8, 173157921, 10, false);


insert into Menu(
menu_id,
kategoria,
ushqimi,
pershkrimi,
cmimi
)
VALUES
(1, 'Pica', 'Shtepie', '/', 6),
(2, 'Mengjes', 'Omlet', '/', 2),
(3, 'Skara', 'Mish Qingji', '/', 9.5),
(4, 'Pije', 'Birre', '/', 2),
(5, 'Skara', 'Biftek Viqi', '/', 14),
(6, 'Pasta', 'Boloneze', '/', 4),
(7, 'Rizoto', 'Fruta Deti', '/', 7),
(8, 'Ushqim Deti', 'Midhje', '/', 12),
(9, 'Pica', 'Pershute', '/', 5),
(10, 'Skara', 'Kombinim', '/', 9);

insert into Porosia(
porosia_id,
tavolina,
punetori,
klienti,
artikuj,
sasia,
porosia_data
)
VALUES
(1, 3, 10,454035610 ,2, 2,'2022-08-31'),
(1, 3,10,454035610 ,4, 1,'2021-03-19'),
(2, 1, 4,268247245,5, 1,'2022-03-15'),
(2, 1, 4,268247245 ,1, 1,'2021-02-15'),
(2, 1, 4,268247245,3, 1,'2022-04-27'),
(2, 1, 4,268247245,2, 2,'2022-09-24'),
(3, 3, 3,557467478,6, 2,'2022-01-29'),
(4, 7, 3,454035610,2, 1,'2022-05-15'),
(5, 8, 10,557467478,2, 1,'2022-01-29'),
(7, 10, 4,557467478 ,1, 3,'2022-05-15'),
(8, 3, 3,454035610 ,6, 4,'2022-11-29'),
(9, 7, 3, 268247245,2, 2,'2022-11-15'),
(10, 8, 10,557467478,2, 1,'2022-12-29'),
(10, 8, 10, 557467478,3, 2,'2022-10-15'),
(10,9,10,557467478 ,1,3,'2022-10-16'),
(11,3,10,268247245,9,2,'2022-10-17'),
(11,3,10, 268247245,1,1,'2022-10-17');






insert into Pagesa(
pagesa_id,
konsumatori,
punetori,
porosia,
forma
)
VALUES
(1, 454035610, 10, 2, 'Cash'),
(2, 268247245, 3, 4, 'Kartel'),
(3, 454035610, 4, 5, 'Cash'),
(4, 173157921, 10, 1, 'Kartel'),
(5, 173157921, 4, 2, 'Cash'),
(6, 454035610, 4, 4, 'Kartel'),
(7, 402863845, 3, 6, 'Cash'),
(8, 173157921, 3, 2, 'Cash'),
(9, 454035610, 10, 2, 'Kartel'),
(10, 268247245, 4, 1, 'Kartel');

insert into Furnizuesi(
furnizuesi_id,
emri,
kontakti
)
VALUES
    (1, 'Fast Delivery', 49455787),
    (2, 'Speed', 49769934),
    (3, 'Start', 49055259),
    (4, 'N&H', 49454087),
    (5, 'D&D', 49626666),
    (6, 'ZTO Express', 49317531),
    (7, 'FedEx', 49321427),
    (8, 'UPS', 49896860),
    (9, 'Blue Dart', 49301091),
    (10, 'DTDC', 49623647);

insert into Furnizimi(
furnizimi_id,
perberesit,
furnizuesi,
punetori,
data_e_furnizimit,
data_e_skadimit,
qmimi,
sasia
)
VALUES (1,'Peperoni', 3, 6, '2022-10-27', '2025-10-29', 5400, 1000),
       (2,'Bizele', 1, 1, '2021-03-23', '2022-03-28', 6700, 500),
       (3,'Uje', 2, 4, '2021-10-15', '2021-11-18', 320, 50),
       (4,'Kafe', 4, 4, '2022-09-17', '2024-09-18', 7000, 200),
       (5,'Kakao', 1, 6, '2022-03-23', '2024-03-28', 12000, 1000),
       (6,'Suxhuk', 5, 6, '2021-08-28', NULL, 320, 20),
       (7,'Mish Viqi', 6, 1, '2022-05-23', NULL, 1200, 50),
       (8,'Sheqer', 8, 4, '2021-01-18', '2023-01-21', 4500, 90),
       (9,'Kryp', 10, 1, '2022-04-15', '2024-04-15', 250, 10),
       (10,'Vere', 9, 6, '2022-10-15', '2022-12-15', 3500, 25);

insert into Stoqet(
stoqe_id,
produkti,
sasia,
vendi,
furnizimi
)
values
    (1, 'Peperoni', 561, 'C2', 3),
    (2, 'Bizele', 241, 'A4', 5),
    (3, 'Uje', 6311, 'A6', 2),
    (4, 'Kafe', 1242, 'B10', 6),
    (5, 'Kakao', 531, 'D2', 7),
    (6, 'Suxhuk', 124, 'A1', 1),
    (7, 'Mish Viqi', 753, 'A5', 2),
    (8, 'Sheqer', 2357, 'B5', 4),
    (9, 'Kryp', 2354, 'C3', 10),
    (10, 'Vere', 1421, 'C6', 9);
    
create table Ditet(
   dita_id integer not null,
   emri nvarchar(10),
primary key(dita_id)
);

insert into Ditet(
dita_id,
emri
)
values
    (1, 'E diele'),
    (2, 'E hene'),
    (3, 'E marte'),
    (4, 'E merkure'),
    (5, 'E enjte'),
    (6, 'E premte'),
    (7, 'E shtune');
    
    
    
    
Select * From Porosia;


#Query 1    
Select * From Konsumatori k
Where k.konsumatori_adresa = 'Prishtine';

#Query 2
select k1.konsumatori_emri as 'Emri', k1.konsumatori_mbiemri as 'Mbiemri' from Konsumatori k1
inner join Rezervimi r on r.klienti = k1.konsumatori_id  and  r.rezervuar between '2022-01-01' and '2022-12-31 '
group by (k1.konsumatori_id)
having count(k1.konsumatori_id) >= 2;

#Query 3
select k2.konsumatori_emri as 'Emri', k2.konsumatori_mbiemri as 'Mbiermi' from Konsumatori k2
inner join  Rezervimi r1 on r1.klienti = k2.konsumatori_id and r1.rezervuar between '2021-01-01' and '2022-12-31' and r1.anuluar= true;

#Query 4 
Select s.stafi_emri as 'Emri', s.stafi_mbiemri as 'Mbiermi'From Stafi s
Where s.stafi_paga > 500;


#Query 5
SELECT k3.konsumatori_emri as 'Emri i Klientit',
k3.konsumatori_mbiemri as 'Mbiermi i Klientit',
porosia_id as 'Numri i porosise', 
s3.stafi_emri as 'Emri i sherbyesit' ,
s3.stafi_mbiemri as 'Mbiermi i sherbyesit',  
sum(sasia) AS Numri_i_porosive
FROM porosia 
inner join Stafi s3 
on s3.stafi_id = punetori
inner join Konsumatori k3 
on k3.konsumatori_id = klienti
GROUP BY porosia_id,punetori, klienti
ORDER BY Numri_i_porosive DESC
LIMIT 5;

#Query 6
Select year(p.porosia_data) as 'Viti' ,month(p.porosia_data) as 'Muaji', m.kategoria as 'Kategoria' ,m.ushqimi as 'Ushqimi' , p.sasia*m.cmimi as Shuma from Porosia p
Inner Join Menu m on p.artikuj= m.menu_id and p.porosia_data between '2022-10-01' and '2022-12-01'
order by Shuma desc;

#Query 7
select Ditet.emri as 'Emri' , count(dayofweek(Rezervimi.rezervuar))/9 as 'Numri'  from Ditet, Rezervimi
Where month(Rezervimi.rezervuar) in (7,8) and Ditet.dita_id = dayofweek(Rezervimi.rezervuar)
group by dayofweek(Rezervimi.rezervuar),Ditet.dita_id
order by Ditet.dita_id;

#Query 8
SELECT m.kategoria, m.ushqimi, sum(sasia) AS shuma 
FROM porosia
inner join Menu m on m.menu_id = artikuj and m.kategoria!="Pije" and year(porosia_data)=year(CURDATE())
GROUP BY artikuj 
ORDER BY shuma DESC
LIMIT 1;

#Query 9
SELECT porosia_id as 'ID e porosise', sum(sasia) as 'Numri i picave' FROM porosia 
inner join Menu m on m.menu_id = artikuj and m.kategoria = 'Pica'
GROUP BY porosia_id
having sum(sasia) >= 3;



/*  FAZA 3  */



create view pija_me_e_shtrenjt as
SELECT m.kategoria, m.ushqimi, m.cmimi 
FROM menu m
inner join porosia p on p.artikuj = m.menu_id and m.kategoria = 'pije'
order by m.cmimi desc
limit 1;

create view produket_me_afat_te_skaduar as
SELECT  f.perberesit, f.data_e_skadimit, f.sasia, f.sasia * f.qmimi as shuma_e_humbur from furnizimi f
where f.data_e_skadimit <= NOW();

create view top_5_porosite_ne_Q4_2022 as
SELECT p.porosia_id, m.kategoria, m.ushqimi, p.sasia, m.cmimi,p.sasia * m.cmimi as vlera_porosise
from porosia p inner join menu m on m.menu_id = p.artikuj
and p.porosia_data between '2022-09-01' and '2022-12-31'
order by vlera_porosise desc
limit 5;





delimiter $$
CREATE TRIGGER prevent_duplicate_staff_id
BEFORE UPDATE ON stafi
FOR EACH ROW
BEGIN
  DECLARE duplicate INT;

  SELECT COUNT(*) INTO duplicate
  FROM stafi
  WHERE stafi_id = NEW.stafi_id;

  IF duplicate > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Kjo id ekziston ,  ju lutem shenoni id tjter';
  END IF;
END $$
delimiter $$;


delimiter $$
CREATE FUNCTION count_staff_payment()
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE total_payment DECIMAL DEFAULT 0;
    SELECT SUM(stafi_paga) INTO total_payment FROM stafi;
    RETURN total_payment;
END $$
delimiter ;
SELECT count_staff_payment();


delimiter //
CREATE PROCEDURE trego_roli3(
IN stafi_id INTEGER ,
OUT stafi_roli VARCHAR(255)
)
BEGIN 
SELECT stafi_roli into stafi_roli FROM stafi WHERE stafi_id = stafi_id;
END //
delimiter ;

 
CALL trego_roli3(2,@stafi_roli);
SELECT @stafi_roli;



delimiter //
CREATE PROCEDURE get_waiters()
BEGIN
    SELECT * FROM stafi WHERE stafi_roli = 'Kamarier';
END //count_staff_payment
delimiter ;

CALL get_waiters();


drop table Funizuesi;
drop table Furnizimi;
drop table Stoqet;
drop table Porosia;
drop table Pagesa;
drop table Rezervimi;



    
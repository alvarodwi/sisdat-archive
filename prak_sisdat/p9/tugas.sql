create database kuliah; #alvaro-41
use kuliah; #alvaro-41

create table mahasiswa(
    npm char(8) primary key not null,
    namaMhs char(15),
    alamatMhs char(15)
); #alvaro-41
desc mahasiswa; #alvaro-41

create table matkul(
    noMK char(5) primary key not null,
    namaMK char(20),
    SKS int
); #alvaro-41
desc matkul; #alvaro-41

create table nilai(
    npm char(8),
    noMK char(8),
    UTS tinyint(2),
    UAS tinyint(2),
    foreign key (npm) references mahasiswa(npm),
    foreign key (noMK) references matkul(noMK)
); #alvaro-41
desc nilai; #alvaro-41

insert into mahasiswa values 
("10296001","Gani","Jatinangor"),
("10296126","Eli","Jakarta"),
("10296832","Jaka","Garut"),
("21196353","Sisi","Majalengka"),
("21198002","Tito","Bandung"),
("31296500","Beni","Depok"),
("41296525","Putra","Bogor"),
("50096487","Yunita","Bekasi"); #alvaro-41

insert into matkul values 
("TI021","Sistem Database",2),
("TI022","Etika Profesi",2),
("TI032","Database Mining",3); #alvaro-41

insert into nilai values 
("10296126","TI032",70,90),
("10296832","TI021",80,75),
("21196353","TI022",75,75),
("31296500","TI021",55,40),
("41296525","TI022",90,80),
("50096487","TI032",85,60); #alvaro-41

--soal1
-- Tampilkan nama dan npm mahasiswa yang nilai UAS lebih dari rata-rata
select namaMhs,npm,uas
from mahasiswa natural join nilai
where uas > (
    select avg(uas) from nilai
); #alvaro-41

--soal 2
-- Tampilkan daftar nama mahasiswa yang mendapat nilai UTS paling rendah.
select namaMhs,npm,uts
from mahasiswa natural join nilai
where uts = (
    select min(uts) from nilai
); #alvaro-41

-- soal 3
-- Tampilkan nama dan npm mahasiswa dengan syarat UTS > 50
select namaMhs,npm,uts
from mahasiswa natural join nilai
where uts > 50; #alvaro-41

-- soal 4
-- Tampilkan npm mahasiswa dengan nilai akhir (uas+uts/2) >= 75
select namaMhs,npm,(uas+uts)/2 as "nilai akhir"
from mahasiswa natural join nilai
where (uas+uts)/2 > 75; #alvaro-41

-- soal 5
-- Tampilkan nama dan npm mahasiswa yang mengambil MK etika profesi
select namaMhs,npm
from mahasiswa natural join nilai
where npm in (
    select npm 
    from nilai
    where noMK = "TI022"
); #alvaro-41

-- soal 6
-- Gunakan perintah INNER JOIN untuk menggabungkan tabel Nilai dan tabel
-- Mahasiswa berdasarkan npm yang diurutkan berdasarkan nilai.
select *
from mahasiswa inner join nilai using (npm)
order by npm; #alvaro-41

-- soal 6
-- Gunakan perintah OUTER JOIN untuk menggabungkan tabel Nilai dan tabel
-- Mahasiswa berdasarkan npm yang diurutkan berdasarkan nilai.
select *
from mahasiswa left join nilai using (npm)
order by npm; #alvaro-41
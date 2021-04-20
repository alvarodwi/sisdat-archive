create database jurusan; #alvaro-41
use jurusan; #alvaro-41

create table mahasiswa(
    npm char(4) primary key not null,
    nama varchar(30),
    alamat varchar(40)
); #alvaro-41
desc mahasiswa; #alvaro-41

create table matkul(
    kode char(3) primary key not null,
    nama varchar(20),
    sks int(2)
); #alvaro-41
desc matkul; #alvaro-41

create table ambil(
    npm char(4),
    kode char(3),
    nilai int(2),
    foreign key (npm) references mahasiswa(npm),
    foreign key (kode) references matkul(kode)
); #alvaro-41
desc ambil; #alvaro-41

insert into mahasiswa values 
('A001','Adistia','Bandung'),
('A002','Bayu','Cirebon'),
('A003','Cahya','Depok'),
('A004','Dadang','Sukabumi'),
('A005','Eneng','Bogor'); #alvaro-41

insert into matkul values 
('A01','Sisdat',3),
('A02','Strukdat',3),
('A03','Orarkom',4),
('A04','Statistika',2),
('A05','Kalkulus',4); #alvaro-41

insert into ambil values
('A001','A01',70),
('A002','A02',80),
('A003','A03',60),
('A004','A02',70),
('A001','A02',70),
('A001','A03',70),
('A002','A03',60),
('A003','A01',80),
('A004','A01',80),
('A005','A02',60),
('A005','A03',60); #alvaro-41

--soal 1
-- tampilkan nama dan nilai mahasiswa yang memiliki nilai tertinggi dalam mata kuliah 'A01'
select nama, nilai
from mahasiswa, ambil
where mahasiswa.npm = ambil.npm
and nilai = (
    select max(nilai) from ambil
    where kode = 'A01'
)
and kode = 'A01'; #alvaro-41


--soal2
-- tampilkan npm dan nama mahasiswa yang memiliki nilai di atas rata-rata nilai dari semua mahasiswa yang mengambil mata kuliah dengan kode 'A03'
select npm, nama
from mahasiswa
where npm in (
    select npm from ambil
    where kode = 'A03'
    and nilai > (
        select avg(nilai) from ambil
        where kode = 'A03'
    )
); #alvaro-41

--soal 3
-- tampilkan npm dan nama mahasiswa yang tidak mengambil matakuliah 'A01'
select npm,nama
from mahasiswa
where npm not in (
    select npm from ambil
    where kode = 'A01'
); #alvaro-41
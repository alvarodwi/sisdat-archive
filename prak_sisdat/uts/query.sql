create database uts; #alvaro-41
show databases; #alvaro-41
use uts; #alvaro-41

create table mahasiswa(
    npm int primary key not null auto_increment,
    nama varchar(10) not null,
    jenis_kelamin varchar(8) not null,
    tgl_lahir varchar(10) not null,
    angkatan varchar(4) not null,
    doswal varchar(10) not null
); #alvaro-41
desc mahasiswa;

alter table mahasiswa
add jml_sks int(2); #alvaro-41
desc mahasiswa; #alvaro-41

alter table mahasiswa
change jenis_kelamin jk char(1); #alvaro-41
desc mahasiswa; #alvaro-41

insert into mahasiswa values 
('14001','Abdul','L','1996-08-23','2014','Maman',20),
('14002','Bambang','L','1996-12-02','2014','Didi',22),
('14003','Mawar','P','1996-05-31','2014','Yanto',22),
('14004','Milea','P','1996-09-05','2014','Maman',18),
('15001','Indah','P','1997-01-12','2015','Yanto',20),
('15002','Bima','L','1992-10-16','2015','Didi',17)
; #alvaro-41
select * from mahasiswa; #alvaro-41

select * from mahasiswa where npm = "15001"; #alvaro-41
update mahasiswa 
set nama = "Puspa"
where npm = "15001"; #alvaro-41
select * from mahasiswa where npm = "15001"; #alvaro-41

select * from mahasiswa
where angkatan = "2014"
and jml_sks = 22;  #alvaro-41

select * from mahasiswa; #alvaro-41
delete from mahasiswa
where nama like "M%"
and length(nama) = 5; #alvaro-41
select * from mahasiswa; #alvaro-41


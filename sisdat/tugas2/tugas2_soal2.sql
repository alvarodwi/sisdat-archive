-- DDL untuk tabel dari ERD dan hasil normalisasi
-- membuat database
create database db_sensus;
use db_sensus;
-- membuat tabel
create table keluarga(
    no_kk varchar(16) primary key not null,
    nama_kk varchar(50) not null,
    alamat varchar(40),
    rt_rw varchar(6),
    kelurahan varchar(30),
    kecamatan varchar(30),
    kodya_kab varchar(30),
    telepon varchar(13)
);
create table warga(
    nik varchar(16) primary key not null,
    nama varchar(50) not null,
    tempat_lahir varchar(30),
    tgl_lahir date,
    jk tinyint(1),
    pendidikan varchar(15),
    pekerjaan varchar(30),
    status_kawin varchar(20),
    no_kk varchar(16)
);
-- membuat foreign key
alter table
    warga
add
    constraint keluarga_no_kk_fk foreign key(no_kk) references keluarga(no_kk);
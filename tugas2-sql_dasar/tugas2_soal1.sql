-- no1 membuat database baru
create database pustaka;
-- no2 menambahkan tabel-tabel
create table anggota(
    npm varchar(12) primary key not null,
    nama varchar(30),
    jk tinyint(1),
    alamat varchar(100)
);
create table katalog(
    no_katalog int primary key not null,
    judul varchar(30),
    pengarang varchar(30),
    penerbit varchar(30),
    tahun int(4),
    jml_buku int
);
create table transaksi(
    no_transaksi int primary key not null,
    tgl_pinjam date,
    npm varchar(12),
    no_katalog int
);
-- no3 menambahkan kolom di tabel anggota
alter table
    anggota
add
    tgl_anggota date,
add
    tgl_berlaku date;
-- rollback perintah diatas...
alter table
    anggota drop tgl_anggota,
    drop tgl_berlaku;
-- no4 menghapus kolom di tabel anggota
alter table
    anggota drop jk,
    drop alamat;
-- rollback perintah diatas...
alter table
    anggota
add
    jk tinyint(1),
add
    alamat varchar(100);
-- no5 membuat index di tabel transaksi
create index TransaksiX on transaksi(npm, tgl_pinjam);
-- no6 menghapus tabel katalog
drop table katalog;
-- rollback perintah diatas...
create table katalog(
    no_katalog int primary key not null,
    judul varchar(50),
    pengarang varchar(30),
    penerbit varchar(30),
    tahun int(4),
    jml_buku int
);
-- input data dummy...
insert into
    anggota
values
    ('140810200001', 'Ariq Hakim Ruswadi', 1, ''),
    ('140810200002', 'Rommel Malik Kusnadi', 1, ''),
    ('140810200003', 'Affan Rifky Kurniadi', 1, ''),
    ('140810200004', 'Aulia Rahmanita', 2, ''),
    ('140810200005', 'Alfadli Maulana Siddik', 1, ''),
    ('140810200006', 'Hali Putri Aisyah', 2, ''),
    ('140810200007', 'Rangga Putra', 1, ''),
    ('140810200008', 'Anggie Forestry', 2, ''),
    ('140810200009', 'Wafi Fahruzzaman', 1, ''),
    (
        '140810200010',
        'Rifky Mahardika Hariyanto',
        1,
        ''
    ),
    ('140810200011', 'Faiq Muhammad', 1, ''),
    ('140810200012', 'Della Fauziyah Husna', 2, ''),
    ('140810200013', 'Rihlan Lumenda Suherman', 1, ''),
    ('140810200014', 'Nawang Ilmi Adzani', 2, ''),
    ('140810200015', 'Nanda Raihan Sukma', 2, '');
insert into
    katalog
values
    (
        1,
        '86 -eightysix-',
        'Asato Asato',
        'Yen On',
        2019,
        5
    ),
    (
        2,
        'By the Grace of the Gods',
        'Roy',
        'J-Novel Club',
        2020,
        6
    ),
    (
        3,
        'Altina the Sword Princess',
        'Yukiya Murasaki',
        'J-Novel Club',
        2019,
        7
    ),
    (
        4,
        'The Apothecary Diaries',
        'Natsu Hyuuga',
        'J-Novel Club',
        2021,
        1
    ),
    (
        5,
        'Invaders of the Rokujouma!?',
        'Takehaya',
        'J-Novel Club',
        2017,
        35
    ),
    (
        6,
        'My Friend’s Little Sister Has It In for Me!',
        'Ghost Mikawa',
        'J-Novel Club',
        2021,
        1
    ),
    (
        7,
        'World Teacher -Isekaishiki Kyouiku Agent-',
        'Kouichi Neko',
        'J-Novel Club',
        2021,
        1
    ),
    (
        8,
        'Drugstore in Another World',
        'Kennoji',
        'Seven Seas',
        2021,
        1
    );
insert into
    transaksi
values
    (1, '2021-01-07', '140810200002', 5),
    (2, '2021-01-07', '140810200012', 1),
    (3, '2021-01-07', '140810200011', 2),
    (4, '2021-01-07', '140810200001', 3),
    (5, '2021-01-08', '140810200007', 3),
    (6, '2021-01-08', '140810200004', 3),
    (7, '2021-01-08', '140810200004', 5),
    (8, '2021-01-08', '140810200004', 8),
    (9, '2021-01-08', '140810200003', 3),
    (10, '2021-01-09', '140810200008', 5);
-- no7 tampilkan semua data didalam tabel anggota, urutkan berdasarkan nama
select
    *
from
    anggota
order by
    nama;
-- no8 tampilkan semua data didalam tabel anggota dengan jk = 1
select
    *
from
    anggota
where
    jk = 1;
-- no9 tampilkan semua data didalam tabel anggota dengan jk = 2 serta nama diawali huruf "D" atau "R"
select
    *
from
    anggota
where
    jk = 2
    and (
        nama like 'd%'
        or nama like 'r%'
    );
-- no10 hitung jumlah anggota yang memiliki jk = 1
select
    count(*) as 'Jumlah Anggota Laki-Laki'
from
    anggota
where
    jk = 1;
-- no11 jumlah transaksi peminjaman yang dilakukan pada tanggal = '01/07/21'
select
    count(*) as 'Jumlah transaksi 01/07/21'
from
    transaksi
where
    tgl_pinjam = '2021-01-07';
-- no12 data anggota yang meminjam buku pada tanggal '01/07/21'
select
    a.npm,
    a.nama,
    t.tgl_pinjam
from
    transaksi t
    inner join anggota a using (npm)
where
    t.tgl_pinjam = '2021-01-07'
group by
    a.npm;
-- no13 jumlah buku yang terbit pada 2021
select
    count(*) as 'Jumlah buku yang diterbitkan tahun 2021'
from
    katalog
where
    tahun = 2021;
-- no14 data anggota yang meminjam buku pada tanggal '01/07/21' + judul buku
select
    k.no_katalog,
    k.judul,
    a.npm,
    a.nama,
    t.tgl_pinjam
from
    transaksi t
    inner join anggota a using (npm)
    inner join katalog k using (no_katalog)
where
    tgl_pinjam = '2021-01-07';
-- no15 tampilkan judul buku, nama peminjam untuk semua buku terurut berdasarkan tgl_pinjam
select
    k.no_katalog,
    k.judul,
    a.npm,
    a.nama,
    t.tgl_pinjam
from
    transaksi t
    inner join anggota a using (npm)
    inner join katalog k using (no_katalog)
order by
    t.tgl_pinjam;
-- no16 jumlah buku dalam tabel katalog, dikelompokkan berdasarkan tahun terbit
select
    count(*) as "Jumlah buku terbit",
    k.tahun
from
    katalog k
group by
    k.tahun;
-- no17 jumlah total buku yang dipinjam
select
    count(*) as "Jumlah total buku yang dipinjam"
from
    transaksi
    inner join katalog using (no_katalog);
-- no18 data anggota + buku yang dipinjam (mau ada ato engga)
select
    a.npm,
    a.nama,
    k.judul,
    t.no_transaksi
from
    anggota a
    left join (
        transaksi t
        inner join katalog k using (no_katalog)
    ) using (npm)
order by
    a.nama;
-- no19 data transaksi urut berdasarkan nama peminjam
select
    t.no_transaksi,
    t.tgl_pinjam,
    a.nama
from
    transaksi t
    inner join anggota a using (npm)
order by
    a.nama;
-- insert old books
insert into
    katalog
values
    (
        9,
        'Kitab Negarakertagama',
        'Mpu Prapanca',
        '-',
        1365,
        1
    ),
    (
        10,
        'Kitab Sutasoma',
        'Mpu Tantular',
        '-',
        1365,
        1
    );
-- old books data
select
    *
from
    katalog
where
    tahun < 1960;
-- no20 delete old books
delete from
    katalog
where
    tahun < 1960;
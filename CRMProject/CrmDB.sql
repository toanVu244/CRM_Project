CREATE DATABASE crm;
USE crm;

CREATE TABLE LoaiThanhVien(
	id int auto_increment,
	ten varchar(255),
	mota varchar(255),
	
	primary key(id)
);

CREATE TABLE NguoiDung(
	id int auto_increment,
	email varchar(255),
	matkhau varchar(255),
	fullname varchar(255),
	diachi varchar (255),
	soDienThoai varchar(11),
	id_loaithanhvien int,
	
	primary key(id)
);

CREATE TABLE CongViec (
  id int AUTO_INCREMENT,
  ten varchar(255),
  mota varchar(255),
  ngaybatdau date,
  ngayketthuc date,
  id_duan int,
  id_trangthai int,
  PRIMARY KEY (id)
)

CREATE TABLE DuAn (
  id int AUTO_INCREMENT,
  ten varchar(255),
  mota varchar(255),
  ngaybatdau date,
  ngayketthuc date,
  id_nguoidung int,
  id_trangthai int,
  PRIMARY KEY (id)
)

CREATE TABLE TrangThai (
  id int AUTO_INCREMENT,
  ten varchar(255),
  mota varchar(255),
  PRIMARY KEY (id)
)


CREATE TABLE CongViec_NguoiDung (
  id_nguoidung int NOT NULL,
  id_congviec int NOT NULL,
  PRIMARY KEY (id_nguoidung,id_congviec)
)

CREATE TABLE DuAn_NguoiDung(
id_duan int not null,
id_nguoidung int not null,
PRIMARY KEY (id_duan,id_nguoidung)
)

ALTER TABLE NguoiDung ADD CONSTRAINT FK_id_loaithanhvien_NguoiDung 
FOREIGN KEY(id_loaithanhvien) REFERENCES LoaiThanhVien(id);

ALTER TABLE DuAn  ADD CONSTRAINT FK_id_nguoidung_DuAn
FOREIGN KEY(id_nguoidung) REFERENCES NguoiDung(id);

ALTER TABLE CongViec  ADD CONSTRAINT FK_id_duan_CongViec
FOREIGN KEY(id_duan) REFERENCES DuAn(id);

ALTER TABLE CongViec  ADD CONSTRAINT FK_id_trangthai_CongViec
FOREIGN KEY(id_trangthai) REFERENCES TrangThai(id);

ALTER TABLE DuAn  ADD CONSTRAINT FK_id_trangthai_CongViec
FOREIGN KEY(id_trangthai) REFERENCES TrangThai(id);

ALTER TABLE CongViec_NguoiDung  ADD CONSTRAINT FK_id_nguoidung_CongViec_NguoiDung
FOREIGN KEY(id_nguoidung) REFERENCES NguoiDung(id);

ALTER TABLE CongViec_NguoiDung  ADD CONSTRAINT FK_id_congviec_CongViec_NguoiDung
FOREIGN KEY(id_congviec) REFERENCES CongViec(id);

ALTER TABLE DuAn_NguoiDung  ADD CONSTRAINT FK_id_nguoidung_DuAn_NguoiDung
FOREIGN KEY(id_nguoidung) REFERENCES NguoiDung(id);

ALTER TABLE DuAn_NguoiDung  ADD CONSTRAINT FK_id_congviec_DuAn_NguoiDung
FOREIGN KEY(id_duan) REFERENCES DuAn(id);
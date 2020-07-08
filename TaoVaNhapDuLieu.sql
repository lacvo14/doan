CREATE DATABASE QuanLyChuyenVaDatVeTau
GO

USE QuanLyChuyenVaDatVeTau
GO

CREATE TABLE DOITUONG
(
	MaLoaiKhach CHAR(10) PRIMARY KEY,
	TenLoaiKhach NVARCHAR(500),
	PhanTramGiamGia INT DEFAULT 0
)
GO

CREATE TABLE THONGTINGATAU
(
	MaGa CHAR(10) PRIMARY KEY,
	TenGa NVARCHAR(500),
	DiaChi NVARCHAR(500)	
)
GO

CREATE TABLE THONGTINTAU
(
	MaTau CHAR(10) PRIMARY KEY,
	TenTau NVARCHAR(500),
	LoaiTau NVARCHAR(500),
	SoToa INT	
)
GO

CREATE TABLE THONGTINTOA
(
	MaToa CHAR(10) PRIMARY KEY,
	TenToa NVARCHAR(500),
	LoaiToa NVARCHAR(500),
	SoCho INT,
)
GO

CREATE TABLE THONGTINKHACHHANG
(
	CMND CHAR(20) PRIMARY KEY,	
	HoTen NVARCHAR(500),
	GioiTinh NVARCHAR(10),
	DiaChi NVARCHAR (500),
	SoDT CHAR(20),
	Email VARCHAR(50)
)
GO

CREATE TABLE THONGTINVE
(
	MaVe CHAR(10) PRIMARY KEY,
	LoaiVe NVARCHAR(50),
	TrangThai NVARCHAR(50),
	MaGaDi CHAR (10),
	MaGaDen CHAR (10),
	MaToa CHAR(10),
	MaTau CHAR(10),
	GiaTien INT,
	NgayDi DATE
)
GO
ALTER TABLE THONGTINVE ADD CONSTRAINT FK_TTV1 FOREIGN KEY (MaGaDi) REFERENCES THONGTINGATAU(MaGa)
ALTER TABLE THONGTINVE ADD CONSTRAINT FK_TTV3 FOREIGN KEY (MaTau) REFERENCES THONGTINTAU(MaTau)
ALTER TABLE THONGTINVE ADD CONSTRAINT FK_TTV4 FOREIGN KEY (MaToa) REFERENCES THONGTINTOA(MaToa)

CREATE TABLE PHIEUDATVE
(
	MaPhieu CHAR(10) PRIMARY KEY,
	MaVe CHAR(10),
	CMND CHAR (20),
	NgayDat DATE,
	GiaVe INT,
	MaLoaiKhach CHAR(10),
	PhuongThucThanhToan NVARCHAR(500),
	ViTriTrongToa INT		
)
GO
ALTER TABLE PHIEUDATVE ADD CONSTRAINT FK_PDV1 FOREIGN KEY (CMND) REFERENCES THONGTINKHACHHANG(CMND)
ALTER TABLE PHIEUDATVE ADD CONSTRAINT FK_PDV2 FOREIGN KEY (MaLoaiKhach) REFERENCES DOITUONG(MaLoaiKhach)
ALTER TABLE PHIEUDATVE ADD CONSTRAINT FK_PDV3 FOREIGN KEY (MaVe) REFERENCES THONGTINVE(MaVe)


-- Them du lieu cho bang DOITUONG
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('CSXH01',N'Bà mẹ Việt Nam anh hùng',90)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('CSXH02',N'Người hoạt động cách mạng trước 9/8/1945',90)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('CSXH03',N'Thương binh',30)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('CSXH04',N'Nạn nhân chất độc màu da cam',30)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('CSXH05',N'Người khuyết tật',30)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('CSXH06',N'Trẻ em dưới 6 tuổi',100)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('K01',N'Trẻ em từ 6 đến 10 tuổi',50)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('K02',N'Người cao tuổi',15)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('K03',N'Học sinh, sinh viên',10)
INSERT INTO DOITUONG(MaLoaiKhach, TenLoaiKhach, PhanTramGiamGia)
VALUES ('K04',N'Khác',0)

--Them du lieu cho bang THONGTINGATAU
INSERT INTO THONGTINGATAU(MaGa,TenGa,DiaChi)
VALUES ('G001',N'Chợ Tía',N'Xã Thắng Lợi, huyện Thường Tín, Hà Nội')
INSERT INTO THONGTINGATAU(MaGa,TenGa,DiaChi)
VALUES ('G002',N'Vinh',N'Số 1 Lê Ninh, phường Quán Bàu, thành phố Vinh, Nghệ An')
INSERT INTO THONGTINGATAU(MaGa,TenGa,DiaChi)
VALUES ('G003',N'Dĩ An',N'	Nguyễn An Ninh, Phường Dĩ An, Thị xã Dĩ An, Bình Dương')
INSERT INTO THONGTINGATAU(MaGa,TenGa,DiaChi)
VALUES ('G004',N'Gò Vấp',N'1 Lê Lai, phường 3, quận Gò Vấp, Thành phố Hồ Chí Minh')
INSERT INTO THONGTINGATAU(MaGa,TenGa,DiaChi)
VALUES ('G005',N'Yên Xuân',N'Xã Hưng Xuân, huyện Hưng Nguyên, Nghệ An')
INSERT INTO THONGTINGATAU(MaGa,TenGa,DiaChi)
VALUES ('G006',N'Yên Trung',N'Thị trấn Đức Thọ, huyện Đức Thọ, Hà Tĩnh')

--Them du lieu cho bang thongtintau
INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('NA1',N'Tàu Hà Nội - Vinh',N'Đầu máy điện',16)
INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('NA2',N'Tàu Vinh - Hà nội',N'Đầu máy điện',18)
-- UPDATE THONGTINTAU
-- SET	SoToa = 18
-- WHERE MaTau = 'NA2'

INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('SE1',N'Tàu nhanh Hà Nội - Sài Gòn',N'Đầu máy điện',18)
-- UPDATE THONGTINTAU
-- SET	SoToa = 18
-- WHERE MaTau = 'SE1'

INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('SE3',N'Tàu nhanh nhất Hà Nội - Sài Gòn',N'Đầu máy điện',20)
-- UPDATE THONGTINTAU
-- SET	SoToa = 20
-- WHERE MaTau = 'SE3' 

INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('SE5',N'Tàu nhanh Hà Nội - Sài Gòn',N'Đầu máy diesel cổ điển',19)
-- UPDATE THONGTINTAU
-- SET	SoToa = 19
-- WHERE MaTau = 'SE5'

INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('SE6',N'Tàu nhanh Sài Gòn - Hà Nội',N'Đầu máy điện',20)
-- UPDATE THONGTINTAU
-- SET	SoToa = 20
-- WHERE MaTau = 'SE6'

INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('SP1',N'Tàu nhanh nhất Hà Nội - Lào Cai',N'Đầu máy điện',22)
-- UPDATE THONGTINTAU
-- SET	SoToa = 22
-- WHERE MaTau = 'SP1'

INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('SP3',N'Tàu nhanh Hà Nội - Lào Cai',N'Đầu máy diesel cổ điển',20)
-- UPDATE THONGTINTAU
-- SET	SoToa = 20
-- WHERE MaTau = 'SP3'

INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('SPT1',N'Tàu Phan Thiết - Sài Gòn',N'Đầu máy hơi nước',16)
INSERT INTO THONGTINTAU(MaTau,TenTau,LoaiTau,SoToa)
VALUES('YB1',N'Tàu Hà Nội - Yên Bái',N'Đầu máy điện',18)
-- UPDATE THONGTINTAU
-- SET	SoToa = 18
-- WHERE MaTau = 'YB1'


--Them du lieu cho bang thongtintoa
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('MT001',N'Toa số 1',N'Toa xe khách hai tầng',20)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('MT002',N'Toa số 2',N'Toa xe khách cao cấp',25)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('MT003',N'Toa số 3',N'Toa xe ghế ngồi cứng',20)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('MT004',N'Toa số 4',N'Toa xe giường cứng',22)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('MT005',N'Toa số 5',N'Toa xe khách hai tầng',22)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('MT006',N'Toa số 6',N'Toa xe ghế ngồi mềm',24)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('NA001',N'Toa số 1',N'Toa xe ghế ngồi mềm',28)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('NA002',N'Toa số 2',N'Toa xe ghế ngồi mềm',24)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('NA003',N'Toa số 3',N'Toa xe giường mềm',22)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('SE009',N'Toa số 9',N'Toa xe giường mềm',24)
INSERT INTO THONGTINTOA(MaToa,TenToa,LoaiToa,SoCho)
VALUES('SE010',N'Toa số 10',N'Toa xe giường mềm',24)

--Them du lieu cho bang thongtinkhachhang
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('123294298',N'Lã Như Hải',N'Nam',N'Bình Dương','01298429888','lahai@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('156156156',N'Tôn Thành An',N'Nam',N'TP Hồ Chí Minh','09359382298','tonan@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('229481928',N'Nguyễn Anh Tuấn',N'Nam',N'TP Hồ Chí Minh','01242482899','nguyentuan@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('258275728',N'Vũ Thị Bình',N'Nữ',N'Bình Dương','02491848777','vubinh@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('261525300',N'Nguyễn Thị Ánh',N'Nữ',N'Hà Tĩnh','09435930582','nguyenanh@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('271726709',N'Trương Thị Hồng Ân',N'Nữ',N'Đồng Nai','01864031028','truongan@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('281526888',N'Lê Phú Bình',N'Nam',N'Bình Dương','01232424229','lebinh@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('288899912',N'Nguyễn Văn Hiệu',N'Nam',N'Nam Định','04939359122','nguyenhieu@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('345345345',N'Võ Thế Anh',N'Nam',N'Nghệ An','04939584121','voanh@gmail.com')
INSERT INTO THONGTINKHACHHANG(CMND,HoTen,GioiTinh,DiaChi,SoDT,Email)
VALUES('423958385',N'Lê Quang Bình',N'Nam',N'Quảng Ngãi','09419481988','lebinh@gmail.com')

--Them du lieu cho bang thongtinve
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('001',N'1 chiều',N'Hết vé','G001','G002','NA002','NA1',329000,'20200102')
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('002',N'Khứ hồi',N'Còn vé','G002','G001','NA003','NA2',500000,'20200420')
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('003',N'1 chiều',N'Hết vé','G004','G001','SE010','SE6',1720000,'20200224')
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('004',N'Khứ hồi',N'Hết vé','G004','G001','SE010','SE6',1500000,'20200412')
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('005',N'1 chiều',N'Hết vé','G001','G004','SE009','SE3',1720000,'202020408')
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('006',N'Khứ hồi',N'Hết vé','G001','G004','SE009','SE3',1500000,'20200420')
--UPDATE THONGTINVE
--SET	NgayDi = '20200420'
--WHERE MaVe = '006'
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('007',N'Khứ hồi',N'Hết vé','G001','G005','NA002','NA1',500000,'20200120')
-- UPDATE THONGTINVE
-- SET	NgayDi = '20200120'
-- WHERE MaVe = '007'
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('008',N'Khứ hồi',N'Hết vé','G005','G001','NA003','NA2',500000,'20200308')
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('009',N'1 chiều',N'Hết vé','G005','G001','NA003','NA2',329000,'20200406')
-- UPDATE THONGTINVE
-- SET	NgayDi = '20200406'
-- WHERE MaVe = '009'
-- UPDATE THONGTINVE
-- SET	TrangThai = 'Hết vé'
-- WHERE MaVe = '009'
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('010',N'1 chiều',N'Hết vé','G001','G006','NA002','NA1',329000,'20200502')
-- UPDATE THONGTINVE
-- SET	NgayDi = '20200502'
-- WHERE MaVe = '010'
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('011',N'Khứ hồi',N'Còn vé','G001','G006','NA002','NA1',329000,'20200606')
-- UPDATE THONGTINVE
-- SET	TrangThai = 'Còn vé'
-- WHERE MaVe = '011'
INSERT INTO THONGTINVE(MaVe,LoaiVe,TrangThai,MaGaDi,MaGaDen,MaToa,MaTau,GiaTien,NgayDi)
VALUES('012',N'Khứ hồi',N'Hết vé','G001','G003','SE009','SE3',1800000,'20200120')

--Them du lieu cho bang phieudatve
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP001','010','261525300','20200428',279650,'K02',N'Tại quầy bán vé',4)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP002','006','156156156','20200406',1500000,'K04',N'Qua ngân hàng',3)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP003','012','123294298','20200110',1800000,'K04',N'Tại quầy bán vé',22)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP004','001','345345345','20191206',329000,'K04',N'Tại quầy bán vé',2)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP005','005','258275728','20200331',1548000,'K03',N'Tại quầy bán vé',6)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP006','003','229481928','20200207',1548000,'K03',N'Tại quầy bán vé',20)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP007','004','271726709','20200403',150000,'CSXH02',N'Qua ngân hàng',10)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP008','007','281526888','20200111',500000,'K04',N'Tại quầy bán vé',1)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP009','008','423958385','20200307',450000,'K03',N'Tại quầy bán vé',18)
INSERT INTO PHIEUDATVE(MaPhieu,MaVe,CMND,NgayDat,GiaVe,MaLoaiKhach,PhuongThucThanhToan,ViTriTrongToa)
VALUES('MP010','009','288899912','202000401',296100,'K03',N'Tại quầy bán vé',6)
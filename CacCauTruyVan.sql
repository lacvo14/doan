-- Only one expression can be specified in the select list when the subquery is not introduced with EXISTS.
-- lỗi trên xuất hiện khi 'where' 1 trường 'in' ... nhưng sau in lại có nhiều trường.

--1. Tìm thông tin của tất cả các khách hàng là nữ:
SELECT CMND,HoTen,GioiTinh,DiaChi,SoDT,Email
FROM THONGTINKHACHHANG
WHERE GioiTinh LIKE N'Nữ'

--2. Tìm tên của các khách hàng thuộc đối tượng “Học sinh, sinh viên”:
SELECT t.HoTen
FROM PHIEUDATVE AS p,DOITUONG AS d,THONGTINKHACHHANG AS t
WHERE t.CMND = p.CMND AND p.MaLoaiKhach=d.MaLoaiKhach AND d.TenLoaiKhach LIKE N'Học sinh, sinh viên'

--3. Cho biết tên các ga tàu ở Nghệ An:
SELECT MaGa, TenGa, DiaChi
FROM THONGTINGATAU 
WHERE DiaChi LIKE N'%Nghệ An'

--4. Cho biết tên các khách hàng đặt vé trong tháng 4/2020:
SELECT t.HoTen
FROM PHIEUDATVE AS p,THONGTINKHACHHANG AS t
WHERE p.CMND = t.CMND AND MONTH(p.NgayDat) = 4

--5. Cho biết thông tin của những vé được khách hàng thanh toán qua ngân hàng:
SELECT t.MaVe, t.LoaiVe, t.TrangThai, t.MaGaDi, t.MaGaDen, t.MaToa, t.MaTau, t.GiaTien, t.NgayDi
FROM PHIEUDATVE AS p,THONGTINVE AS t
WHERE p.MaVe = t.MaVe AND p.PhuongThucThanhToan LIKE N'Qua ngân hàng'

--6. Cho biết thông tin của những vé chưa được mua:
SELECT MaVe, LoaiVe, TrangThai, MaGaDi, MaGaDen, MaToa, MaTau, GiaTien, NgayDi
FROM THONGTINVE
WHERE TrangThai LIKE N'Còn vé'

-- 7. Cho biết thông tin các tàu thuộc loại tàu “Đầu máy điện”:
SELECT MaTau, TenTau, LoaiTau, SoToa
FROM THONGTINTAU
WHERE LoaiTau LIKE N'Đầu máy điện'

-- 8. Cho biết thông tin các toa thuộc loại toa “Toa xe giường mềm”:
SELECT MaToa, TenToa, LoaiToa, SoCho
FROM THONGTINTOA
WHERE LoaiToa LIKE N'Toa xe giường mềm'

-- 9. Tìm những tàu có nhiều toa nhất:
SELECT t.MaTau,t.TenTau,t.LoaiTau,t.SoToa
FROM THONGTINTAU AS t
WHERE t.SoToa = (SELECT TOP 1 SoToa
				FROM THONGTINTAU
				ORDER BY SoToa DESC)

-- 10. Tìm tất cả những tàu xuất phát từ ga Chợ Tía (Mã ga là G001):
SELECT MaTau,TenTau,LoaiTau,SoToa
FROM THONGTINTAU
WHERE MaTau IN (SELECT MaTau
				FROM THONGTINVE
				WHERE MaGaDi = (SELECT MaGa
								FROM THONGTINGATAU
								WHERE TenGa LIKE N'Chợ Tía'
								)
				)

-- 11. Cho biết những đối tượng có phần trăm giảm giá lớn hơn hoặc bằng 50%:
SELECT MaLoaiKhach,TenLoaiKhach,PhanTramGiamGia
FROM DOITUONG
WHERE PhanTramGiamGia >=50
	
-- 12. Cho biết những khách hàng đi về ga Yên Trung hoặc Yên Xuân:
SELECT t.CMND,t.HoTen,t.GioiTinh,t.DiaChi,t.SoDT,t.Email
FROM THONGTINKHACHHANG AS t,PHIEUDATVE AS p,THONGTINVE AS t2
WHERE t.CMND = p.CMND AND p.MaVe = t2.MaVe AND t2.MaGaDen IN
(
	SELECT MaGa	
	FROM THONGTINGATAU
	WHERE TenGa LIKE N'Yên Xuân' OR TenGa LIKE N'Yên Trung'
)

-- 13. Tìm những toa có số lượng chứa khách lớn hơn hoặc bằng 24:
SELECT MaToa,TenToa,LoaiToa,SoCho
FROM THONGTINTOA
WHERE SoCho >=24

-- 14. Tìm những khách hàng có giới tính “Nam” và có địa chỉ ở “Bình Dương”:
SELECT CMND, HoTen, GioiTinh, DiaChi, SoDT, Email
FROM THONGTINKHACHHANG
WHERE GioiTinh LIKE N'Nam' AND DiaChi LIKE N'Bình Dương'

-- 15. Đếm số lượng vé của mỗi loại vé tàu:
SELECT LoaiVe, COUNT(LoaiVe) AS 'Số lượng'
FROM THONGTINVE
GROUP BY LoaiVe

-- 16. Tìm những vé có giá tiền rẻ nhất:
SELECT t.MaVe,t.LoaiVe,t.TrangThai,t.MaGaDi,t.MaGaDen,t.MaToa,t.MaTau,t.GiaTien,t.NgayDi
FROM THONGTINVE AS t
WHERE t.GiaTien = (SELECT TOP 1 GiaTien
				FROM THONGTINVE
				ORDER BY GiaTien)

-- 17. Cho biết tên khách hàng và tên toa mà khách hàng đó sẽ đi:
-------------------------------------
SELECT t.HoTen, t2.TenToa
FROM THONGTINKHACHHANG AS t, THONGTINTOA AS t2, PHIEUDATVE AS p, THONGTINVE AS t3
WHERE t.CMND = p.CMND AND t2.MaToa = t3.MaToa AND p.MaVe = t3.MaVe

-- 18. Cho biết những khách hàng đi chuyến tàu Hà Nội – Vinh:
SELECT CMND,HoTen,GioiTinh,DiaChi,SoDT, Email
FROM THONGTINKHACHHANG
WHERE CMND IN (SELECT CMND
				FROM PHIEUDATVE
				WHERE MaVe IN(SELECT MaVe
							FROM THONGTINVE
							WHERE MaTau = (SELECT MaTau
											FROM THONGTINTAU
											WHERE TenTau LIKE N'%Hà Nội - Vinh'							
										)
					
							)
				) 

-- 19. Cho biết thông tin những khách hàng tên “Bình”, có địa chỉ ở “Bình Dương” và không thuộc đối tượng giảm giá vé:
SELECT CMND,HoTen,GioiTinh,DiaChi,SoDT,Email
FROM THONGTINKHACHHANG
WHERE HoTen LIKE N'%Bình' AND DiaChi LIKE N'Bình Dương'
AND CMND IN (SELECT CMND
			FROM PHIEUDATVE
			WHERE MaLoaiKhach = (SELECT MaLoaiKhach 
								FROM DOITUONG
								WHERE PhanTramGiamGia = 0)
			)

-- 20. Tính thời gian mà mỗi khách hàng phải chờ từ ngày đặt vé đến ngày đi tàu:
SELECT p.MaPhieu,p.NgayDat,t.MaVe,t.NgayDi,DATEDIFF(dd,p.NgayDat,t.NgayDi) AS 'Số ngày khách hàng phải chờ'
FROM PHIEUDATVE AS p, THONGTINVE AS t
WHERE p.MaVe = t.MaVe;
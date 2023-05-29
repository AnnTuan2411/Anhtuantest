-- Tạo database
CREATE DATABASE CarRentalManagement;
USE CarRentalManagement;

-- Tạo bảng System Admin
CREATE TABLE SystemAdministrators (
  admin_id INT PRIMARY KEY,
  username NVARCHAR(30),
  password NVARCHAR(30),
  full_name NVARCHAR(50),
  email NVARCHAR(50),
  phone NVARCHAR(10)
);

-- Tạo bảng Fleet Manager
CREATE TABLE FleetManagers (
  manager_id INT PRIMARY KEY,
  username NVARCHAR(30),
  password NVARCHAR(30),
  full_name NVARCHAR(50),
  email NVARCHAR(50),
  phone NVARCHAR(10)
);

-- Tạo bảng Staffs
CREATE TABLE Staffs (
  staff_id INT PRIMARY KEY,
  username NVARCHAR(30),
  password NVARCHAR(30),
  full_name NVARCHAR(50),
  email NVARCHAR(50),
  phone NVARCHAR(10)
);

-- Tạo bảng Customers
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  full_name NVARCHAR(50),
  email NVARCHAR(50),
  phone NVARCHAR(10),
  driver_license_number NVARCHAR(20),
  username NVARCHAR(30),
  password NVARCHAR(30),
);

-- Tạo bảng Locations
CREATE TABLE Locations (
  location_id INT PRIMARY KEY,
  name NVARCHAR(50),
  address NVARCHAR(100)
);

-- Tạp bảng Categories
CREATE TABLE Categories (
  category_id INT PRIMARY KEY,
  number_of_seats nvarchar(10)
);

-- Tạo bảng Cars
CREATE TABLE Cars (
  car_id INT PRIMARY KEY,
  name NVARCHAR(50),
  category_id  int,
  detail NVARCHAR (max),
  registration_number NVARCHAR(20),
  location_id INT,
  image NVARCHAR(20),
  cost int,
  status NVARCHAR(20),
  FOREIGN KEY (location_id) REFERENCES Locations(location_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Tạo bảng Rentals
CREATE TABLE Rentals (
  rental_id INT PRIMARY KEY,
  customer_id INT,
  rental_start_date DATE,
  rental_end_date DATE,
  pickup_location_id INT,
  return_location_id INT,
  total_cost DECIMAL(10, 2),
  rental_status NVARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (pickup_location_id) REFERENCES Locations(location_id),
  FOREIGN KEY (return_location_id) REFERENCES Locations(location_id)
);

-- Tạo bảng RentalItems
CREATE TABLE RentalItems (
  rental_item_id INT PRIMARY KEY,
  rental_id INT,
  car_id INT,
  FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id),
  FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

-- Tạo bảng Transactions
CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY,
  rental_id INT,
  transaction_date DATE,
  FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);

-- Nhập dữ liệu SystemAdministrators
INSERT INTO SystemAdministrators (admin_id, username, password, full_name, email, phone)
VALUES
  (1, 'admin1', 'password1', N'Hồ Quốc A', 'admin1@example.com', '1234567890'),
  (2, 'admin2', 'password2', N'Nguyễn Thị B', 'admin2@example.com', '9876543210'),
  (3, 'admin3', 'password3', N'Trần Văn C', 'admin3@example.com', '4567890123'),
  (4, 'admin4', 'password4', N'Lê Thị D', 'admin4@example.com', '7890123456'),
  (5, 'admin5', 'password5', N'Phạm Văn E', 'admin5@example.com', '0123456789');

-- Nhập dữ liệu FleetManagers
INSERT INTO FleetManagers (manager_id, username, password, full_name, email, phone)
VALUES
  (1, 'manager1', 'password1', N'Nguyễn Văn A', 'manager1@example.com', '1234567890'),
  (2, 'manager2', 'password2', N'Hoàng Thị B', 'manager2@example.com', '9876543210'),
  (3, 'manager3', 'password3', N'Trương Minh C', 'manager3@example.com', '4567890123'),
  (4, 'manager4', 'password4', N'Nguyễn Thanh D', 'manager4@example.com', '7890123456'),
  (5, 'manager5', 'password5', N'Vũ Đức E', 'manager5@example.com', '0123456789');

-- Nhập dữ liêu Staffs
INSERT INTO Staffs(staff_id, username, password, full_name, email, phone)
VALUES
  (1, 'staff1', 'password1', N'Hồ Quốc A', 'staff1@example.com', '1234567890'),
  (2, 'staff2', 'password2', N'Nguyễn Thị B', 'staff2@example.com', '9876543210'),
  (3, 'staff3', 'password3', N'Trần Văn C', 'staff3@example.com', '4567890123'),
  (4, 'staff4', 'password4', N'Lê Thị D', 'staff4@example.com', '7890123456'),
  (5, 'staff5', 'password5', N'Phạm Văn E', 'staff5@example.com', '0123456789');

-- Nhập dữ liệu Locations
INSERT INTO Locations (location_id, name, address)
VALUES
  (1, N'Hà Nội', '123 Đường Chính'),
  (2, N'Hồ Chí Minh', '456 Đường Cây Đa'),
  (3, N'Đà Nẵng', '789 Đường Cây Sồi'),
  (4, N'Hội An', '321 Đường Cây Trúc'),
  (5, N'Bình Dương', '654 Đường Cây Phong');

-- Nhập dữ liệu Categories
INSERT INTO Categories (category_id, number_of_seats)
VALUES 
	(1, N'4 chỗ'), (2, N'5 chỗ'), (3, N'7 chỗ');

-- Nhập dữ liệu Cars
INSERT INTO Cars (car_id, name, category_id, detail, registration_number, location_id, image, status, cost)
VALUES
  (1, N'FORD RANGER RAPTOR 2019', 1, N'Bán tải Ford Raptor máy dầu số tự động . Đăng ký 1/2019. Xe full option gia đình sử dụng. Full chức năng hỗ trợ lái xe an toàn. Rửa xe miễn phí cho khách. Dạng nắp thùng cuộn', 'ABC123', 1, 'car1.jpg', 'Available', 200),
  (2, N'HYUNDAI ACCENT 2022', 1, N'Vinfast LUX A 2.0, sản xuất 2020. Xe mới sạch-mạnh-rộng rãi-xe trang bị', 'DEF456', 2, 'car2.jpg', 'Available', 150),
  (3, N'MAZDA 3', 1, N'MAZDA 3 tự động, sản xuất 6/2018. Cruise Control, phanh tay điện tử,...Xe gia đình không mùi', 'GHI789', 3, 'car3.jpg', 'Available', 180),
  (4, N'VINFAST FADIL 2020', 1, N'VinfastFadil, san xuat 2020. Xe gia dinh', 'JKL012', 4, 'car4.jpg', 'Available', 160),
  (5, N'VINFAST LUX A 2.0', 1, N'Vinfast LUX A 2.0, san xuat 2020. Xe mới sạch-manh-rộng rãi-xe trang bị', 'MNO345', 5, 'car5.jpg', 'Available', 250),
  (6, N'KIA K5 2022', 2, N'KIA K5 Trùm phân khúc sedan hạng D. Xe đăng ký mới 2022 KIA K5 là mẫu mới dành cho anh/chị em muốn thuê trải nghiệm, mang phiên bản Prenium màu đỏ công nghệ 4.0 hiện đại chạy rất sướng trên mọi cung đường. Xe có trang bị thêm bộ mâm VLT giúp xe chạy nhẹ, êm hơn bản zin và đẹp xe hơn.', 'PQR678', 1, 'car6.jpg', 'Available', 220),
  (7, N'KIA MORNING 2017', 2, N'Xe rất Tiết Kiệm Xăng . bảo dưỡng tốt. Có cảm biến mùi, bảo hiểm 2 chiều, Anh Chị an tâm sử dụng. Xe Được khử khuẩn Nano sau mỗi lần sử dụng', 'STU901', 2, 'car7.jpg', 'Available', 100),
  (8, N'MORRIS GARAGES MG5 STANDARD 2022', 2, N'Xe mới tháng 11/2022', 'VWX234', 3, 'car8.jpg', 'Available', 190),
  (9, N'VINFAST FADIL 2019', 2, N'Xe Fadil bản Full, gia đình đi nên sạch sẽ thơm tho. Nội thất đẹp, ghế da sang trọng. Siêu tiết kiệm xăng.', 'YZA567', 4, 'car9.jpg', 'Available', 170),
  (10, N'VINFAST FADIL 2022', 2, N'Xe sạch sẽ, thơm tho, có bảo hiểm', 'BCD890', 5, 'car10.jpg', 'Available', 210),
  (11, N'CHEVROLET CAPTIVA 2016', 3, N'Xe Captiva đã được đầu tư trang bị tận răng mọi tiện nghi của xe, bản cao cấp nhất của Chevrolet, trang bị thêm phi thuyền phù hợp các chuyến đi cần để hành lí nhiều.', 'EFG123', 1, 'car11.jpg', 'Available', 280),
  (12, N'HYUNDAI SANTA FE 2018', 3, N'Huynhdai santafe số tự động đăng ký thá 4/2018. Xe gia đình mới đep . Nội thất nguyen bản, sạch sẽ , bảo dưỡng thường xuyen, rửa xe miễn phi cho khách.Xe rộng  rãi,an toàn, tiện nghi phù hợp cho gia đình đi du lich . Xe được trang bị hệ thống đầy đủ và hiện đại', 'HIJ456', 2, 'car12.jpg', 'Available', 300),
  (13, N'MITSUBISHI XPANDER 2019', 3, N'Xpander 2019, màu bạc, 7 chỗ, xe mới. Xe gia đình nên được giữ gìn cẩn thận, bảo dưỡng định kỳ.', 'KLM789', 3, 'car13.jpg', 'Available', 230),
  (14, N'MITSUBISHI XPANDER 2020', 3, N'Xe gia đình hiệu Xpander màu đỏ, số tự động. 7 chỗ đa dụng, rộng rãi. Động cơ 1.5đủ dùng đi trong phố hoặc tham quan các điểm du lịch. Xe sản xuất và nhập tháng 10/2019. Được trang bị màn hình giải trí, dẫn đường, ra lệnh giọng nói, camera hành trình. Xe luôn được bảo dưỡng định kì, rửa xe sạch sẽ mỗi lần sử dụng', 'PQR012', 4, 'car14.jpg', 'Available', 240),
  (15, N'SUZUKI XL7 2021', 3, N'Suzuki XL7 stđ đời 2021 chạy rất tiết kiệm nhiên liệu.', 'STU345', 5, 'car15.jpg', 'Available', 270);

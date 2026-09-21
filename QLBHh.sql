-- 1. Tạo cơ sở dữ liệu QuanLyBanHang
CREATE DATABASE IF NOT EXISTS QuanLyBanHang;
USE QuanLyBanHang;

-- 2. Tạo bảng Customer (Khách hàng)
CREATE TABLE Customer (
    cID INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(100) NOT NULL,
    cAge TINYINT CHECK (cAge > 0)
);

-- 3. Tạo bảng Order (Hóa đơn)
CREATE TABLE `Order` (
    oID INT AUTO_INCREMENT PRIMARY KEY,
    cID INT NOT NULL,
    oDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    oTotalPrice DECIMAL(12, 2) DEFAULT NULL,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

-- 4. Tạo bảng Product (Sản phẩm)
CREATE TABLE Product (
    pID INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(150) NOT NULL,
    pPrice DECIMAL(12, 2) NOT NULL CHECK (pPrice >= 0)
);

-- 5. Tạo bảng OrderDetail (Chi tiết hóa đơn - Bảng trung gian n-m)
CREATE TABLE OrderDetail (
    oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT NOT NULL CHECK (odQTY > 0),
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);
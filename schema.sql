-- KỊCH BẢN TẠO CƠ SỞ DỮ LIỆU VÀ BẢNG CHO DỰ ÁN SAKURA TASK MANAGER
-- Cơ sở dữ liệu: Tên nhóm (Ví dụ: Nhom1_DB)

-- Bước 1: Tạo Cơ sở dữ liệu (Người dùng có thể tự chạy thủ công hoặc đổi tên)
-- CREATE DATABASE Nhom1_DB;
-- GO
-- USE Nhom1_DB;
-- GO

-- Bước 2: Tạo bảng Users (Tài khoản người dùng)
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL -- 'ADMIN' hoặc 'USER'
);

-- Bước 3: Tạo bảng Tasks (Danh sách công việc)
CREATE TABLE tasks (
    id INT IDENTITY(1,1) PRIMARY KEY,
    task_code VARCHAR(50) NOT NULL UNIQUE,
    task_name NVARCHAR(200) NOT NULL,
    description NVARCHAR(MAX),
    assignee NVARCHAR(100),
    due_date DATE,
    status VARCHAR(20) DEFAULT 'TODO' -- 'TODO', 'IN_PROGRESS', 'DONE'
);

-- Bước 4: Chèn dữ liệu mẫu (Dữ liệu bắt buộc theo đề thi)
INSERT INTO users (username, password, role) VALUES 
('baohg', '123', 'ADMIN'), -- Nhóm trưởng (ADMIN)
('user1', '123456', 'USER');    -- Thành viên (USER)

-- Bước 5: Chèn một số công việc mẫu (Phong cách Nhật Bản)
INSERT INTO tasks (task_code, task_name, description, assignee, due_date, status) VALUES 
('TASK-001', N'Thiết kế giao diện cổng chào Torii', N'Vẽ phác thảo và lập trình CSS cổng chào Torii mang đậm bản sắc Kyoto.', N'Nguyễn Thành Trung', '2026-06-01', 'TODO'),
('TASK-002', N'Tích hợp hiệu ứng hoa anh đào rơi', N'Lập trình hiệu ứng hoạt cảnh CSS falling sakura petals nhẹ nhàng, mượt mà.', N'Phan Văn Nam', '2026-05-30', 'IN_PROGRESS'),
('TASK-003', N'Cấu hình bộ lọc Servlet Filter an ninh', N'Chặn đứng mọi truy cập trái phép từ những kẻ xâm nhập chưa đăng nhập.', N'Lê Thị Mai', '2026-05-29', 'DONE');

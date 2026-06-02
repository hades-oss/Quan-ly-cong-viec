# ĐỀ THI THỰC HÀNH JAVA WEB MVC
## One Day Web Application Challenge 2026

### 1. Mục tiêu môn học
Bài thi được xây dựng nhằm đánh giá khả năng của sinh viên trong việc:
* **Hiểu cơ chế hoạt động của Web:** HTTP, Request/Response, Servlet Lifecycle.
* **Thiết kế và triển khai ứng dụng** theo mô hình **MVC**.
* **Xây dựng hệ thống CRUD** bằng: JDBC, Repository Pattern.
* **Phát triển giao diện JSP** sử dụng: EL, JSTL, Layout MVC chuẩn.
* **Triển khai bảo mật:** Authentication, Authorization, Session, Filter.
* **Tích hợp mở rộng (nếu có):** JPA, JSON API, Ajax.

---

### 2. Chủ đề bài thi
**Xây dựng hệ thống quản lý công việc nhóm (Team Task Management System)**

Ứng dụng cho phép người dùng:
1. Đăng nhập hệ thống
2. Quản lý công việc
3. Phân quyền người dùng
4. Tìm kiếm và lọc dữ liệu
5. Cập nhật trạng thái công việc bằng Ajax

---

### 3. Thời gian và hình thức thi
| Nội dung | Thông tin chi tiết |
| :--- | :--- |
| **Hình thức** | Thi theo nhóm |
| **Thời gian** | 40 phút |
| **Công nghệ bắt buộc** | JSP/Servlet |
| **Database** | SQL Server |

> [!IMPORTANT]
> * **Tên Cơ sở dữ liệu:** Là tên của nhóm.
> * **Tên đăng nhập quản trị (Admin):** Là tên viết tắt của nhóm trưởng.
> * *Ví dụ:* Nhóm trưởng tên *Nguyễn Thành Trung* thì tên đăng nhập với quyền admin là `baohg`.

---

### 4. Công nghệ và kỹ thuật bắt buộc
#### Backend
* Servlet
* JSP
* JDBC
* Filter
* Session

#### Frontend
* HTML/CSS/JavaScript
* JSP EL
* JSTL

#### Kiến trúc
* MVC Pattern
* Repository Pattern

---

### 5. Công nghệ Khuyến khích / Nâng cao
* JPA/Hibernate
* Responsive UI
* Dashboard thống kê

---

### 6. Yêu cầu chức năng

#### A. Authentication & Authorization (20 điểm)
1. **Đăng nhập:** Người dùng đăng nhập bằng `username` và `password`. Thông tin tài khoản được lưu trong database.
2. **Session Management:** Sau khi đăng nhập thành công, lưu thông tin user bằng Session. Không cho phép truy cập các trang quản lý nếu chưa đăng nhập.
3. **Filter:** Sử dụng Filter để kiểm tra đăng nhập và ngăn chặn truy cập trái phép.
4. **Phân quyền:**
   * **ADMIN:** Quản lý toàn bộ công việc (Thêm / Sửa / Xóa).
   * **USER:** Chỉ xem danh sách công việc.

**Tài khoản mẫu:**
| Username | Password | Role |
| :--- | :--- | :--- |
| `baohg` | `123` | **ADMIN** |
| `user1` | `123456` | **USER** |

---

#### B. Quản lý công việc CRUD
Mỗi công việc (Task) gồm các thông tin:
| Trường | Kiểu dữ liệu | Mô tả |
| :--- | :--- | :--- |
| `id` | `int` | Khóa chính |
| `task_code` | `varchar` | Mã công việc |
| `task_name` | `varchar` | Tên công việc |
| `description` | `text` | Mô tả chi tiết |
| `assignee` | `varchar` | Người thực hiện |
| `due_date` | `date` | Hạn hoàn thành |
| `status` | `varchar` | Trạng thái (`TODO`, `IN_PROGRESS`, `DONE`) |

**Chức năng bắt buộc:**
1. **Danh sách công việc:** Hiển thị dạng bảng sử dụng thẻ JSTL `<c:forEach>`.
2. **Thêm công việc:** Thực hiện kiểm tra hợp lệ (Validation):
   * `task_name` không được để trống.
   * `task_code` không được trùng lặp.
3. **Cập nhật công việc.**
4. **Xóa công việc:** Phải có hộp thoại xác nhận (Confirm) trước khi xóa.

---

#### C. JSP + EL + JSTL
Bắt buộc sử dụng:
* Expression Language (EL): `${...}`
* JSTL Core tags: `<c:forEach>`, `<c:if>`

---

#### D. Tìm kiếm & lọc dữ liệu
Cho phép người dùng:
* Tìm kiếm công việc theo tên (`task_name`).
* Lọc công việc theo trạng thái (`status`).

---

#### E. Database & Repository Pattern
Yêu cầu kiến trúc:
* Sử dụng **JDBC** kết nối cơ sở dữ liệu.
* Tách biệt tầng dữ liệu bằng cách sử dụng **Repository/DAO Pattern** (Ví dụ: `TaskRepository`, `UserRepository`).

---

### 11. Nội dung demo với giám khảo
Mỗi nhóm cần:
1. Chạy ứng dụng thành công.
2. Demo mượt mà các chức năng chính theo yêu cầu của đề thi.

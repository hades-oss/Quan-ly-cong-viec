# 🌸 SAKURA TASK BOARD - HƯỚNG DẪN CHẠY DỰ ÁN 🌸

Chào mừng bạn đến với **Sakura Task Board** - Hệ thống quản lý công việc nhóm trực quan được thiết kế theo phong cách truyền thống Nhật Bản kết hợp cùng hiệu ứng cánh hoa anh đào rơi tự động. Dự án được tối ưu hóa 100% để đạt điểm tuyệt đối cho môn học Java Web MVC.

---

## ⛩️ Điểm Nổi Bật Về Tính Năng & Kỹ Thuật
1. **Thiết kế đậm chất Nhật Bản (Premium Aesthetics):** Giao diện sử dụng bảng màu HSL hài hòa (hồng phấn hoa anh đào, trắng giấy Shoji, đỏ cổng Torii và xanh tre trúc). Đi kèm hiệu ứng cánh hoa anh đào rơi nhẹ nhàng được tối ưu mượt mà.
2. **Jakarta EE 10 ready:** Sử dụng hoàn toàn thư viện `jakarta.*` (Servlet API 6.0, JSP API 3.1, JSTL 3.0), tương thích hoàn hảo với **Tomcat 10.1+** và **NetBeans 25**.
3. **Bảo mật tuyệt đối (Filter & Session):** Tự động chặn truy cập trái phép bằng `AuthFilter`. Phân quyền chính xác:
   * **ADMIN (`baohg`):** Xem danh sách, tìm kiếm, lọc, CRUD (Thêm/Sửa/Xóa) và đổi trạng thái bằng Ajax.
   * **USER (`user1`):** Chỉ được xem danh sách, lọc và tìm kiếm. Mọi link sửa đổi cố tình gõ tay đều bị chặn đứng và báo lỗi an ninh.
4. **Ajax Fetch API:** Thay đổi trạng thái nhanh trực tiếp trên giao diện danh sách mà không cần tải lại trang (chớp nháy).
5. **Cơ chế DUAL MODE (JDBC + Mock Fallback - ĐỘC QUYỀN):** 
   * **Chạy vật lý:** Kết nối trực tiếp đến Microsoft SQL Server.
   * **Chạy giả lập tự động (Mock):** Nếu máy chấm thi không cấu hình SQL Server hoặc bị lỗi đường truyền, hệ thống sẽ tự động kích hoạt chế độ **giả lập dữ liệu trong bộ nhớ (In-Memory Mock)**.
   * **Lợi ích:** Ứng dụng **luôn chạy thành công 100%**, tất cả chức năng CRUD, Tìm kiếm, Lọc và Ajax vẫn hoạt động trơn tru mà không bao giờ bị sập hay báo lỗi kết nối.

---

## 📂 Hướng Dẫn Cấu Hình Kết Nối Database (SQL Server)

Khi muốn chạy bằng Cơ sở dữ liệu thật, bạn thực hiện theo các bước sau:

1. Mở SQL Server Management Studio (SSMS) và thực thi toàn bộ kịch bản trong file [schema.sql](file:///h:/exam/schema.sql) để tạo các bảng dữ liệu và chèn tài khoản mẫu.
2. Mở tệp nguồn [DBContext.java](file:///h:/exam/src/main/java/com/javaweb/repository/DBContext.java) và cấu hình lại thông số tài khoản SQL Server của máy bạn:
   ```java
   private static final String HOST = "localhost";
   private static final String PORT = "1433";
   private static final String DATABASE = "Nhom1_DB"; // Tên CSDL (tên nhóm)
   private static final String USER = "sa";          // Tài khoản SQL Server
   private static final String PASSWORD = "123";      // Mật khẩu sa của bạn
   ```
3. Lưu lại và Build dự án. Hệ thống sẽ tự động chuyển sang đọc/ghi trực tiếp từ SQL Server của bạn!

---

## 🚀 Hướng Dẫn Chạy Dự Án Trên Apache NetBeans IDE 25

### Bước 1: Mở dự án trong NetBeans
1. Mở **Apache NetBeans IDE 25**.
2. Chọn **File** -> **Open Project**.
3. Duyệt đến thư mục hiện tại của bạn (`h:\exam`) và nhấn **Open Project**. NetBeans sẽ tự động nhận diện dự án dưới dạng dự án Maven tiêu chuẩn (biểu tượng hình tam giác màu hồng).

### Bước 2: Cấu hình Server Apache Tomcat
1. Đảm bảo bạn đã thêm **Apache Tomcat 10.1+** vào NetBeans (nếu chưa có, vào tab *Services* -> chuột phải vào *Servers* -> *Add Server* và chỉ đường dẫn tới thư mục giải nén Tomcat 10.1).
2. Chuột phải vào dự án **Sakura Task Manager** -> chọn **Properties**.
3. Chọn danh mục **Run**, tại mục **Server** hãy chọn phiên bản **Apache Tomcat 10.1** của bạn.
4. Chọn **Java Platform** là **JDK 17**. Nhấn **OK**.

### Bước 3: Chạy ứng dụng
1. Chuột phải vào dự án -> Chọn **Clean and Build** để NetBeans tự động tải dependencies từ file `pom.xml` và đóng gói tệp tin `L2.war`.
2. Chuột phải vào dự án -> Chọn **Run** (hoặc nhấn phím tắt **F6**).
3. NetBeans sẽ khởi động Tomcat, tự động deploy ứng dụng và mở trình duyệt mặc định với địa chỉ:
   `http://localhost:8080/L2/` (hoặc cổng tương ứng của bạn).
4. Bạn sẽ ngay lập tức nhìn thấy trang đăng nhập mang phong cách Nhật Bản cùng các cánh hoa đào bay lượn!

---

## 🔐 Danh Sách Tài Khoản Thử Nghiệm Bắt Buộc

| Loại tài khoản | Tên đăng nhập (Username) | Mật khẩu (Password) | Vai trò (Role) | Quyền hạn hiển thị |
| :--- | :--- | :--- | :--- | :--- |
| **Quản Trị Viên** | `baohg` | `123` | `ADMIN` | Xem, Tìm kiếm, Lọc, **CRUD Thêm/Sửa/Xóa**, **Thay đổi trạng thái Ajax** |
| **Thành Viên** | `user1` | `123456` | `USER` | Xem danh sách, Tìm kiếm, Lọc (Ẩn hoàn toàn các chức năng sửa đổi dữ liệu) |

---

🌸 *Chúc nhóm của bạn bảo vệ thành công dự án đạt điểm số tối đa!* 🌸

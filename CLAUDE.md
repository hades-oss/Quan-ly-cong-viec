# LAB2 CONTEXT — JSP/Servlet

## TECH STACK (BẮT BUỘC)
* **Java Version:** Java 17
* **Java Web Specification:** Jakarta EE 10 (KHÔNG dùng `javax.*`, CHỈ dùng `jakarta.*`)
* **Application Server:** Apache Tomcat 10.1+
* **Build Tool:** Maven (WAR packaging)
* **IDE Target:** Apache NetBeans IDE 25
* **Web Framework:** JSP/Servlet (KHÔNG dùng Spring, KHÔNG dùng Spring Boot)
* **Namespace Imports:** 
  * `jakarta.servlet.*`
  * `jakarta.servlet.http.*`
  * `jakarta.servlet.annotation.*`
* **Configuration:** Sử dụng Annotation `@WebServlet` (KHÔNG dùng web.xml servlet-mapping trừ cấu hình chung nếu cần)
* **Database:** Microsoft SQL Server
* **Connection:** JDBC Driver (`mssql-jdbc`)
* **Pattern:** MVC Pattern + Repository Pattern

---

## CẤU TRÚC PROJECT (Maven Standard)
```
L2/
├── pom.xml
├── CLAUDE.md
└── src/
    └── main/
        ├── java/
        │   └── com/javaweb/
        │       ├── model/       ← JavaBean (POJO): User.java, Task.java
        │       ├── repository/  ← Lớp kết nối DB và xử lý dữ liệu (UserRepository.java, TaskRepository.java)
        │       ├── filter/      ← Filter kiểm tra quyền (AuthFilter.java)
        │       └── servlet/     ← HttpServlet classes (LoginServlet, TaskServlet, v.v.)
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml      ← Cấu hình chào mừng trang chủ hoặc lỗi nếu cần
            └── views/
                ├── auth/        ← Giao diện đăng nhập
                │   └── login.jsp
                └── task/        ← Giao diện quản lý công việc
                    ├── list.jsp
                    ├── create.jsp
                    └── update.jsp
```

---

## pom.xml — DEPENDENCY BẮT BUỘC
```xml
<dependency>
  <groupId>jakarta.servlet</groupId>
  <artifactId>jakarta.servlet-api</artifactId>
  <version>6.0.0</version>
  <scope>provided</scope>
</dependency>
<dependency>
  <groupId>jakarta.servlet.jsp</groupId>
  <artifactId>jakarta.servlet.jsp-api</artifactId>
  <version>3.1.0</version>
  <scope>provided</scope>
</dependency>
<dependency>
  <groupId>jakarta.servlet.jsp.jstl</groupId>
  <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
  <version>3.0.0</version>
</dependency>
<dependency>
  <groupId>org.glassfish.web</groupId>
  <artifactId>jakarta.servlet.jsp.jstl</artifactId>
  <version>3.0.0</version>
</dependency>
<dependency>
  <groupId>com.microsoft.sqlserver</groupId>
  <artifactId>mssql-jdbc</artifactId>
  <version>12.2.0.jre11</version>
</dependency>
```

---

## BÀI TẬP

### Bài 1: Đăng nhập và Phân quyền (Authentication & Authorization)
* **Mô tả:** Xây dựng hệ thống đăng nhập bảo mật và phân quyền truy cập giữa 2 nhóm người dùng: ADMIN (toàn quyền quản lý) và USER (chỉ xem danh sách công việc). Sau khi đăng nhập, thông tin người dùng được lưu trữ trong Session. Hệ thống chặn tất cả các yêu cầu truy cập trái phép vào trang quản lý khi chưa đăng nhập.
* **File cần tạo:**
  * `com.javaweb.model.User.java` (JavaBean chứa: id, username, password, role)
  * `com.javaweb.repository.UserRepository.java` (Kiểm tra thông tin đăng nhập trong database)
  * `com.javaweb.servlet.LoginServlet.java` (Xử lý GET hiển thị form, POST xử lý xác thực và lưu Session)
  * `com.javaweb.servlet.LogoutServlet.java` (Hủy Session và chuyển hướng về trang đăng nhập)
  * `com.javaweb.filter.AuthFilter.java` (Chặn truy cập trái phép bằng cách kiểm tra Session)
  * `views/auth/login.jsp` (Giao diện form đăng nhập)
* **Yêu cầu kỹ thuật:**
  * Sử dụng Filter kế thừa `HttpFilter` của `jakarta.servlet` để kiểm tra đăng nhập.
  * Phân quyền cụ thể dựa trên vai trò (`role`):
    * Tài khoản Admin mẫu: `baohg` / `123` (Quyền ADMIN: CRUD)
    * Tài khoản User mẫu: `user1` / `123456` (Quyền USER: Chỉ xem)
  * Dữ liệu tài khoản phải được lưu và kiểm tra từ cơ sở dữ liệu SQL Server.
* **Hình minh họa:** *(Tài liệu gốc không kèm theo hình ảnh trực quan)*

---

### Bài 2: Quản lý công việc CRUD (Task Management)
* **Mô tả:** Xây dựng chức năng hiển thị danh sách công việc dạng bảng, cho phép ADMIN thêm mới công việc với kiểm tra dữ liệu hợp lệ, cập nhật thông tin công việc hiện tại, và xóa công việc với yêu cầu xác nhận trước khi thực hiện.
* **File cần tạo:**
  * `com.javaweb.model.Task.java` (JavaBean chứa: id, task_code, task_name, description, assignee, due_date, status)
  * `com.javaweb.repository.TaskRepository.java` (Thực hiện CRUD bằng JDBC kết nối SQL Server)
  * `com.javaweb.servlet.TaskListServlet.java` (Hiển thị danh sách công việc)
  * `com.javaweb.servlet.TaskCreateServlet.java` (Hiển thị form thêm và xử lý lưu công việc)
  * `com.javaweb.servlet.TaskUpdateServlet.java` (Hiển thị form sửa và xử lý lưu thay đổi)
  * `com.javaweb.servlet.TaskDeleteServlet.java` (Xử lý xóa công việc khi có yêu cầu)
  * `views/task/list.jsp` (Giao diện danh sách)
  * `views/task/create.jsp` (Giao diện thêm mới)
  * `views/task/update.jsp` (Giao diện chỉnh sửa)
* **Yêu cầu kỹ thuật:**
  * **Danh sách công việc:** Sử dụng thẻ JSTL `<c:forEach>` và Expression Language `${}` để duyệt hiển thị dữ liệu lên bảng HTML.
  * **Thêm công việc:** Thực hiện validation bắt buộc:
    * `task_name` không được để trống.
    * `task_code` không được trùng lặp trong hệ thống.
  * **Xóa công việc:** Sử dụng JavaScript hiển thị hộp thoại `confirm()` xác nhận trước khi gửi yêu cầu xóa về Servlet.
* **Hình minh họa:** *(Tài liệu gốc không kèm theo hình ảnh trực quan)*

---

### Bài 3: Tìm kiếm, Lọc và Cập nhật trạng thái bằng Ajax (Search, Filter & Ajax)
* **Mô tả:** Xây dựng chức năng tìm kiếm công việc theo tên, lọc danh sách công việc theo trạng thái (`TODO`, `IN_PROGRESS`, `DONE`) và cho phép người dùng thay đổi nhanh trạng thái công việc trực tiếp trên giao diện danh sách bằng công nghệ Ajax mà không cần tải lại toàn bộ trang.
* **File cần tạo:**
  * `com.javaweb.servlet.TaskStatusAjaxServlet.java` (Nhận yêu cầu cập nhật trạng thái qua Ajax và phản hồi trạng thái JSON/Text)
  * Tích hợp mã nguồn JavaScript (Ajax Fetch / XHR) trong `views/task/list.jsp`.
* **Yêu cầu kỹ thuật:**
  * Tạo các phần tử `<input type="text">` tìm kiếm và `<select>` lọc trạng thái trên trang `list.jsp`.
  * Khi thay đổi trạng thái của một công việc trên dòng của bảng, hệ thống sẽ tự động gọi Servlet xử lý ngầm (Ajax) và cập nhật hiển thị mà không cần tải lại trang.
* **Hình minh họa:** *(Tài liệu gốc không kèm theo hình ảnh trực quan)*

---

## LƯU Ý CHUNG
* **TUYỆT ĐỐI** không import `javax.servlet.*` — Apache NetBeans IDE 25 + Tomcat 10.1 chỉ nhận các thư viện trong namespace `jakarta.*`.
* Mọi trang JSP phải khai báo định dạng ngôn ngữ và bảng mã ở ngay dòng đầu tiên:
  ```jsp
  <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
  ```
* Sử dụng **Expression Language (EL)** trực tiếp dạng `${user.username}`, tuyệt đối không sử dụng Scriptlet `<% ... %>` để hiển thị dữ liệu.
* Sử dụng **JSTL** đúng URI phiên bản Jakarta:
  ```jsp
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
  ```

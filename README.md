# LTDiDong

Hướng dẫn tạo và chạy ứng dụng Flutter bằng **GitHub Codespaces** (không cần cài Android Studio trên máy trường).

## 1. Mở Codespaces

Vào repository → **Code → Codespaces** → mở Codespace có sẵn hoặc **Create codespace on main**. Chọn **Terminal → New Terminal**.

## 2. Kiểm tra Flutter

```bash
flutter --version
```

Nếu báo `flutter: command not found`, thử thêm Flutter đã cài vào PATH:

```bash
export PATH="$HOME/flutter/bin:$PATH"
flutter --version
```

Nếu vẫn không có Flutter, thực hiện **bước 3**.

## 3. Cài Flutter lần đầu trên Codespace mới

Ở thư mục gốc repository, chạy từng lệnh:

```bash
git clone https://github.com/flutter/flutter.git -b stable --depth 1 ~/flutter
export PATH="$HOME/flutter/bin:$PATH"
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
flutter --version
flutter config --enable-web
flutter precache --web
```

**Lưu ý:** Chỉ `git clone` khi `~/flutter` chưa tồn tại. Nếu Flutter đã có sẵn, không cần cài lại. Sau khi cài, mở terminal mới hoặc chạy `source ~/.bashrc`.

## 4. Tạo project Flutter mới (Câu 1)

Ở thư mục gốc repository:

```bash
flutter create bai_thi_flutter
cd bai_thi_flutter
```

Nếu project đã tồn tại, **không tạo lại**; chỉ vào thư mục:

```bash
cd bai_thi_flutter
flutter pub get
```

## 5. Chạy Flutter trên trình duyệt Codespaces

Đảm bảo terminal đang ở thư mục project (có file `pubspec.yaml`), rồi chạy:

```bash
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=3000
```

Đợi terminal báo ứng dụng được phục vụ trên port 3000. Trong Codespaces, mở tab **PORTS → 3000 → Open in Browser**.

Ứng dụng mới tạo mặc định có tiêu đề **Flutter Demo Home Page**, bộ đếm `0` và nút `+`.

**Quan trọng:** Cách này chạy **Flutter Web** để xem và chụp giao diện trong Codespaces, không phải Android Emulator.

## 6. Lần sau mở lại Codespace

Mở **Terminal → New Terminal**, rồi chạy:

```bash
export PATH="$HOME/flutter/bin:$PATH"
cd bai_thi_flutter
flutter pub get
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=3000
```

Nếu terminal đang ở trong `bai_thi_flutter` rồi thì bỏ qua lệnh `cd`. Bấm `Ctrl + C` để dừng server khi cần.

## 7. Chụp màn hình nộp bài

- **Ảnh code:** mở thư mục `lib/` và `main.dart` trong Codespaces; dùng `Win + Shift + S`.
- **Ảnh kết quả:** mở port 3000, có thể bật chế độ điện thoại trên Chrome bằng `F12` → `Ctrl + Shift + M`, rồi chụp lại.
- Chụp Câu 1 **trước khi sửa** `main.dart` để làm Câu 2, Câu 3.

## 8. Lỗi thường gặp

- **`flutter: command not found`**: chạy `export PATH="$HOME/flutter/bin:$PATH"`; nếu chưa cài thì quay lại bước 3.
- **Trình duyệt trắng**: chờ biên dịch xong, tải lại bằng `Ctrl + Shift + R`; xem lỗi ở Terminal.
- **Port 3000 đã được sử dụng**: dừng phiên Flutter cũ bằng `Ctrl + C` trước khi chạy lại.
- **Đã có `bai_thi_flutter`**: không chạy lại `flutter create` để tránh ghi đè bài đang làm.

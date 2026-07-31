#!/bin/bash

# Kiểm tra xem có đang chạy trong môi trường Termux không
if [ ! -d "/data/data/com.termux/files/usr" ]; then
    echo "[!] Script này chỉ dành cho ứng dụng Termux trên Android."
    exit 1
fi

echo "[+] Đang kiểm tra và cập nhật danh sách kho lưu trữ Termux..."

# Kiểm tra xem công cụ termux-change-repo đã có sẵn chưa
if command -v termux-change-repo &> /dev/null; then
    echo "[+] Đang chọn mirror tự động hoặc mặc định tốt nhất..."
    # Đổi sang kho chính thức mặc định hoặc tự động điều hướng
    termux-change-repo main --default
else
    echo "[!] Không tìm thấy lệnh 'termux-change-repo'. Tiến hành cập nhật thủ công danh sách sources.list..."
    
    # Tạo thư mục apt nếu chưa có
    mkdir -p /data/data/com.termux/files/usr/etc/apt/sources.list.d
    
    # Ghi nguồn mirror Grimler (một trong các mirror Termux ổn định nhất)
    cat <<EOF > /data/data/com.termux/files/usr/etc/apt/sources.list
deb https://grimler.se/termux-packages-24/ stable main
EOF
fi

echo "[+] Đang cập nhật lại cơ sở dữ liệu gói (apt update)..."
apt update -y

echo "[✓] Hoàn tất đổi Repo cho Termux!"
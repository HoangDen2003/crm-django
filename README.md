# Clone từ github

Chạy lệnh sau để tải code về máy:

- `git clone: https://github.com/HoangDen2003/crm-django.git`
- `cd crmdjango`

# Install

- `pip install django`: tải django
- `python -m venv env`: tạo môi trường ảo
- `pip install -r requirements.txt`: cài đặt package

# Tạo super user

- `python manage.py createsuperuser`

# Migrate

- `python manage.py migrate`

# Run

- `python manage.py runserver`

  Sau đó mở trình duyệt và truy cập: http://127.0.0.1:8000/admin

# API Document (Swagger)

Sau khi chạy server, truy cập tài liệu API tại:

- Swagger UI: http://127.0.0.1:8000/api/docs/

from django.http import JsonResponse
import jwt
from django.conf import settings
from employees.models import Employee
from .utils import verify_jwt

SECRET_KEY = settings.SECRET_KEY

class JWTAuthenticationMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        auth_header = request.headers.get("Authorization")

        if auth_header and auth_header.startswith("Bearer "):
            token = auth_header.split(" ")[1]  # Lấy token từ "Bearer <token>"
            payload = verify_jwt(token)

            if payload:
                print("Payload:", payload)

                try:
                    user = Employee.objects.get(id=payload.get("id"))
                    # fake thuộc tính
                    user.is_active = True
                    user.is_authenticated = True
                    
                    request.user = user  # Gán user vào request để sử dụng trong view
                except Employee.DoesNotExist:
                    return JsonResponse({"error": "User not found"}, status=401)
            else:
                return JsonResponse({"error": "Invalid or expired token"}, status=401)

        return self.get_response(request)
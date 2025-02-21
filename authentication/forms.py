from django import forms
from employees.models import Employee

class LoginForm(forms.Form):
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput)

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if not Employee.objects.filter(email=email).exists():
            raise forms.ValidationError('Email không tồn tại!')
        return email

    def clean_password(self):
        password = self.cleaned_data.get('password')
        email = self.cleaned_data.get('email')
        try:
            employee = Employee.objects.get(email=email)  # Lấy thông tin nhân viên từ DB
            if employee.password != password:  # So sánh mật khẩu thuần túy
                raise forms.ValidationError("Mật khẩu không đúng!")
        except Employee.DoesNotExist:
            raise forms.ValidationError("Nhân viên không tồn tại!")
        return password
        
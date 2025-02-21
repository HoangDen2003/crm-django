"""
WSGI config for crmdjango project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/dev/howto/deployment/wsgi/
"""
import sys
import io
import os

from django.core.wsgi import get_wsgi_application

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding="utf-8")

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'crmdjango.settings')

application = get_wsgi_application()

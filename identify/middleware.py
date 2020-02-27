from django.shortcuts import redirect
from django.utils.deprecation import MiddlewareMixin
import re


class CheckLoginMiddleware(MiddlewareMixin):

    @staticmethod
    def process_request(request):
        path = (r'/api/.*')
        if not request.user.is_authenticated \
                and request.path not in ('/identify/login/', '/identify/register/') \
                and not re.search(r'/api/.*', request.path):
            return redirect('identify:login')


class SessionLifetimeMiddleware(MiddlewareMixin):

    @staticmethod
    def process_request(request):
        if request.user.is_superuser:
            request.session.set_expiry(None)
        else:
            request.session.set_expiry(5 * 60)

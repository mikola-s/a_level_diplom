from django.shortcuts import redirect


class CheckLoginMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if not request.user.is_authenticated and \
                request.path not in ('/identify/login/', '/identify/register/'):
            return redirect('identify:login')
        response = self.get_response(request)
        return response

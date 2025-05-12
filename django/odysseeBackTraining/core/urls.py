from django.urls import path
from rest_framework.urlpatterns  import format_suffix_patterns
from . import views

app_name="core"
urlspattern = [
    path('', views.indexHome, name="indexHome"),
    path("login", views.indexLogin, name="indexLogin"),
    path('/my-username/loging-out', views.loginOut, name="loginOut"),
    path("sharing", views.indexSharing, name="indexSharing"),
    path("projets", views.indexProjets, name="indexProjets"),
    path('/my-username', views.userHome, name="userHome")
]
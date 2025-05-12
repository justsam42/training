from django.urls import path
from rest_framework.urlpatterns  import format_suffix_patterns
from . import views

app_name="projets"
urlspattern = [
    path('', views.indexUserProjets, name="indexUserProjets"),
    path("my-project-id", views.focusProjet, name="focusProjet")
]
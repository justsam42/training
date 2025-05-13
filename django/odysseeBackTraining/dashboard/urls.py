from django.urls import path
from rest_framework.urlpatterns  import format_suffix_patterns
from . import views

app_name="dashboard"
urlspattern = [
    path("", views.dashboardDefault, name="dashboardDefault"),
    path("projets", views.dashboardProjects, name="dashboardProjects")
]
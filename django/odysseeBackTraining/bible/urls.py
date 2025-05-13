from django.urls import path
from rest_framework.urlpatterns  import format_suffix_patterns
from . import views

app_name="bible"
urlspattern = [
    path("", views.indexBible, name="indexBible"),
    path("mes-collections", views.indexCollection, name="indexCollection"),
    path("mes-collections/ma-collection/mon-objet", views.focusObjet, name="focusObjet")
]


""" 
path("mes-collections/<str:collection_name>/<str:object_name>", views.focusObjet, name="focusObjet")
 """
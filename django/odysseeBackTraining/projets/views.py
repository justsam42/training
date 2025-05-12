from rest_framework.decorators import api_view 
from rest_framework.response import Response
from rest_framework import status

from .models import *
from .serializers import * 

from django.shortcuts import render


# View qui correspond à la page d'accueil de la FEATURE --- Gestion de PROJETS

@api_view(["GET", "POST"])
def indexUserProjets(request, format=None):

    if request.method == "GET":
        pass

    if request.method == "POST":
        pass



# View qui correspond au FOCUS sur un PROJET 
@api_view(["GET", "POST"])
def focusProjet(request, format=None):

    if request.method == "GET":
        pass

    if request.method == "POST":
        pass



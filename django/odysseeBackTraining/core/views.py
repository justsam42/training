from rest_framework.decorators import api_view 
from rest_framework.response import Response
from rest_framework import status

from .models import *
from .serializers import * 

from django.shortcuts import render


# View qui correspond à la page d'accueil de l'appli Odyssee
@api_view(["GET", "POST"])

def indexHome(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass


# View qui correspond à la page d'accueil de l'appli Odyssee pour un USER logged-in
@api_view(["GET", "POST"])
def userHome(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass


# View qui correspond à la view LOGIN de l'appli Odyssee
@api_view(["GET", "POST"])

def indexLogin(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass

# View qui correspond à la view LOGIN OUT de l'appli Odyssee
@api_view(["GET", "POST"])

def loginOut(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass


# View qui correspond à la view SHARING de l'appli Odyssee
@api_view(["GET", "POST"])

def indexSharing(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass


# View qui correspond à la view PROJETS (partgés) de l'appli Odyssee
@api_view(["GET", "POST"])

def indexProjets(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass



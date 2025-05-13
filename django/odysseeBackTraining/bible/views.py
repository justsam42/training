from rest_framework.decorators import api_view 
from rest_framework.response import Response
from rest_framework import status

from .models import *
from .serializers import * 

from django.shortcuts import render


# View qui correspond à la page d'accueil de la FEATURE ---BIBLE----
# Front_name = 
@api_view(["GET", "POST"])

def indexBible(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass


# View qui correspond à la page d'accueil des - COLLECTIONS-  de la FEATURE ---BIBLE----
# Front_name = defaultViewBible
@api_view(["GET", "POST"])

def indexCollection(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass


# View qui correspond au FOCUS d'un objet d'une collection de la FEATURE ---BIBLE----
# Front_name = 
@api_view(["GET", "POST"])

def focusObjet(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass
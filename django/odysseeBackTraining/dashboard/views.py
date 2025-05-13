from rest_framework.decorators import api_view 
from rest_framework.response import Response
from rest_framework import status

from .models import *
from .serializers import * 

from django.shortcuts import render


# View qui correspond à la VIEW (d'accueil) TASK du --- DASHBOARD
@api_view(["GET", "POST"])

def dashboardDefault(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass


# View qui correspond  à la VIEW PROJECT du --- DASHBOARD
@api_view(["GET", "POST"])
def dashboardProjects(request, format=None):

    if request.method == "GET" :
        pass

    if request.method == "POST" : 
        pass



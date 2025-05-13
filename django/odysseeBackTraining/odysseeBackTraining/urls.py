"""
URL configuration for odysseeBackTraining project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')), 
    path('projets/', include('projets.urls')),
    path('bibles/', include('bible.urls')),
    path('dashboard/', include('dashboard.urls')),
    path('taches/', include('taches.urls')),
    path('idees/', include('idees.urls'))
]

""" 
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')), 
    path('<str:"username_id">/projets/', include('projets.urls')),
    path('<str:"username_id">/bibles/', include('bible.urls')),
    path('<str:"username_id">/dashboard/', include('dashboard.urls')),
    path('<str:"username_id">/taches/', include('taches.urls')),
    path('<str:"username_id">/idees/', include('idees.urls'))
]


 """
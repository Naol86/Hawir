from django.urls import path
from .views import CarList, CarDeactivateAPIView

urlpatterns = [
    path('cars/', CarList.as_view(), name='car-list'),
    path('deactivate/<int:id>', CarDeactivateAPIView.as_view(), name='car-deactivate'),
]

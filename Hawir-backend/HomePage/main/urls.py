from django.urls import path
from .views import *

urlpatterns = [
    path('home/', home.as_view(), name='car-list'),
    path('register/', NewUser.as_view(), name='car-list'),
    path('login/', LoginUser.as_view(), name='car-list'),
    path('favorite/', UserFavoritePlaces.as_view(), name='car-list'),
    path('add-visited/', AddVisited.as_view(), name='car-list'),
    path('add-favorite/', AddFavorite.as_view(), name='car-list'),
    path('visited-places/', VisitedPlaces.as_view(), name='car-list'),
    path('detail-place/<int:place_id>/', PlaceDetail.as_view(), name='car-list'),
    path('group-detail/<int:group_id>/', DetailGroupData.as_view(), name='car-list'),
    path('group-data/', GroupData.as_view(), name='car-list'),
    path('creat-group', CreateGroup.as_view(), name='car-list'),
    # AddMember
    path('new-member', AddMember.as_view(), name='car-list'),
    
   
]

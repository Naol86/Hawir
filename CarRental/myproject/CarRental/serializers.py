from rest_framework import serializers # type: ignore
from .models import Car,Car_Images,Company


class CarImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Car_Images
        fields = ['id', 'image']
class CarSerializers(serializers.ModelSerializer):
    images = CarImageSerializer(many=True, read_only=True)
    class Meta:
        model = Car
        fields = ['id','car_type', 'price_per_day', 'review', 'is_active','images']
class Company_Serializers(serializers.ModelSerializer):
    cars = CarSerializers(many=True, read_only=True)
    
    class Meta:
        model = Company
        fields = ["id","name","location","cars"]
   
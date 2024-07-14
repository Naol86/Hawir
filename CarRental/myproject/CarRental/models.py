from django.db import models

# Create your models here.
class Company(models.Model):
    name = models.CharField(max_length=100)
    location = models.CharField(max_length=100)
    
    def __str__(self) -> str:
        return f"{self.name} {self.location}"
class Car(models.Model):
    Company =  models.ForeignKey(Company, on_delete=models.CASCADE, related_name='cars')
    car_type = models.CharField(max_length=100)
    price_per_day = models.DecimalField(max_digits=10,decimal_places=2)
    review = models.TextField(max_length=10000)
    is_available = models.IntegerField(default=1) 
    

    def __str__(self):
        return f"{self.Company.name} {self.Company.location}  => {self.car_type}"

class Car_Images(models.Model):
    car = models.ForeignKey(Car, on_delete=models.CASCADE, related_name='images')
    image = models.CharField(10000),
    
    def __str__(self) -> str:
        return f"{self.car.Company.name} {self.car.Company.location} =>  {self.car.car_type}"
    
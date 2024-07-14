from django.shortcuts import render
from django.db import connections
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from django.http import JsonResponse

class CarList(APIView):
    def get(self, request, format=None):
        location = request.query_params.get('location')
        with connections['default'].cursor() as cursor:
            if location:
                cursor.execute(f"""
                    SELECT c.id as company_id, c.name as company_name, c.location, car.id as car_id, car.car_type,car.is_available as is_available,car.price_per_day,car.review as review, img.id as image_id, img.image
                    FROM Company c
                    LEFT JOIN Car car ON c.id = car.company_id
                    LEFT JOIN CarImage img ON car.id = img.car_id
                    WHERE c.location = '{location}' AND car.is_available = 1;
                """)
            else:
                cursor.execute("""
                    SELECT c.id as company_id, c.name as company_name, c.location, car.id as car_id, car.car_type,car.is_available as is_available,car.price_per_day,car.review as review, img.id as image_id, img.image
                    FROM Company c
                    LEFT JOIN Car car ON c.id = car.company_id
                    LEFT JOIN CarImage img ON car.id = img.car_id
                    WHERE car.is_available = 1;
                """)
            data = dict_fetchall(cursor)
            nested_data = nest_data(data)
        return Response(nested_data, status=status.HTTP_200_OK)

class CarDeactivateAPIView(APIView):
    def get(self, request, id, format=None):
        with connections['default'].cursor() as cursor:
            cursor.execute(f"SELECT * FROM Car WHERE id={id};")
            car = cursor.fetchone()

        if car:
            with connections['default'].cursor() as cursor:
                cursor.execute(f"UPDATE Car SET is_active=False WHERE id={id};")
            return Response({'status': 'success', 'data': 'Car deactivated successfully'}, status=status.HTTP_200_OK)
        else:
            return Response({'status': 'error', 'data': 'Car not found'}, status=status.HTTP_404_NOT_FOUND)

def dict_fetchall(cursor):
    columns = [col[0] for col in cursor.description]
    return [dict(zip(columns, row)) for row in cursor.fetchall()]
def nest_data(data):
    companies = {}

    for row in data:
        company_id = row['company_id']
        car_id = row['car_id']
        image_id = row['image_id']

        if company_id not in companies:
            companies[company_id] = {
                'id': company_id,
                'name': row['company_name'],
                'location': row['location'],
                'cars': {}
            }

        if car_id not in companies[company_id]['cars']:
            companies[company_id]['cars'][car_id] = {
                'id': car_id,
                'car_type': row['car_type'],
                'is_avilavil' : row["is_available"],
                'review' : row["review"],
                'Price per day' : row["price_per_day"],
                'images': []
            }

        if image_id:
            companies[company_id]['cars'][car_id]['images'].append({
                'id': image_id,
                'image': row['image']
            })
    nested_list = []
    for company in companies.values():
        company['cars'] = list(company['cars'].values())
        nested_list.append(company)

    return nested_list



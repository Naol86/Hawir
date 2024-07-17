from django.shortcuts import render
from django.db import connections
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.http import JsonResponse
from passlib.hash import sha256_crypt

class home(APIView):
    def get(self, request):
        try:
            with connections['default'].cursor() as cursor:
                cursor.execute("SELECT id, name, description, location, category, pictures, review, rating, created_at FROM Places")
                data = dict_fetchall(cursor)

            return Response(data, status=status.HTTP_200_OK)
        
        except Exception as e:
            print("Error fetching data:", str(e))
            return Response({"error": "Internal Server Error"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                
class NewUser(APIView):
    def post(self, request):
        try:
            # Extract data from the request
            name = request.data.get('name')
            email = request.data.get('email')
            password = request.data.get('password')
            profile_picture = request.data.get('profile_picture', '')
            age = int(request.data.get('age', 0))
            country = request.data.get('country', 'Ethiopia')
            hashed_password = sha256_crypt.hash(password)
            with connections['default'].cursor() as cursor:
                sql_check = "SELECT id FROM User WHERE email = %s"
                cursor.execute(sql_check, (email,))
                existing_user = cursor.fetchone()
                if existing_user:
                    return JsonResponse({'status': 'failed', 'message': 'Email already registered'}, status=400)
                sql_insert = """
                    INSERT INTO User (name, email, password, profile_picture, age, country)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """
                cursor.execute(sql_insert, (name, email, hashed_password, profile_picture, age, country))
            connections['default'].commit()
            return JsonResponse({'status': 'successful', 'message': 'User created successfully'}, status=200)
        except Exception as e:
            connections['default'].rollback()
            return JsonResponse({'status': 'failed', 'message': f'Unexpected error: {str(e)}'}, status=500)
class LoginUser(APIView):
    def post(self, request):
        try:
            email = request.data.get('email')
            password = request.data.get('password')
            with connections['default'].cursor() as cursor:
                sql = """
                    SELECT id, password FROM User
                    WHERE email = %s
                """
                cursor.execute(sql, (email,))
                user = cursor.fetchone()

                if user:
                    user_id = user[0]
                    hashed_password = user[1]
                    if sha256_crypt.verify(password, hashed_password):
                        return JsonResponse({'status': 'successful', 'user_id': user_id}, status=200)
                    else:
                        return JsonResponse({'status': 'failed', 'message': 'Invalid credentials'}, status=401)
                else:
                    return JsonResponse({'status': 'failed', 'message': 'User not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'failed', 'message': f'Unexpected error: {str(e)}'}, status=500)
class AddFavorite(APIView):
    def post(self,request):
        user_id = request.data.get('user_id')
        place_id = request.data.get('place_id')
        with connections['default'].cursor() as cursor:
            sql_insert = """
                    INSERT INTO Favorite (user_id, place_id,)
                    VALUES (%s, %s)
                """
            cursor.execute(sql_insert, (user_id, place_id))
            connections['default'].commit()
            return JsonResponse({'status': 'successful', 'message': 'User created successfully'}, status=200)
class AddVisited(APIView):
    def post(self,request):
        user_id = request.data.get('user_id')
        place_id = request.data.get('place_id')
        with connections['default'].cursor() as cursor:
            sql_insert = """
                    INSERT INTO VisitedPlaces (user_id, place_id,)
                    VALUES (%s, %s)
                """
            cursor.execute(sql_insert, (user_id, place_id))
            connections['default'].commit()
            return JsonResponse({'status': 'successful', 'message': 'User created successfully'}, status=200)
class UserFavoritePlaces(APIView):
    def post(self, request):
        try:
            user_id = request.data.get('user_id')
            
            with connections['default'].cursor() as cursor:
                # Query to get all place_ids favorited by the user
                sql = """
                    SELECT place_id FROM Favorite WHERE user_id = %s
                """
                cursor.execute(sql, (user_id,))
                favorite_places = cursor.fetchall()  # Fetch all place_ids
                
                place_ids = [row[0] for row in favorite_places]  # Extract place_ids
                
                # Query to fetch place details for all place_ids
                places_data = []
                for place_id in place_ids:
                    sql_place = """
                        SELECT * FROM Places WHERE id = %s
                    """
                    cursor.execute(sql_place, (place_id,))
                    place_data = cursor.fetchone()  # Fetch place details
                    if place_data:
                        places_data.append({
                            'id': place_data[0],
                            'name': place_data[1],
                            'description': place_data[2],
                            'location': place_data[3],
                            'category': place_data[4],
                            'picture': place_data[5],
                            'review': place_data[6],
                            'rating': place_data[7],
                            'created_at': place_data[8]
                        })
                
                return JsonResponse({'status': 'successful', 'favorite_places': places_data}, status=200)
        
        except Exception as e:
            print(e)  # Log or handle the exception as per your application's needs
            return JsonResponse({'status': 'failed', 'message': 'Error retrieving favorite places'}, status=500)
class VisitedPlaces(APIView):
    def post(self, request):
        try:
            user_id = request.data.get('user_id')
            
            with connections['default'].cursor() as cursor:
                # Query to get all place_ids favorited by the user
                sql = """
                    SELECT place_id FROM VisitedPlaces WHERE user_id = %s
                """
                cursor.execute(sql, (user_id,))
                favorite_places = cursor.fetchall()  # Fetch all place_ids
                
                place_ids = [row[0] for row in favorite_places]  # Extract place_ids
                
                # Query to fetch place details for all place_ids
                places_data = []
                for place_id in place_ids:
                    sql_place = """
                        SELECT * FROM Places WHERE id = %s
                    """
                    cursor.execute(sql_place, (place_id,))
                    place_data = cursor.fetchone()  # Fetch place details
                    if place_data:
                        places_data.append({
                            'id': place_data[0],
                            'name': place_data[1],
                            'description': place_data[2],
                            'location': place_data[3],
                            'category': place_data[4],
                            'picture': place_data[5],
                            'review': place_data[6],
                            'rating': place_data[7],
                            'created_at': place_data[8]
                        })
                
                return JsonResponse({'status': 'successful', 'favorite_places': places_data}, status=200)
        
        except Exception as e:
            print(e)  # Log or handle the exception as per your application's needs
            return JsonResponse({'status': 'failed', 'message': 'Error retrieving favorite places'}, status=500)
class PlaceDetail(APIView):
    def get(self, request, place_id):
        try:
            with connections['default'].cursor() as cursor:
                # Fetch place details from Places table
                place_data = self.fetch_place_details(cursor, place_id)

                if place_data:
                    # Fetch images from PlaceDetail table
                    images_data = self.fetch_place_images(cursor, place_id)
                    place_data['images'] = images_data

                    return JsonResponse({'status': 'success', 'place': place_data})
                else:
                    return JsonResponse({'status': 'error', 'message': 'Place not found'}, status=404)

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    def fetch_place_details(self, cursor, place_id):
        sql = """
            SELECT id, name, description, location, category, pictures, review, rating, created_at
            FROM Places
            WHERE id = %s
        """
        cursor.execute(sql, (place_id,))
        place = cursor.fetchone()
        if place:
            place_id, name, description, location, category, pictures, review, rating, created_at = place
            pictures_list = pictures.split(',') if pictures else []
            return {
                'id': place_id,
                'name': name,
                'description': description,
                'location': location,
                'category': category,
                'pictures': pictures_list,
                'review': review,
                'rating': float(rating) if rating else None,
                'created_at': created_at.strftime('%Y-%m-%d %H:%M:%S') if created_at else None
            }
        else:
            return None

    def fetch_place_images(self, cursor, place_id):
        sql = """
            SELECT image
            FROM PlaceDetail
            WHERE place_id = %s
        """
        cursor.execute(sql, (place_id,))
        images = cursor.fetchall()
        images_list = [image[0] for image in images]
        return images_list
class CreateGroup(APIView):
    def post(self, request):
        try:
            name = request.data.get('name')
            created_by = request.data.get('created_by')
            description = request.data.get('description', '')
            price = request.data.get('price', 0.0)
            
            with connections['default'].cursor() as cursor:
                sql = """
                    INSERT INTO GroupData (name, created_by, description, price)
                    VALUES (%s, %s, %s, %s)
                """
                cursor.execute(sql, (name, created_by, description, price))
            connections['default'].commit()
            
            return Response({'status': 'success', 'message': 'Group created successfully'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            connections['default'].rollback()
            return Response({'status': 'error', 'message': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
class AddMember(APIView):
    def post(self, request):
        try:
            group_id = request.data.get('group_id')
            user_id = request.data.get('user_id')
            with connections['default'].cursor() as cursor:
                sql = """
                    INSERT INTO Member (group_id, user_id)
                    VALUES (%s, %s)
                """
                cursor.execute(sql, (group_id, user_id))
            connections['default'].commit()
            return Response({'status': 'success', 'message': 'Member added successfully'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            connections['default'].rollback()
            return Response({'status': 'error', 'message': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
class GroupData(APIView):
    def get(self, request):
        try:
            with connections['default'].cursor() as cursor:
                sql = """
                    SELECT id, name, created_by, description, price
                    FROM GroupData
                """
                cursor.execute(sql)
                data = dict_fetchall(cursor)
            
            return Response(data, status=status.HTTP_200_OK)
        
        except Exception as e:
            return Response({'status': 'error', 'message': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
class DetailGroupData(APIView):
    def get(self, request, group_id):
        try:
            with connections['default'].cursor() as cursor:
                group_sql = """
                    SELECT id, name, created_by, description, price
                    FROM GroupData
                    WHERE id = %s
                """
                cursor.execute(group_sql, (group_id,))
                group_data = dict_fetchone(cursor)

                if not group_data:
                    return Response({'status': 'error', 'message': 'Group not found'}, status=status.HTTP_404_NOT_FOUND)
                members_sql = """
                    SELECT u.id as user_id, u.name as user_name, u.email as user_email
                    FROM `Member` m
                    INNER JOIN `User` u ON m.user_id = u.id
                    WHERE m.group_id = %s
                """
                cursor.execute(members_sql, (group_id,))
                members_data = dict_fetchall(cursor)
                group_data['members'] = members_data

            return Response(group_data, status=status.HTTP_200_OK)

        except Exception as e:
            return Response({'status': 'error', 'message': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
def dict_fetchone(cursor):
    columns = [col[0] for col in cursor.description]
    return dict(zip(columns, cursor.fetchone()))

def dict_fetchall(cursor):
    columns = [col[0] for col in cursor.description]
    return [dict(zip(columns, row)) for row in cursor.fetchall()]
    
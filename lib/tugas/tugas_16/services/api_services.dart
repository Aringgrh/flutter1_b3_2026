import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_response.dart';
import '../models/batch_model.dart';
import '../models/login_request.dart';
import '../models/profile_photo_response.dart';
import '../models/profile_response.dart';
import '../models/register_request.dart';
import '../models/training_model.dart';
import '../models/user_list_response.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // 1. Register User
  @POST('/api/register')
  Future<AuthResponse> register(
    @Body() RegisterRequest request,
  );

  // 2. Login User
  @POST('/api/login')
  Future<AuthResponse> login(
    @Body() LoginRequest request,
  );

  // 3. Get Profile User
  @GET('/api/profile')
  Future<ProfileResponse> getProfile({
    @Header('Authorization') String? token,
  });

  // 4. Edit Profile
  @PUT('/api/profile')
  Future<ProfileResponse> editProfile(
    @Body() Map<String, dynamic> body, {
    @Header('Authorization') String? token,
  });

  // 5. Edit Profile Photo
  @PUT('/api/profile/photo')
  Future<ProfilePhotoResponse> editProfilePhoto(
    @Body() Map<String, dynamic> body, {
    @Header('Authorization') String? token,
  });

  // 6. Get All Users
  @GET('/api/users')
  Future<UserListResponse> getAllUsers();

  // 7. Get List Trainings (Public)
  @GET('/api/trainings')
  Future<TrainingListResponse> getTrainings();

  // 8. Get Detail Training by ID (Public)
  @GET('/api/trainings/{id}')
  Future<TrainingDetailResponse> getTrainingDetail(
    @Path('id') int id, {
    @Header('Authorization') String? token,
  });

  // 9. Get List All Batches
  @GET('/api/batches')
  Future<BatchListResponse> getBatches({
    @Header('Authorization') String? token,
  });
}

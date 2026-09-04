import 'package:dio/dio.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/models/postt_models.dart';
import 'package:retrofit/retrofit.dart';

part 'apii_services.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/api/v2/Characters')
  Future<List<PosttModels>> getAllPosts();
}
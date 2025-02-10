import 'package:dio/dio.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_firebase_ecommerce/resources/app_url.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: AppUrl.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/dresses")
  Future<List<Dress>> getAllDress();

  @GET("/dresse")
  Future<Dress> getDress();
}

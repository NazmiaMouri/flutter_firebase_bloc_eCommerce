import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_firebase_ecommerce/models/api_response.dart';
import 'package:flutter_firebase_ecommerce/models/auth_request.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/models/order.dart';
import 'package:flutter_firebase_ecommerce/models/user.dart';
import 'package:flutter_firebase_ecommerce/models/user.dart'as UserModel;
import 'package:flutter_firebase_ecommerce/network/cookie_manager.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_firebase_ecommerce/resources/app_url.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: AppUrl.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/authchecking")
  Future<ApiResponse<User>> auth();

  @POST("/signup")
  Future<ApiResponse<User>> signUp(@Body() User user);

  @POST("/login")
  Future<ApiResponse<User>> login(@Body() LoginRequest loginRequest);

  @GET("/logout")
  Future<void> logout();

  @GET("/dresses")
  Future<ApiResponse<List<Dress>>> getAllDress();

  // @GET("/dresses/{productId}")
  // Future<Dress> getDress(@Path("productId") String productId);

  @GET("/cart")
  Future<ApiResponse<List<Cart>>> getCartItems();

  @POST("/cart/add")
  Future<ApiResponse<Cart>> addCartItem(@Body() Cart cartItem);

  @POST("/cart/remove")
  Future<ApiResponse<UserModel.User>> deleteCartItem(@Body() Cart cartItem);

  @GET("/orders")
  Future<ApiResponse<List<OrderDetails>>> getOrders();

  @POST("/orders/create")
  Future<ApiResponse<OrderDetails>> createOrder(@Body() OrderDetails order);
}

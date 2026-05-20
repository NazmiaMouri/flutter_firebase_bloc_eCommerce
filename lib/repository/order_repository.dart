
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_ecommerce/models/api_response.dart';
import 'package:flutter_firebase_ecommerce/models/cart.dart';
import 'package:flutter_firebase_ecommerce/models/dress.dart';
import 'package:flutter_firebase_ecommerce/models/order.dart';
import 'package:flutter_firebase_ecommerce/network/api_client.dart';
import 'package:flutter_firebase_ecommerce/network/header_requesttime.dart';
import 'package:flutter_firebase_ecommerce/models/user.dart'as UserModel;


class OrderRepository {
  late RestClient _apiRequest;

  OrderRepository() {
    //RestClient take a dio object so i made a singleton dio class which is named  /// HeaderRequestTime ///
    //because i declare the header, content type, request time out under this singleton class.
    _apiRequest = RestClient(HeaderRequestTime.instance);
  }
  Future<ApiResponse<List<Cart>>> getCartItems() {
    return _apiRequest.getCartItems();
  }

  Future<ApiResponse<Cart>> addCartItem(Cart cartItem) {
    return _apiRequest.addCartItem(cartItem);
  }

  Future<ApiResponse<UserModel.User>> deleteCartItem(Cart cartItem) {
    return _apiRequest.deleteCartItem(cartItem);
  }

  Future<ApiResponse<OrderDetails>> createOrder(OrderDetails order) {
    return _apiRequest.createOrder(order);
  }

  Future<ApiResponse<List<OrderDetails>>> getOrders() {
    return _apiRequest.getOrders();
  }
}

final orderRepo = OrderRepository();

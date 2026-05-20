import 'package:dio/dio.dart';
import 'package:flutter_firebase_ecommerce/models/api_response.dart';
import 'package:flutter_firebase_ecommerce/models/order.dart';
import 'package:flutter_firebase_ecommerce/repository/order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersProvider = FutureProvider<ApiResponse<List<OrderDetails>>>((ref) async {
  return await orderRepo.getOrders();
});
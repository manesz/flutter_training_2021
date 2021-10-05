
import 'dart:convert';

import 'package:demo0/src/models/product.dart';

class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;


  Future<List<Product>> getProduct() async {
    final response = await _dio.get("");
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }
}
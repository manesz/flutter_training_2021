
import 'dart:convert';

import 'package:demo0/src/models/product.dart';
import 'package:dio/dio.dart';

class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;


  Future<List<Product>> getProduct() async {
    print("Loading..");
    final response = await Dio().get("https://cmcrud.herokuapp.com/products");
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }
}
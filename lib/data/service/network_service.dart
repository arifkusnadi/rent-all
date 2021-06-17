import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rent/data/models/api_response.dart';

import 'package:rent/data/models/book.dart';
import 'package:rent/data/models/products.dart';
import 'package:rent/data/models/usermodel.dart';
import 'package:rent/data/service/local_service.dart';

abstract class BaseService {
  Future<List<Product>> getProducts();
  Future<ApiResponse> login(String email, String password);
  Future<ApiResponse> register(Usermodel profil);
  Future<List<Book>> getHistoryBooking();
  Future<ApiResponse> makeOrder(Book newBooking);
  Future<ApiResponse> updateProfile(String email, String password, String nama);
  Future<Usermodel> getProfile();
  static const exerciseEndpoint = "/products";
  static const loginEndpoint = "/auth/login";
  static const registerEndpoint = "/auth/register";
  static const profileEndpoint = "/profile";
}

class NetworkService extends BaseService {
  NetworkService._internal();
  static final _singleton = NetworkService._internal();
  factory NetworkService() => _singleton;
  static const String BASEURL = "http://192.168.43.150";

  final Dio _dio = Dio(BaseOptions(
    baseUrl: BASEURL,
  ));
  final LocalService _localService = LocalService();

  @override
  Future<List<Product>> getProducts() async {
    List<Product> exercises = [];
    var response = await _dio.get<List>(BaseService.exerciseEndpoint);
    if (response.statusCode == 200) {
      print(response.data);
      (response.data ?? [])
          .map<Product>((e) => Product.fromJson(e))
          .forEach((element) {
        exercises.add(element);
      });
    }
    return exercises;
  }

  @override
  Future<List<Book>> getHistoryBooking() async {
    List<Book> history = [];
    int id = (await _localService.getLoginDetails())["idUser"];
    var response =
        await _dio.get<List>(BaseService.profileEndpoint + "/$id/book");
    if (response.statusCode == 200) {
      (response.data ?? [])
          .map<Book>((e) => Book.fromJson(e))
          .forEach((element) {
        history.add(element);
      });
    }
    return history;
  }

  @override
  Future<Usermodel> getProfile() async {
    int id = (await _localService.getLoginDetails())["idUser"];
    var response = await _dio
        .get<Map<String, dynamic>>(BaseService.profileEndpoint + "/$id/detail");
    if (response.statusCode == 200) {
      return Usermodel.fromJson(response.data ?? {"message": "internal error"});
    }
    return Usermodel();
  }

  @override
  Future<ApiResponse> login(String email, String password) async {
    var response = await _dio.post<Map<String, dynamic>>(
      BaseService.loginEndpoint,
      data: FormData.fromMap({
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(
          response.data ?? {"message": "internal error"});
    }
    return ApiResponse(message: "internal error");
  }

  @override
  Future<ApiResponse> register(
    Usermodel profile,
  ) async {
    var data = profile.toJson();
    data.removeWhere((key, value) => value == null);

    var formData = FormData.fromMap(data);
    debugPrint(data.toString());
    var response = await _dio.post<Map<String, dynamic>>(
        BaseService.registerEndpoint,
        data: formData);
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(
          response.data ?? {"message": "internal error"});
    }
    return ApiResponse(message: "internal error");
  }

  @override
  Future<ApiResponse> makeOrder(Book newBooking) async {
    int id = (await _localService.getLoginDetails())["idUser"];

    var map = newBooking.toJson();
    map.removeWhere((key, value) => value == null);
    var response = await _dio.post(
      BaseService.profileEndpoint + "/$id/order/make",
      data: FormData.fromMap(map),
    );
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(response.data);
    }
    return ApiResponse(message: "cannot make order : internal server error");
  }

  @override
  Future<ApiResponse> updateProfile(
      String email, String password, String name) async {
    int id = (await _localService.getLoginDetails())["idUser"];

    var map = {
      'email': email,
      'password': password,
      'name': name,
    };
    var response = await _dio.post(
      BaseService.profileEndpoint + "/$id/update",
      data: FormData.fromMap(map),
    );
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(response.data);
    }

    return ApiResponse(message: "internal error");
  }
}

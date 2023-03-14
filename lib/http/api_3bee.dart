import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_3bee/data/user.dart';
import 'package:interview_3bee/http/models/apiaries_line_response.dart';
import 'package:interview_3bee/http/models/hive_list_response.dart';

import 'models/apiaries_list_response.dart';
import 'models/login_response.dart';

class Api3Bee {
  final host = 'api.3bee.com';
  final api = '/api/v1';

  Api3Bee();

  Future<User> login(String email, String password) async {
    var url = Uri.https(host, '$api/auth/jwt/create');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      return User.initial(
        email: email,
        accessToken: loginResponse.access,
        refreshToken: loginResponse.refresh,
      );
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<HiveListResponse> fetchHivesByApiariesId(
      String apiariesId, User user) async {
    var url = Uri.https(host, '$api/apiaries/$apiariesId/hives');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${user.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return HiveListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch hives');
    }
  }

  Future<ApiariesListResponse> fetchApiaries(User user) async {
    var url = Uri.https(host, '$api/apiaries');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${user.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return ApiariesListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch ');
    }
  }
}

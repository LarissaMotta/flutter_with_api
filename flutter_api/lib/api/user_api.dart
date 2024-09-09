import 'dart:convert';
import 'dart:io';

import 'package:flutter_api/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserApi {
  final String baseUrl = "https://reqres.in/api/users";

  Future<List<User>> getAllUsers() async {
    final Response response = await http.get(Uri.parse('$baseUrl?per_page=12'));
    if(response.statusCode != 200) {
      throw const HttpException("The request has failed");
    }
    final List<dynamic> decodedJson =  jsonDecode(response.body)['data'];
    return decodedJson.map((dynamic json) => User.fromJson(json)).toList();
  }

  Future<User> getUser(int id) async {
    final Response response = await http.get(Uri.parse('$baseUrl/$id'));
    if(response.statusCode != 200) {
      throw const HttpException("The request has failed");
    }
    final dynamic decodedJson =  jsonDecode(response.body)['data'];
    return User.fromJson(decodedJson);
  }
}

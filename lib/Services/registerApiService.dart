import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = 'http://sowlab.pw/assignment/user/register/';

  Future<http.Response> registerUser(Map<String, dynamic> userData) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        body: userData,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }
}

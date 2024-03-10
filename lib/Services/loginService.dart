import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final String apiUrl = 'https://sowlab.pw/assignment/user/login';
    final String email = emailController.text;
    final String password = passwordController.text;

    // Define the login model
    Map<String, dynamic> loginData = {
      "email": email,
      "password": password,
      "role": "farmer",
      "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      "type": "email", // Assuming it's an email login
      "social_id": "" // Assuming it's not a social login
    };

    // Convert the model to JSON
    String body = json.encode(loginData);

    // Make the HTTP POST request
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: body,
    );

    // Check if the request is successful
    if (response.statusCode == 200) {
      // Handle the successful login
      print('Login Successful!');
      print(response.body);
      // Navigate to the next screen or perform any other actions
    } else {
      // Handle errors
      print('Login Failed: ${response.statusCode}');
      print(response.body);
      // Display error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to login. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginUser,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

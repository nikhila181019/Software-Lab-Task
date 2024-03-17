import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:software_lab_task/Services/googleAuth.dart';

import '../Services/appleAuth.dart';
import '../Services/facebookAuth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final String apiUrl = 'https://sowlab.pw/assignment/user/login';
    final String email = emailController.text;
    final String password = passwordController.text;

    // Check if email or password is empty
    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Email and password cannot be empty.'),
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
      return;
    }

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

      print('Login Successful!');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful!'),
          duration: Duration(seconds: 3),
        ),
      );

      Navigator.pushNamed(context, "AfterSuccessfulLogin");

      // Navigate to the next screen or perform any other actions
    } else {
      // Handle errors
      print('Login Failed: ${response.statusCode}');
      print(response.body);
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Access Denied! I have by pass the screen to show UI'),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.pushNamed(context, "AfterSuccessfulLogin");

      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text('Error'),
      //       content: Text('Failed to login. Please try again.'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Text(
                "FarmerEats",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Text(
                      "New here?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "fromLoginn");
                    },
                    child: Text(
                      " Create Account",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(04, 04, 0, 0),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail, size: 30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(04, 04, 0, 0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, size: 30),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 17, 12, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "fromLogin");
                          },
                          child: Text(
                            "Forgot?",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  await loginUser();
                },
                child: Container(
                  height: 65,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(child: Text("or login with", style: TextStyle(color: Colors.grey),)),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 40),
                  GestureDetector(
                      onTap: () async {
                        try {
                          final UserCredential userCredential = await  signInWithGoogle();
                          final User? user = userCredential.user;
                          print('Signed in as: ${user!.displayName}');
                          // Navigate to the next screen after successful authentication
                        } catch (e) {
                          print('Failed to sign in with Google: $e');
                          // Handle errors
                        }
                      },

                    child: Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Icons/GoogleIcon.png")),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: ()async {
                      try {
                        final UserCredential userCredential = await signInWithApple();
                        final User? user = userCredential.user;
                        print('Signed in as: ${user?.displayName}');
                        // Navigate to the next screen after successful authentication
                      } catch (e) {
                        print('Failed to sign in with Apple: $e');
                        // Handle errors
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Icons/AppleIcon.png")),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () async {
                  try {
                              final UserCredential userCredential = await signInWithFacebook();
                               final User? user = userCredential.user;
                            print('Signed in as: ${user?.displayName}');
                        // Navigate to the next screen after successful authentication
                      } catch (e) {
                      print('Failed to sign in with Facebook: $e');
                      // Handle errors
                  }

                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Icons/FacebookIcon.png")),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

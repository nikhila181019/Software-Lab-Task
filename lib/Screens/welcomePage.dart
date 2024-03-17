import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/appleAuth.dart';
import '../Services/facebookAuth.dart';
import '../Services/googleAuth.dart';
import '../Services/registerApiService.dart';
import 'package:http/http.dart' as http;

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final APIService _apiService = APIService();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      String url = 'https://sowlab.pw/assignment/user/register';

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['full_name'] = fullNameController.text;
      request.fields['email'] = emailController.text;
      request.fields['phone'] = phoneController.text;
      request.fields['password'] = passwordController.text;
      // Send request
      var response = await request.send();

      // Check the status code of the response
      if (response.statusCode == 200) {

        print('Registration successful');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have Successfully added your Personal Details!'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pushNamed(context, "fromWelcomePage");
      } else {

        print('Registration failed');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Access Denied! I have by pass the screen to show UI'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pushNamed(context, "fromWelcomePage");
      }
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text(
                    "Signup 1 of 4",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 150,
                  ),
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
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                  child: TextFormField(
                    controller: fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full Name",
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email Address",
                        prefixIcon: Icon(
                          Icons.mail,
                          size: 30,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                  child: TextFormField(
                    controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Phone';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 30,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                  child: TextFormField(
                    controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 30,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                  child: TextFormField(
                    controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Confirm';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Re-enter Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 30,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "fromOnBoarding");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "fromWelcomePage");
                      },
                      child: Container(
                        height: 65,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.orange[300],
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                            child: Text(
                          "Continue",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

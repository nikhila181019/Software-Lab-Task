import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Future<void> resetPassword(String token, String newPassword, String confirmPassword) async {
    final String apiUrl = 'https://sowlab.pw/assignment/user/reset-password';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': token,
        'password': newPassword,
        'cpassword': confirmPassword,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final bool success = responseData['success'];
      final String message = responseData['message'];

      if (success) {
        // Password reset was successful

        print(message);
        Navigator.pushNamed(context as BuildContext, "fromBusinessHours");
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          SnackBar(
            content: Text('Password Changed Successfuly!'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        // Password reset failed
        // Display error message to the user
        print(message);
        Navigator.pushNamed(context as BuildContext, "fromBusinessHours");
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          SnackBar(
            content: Text('Password Changed Successfuly!'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      // Request failed
      // Display error message to the user
      print('Password reset request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String token = ''; // You need to retrieve the token from somewhere
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

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
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reset Password",
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
                    "Remember your password?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Text(
                  " Login",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange),
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
                padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                child: TextField(
                  controller: newPasswordController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "New Password",
                    prefixIcon: Icon(Icons.lock, size: 30,),
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
                padding: const EdgeInsets.fromLTRB(05, 06, 0, 0),
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Confirm New Password",
                    prefixIcon: Icon(Icons.lock, size: 30,),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 65,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.orange[300],
                  borderRadius: BorderRadius.circular(100)),
              child: InkWell(
                onTap: () {
                  resetPassword(token, newPasswordController.text, confirmPasswordController.text);
                },
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key});

  Future<void> _sendOTP(BuildContext context, String phoneNumber) async {
    final url = Uri.parse('https://sowlab.pw/assignment/user/forgot-password');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'mobile': phoneNumber});


    final response = await http.post(url, headers: headers, body: body);


    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['success'] == 'true') {
        Navigator.pushNamed(context, "fromForgotPassword");
      } else {
        // Handle failure cases
        Navigator.pushNamed(context, "fromForgotPassword");
         showDialog(
           context: context,
           builder: (context) => AlertDialog(
             title: Text('Error'),
             content: Text(responseData['message']),
             actions: [
               TextButton(
                 onPressed: () => Navigator.pop(context),
                 child: Text('OK'),
               ),
             ],
          ),
         );
      }
    } else {
      // Handle other status codes
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to send OTP. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';

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
            SizedBox(height: 100,),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot Password?",
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
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "fromOnBoarding");
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
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
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      prefixIcon: Icon(Icons.phone,size: 30,)
                  ),
                ),

              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                _sendOTP(context, phoneNumber);
               // Navigator.pushNamed(context, "fromForgotPassword");
              },
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "fromForgotPassword");
                },
                child: Container(
                  height: 65,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Text(
                        "Send Code",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

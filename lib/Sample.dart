import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController informalNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  Future<void> registerUser() async {
    String url = 'https://sowlab.pw/assignment/user/register';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add text fields
    request.fields['full_name'] = fullNameController.text;
    request.fields['email'] = emailController.text;
    request.fields['phone'] = phoneController.text;
    request.fields['password'] = passwordController.text;
    request.fields['role'] = 'farmer';
    request.fields['business_name'] = businessNameController.text;
    request.fields['informal_name'] = informalNameController.text;
    request.fields['address'] = addressController.text;
    request.fields['city'] = cityController.text;
    request.fields['state'] = stateController.text;
    request.fields['zip_code'] = zipCodeController.text;
    request.fields['registration_proof'] = 'my_proof.pdf';
    request.fields['device_token'] = '0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx';
    request.fields['type'] = 'email';
    request.fields['social_id'] = '';

    // Add business hours
    request.fields['business_hours'] = jsonEncode({
      "mon": ["8:00am - 10:00am", "10:00am - 1:00pm"],
      "tue": ["8:00am - 10:00am", "10:00am - 1:00pm"],
      "wed": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
      "thu": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
      "fri": ["8:00am - 10:00am", "10:00am - 1:00pm"],
      "sat": ["8:00am - 10:00am", "10:00am - 1:00pm"],
      "sun": ["8:00am -10:00am"]
    });

    // Send request
    var response = await request.send();

    // Check the status code of the response
    if (response.statusCode == 200) {
      // Registration successful
      print('Registration successful');
    } else {
      // Registration failed
      print('Registration failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: fullNameController, decoration: InputDecoration(labelText: 'Full Name')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Phone')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password')),
            TextField(controller: businessNameController, decoration: InputDecoration(labelText: 'Business Name')),
            TextField(controller: informalNameController, decoration: InputDecoration(labelText: 'Informal Name')),
            TextField(controller: addressController, decoration: InputDecoration(labelText: 'Address')),
            TextField(controller: cityController, decoration: InputDecoration(labelText: 'City')),
            TextField(controller: stateController, decoration: InputDecoration(labelText: 'State')),
            TextField(controller: zipCodeController, decoration: InputDecoration(labelText: 'Zip Code')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

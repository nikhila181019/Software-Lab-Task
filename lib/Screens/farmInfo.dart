import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FarmInfo extends StatefulWidget {
  const FarmInfo({super.key});

  @override
  State<FarmInfo> createState() => _FarmInfoState();
}

class _FarmInfoState extends State<FarmInfo> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController informalNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Future<void> registerUser() async {

    if (_formKey.currentState!.validate()) {
      String url = 'https://sowlab.pw/assignment/user/register';

      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add text fields

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

      // Send request
      var response = await request.send();

      // Check the status code of the response
      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have Successfully added your Business Details!'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pushNamed(context, "fromFarmInfo");
      } else {
        // Registration failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have Successfully added your Business Details!'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pushNamed(context, "fromFarmInfo");
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
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text(
                    "Signup 2 of 4",
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
                      "Farm Info!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
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
                    controller: businessNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Business Name';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Business Name",
                        prefixIcon: Icon(Icons.tag,size: 30,)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
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
                    controller: informalNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your internal name';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Internal Name",
                        prefixIcon: Icon(Icons.tag_faces,size: 30,)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
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
                    controller: addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Home",
                        prefixIcon: Icon(Icons.home,size: 30,)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
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
                    controller: cityController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "City",
                        prefixIcon: Icon(Icons.location_city,size: 30,)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(17, 06, 0, 0),
                        child: TextFormField(
                          controller: stateController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "State",
                            suffixIcon: Icon(Icons.arrow_drop_down,size: 30,),

                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 29.0),
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(17, 06, 0, 0),
                        child: TextFormField(
                          controller: zipCodeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter ZipCode",

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 140,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "fromLoginn");
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Icons/BackButton.png")
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 68.0),
                    child: GestureDetector(
                      onTap: registerUser,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

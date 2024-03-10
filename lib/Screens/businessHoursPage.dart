import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class BusinessHours extends StatefulWidget {
  const BusinessHours({Key? key});

  @override
  _BusinessHoursState createState() => _BusinessHoursState();
}

class _BusinessHoursState extends State<BusinessHours> {
  Future<void> registerUser() async {
    String url = 'https://sowlab.pw/assignment/user/register';

    var request = http.MultipartRequest('POST', Uri.parse(url));
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hurray! Registration Successful!'),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.pushNamed(context, "fromBusinessHours");
    } else {
      // Registration failed
      print('Registration failed');
    }
  }
  List<String> selectedDays = [];
  List<String> selectedTimes = [];

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
      body: Column(
        children: [
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text(
                "Signup 4 of 4",
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
                  "Business Hours",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text(
                "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Row(
            children: [
              for (String day in ["M", "T", "W", "Th", "F", "S", "Su"])
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedDays.contains(day)) {
                        selectedDays.remove(day);
                      } else {
                        selectedDays.add(day);
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: selectedDays.contains(day) ? Colors.orange[300] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text(day,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 30,),
              Row(
                children: [
                  for (String time in ["8:00am - 10:00am", "10:00am - 01:00pm"])
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedTimes.contains(time)) {
                            selectedTimes.remove(time);
                          } else {
                            selectedTimes.add(time);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 60,
                          width: 190,
                          decoration: BoxDecoration(
                              color: selectedTimes.contains(time) ? Colors.orange[300] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text(time,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [

                  for (String time in ["1:00pm - 04:00pm", "04:00pm - 07:00pm",])
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedTimes.contains(time)) {
                            selectedTimes.remove(time);
                          } else {
                            selectedTimes.add(time);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 60,
                          width: 190,
                          decoration: BoxDecoration(
                              color: selectedTimes.contains(time) ? Colors.orange[300] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text(time,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [

                  for (String time in ["07:00pm - 10:00pm",])
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedTimes.contains(time)) {
                            selectedTimes.remove(time);
                          } else {
                            selectedTimes.add(time);
                          }
                        });


                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 60,
                          width: 190,
                          decoration: BoxDecoration(
                              color: selectedTimes.contains(time) ? Colors.orange[300] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text(time,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                ],
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,140,0,0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "fromFarmInfo");
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
                            "Submit",
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
        ],
      ),
    );
  }
}


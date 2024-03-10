import 'package:flutter/material.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

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
                "Signup 3 of 4",
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
                  "Verification",
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
                "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text(
                    "Attach proof of registration",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75.0),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/Icons/CameraIcon.png"),
                    )
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,350,0,0),
            child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, "fromWelcomePage");
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
                    onTap: (){
                      Navigator.pushNamed(context, "fromVerification");
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
            ),
          ),
        ],
      ),
    );
  }
}

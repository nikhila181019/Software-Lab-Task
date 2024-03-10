import 'package:flutter/material.dart';
import 'package:software_lab_task/Data/onBoardingData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<onBoardingEntity> _onBoardingData = onBoardingEntity.onBoardingData;
    return Scaffold(
        body: PageView.builder(
            itemCount: _onBoardingData.length,
            itemBuilder: (context, index) {
              return BoardingPage(
                  bgColor: _onBoardingData[index].bgColor,
                  image: _onBoardingData[index].image,
                  title: _onBoardingData[index].title,
                  description: _onBoardingData[index].description,
                  index: index);
            }));
  }
}

class BoardingPage extends StatelessWidget {
  final Color bgColor;
  final String image;
  final String title;
  final String description;
  final int index;

  const BoardingPage({
    Key? key,
    required this.bgColor,
    required this.image,
    required this.title,
    required this.description,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
              height: 400,
              width: 4000,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/OnBoarding/$image"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 355,
                width: 440,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text(
                        "$title",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Text(
                          "$description",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0 ? Colors.black : Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                            width: 10,
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 1 ? Colors.black : Colors.grey),
                          ),
                          SizedBox(height: 15, width: 10),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 2 ? Colors.black : Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "fromLoginn");
                        },
                        child: Container(
                          height: 65,
                          width: 250,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(child: Text("Join the Movement",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Colors.white),)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "fromOnBoarding");
                        },
                          child: Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),))
                    ],

                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

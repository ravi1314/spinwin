import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spin_win/screen/home_screen.dart';
// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

class Instructions_Screen extends StatefulWidget {
  const Instructions_Screen({super.key});

  @override
  State<Instructions_Screen> createState() => _Instructions_ScreenState();
}

class _Instructions_ScreenState extends State<Instructions_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Welcome User',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "That is Some Instructions for win Reward",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Card(
                  color: Colors.amber,
                  child: Text(
                    "Hello User We Provide link to user so user can receive Coin from Coin Master",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Card(
                  color: Colors.amber,
                  child: Text(
                    "That means You Need Install Coin Master",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/image/coinmaster.png')),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () {
                  Get.offAll(() => Home_Screen());
                },
                child: Text("Continue"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

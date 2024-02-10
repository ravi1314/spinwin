import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spin_win/screen/istrction_screen.dart';
// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/image/Subscribe.jpg')),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Text("Spin And Win",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              Text("Reward spin Link",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text("We Provide Reward spin link ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text("By Continuing you Agree to our Privacy Policy",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
              Text("Terms of use and Privacy Policy.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
              SizedBox(
                height: 100,
              ),
              MaterialButton(
                color: Colors.amber,
                onPressed: () {
                  Get.to(() => Instructions_Screen());
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

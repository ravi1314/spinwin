import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spin_win/screen/mainscreen.dart';
// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

class Splace_screen extends StatefulWidget {
  const Splace_screen({super.key});

  @override
  State<Splace_screen> createState() => _Splace_screenState();
}

class _Splace_screenState extends State<Splace_screen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      CircularProgressIndicator();
      Get.offAll(() => Main_Screen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 200),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/image/Subscribe.jpg')),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  alignment: Alignment.center,
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Spin & Win',
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  ),
                ),
                Text("Reward spin Link",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

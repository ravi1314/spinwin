import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spin_win/model/link_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, unused_element, deprecated_member_use

// ignore_for_file: prefer_const_constructors

// ignore_for_file: camel_case_types

class Link_Screen extends StatelessWidget {
  String docId;
  String date;
  LinkModel linkModel;
  Link_Screen(
      {super.key,
      required this.linkModel,
      required this.docId,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Spin & Win '),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('asset/image/spinwin.jpg'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Spin and Win Your Reward",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 5,
                  semanticContainer: true,
                  child: ListTile(
                    title: Text(linkModel.link.toString()),
                    subtitle: Text(linkModel.date.toString()),
                    trailing: Icon(
                      Icons.money,
                      size: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                shape: Border.all(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
                color: Colors.amber,
                onPressed: () {
                  _launchURL(linkModel.newlink);
                },
                child: Text("Win Your Reward"),
              )
            ],
          ),
        ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

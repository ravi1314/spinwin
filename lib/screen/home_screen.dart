import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spin_win/api/firebase_api.dart';
import 'package:spin_win/model/link_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:spin_win/screen/link_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:spin_win/notificationservice/local_notification_service.dart';
// ignore_for_file: camel_case_types, prefer_const_constructors

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  get $time => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Spin & Win '),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('spinlink').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  var time = DateTime.now();

                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];

                        LinkModel linkModel = LinkModel(
                            date: data['date'],
                            id: data['id'],
                            newlink: data['newlink'],
                            link: data['link']);
                        return Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Colors.white,
                              elevation: 7,
                              semanticContainer: true,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('asset/image/Subscribe.jpg'),
                                  backgroundColor: Colors.white,
                                ),
                                title: Text(linkModel.link),
                                subtitle: Text(linkModel.date),
                                trailing: InkWell(
                                  // onTap: () => _launchURL(link),
                                  onTap: () {
                                    Get.to(() => Link_Screen(
                                          docId: snapshot.data!.docs[index].id,
                                          date: snapshot.data!.docs[index]
                                              ['date'],
                                          linkModel: LinkModel(
                                              id: data['id'],
                                              newlink: data['newlink'],
                                              date: data['date'],
                                              link: data['link']),
                                        ));
                                  },
                                  child: Icon(
                                    Icons.arrow_circle_right,
                                    size: 50.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error is ${snapshot.hasError.toString()}'),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }
}

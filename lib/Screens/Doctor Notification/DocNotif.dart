import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vjti/Colors/color.dart';
import 'package:vjti/Screens/Doctor%20Notification/Medication.dart';

class DocNotification extends StatefulWidget {
  const DocNotification({super.key});

  @override
  State<DocNotification> createState() => _DocNotificationState();
}

class _DocNotificationState extends State<DocNotification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Doc Notification"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, Index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kLighterGreen,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.07,

                            // ignore: prefer_const_constructors
                            backgroundImage: NetworkImage(
                                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fthenounproject.com%2Fbrowse%2Ficons%2Fterm%2Fcircle-avatar%2F&psig=AOvVaw1GeW7A5wTpuBFoMXPzCppW&ust=1677328946236000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCLiVgrGXrv0CFQAAAAAdAAAAABAE"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Patients Name",
                              style: kPoppinsBold.copyWith(
                                  fontSize: 19, color: kBlack),
                            ),
                            Text(
                              "Patient Age",
                              style: kPoppinsMedium.copyWith(
                                  color: kBlack, fontSize: 17),
                            ),
                            Text("Appointment Timing",
                                style: kPoppinsMedium.copyWith(
                                    color: kBlack, fontSize: 17))
                          ],
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PatientMedication();
                          })),
                          icon: Icon(Icons.medical_information_outlined),
                          color: kDarkBlue,
                          iconSize: 35,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    ));
  }
}
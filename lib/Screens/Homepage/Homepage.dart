// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vjti/Screens/DoctorList/DoctorList.dart';
import 'Models/specialisation.dart';
import 'package:vjti/Colors/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<specialisation> Spec = [
    specialisation('assets/Specialisation/cardiology.jpg', 'Cardiology'),
    specialisation('assets/Specialisation/Diebetes.jpg', 'Diabetes'),
    specialisation('assets/Specialisation/Gynecology.jpg', 'Gynecology'),
    specialisation('assets/Specialisation/Neurology.jpg', 'Neurology'),
    specialisation('assets/Specialisation/Oral_Health.jpg', 'Dentist'),
    specialisation('assets/Specialisation/Otology.jpg', 'Otology'),
    specialisation('assets/Specialisation/Pulmonology.jpg', 'Pulmonology'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 58,
              elevation: 10,
              title: Center(
                  child: Text(
                'AAROGYAग्राम',
                style: TextStyle(fontSize: 28),
              )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              backgroundColor: kDarkBlue,
              foregroundColor: kLighterGreen,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.325,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(15),
                          height: 304,
                          width: 255,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                kGreenishBlue,
                                kMildgreen,
                                kLighterGreen
                              ],
                            ),
                            color: kLighterGreen,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: Text(
                      "Medical Specialities",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1f1545)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView.builder(
                      itemCount: Spec.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          width: 95,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 249, 255),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return DoctorList();
                                })),
                                icon: Image.asset(
                                  '${Spec[index].url}',
                                  fit: BoxFit.cover,
                                ),
                                iconSize: 35,
                              ),
                              Text(
                                '${Spec[index].spec}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: Text(
                      "Recommended Doctors",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1f1545)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: kDarkBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(children: [
                            Row(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpXPyXbPKBb4oyJGgtHpo7c24w_7o2mbBENJlVUoiGv7tB7sqnl4bjAvNijfGwyT3-Ass&usqp=CAU")),
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "data",
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "data",
                                        style: TextStyle(
                                            color: kWhite, fontSize: 15),
                                      ),
                                      Text(
                                        "data ",
                                        style: TextStyle(
                                            color: kWhite, fontSize: 15),
                                      ),
                                    ])
                              ],
                            ),
                            Divider(
                              color: kWhite,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                          ]),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}

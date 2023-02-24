// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vjti/Screens/DoctorList/DoctorList.dart';
import 'package:vjti/Screens/Homepage/Models/HospitalDetails.dart';
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

  List<String> pharma = [
    "assets/OnlineMedication/TrueMeds.jpg",
    'assets/OnlineMedication/Pharmeasy.jpg',
    'assets/OnlineMedication/netmeds.jpg'
  ];

  List<Hospitaldetails> hospitaldetails = [
    Hospitaldetails(
        Hospitalname: "Deenanath Mangeshkar",
        Hospitalimg: 'assets/Hospital/Deenanath.jpg')
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
                      itemCount: hospitaldetails.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(12),
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
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/Hospital/Deenanath.jpg'),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${hospitaldetails[index].Hospitalname}",
                                      style: TextStyle(fontSize: 12),
                                      softWrap: true,
                                    )
                                  ],
                                )
                              ],
                            ),
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
                                iconSize: 40,
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
                      "Online Pharmacy",
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
                      itemCount: pharma.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('${pharma[index]}'),
                                fit: BoxFit.contain),
                            color: kDarkBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}

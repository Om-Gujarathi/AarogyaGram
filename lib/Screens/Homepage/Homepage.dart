// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vjti/Screens/DoctorList/DoctorList.dart';
import 'package:vjti/Screens/Homepage/Models/HospitalDetails.dart';
import 'Models/Pharmacy.dart';
import 'Models/specialisation.dart';
import 'package:vjti/Colors/color.dart';
import 'package:url_launcher/url_launcher.dart';

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

  List<Pharmacy> pharma = [
    Pharmacy(
        img: "assets/OnlineMedication/TrueMeds.jpg",
        site: 'https://www.1mg.com/'),
    Pharmacy(
        img: 'assets/OnlineMedication/Pharmeasy.jpg',
        site: 'https://pharmeasy.in/'),
    Pharmacy(
        img: 'assets/OnlineMedication/netmeds.jpg',
        site: 'https://www.netmeds.com/')
  ];

  List<Hospitaldetails> hospitaldetails = [
    Hospitaldetails(
        Hospitalname: "Deenanath Mangeshkar",
        Hospitalimg: 'assets/Hospital/Deenanath.jpg',
        Address:
            'Deenanath Mangeshkar Hospital Road, near Mhatre Bridge, Erandwane, Pune, Maharashtra 411004'),
    Hospitaldetails(
        Hospitalname: "Sinhgad Hospital",
        Hospitalimg: 'assets/Hospital/Sinhgad.jpg',
        Address:
            'S. No. 44/1, Vadgaon Budruk, 0ff, Sinhgad Rd, Pune, Maharashtra 411041'),
    Hospitaldetails(
        Hospitalname: "Sahyadri Hospital",
        Hospitalimg: 'assets/Hospital/Sahyadri.jpg',
        Address:
            'Plot No. 30-C, Erandvane, Karve Rd, Deccan Gymkhana, Pune, Maharashtra 411004'),
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
            body: SingleChildScrollView(
              child: Column(
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                '${hospitaldetails[index].Hospitalimg}'),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${hospitaldetails[index].Hospitalname}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            softWrap: true,
                                          ),
                                          Text(
                                            "General Hospital",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            softWrap: true,
                                          ),
                                          RatingBar.builder(
                                              initialRating: 2,
                                              minRating: 1,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.all(2),
                                              itemSize: 20,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                              onRatingUpdate: (rating) =>
                                                  debugPrint(
                                                      rating.toString())),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${hospitaldetails[index].Address}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic),
                                  ),
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
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return DoctorList(
                                      specialisation: Spec[index].spec!,
                                    );
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
                              // image: DecorationImage(
                              //     image: AssetImage('${pharma[index]}'),
                              //     fit: BoxFit.contain),
                              color: kDarkBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ElevatedButton(
                                onPressed: () async {
                                  launch('${pharma[index].site}');
                                },
                                child: Image.asset("${pharma[index].img}")),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

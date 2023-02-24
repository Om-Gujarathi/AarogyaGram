// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:doctorlist/BookingAppointment.dart/Appointment.dart';-0000000
import 'package:vjti/Colors/color.dart';
import 'package:vjti/Screens/AppointmentScreen/AppointmentScreen.dart';
import 'Doctors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  final List<String> _items = ["Archit", "Archit", "Archit"];

  List<Doctors> doc = [
    Doctors("Dr. Archit K", 4, "Physiotherapist", "Sinhgad Hospital",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxUJ_kOh-4mPOy2oYS6a7fe6gNfuF17uM61Q&usqp=CAU"),
    Doctors("Dr. Sheetal", 3, "Cardiologist", "Deenanath Hospital",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7_jlk_CHax5EgR5RuKXskRxJi6jTrf_a5jK0inaEzkrO99r7klaHvGz_yEVeApgh7On4&usqp=CAU"),
    Doctors("Dr. Archit K", 5, "Physiotherapist", "AK Clinic",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5HKYSiWWJJUfj3pU3g6trGaxnbPj5pADrKQ&usqp=CAU"),
    Doctors("Dr. Archit K", 1, "Physiotherapist", "AK Clinic",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxUJ_kOh-4mPOy2oYS6a7fe6gNfuF17uM61Q&usqp=CAU"),
    Doctors("Dr. Archit K", 2, "Physiotherapist", "AK Clinic",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxUJ_kOh-4mPOy2oYS6a7fe6gNfuF17uM61Q&usqp=CAU")
  ];

  // void updateSearchlist(String value) {
  //   //Fucntion to filter our searches
  //   setState(() {
  //     diaplaylist = doc
  //         .where((element) =>
  //             element.Specialisation!.toLowerCase().contains(value.toString()))
  //         .toList();
  //   });
  // }

  double? _rating;
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  // List<Doctors> diaplaylist = doc;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: null,
                //  (value) => updateSearchlist(value),
                style: TextStyle(color: kGreenishBlue, fontSize: 18),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: kGreenishBlue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    hintText: ("Serach for treatment"),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: kLighterGreen,
                    ),
                    prefixIcon: Icon(Icons.search_outlined),
                    prefixIconColor: kLighterGreen),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: doc.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height * 0.28,
                          decoration: BoxDecoration(
                              color: kLighterGreen,
                              //  Color(0xFF7553F6),
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        decoration: BoxDecoration(
                                          // color: Colors.bl'ack,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "${doc[index].Photo}")),
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Column(children: [
                                      Text(
                                        "${doc[index].Name}",
                                        style: TextStyle(
                                            color: kDarkBlue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${doc[index].Specialisation}",
                                        style: TextStyle(
                                            color: kDarkBlue, fontSize: 15),
                                      ),
                                      Text(
                                        "${doc[index].Hospital_Name}",
                                        style: TextStyle(
                                          color: kDarkBlue,
                                          fontSize: 13,
                                        ),
                                      ),
                                      RatingBar.builder(
                                          initialRating: 2,
                                          minRating: 1,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.all(2),
                                          itemSize: 20,
                                          itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                          onRatingUpdate: (rating) =>
                                              debugPrint(rating.toString())),
                                    ]),
                                  ],
                                ),
                              ),
                              Divider(
                                color: kDarkBlue,
                              ),
                              // Text(
                              //   "_______________________________________________________________________",
                              //   style:
                              //       TextStyle(color: Colors.grey, fontSize: 10),
                              // ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 8, 5, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Available Now",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: kDarkBlue),
                                        ),
                                        Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.video,
                                              size: 14,
                                              color: Color.fromARGB(
                                                  255, 58, 180, 62),
                                            ),
                                            Text(
                                              "  Video Call",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: kDarkBlue),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kDarkBlue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DoctorAppointmentScreen())),
                                  child: Text(
                                    "Book Appointment",
                                    style: TextStyle(fontSize: 20),
                                  ))
                            ],
                          ),
                        );
                      })))
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

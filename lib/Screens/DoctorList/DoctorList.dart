// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:doctorlist/BookingAppointment.dart/Appointment.dart';-0000000
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vjti/Colors/color.dart';
import 'package:vjti/Screens/AppointmentScreen/AppointmentScreen.dart';
import 'package:vjti/Screens/Homepage/Models/specialisation.dart';
import 'package:vjti/Services/FirestoreServices.dart';
import '../../Modals/Doctors.dart';

import 'package:flutter/material.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key, required this.specialisation});
  final String specialisation;

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
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
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    // Stream for a particular speciality of doctors
                    stream:
                        FirestoreServices().getDoctors(widget.specialisation),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // making snapshots into a list of Qsnaps
                        List<QueryDocumentSnapshot<Map<String, dynamic>>>
                            docList = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: snapshot.data!.size,
                          itemBuilder: ((context, index) {
                            Doctor doc = Doctor.fromJSON(docList[index].data(),
                                docList[index].data()["doctorUID"]);
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DoctorAppointmentScreen(doctor: doc),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(15),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: kLighterGreen,
                                    //  Color(0xFF7553F6),
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18,
                                              decoration: BoxDecoration(
                                                // color: Colors.bl'ack,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${doc.Photo}"),
                                                ),
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                          Column(children: [
                                            Text(
                                              "${doc.Name}",
                                              style: TextStyle(
                                                  color: kDarkBlue,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${doc.Specialisation}",
                                              style: TextStyle(
                                                  color: kDarkBlue,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "${doc.Hospital_Name}",
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
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                onRatingUpdate: (rating) =>
                                                    debugPrint(
                                                        rating.toString())),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 8, 5, 0),
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
                                    // ElevatedButton(
                                    //     style: ElevatedButton.styleFrom(
                                    //         backgroundColor: kDarkBlue,
                                    //         shape: RoundedRectangleBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(20))),
                                    //     onPressed: () => Navigator.of(context).push(
                                    //         MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 DoctorAppointmentScreen())),
                                    //     child: Text(
                                    //       "Book Appointment",
                                    //       style: TextStyle(fontSize: 20),
                                    //     ))
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      }
                      return CircularProgressIndicator();
                    }),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

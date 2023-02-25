// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:vjti/Colors/color.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../Modals/Doctors.dart';
import '../../../Modals/Slots.dart';

class PatientDetails extends StatefulWidget {
  final Slot slot;
  final Doctor doctor;
  const PatientDetails({super.key, required this.slot,required this.doctor});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    var color1 = kLighterGreen;
    var color2 = kGreenishBlue;
    // PhoneNumber India = 919055668775 as PhoneNumber;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Patient's Details",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person,
                            size: 35, color: Colors.grey[700]),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Firstname Middlename Lastname",
                        // hintStyle: TextStyle(
                        //   color: Colors.grey[700],
                        // ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.calendar_month_outlined,
                            size: 35, color: Colors.grey[700]),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Enter your Age ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        AgeButton(color1: color1, color2: color2, Age: 10),
                        AgeButton(color1: color1, color2: color2, Age: 18),
                        AgeButton(color1: color1, color2: color2, Age: 30),
                        AgeButton(color1: color1, color2: color2, Age: 40),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.location_city_outlined,
                            size: 35, color: Colors.grey[700]),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Enter your City/Village Name ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Eg:- City - Pune/ Village - Pachora",
                          hintStyle: TextStyle(color: Colors.grey[700])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.phone, size: 35, color: Colors.grey[700]),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (value) {},
                        // countries: ['IND'],
                        initialValue: PhoneNumber(isoCode: 'IND'),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.groups_outlined,
                            size: 35, color: Colors.grey[700]),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: GenderPickerWithImage(
                      onChanged: (value) {},
                      size: 25,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tell me how are you feeling😄",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width * 0.155,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: color2),
                        child: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.mic,
                              size: 45,
                              color: color1,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: color2, foregroundColor: color1),
                          onPressed: () {
                            // TODO take inputs and fill out the following the appointment will be set
                            // FirestoreServices().bookAppointment(doctorUID, slot.time, patientData, rUserPatientUID)
                          },
                          child: Text("Book Appointment")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AgeButton extends StatefulWidget {
  const AgeButton(
      {super.key,
      required this.color1,
      required this.color2,
      required this.Age});

  final Color color1;
  final Color color2;
  final int Age;

  @override
  State<AgeButton> createState() => _AgeButtonState();
}

class _AgeButtonState extends State<AgeButton> {
  bool istapped = false;

  var color_primary = kLighterGreen;
  var color_secondary = kGreenishBlue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, top: 8),
      height: 68,
      width: 68,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            istapped = !istapped;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: istapped ? color_secondary : color_primary,
            foregroundColor: istapped ? color_primary : color_secondary),
        child: Text("+${widget.Age} Years"),
      ),
    );
  }
}

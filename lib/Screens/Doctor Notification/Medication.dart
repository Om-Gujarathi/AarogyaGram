// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

import '../../Colors/color.dart';

class PatientMedication extends StatefulWidget {
  const PatientMedication({super.key});

  @override
  State<PatientMedication> createState() => Patient_MedicationState();
}

class Patient_MedicationState extends State<PatientMedication> {
  void deleteReminder() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Patient Medication"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.person_2_outlined,
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
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Text("data",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey[700],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Diagnosis",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: kLighterGreen,
                ),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // MedicineReminder reminder = reminders[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 15),
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: kLighterGreen,
                        elevation: 20,
                        shadowColor: kGreenishBlue,
                        child: ListTile(
                          contentPadding: EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 10),
                          iconColor: Colors.red,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Data",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          subtitle: Text(
                            'data',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            // onPressed: () =>
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => Container(
                                        padding: EdgeInsets.all(20),
                                        child: Center(
                                          child: AlertDialog(
                                            title: const Text(
                                              "Delete reminder ?",
                                              textAlign: TextAlign.center,
                                            ),
                                            content: const Text(
                                              "Are you sure that you want to delete this reminder ?",
                                              textAlign: TextAlign.center,
                                            ),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: const Text("CANCEL"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      deleteReminder();
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: const Text(
                                                      "DELETE",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vjti/Modals/Doctors.dart';

import '../../Modals/Slots.dart';
import '../../Services/FirestoreServices.dart';
import '../DoctorList/Patient/Appointment.dart';
import 'Utils/SlotsCard.dart';

class DoctorAppointmentScreen extends StatelessWidget {
  final Doctor doctor;
  Slot? _selectedSlot;
  DoctorAppointmentScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue.shade200, Colors.blue],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 55, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // TODO: Implement the back navigation
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 35,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // TODO: Implement the favourites functionality
                            },
                            child: Icon(
                              Icons.favorite_border,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Patients",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "1.8k",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Experience",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${doctor.Experience} years",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Rating",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "4.3",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.Name!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.monitor_heart,
                        color: Colors.red,
                        size: 28,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        doctor.Specialisation!,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FirestoreServices().getSlots(doctor.uid!),
                      builder: (context, snapshot) {
                        QuerySnapshot<Map<String, dynamic>> data =
                            snapshot.data!;
                        // print(data.docs[0].data());
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return CircularProgressIndicator();
                        if (snapshot.hasData) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            // height: 220,
                            child: Card(
                              borderOnForeground: true,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: TextFormField(
                                            onChanged: (value) => print(value),
                                            cursorWidth: 6,
                                            keyboardType:
                                                TextInputType.datetime,
                                            decoration: const InputDecoration(
                                                hintText: "Enter date",
                                                prefixIcon:
                                                    Icon(Icons.date_range),
                                                prefixIconColor: Colors.black),
                                          ),
                                        ),
                                        Text(snapshot.data!.size.toString() +
                                            " slots")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Expanded(
                                        child: ListView.builder(
                                            itemCount: snapshot.data!.size,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              Slot slot = Slot.fromJSON(
                                                  data.docs[index].data(),
                                                  data.docs[index].id);
                                              // print("Slot Recieved : \n$slot");
// TODO make this GD change it's colour when tapped and also update the value of appointmentTime variable above
                                              return SlotsCard(
                                                slot: slot,
                                                function: () {
                                                  _selectedSlot = Slot(
                                                      doctorUID: slot.doctorUID,
                                                      slotUID: slot.slotUID,
                                                      time: slot.time,
                                                      isAvailable:
                                                          slot.isAvailable);
                                                },
                                              );
                                            }),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        if (_selectedSlot == null) {
                          SnackBar(
                            content: Text("No slot selected"),
                            // content: Text(
                            //     "Laudya Slots tuza baap select karnar ka?"),
                          );
                          return;
                        }
                        try {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientDetails(
                                doctor: doctor,
                                slot: _selectedSlot!,
                              ),
                            ),
                          );
                        } on Exception catch (e) {
                          throw e;
                        }
                      },
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            "Book Appointment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

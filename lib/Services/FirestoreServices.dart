import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Modals/RUser.dart';
import '../Modals/Slots.dart';


class FirestoreServices {
  final FirebaseFirestore _dataBase = FirebaseFirestore.instance;

  Future<RUser> uidToRUser(String uid) async {
    DocumentSnapshot? rUserDoc;

    RUser rUser = RUser(uid: "", name: "", email: "", role: "");
    bool RUserExists;
    try {
      rUserDoc = await _dataBase.collection("RUser").doc(uid).get();
      print(rUserDoc.exists);
      RUserExists = rUserDoc.exists;
      print(rUserDoc.data());

      if (rUserDoc.exists) {
        rUser = RUser(
            uid: uid,
            name: rUserDoc["name"],
            email: rUserDoc["email"],
            role: rUserDoc["role"]);
        print("${rUser.email}\n${rUser.name}\n${rUser.role}\n${rUser.uid}");
      }

      // }
    } catch (e) {
      print(e);
    }
    return rUser;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAppointments(String doctorUID,
          {bool isDescending = false}) =>
      _dataBase
          .collection("appointments")
          .where("doctorUID", isEqualTo: doctorUID)
          .where("appointmentCompleted", isEqualTo: false)
          // .orderBy("time", descending: isDescending)
          .snapshots();

  void bookAppointment(String doctorUID, DateTime dateTime, String patientUID,
      bool paymentStatus) {
    // _dataBase.collection("appointments").where("patientsUID",isEqualTo: "patientUID");
    // TODO slots need to be made unavailable
    _dataBase.collection("appointments").add({
      "patientUID": patientUID,
      "doctorUID": doctorUID,
      "time": dateTime,
      "paymentStatus": paymentStatus,
      "appointmentCompleted": false
    });
  }

  void createHostipal(
      String adminUID, String hospitalName, double lat, double long) async {
    DateTime now = DateTime.now();
    // Adding Info to Hospital collection
    DocumentReference<Map<String, dynamic>> hospital =
        await _dataBase.collection("hospitals").add({
          "name":hospitalName,
      "createdBy": adminUID,
      "doctors": [adminUID],
      "time": now,
      "lat": lat,
      "long": long,
    });
    // updating hospital
    _dataBase.collection("RUser").doc(adminUID).update({
      "Hospital": FieldValue.arrayUnion([hospital.id])
    });
  }

  void addDoctorInHospital(
      String hospitalUID, String doctorUID) async {

      _dataBase.collection("hospitals").doc(hospitalUID).update({
      "doctors" : FieldValue.arrayUnion([doctorUID])
    });

      _dataBase.collection("RUser").doc(doctorUID).update({
      "Hospital": FieldValue.arrayUnion([hospitalUID])
    });

  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSlots(String doctorUID,
          {bool isDescending = false}) =>
      _dataBase
          .collection("Slots")
          .where("doctorUID", isEqualTo: doctorUID)
          // .orderBy("time", descending: isDescending)
          .snapshots();

  void updateSlots(Slot slot) {
    _dataBase.collection("Slots").doc(slot.slotUID).update(slot.toJSON());
  }

// This returns a slot obj using which update functionality can be easily used
// especially in book appointment and edit slots list in doctors view
  Future<Slot> setSlot(
          String doctorUID, DateTime dateTime, bool isAvailable) async =>
      await _dataBase.collection("Slots").add({
        "doctorUID": doctorUID,
        "time": dateTime,
        "available": isAvailable
      }).then((value) async {
        final docData = await value.get();
        return Slot.fromJSON({
          "doctorUID": doctorUID,
          "time": dateTime,
          "available": isAvailable
        }, value.id);
      });
}

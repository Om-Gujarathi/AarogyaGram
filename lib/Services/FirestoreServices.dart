import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vjti/Modals/Doctors.dart';

import '../Modals/RUser.dart';
import '../Modals/Slots.dart';

class FirestoreServices {
  final FirebaseFirestore _dataBase = FirebaseFirestore.instance;
  final FirebaseStorage fs = FirebaseStorage.instance;

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
          .where("isCompleted", isEqualTo: false)
          // .orderBy("time", descending: isDescending)
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> getDoctors(
          String specialisation) =>
      _dataBase
          .collection("Doctor")
          .where("Specialisation", isEqualTo: specialisation)
          .snapshots();

  void bookAppointment(String doctorUID, DateTime dateTime,
      Map<String, dynamic> patientData, String rUserPatientUID) {
    _dataBase.collection("appointments").add({
      "doctorUID": doctorUID,
      "rUserPatientUID": rUserPatientUID,
      "patientData": patientData,
      "time": dateTime,
      "isCompleted": false
    });
  }

  void createHostipal(
      String adminUID, String hospitalName, double lat, double long) async {
    DateTime now = DateTime.now();
    // Adding Info to Hospital collection
    DocumentReference<Map<String, dynamic>> hospital =
        await _dataBase.collection("hospitals").add({
      "name": hospitalName,
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

  Future<Doctor> createDoctor(
    String? uid,
    String? name,
    String? hospital_Name,
    int? experience,
    String? specialisation,
    String? photo,
  ) async =>
      // Adding Info to Doctor collection
      _dataBase.collection("Doctor").add({
        "doctorUID": uid,
        "Name": name,
        "Hospital_Name": hospital_Name,
        "Experience": experience,
        "Specialisation": specialisation,
        "Photo": photo,
      }).then((value) async {
        final doctorData = await value.get();
        return Doctor.fromJSON(doctorData.data(), value.id);
      });

  void addDoctorInHospital(String hospitalUID, String doctorUID) async {
    _dataBase.collection("hospitals").doc(hospitalUID).update({
      "doctors": FieldValue.arrayUnion([doctorUID])
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

  Future<void> storage(String uid, XFile video) async {
    Reference rootRef = fs.ref();
    Reference videoFolderRef =
        rootRef.child('videos').child("video${Random().nextInt(100)}");
    final metadata = SettableMetadata(
      contentType: 'video/mp4',
    );
    TaskSnapshot ut =
        await videoFolderRef.putFile(File(video.path), metadata);

    String uri = await ut.ref.getDownloadURL();
    addVideoUrl(uri);
    print("URL IS : " + uri);
  }

  void addVideoUrl(String url) {
    _dataBase.collection('videos').add({"videourl": url});
  }

  Future<List<String>> getVideoUrls() async {
    print("HELLO");
    List<String> videos = List.empty(growable: true);

    final Stream<QuerySnapshot> _videoStream =
        _dataBase.collection('videos').snapshots();
    int i = 0;
    _videoStream.forEach((element) {
      element.docs.forEach((element) {
        // print("EUU");
        // videos[i++] = element.get('videourl');
        // videos.add(element.get('videourl'));
        videos.add(element.get('videourl'));
      });
    });
    print(videos.length);
    return videos;
  }
}

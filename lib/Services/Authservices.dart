import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Modals/RUser.dart';
import 'FirestoreServices.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final FirestoreServices _firestoreServices = FirestoreServices();

  Stream<RUser> asyncMap(Stream<User?> stream) async* {
    await for (final element in stream) {
      final result = await _firestoreServices.uidToRUser(element!.uid);
      yield result;
    }
  }

  Stream<RUser> get rUserStream => asyncMap(_auth.authStateChanges());

  // log in
  Future<RUser> logInCustomerUsingEmailAndPassword(
    String email,
    String password,
  ) async {
    RUser rUser;
    // Logging the user in
    UserCredential creds = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    rUser = await _firestoreServices.uidToRUser(creds.user!.uid);
    print(
        "User Logged in With UID : ${creds.user != null ? creds.user!.uid : "Error"}");
    print(rUser.name);
    return rUser;
  }

  // Create
  Future<RUser> createPatient(
    String email,
    String password,
    String userName,
    String phoneNumber,
    String role,
    String gender,
    int age,
  ) async {
    UserCredential creds = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = creds.user!;
    print(
      "User Created With UID : ${creds.user != null ? creds.user!.uid : "Error"}",
    );
    // Creating RUser Obj using Firebase user
    RUser rUser =
        RUser(uid: user.uid, name: userName, email: email, role: role);

    print("Addng...");

    // Adding the user<Customer> to our database with doc ID being the FirebaseAuth UID.
    // final docRUser = db.collection("RUser").doc(creds.user!.uid.toString());
    final docUser = db.collection("patient").doc(creds.user!.uid.toString());
    await docUser.set({
      "uid": rUser.uid,
      "email": rUser.email,
      "name": userName,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "age": age,
    });
    // await docRUser.set(rUser.toJSON());

    return rUser;
  }

  void signOut() {
    _auth.signOut();
  }
  // Forgot Password
}

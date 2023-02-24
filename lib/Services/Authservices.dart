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

 Stream<RUser> get rUserStream  => asyncMap(_auth.authStateChanges()); 
  
  // .map(
  //   (user) {
  //     _firestoreServices.uidToRUser(user!.uid);
  //   },
  // );

  // log in
  Future<RUser> logInCustomerUsingEmailAndPassword(
    String email,
    String password,
    // String userName,
    // String phoneNumber,
  ) async {
    RUser rUser;
    // Logging the user in
    UserCredential creds = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    rUser = await _firestoreServices.uidToRUser(creds.user!.uid);
    // print("Sending The User Via Stream");

    // print("User Sent Via Stream");

    print(
      "User Logged in With UID : ${creds.user != null ? creds.user!.uid : "Error"}",
    );
    print(rUser.name);
    return rUser;
  }

  // Create
  Future<RUser> createRUserUsingEmailAndPassword(
    String email,
    String password,
    String userName,
    String phoneNumber,
    String role,
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
    final docUser = db.collection("RUser").doc(creds.user!.uid.toString());
    await docUser.set(rUser.toJSON());

    return rUser;
  }

  void SignOut() {
    _auth.signOut();
  }
  // Forgot Password
}

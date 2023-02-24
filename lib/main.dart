// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vjti/Screens/AuthenticationScreens/LogInScreen.dart';

import 'Modals/RUser.dart';
import 'Services/Authservices.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: defaultFirebaseAppName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      home: StreamBuilder<RUser>(
          stream: AuthServices().rUserStream,
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            //   final RUser? rUser = snapshot.data;
            //   if (snapshot.data!.role == "P") {
            //     return Container();
            //     // return DoctorAppointmentScreen();
            //   } else if (snapshot.data!.role == "D") {
            //     // return EntryPoint(rUser: rUser!);
            //     return Container();
            //   }
            // }
            return LogInPage();
          }),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vjti/Modals/RUser.dart';
import 'package:vjti/Screens/AuthenticationScreens/PatientSignupScreen.dart';
import 'package:vjti/Services/Authservices.dart';

class LogInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices _authServices = AuthServices();
  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 252),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/Images/Hospital_BG.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("Welcome to ", style: TextStyle(fontSize: 28))),
                  const Text(
                    "Arogyaग्राम",
                    style: TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.w400,
                        fontFamily: "AppName"),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      label: const Text("Email"),
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientSignInPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurpleAccent),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              elevation: 4,
                              shadowColor: Color.fromARGB(255, 34, 29, 62)),
                          onPressed: () async {
                            RUser rUser = await _authServices
                                .logInCustomerUsingEmailAndPassword(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Text(
                              "Log In",
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

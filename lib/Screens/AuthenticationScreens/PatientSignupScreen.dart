import 'package:flutter/material.dart';
import 'package:vjti/Modals/RUser.dart';
import 'package:vjti/Services/Authservices.dart';

class PatientSignInPage extends StatelessWidget {
  String? patientGender;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices _authServices = AuthServices();
  PatientSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 252),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Arogyagram",
                  style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.w400,
                      fontFamily: "AppName"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(
                    image: AssetImage("assets/Images/Patient_BG.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                // const Spacer(),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: const Text("Name"),
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter your age"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // const Spacer(),
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
                  height: 10,
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Are you a doctor?",
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
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

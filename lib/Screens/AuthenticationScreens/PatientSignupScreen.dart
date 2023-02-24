import 'package:flutter/material.dart';
import 'package:vjti/Modals/RUser.dart';
import 'package:vjti/Services/Authservices.dart';

class PatientSignInPage extends StatefulWidget {
  PatientSignInPage({super.key});

  @override
  State<PatientSignInPage> createState() => _PatientSignInPageState();
}

class _PatientSignInPageState extends State<PatientSignInPage> {
  final List<String> _genders = ['Male', 'Female', 'Other'];
  String? _selectedGender;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phNoController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  List<DropdownMenuItem<String>>? _genderDropdownItems;

  final AuthServices _authServices = AuthServices();
  @override
  void initState() {
    _genderDropdownItems = _genders.map((gender) {
      return DropdownMenuItem<String>(
        value: gender,
        child: Text(gender),
      );
    }).toList();
    _selectedGender = _genders.first;
    super.initState();
  }

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
                  controller: _nameController,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 130,
                      child: TextField(
                        controller: _ageController,
                        decoration:
                            const InputDecoration(hintText: "Enter your age"),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                        items: _genderDropdownItems,
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a gender';
                          }
                          return null;
                        },
                      ),
                    ),
                    // SizedBox(height: 16.0),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // const Spacer(),
                TextField(
                  controller: _phNoController,
                  decoration: InputDecoration(
                    label: const Text("Phone Number"),
                    hintText: "Enter Your Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        RUser rUser = await _authServices.createPatient(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          _nameController.text.trim(),
                          _phNoController.text.trim(),
                          "P",
                          _selectedGender!,
                          int.parse(
                            _ageController.text.trim(),
                          ),
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

import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
                  image:
                      AssetImage("assets/Images/Authentication_BG_Image.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Spacer(),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("Welcome to ", style: TextStyle(fontSize: 28))),
                  const Text(
                    "Arogyagram",
                    style: TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.w400,
                        fontFamily: "AppName"),
                  ),
                  const Spacer(),
                  TextField(
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
                        onTap: () {},
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
                          onPressed: () {},
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
                  // const Spacer(
                  //   flex: 2,
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:herry_up/core/data/model/login_model.dart';
import 'package:herry_up/core/data/service/login_service.dart';
import 'package:herry_up/task2/view/homepage.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              "riide",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.w200),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                  child: SizedBox(
                      width: 450,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                              style: TextStyle(color: Colors.white),
                              controller: email,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  controller: password,
                                  decoration: InputDecoration(
                                      hintText: "Enter your password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextButton(
                                  onPressed: () async {
                                    bool status =
                                        await LoginServiceImp().logIn(Mod_login(
                                      email: email.toString(),
                                      password: password.toString(),
                                    ));
                                    if (status) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ));
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.greenAccent,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white),
                                  )),
                            )
                          ]))))
        ]));
  }
}

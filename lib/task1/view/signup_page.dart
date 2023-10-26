import 'package:flutter/material.dart';
import 'package:herry_up/core/data/model/signup_model.dart';
import 'package:herry_up/core/data/service/auth_service.dart';
import 'package:herry_up/task1/view/login_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// TODO : create service function and send the user model to back end

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool ischecked = false;
  bool ischecked2 = false;
  String gender = " ";
  String birth = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "riide",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Sign up",
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.w200),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: email,
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: phone,
                          decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Text(
                            "Male",
                            style: TextStyle(color: Colors.white),
                          ),
                          Checkbox(
                            value: ischecked,
                            onChanged: (value) {
                              setState(() {
                                if (ischecked2) {
                                  ischecked2 = false;
                                  ischecked = value!;
                                } else {
                                  ischecked = value!;
                                }
                                gender = "Male";
                              });
                            },
                            checkColor: Colors.amber,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Female",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Checkbox(
                                  value: ischecked2,
                                  onChanged: (value) {
                                    setState(() {
                                      if (ischecked) {
                                        ischecked = false;
                                        ischecked2 = value!;
                                      } else {
                                        ischecked2 = value!;
                                      }
                                      gender = "Female";
                                    });
                                  },
                                  checkColor: Colors.amber,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        color: Colors.green,
                        width: 400,
                        height: 250,
                        child: CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          onDateChanged: (value) {
                            birth = value.toString();
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(
                          onPressed: () async {
                            bool status = await AuthServiceImp().signUP(ModAuth(
                                name: name.toString(),
                                email: email.toString(),
                                birth: birth,
                                password: password.toString(),
                                phone: phone.toString(),
                                gender: gender));
                            if (status) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            }
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.greenAccent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}

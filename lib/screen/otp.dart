import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vendor_app/screen/auth.dart';
import 'package:http/http.dart';

class Otp extends StatelessWidget {
  // Otp({Key? key}) : super(key: key);
  String number;
  Otp({required this.number});
  TextEditingController otp = TextEditingController();

  void verify(String otp, number) async {
    try {
      Response response = await post(
        Uri.parse('https://allinonevendor.herokuapp.com/v/verifyOTPP'),
        body: {
          'number': number,
          'otp': otp,
        },
      );

      // print(jsonDecode(response.body.toString()));
      //output: {message: Success!, 
      //token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjY4Nzc5NDd9.SlpQ5gniHxdTYHj1QgM5_7KKj7JXNWkeCRUq4VSY9GE}

      if (response.statusCode == 200) {
        print("verifed!");
      } else {
        print("Login failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              verify(otp.text.toString(), number);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Auth()));
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBe,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[4],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                      const Text(
                        "Verify your contact number",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Enter the verification Code , We've sent on the $number",
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: TextFormField(
                        controller: otp,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Resend",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 0, left: 20),
                  child: Text(
                    "Valid till 20 sec",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

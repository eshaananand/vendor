import 'package:flutter/material.dart';
import 'package:vendor_app/screen/location.dart';
import 'package:vendor_app/screen/location_fetch.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Location()));
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
                SizedBox(
                  height: 30,
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
                        "Verification",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "First Name:",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your first name' : null,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Enter your first name",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Last Name:",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your last name' : null,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Enter your last name",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "E-mail:",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your email' : null,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Enter your email",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Address:",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your address' : null,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Enter your address",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Phone Number:",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your phone number' : null,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Enter your phone number",
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

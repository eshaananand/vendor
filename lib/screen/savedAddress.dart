// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'add_new_address.dart';

class SavedAddress extends StatefulWidget {
  SavedAddress({Key? key}) : super(key: key);

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  List<String> location = [
    "Home",
    "OFFICE",
    "OTHER",
  ];

  List<String> address = [
    "234 Purbanchal School Road 1st floor",
    "607 Uttar Purba Fartabad sahapara ",
    "B/H/4 Rifle range road Park circus ",
  ];

  Widget coupons(
      {String heading = "",
      String detail = "",
      required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    heading,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                ],
              ),
              Text(
                detail,
                style: TextStyle(
                  color: HexColor("000000").withOpacity(0.69),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
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
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Saved Address",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: location.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: coupons(
                                  onTap: () {},
                                  heading: location[index],
                                  detail: address[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: AddNewAddress(),
                              withNavBar: false,
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "+ Add New",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

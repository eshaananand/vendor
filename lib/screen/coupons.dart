// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Coupons extends StatelessWidget {
  Coupons({Key? key}) : super(key: key);

  List<String> couponHeading = [
    "Flat 15% discount",
    "Flat 30% discount",
    "Flat 40% discount",
  ];
  List<String> couponDetail = [
    "Upto Rs.150 on order above 1599",
    "Upto Rs.500 on order above 1700",
    "Upto Rs.400 on order above 2000",
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
                  Image.asset("assets/copons.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      heading,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
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
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "Apply Coupons",
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
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: couponHeading.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: coupons(
                                  onTap: () {},
                                  heading: couponHeading[index],
                                  detail: couponDetail[index],
                                ),
                              );
                            },
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

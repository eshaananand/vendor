// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemsOfShop extends StatefulWidget {
  ItemsOfShop({Key? key}) : super(key: key);

  @override
  State<ItemsOfShop> createState() => _ItemsOfShopState();
}

class _ItemsOfShopState extends State<ItemsOfShop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              //
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[4],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.qr_code, color: Colors.red),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart_outlined,
                            color: Colors.red),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tripathi Store",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: HexColor("8A8989"),
                      ),
                      Text(
                        "2.9 km",
                        style: TextStyle(
                          color: HexColor("8A8989"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: HexColor("8A8989"),
                          ),
                          Text(
                            "10 mins",
                            style: TextStyle(
                              color: HexColor("8A8989"),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 200.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 25,
                            ),
                            Text(
                              "3.5",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Vegetables"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Vegetables"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Vegetables"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Vegetables"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Vegetables"),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

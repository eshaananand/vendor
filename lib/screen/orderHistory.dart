// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_app/screen/traclkLocation.dart';

class OrderPayment extends StatefulWidget {
  OrderPayment({Key? key}) : super(key: key);

  @override
  State<OrderPayment> createState() => _OrderPaymentState();
}

class _OrderPaymentState extends State<OrderPayment> {
//current orders
  List<String> currentImage = [
    "assets/vegetable.png",
    "assets/vegetable.png",
    "assets/vegetable.png"
  ];

  List<String> currentType = [
    "Vegetables and Fruits",
    "Vegetables and Fruits",
    "Vegetables and Fruits"
  ];

  List<String> currentDate = ["24 August", "24 August", "24 August"];

  List<String> currentTime = ['11:00 am', '11:00 am', '11:00 am'];

  List<String> currentStoreName = [
    "Tripathi Store",
    "Tripathi Store",
    "Tripathi Store"
  ];

  List<String> currentTo = ["Home", "Home", "Home"];

  List<String> currentStatus = [
    "Pickup Arranged",
    "Pickup Arranged",
    "Pickup Arranged"
  ];

//past orders
  List<String> pastImage = ["assets/vegetable.png"];

  List<String> pastType = ["Vegetables and Fruits"];

  List<String> pastDate = ["24 August"];

  List<String> pastTime = ['11:00 am'];

  List<String> pastStoreName = ["Tripathi Store"];

  List<String> pastTo = ["Home"];

  List<double> stars = [0];

  Widget currentOrders(
    BuildContext context, {
    GestureTapCallback? onTap,
    String image = "",
    String type = "",
    String date = "",
    String time = "",
    String storeName = "",
    String to = "",
    String status = "",
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                // width: 60,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          type,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child:
                              Text(status, style: TextStyle(color: Colors.red)),
                        )
                      ],
                    ),
                    Text(
                      "$date, $time",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Icon(
                          //   Icons.arrow_drop_down,
                          //   color: Colors.red,
                          //   size: ,
                          // ),
                          Image.asset("assets/down_arrow.png"),
                          Text(storeName, style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    Icon(Icons.more_vert, color: Colors.red),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          Text(
                            to,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget pastOrders(
    BuildContext context, {
    String image = "",
    String type = "",
    String date = "",
    String time = "",
    String storeName = "",
    String to = "",
    int index = 0,
  }) {
    return Container(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              // width: 60,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        type,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Delivered",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "$date, $time",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/down_arrow.png"),
                        Text(storeName, style: TextStyle(fontSize: 14))
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        Row(
                          children: [
                            Text(
                              to,
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                print("Hello");
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height: 350,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 25.0),
                                              child: Center(
                                                child: Text(
                                                  "Rate Us",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20.0, left: 20),
                                              child: Text(
                                                "Rating",
                                                style: TextStyle(fontSize: 22),
                                              ),
                                            ),
                                            RatingBar.builder(
                                              // tapOnlyMode: true,
                                              initialRating: 0,
                                              minRating: 0,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.red,
                                              ),
                                              onRatingUpdate: (rating) {
                                                setState(() {
                                                  stars[index] = rating;
                                                });
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 25.0, left: 20),
                                              child: Text(
                                                "YOUR REVIEWS",
                                                style: TextStyle(fontSize: 22),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: SizedBox(
                                                height: 100,
                                                child: Card(
                                                  elevation: 10,
                                                  child: TextFormField(
                                                    maxLines: 10,
                                                    minLines: 5,
                                                    decoration: InputDecoration(
                                                      fillColor:
                                                          HexColor("D9D9D9"),
                                                      // .withOpacity(0.3),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: stars[index] != 0
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[index] >= 2
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[index] >= 3
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[index] >= 4
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: stars[index] >= 5
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ORDER(S) IN PROCESS",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      child: Container(
                        height: currentType.length * 130,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: currentType.length,
                          itemBuilder: ((context, index) {
                            return currentOrders(
                              context,
                              onTap: () => {
                                pushNewScreen(
                                  context,
                                  screen: TrackLocation(),
                                  withNavBar: false,
                                ),
                              },
                              image: currentImage[index],
                              date: currentDate[index],
                              status: currentStatus[index],
                              storeName: currentStoreName[index],
                              time: currentTime[index],
                              to: currentTo[index],
                              type: currentType[index],
                            );
                          }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 30),
                      child: Text(
                        "PAST ADDRESS",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: pastType.length * 150,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pastType.length,
                        itemBuilder: ((context, index) {
                          return pastOrders(
                            context,
                            image: pastImage[index],
                            date: pastDate[index],
                            storeName: pastStoreName[index],
                            time: pastTime[index],
                            to: pastTo[index],
                            type: pastType[index],
                            index: index,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

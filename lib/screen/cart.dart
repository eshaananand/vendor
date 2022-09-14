// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_app/screen/coupons.dart';
import 'package:vendor_app/screen/orderPlaced.dart';
import 'package:vendor_app/screen/selectPayment.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isSelfPickChecked = true;

  @override
  List<String> itemName = [
    "Fresh Potato",
    "Fresh Onion",
    "Fresh Carrort",
    "Fresh Aaloo",
    "Fresh Duck"
  ];
  List<int> itemWeight = [2, 3, 4, 2, 2];
  List<double> itemPrice = [10, 20, 30, 40, 10];
  List<int> initialAmount = [1, 2, 3, 4, 2];
  List<int> increaseAmount = [1, 2, 3, 2, 1];

  Widget items({
    required int initialAmount,
    required int weight,
    required double price,
    required String name,
    required int index,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Row(
                children: [
                  Text(
                    "$weight kg",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 70,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            increaseAmount[index] += 1;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        increaseAmount[index].toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (increaseAmount[index] == 1) {
                            } else
                              increaseAmount[index] -= 1;
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          size: 15,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "       Rs." + (price * increaseAmount[index]).toString(),
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<String> paymentType = [
    "Sub Total",
    "Service Fee",
    "Delivery Fee",
    "Discount"
  ];
  List<int> paymentAmount = [190, 10, 10, 10];

  Widget payment({
    required String paymentType,
    required int amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(paymentType), Text("Rs. $amount")],
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              pushNewScreen(
                context,
                screen: SelectPayment(
                  onWalletTap: () {
                    pushNewScreen(context, screen: OrderPlaced());
                  },
                  onCreditCardTap: () {
                    pushNewScreen(context, screen: OrderPlaced());
                  },
                  onDebitCardTap: () {
                    pushNewScreen(context, screen: OrderPlaced());
                  },
                  onRazorPayTap: () {
                    pushNewScreen(context, screen: OrderPlaced());
                  },
                  onStripeTap: () {
                    pushNewScreen(context, screen: OrderPlaced());
                  },
                  onCashOnDeliveryTap: () {
                    pushNewScreen(context, screen: OrderPlaced());
                  },
                ),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Pay Rs. 200',
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
        body: SingleChildScrollView(
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
                      "Confirm Order",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Tripathi Store",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 50),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: items(
                                index: index,
                                initialAmount: initialAmount[index],
                                name: itemName[index],
                                price: itemPrice[index],
                                weight: itemWeight[index],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 30.0, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: Coupons(),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: HexColor("8A8989"),
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Image.asset("assets/copons.png"),
                                ),
                                Text(
                                  "     Apply Coupons",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 30, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Info",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 130,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 40, 0),
                                    child: payment(
                                      amount: paymentAmount[index],
                                      paymentType: paymentType[index],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: HexColor("000000").withOpacity(0.56),
                        thickness: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Rs. 200",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: isSelfPickChecked
                                      ? Icon(
                                          Icons
                                              .check_box_outline_blank_outlined,
                                          size: 25,
                                        )
                                      : Icon(
                                          Icons.check_box,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      isSelfPickChecked = !isSelfPickChecked;
                                    });
                                  },
                                ),
                                Text(
                                  "Self Pickup",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                    ),
                                    Text(
                                      "Deliver to",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        " Home",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "2/3, SIMS lane, near Sanjitha Maternity ",
                                    style: TextStyle(
                                      color: HexColor("8A8989"),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

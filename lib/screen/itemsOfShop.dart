// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ItemsOfShop extends StatefulWidget {
  ItemsOfShop({Key? key}) : super(key: key);

  @override
  State<ItemsOfShop> createState() => _ItemsOfShopState();
}

double totalPrice = 0;
int totalItems = 0;

//Each 0 represent the number of items bought under each
//Eg - First 0 reprsents the number of items bought of first store item inside vegetable i.e total items bought of potato
//Each list represnts each TabBar (Vegetables, Fruits,Hebs and Mushroom)
List<List<int>> itemCount = [
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
];

List<String> tabName = ["Vegetables", "Fruits", "Herbs", "Mushroom"];

class _ItemsOfShopState extends State<ItemsOfShop> {
  Widget items({
    required ImageProvider<Object> image,
    required BuildContext context,
    /*
    # For Vegetables -> index = 0
    # For Fruits -> index = 1
    # For Herbs -> index = 2
    # For Mushroom -> index = 3

    Its indicates which list is to be choosen from List<List<int>> itemCount
    */
    required int index,
    //It is the count of item selected after + and - when adding an item.
    //It tells which 0 has to be choosen from List<List<int>> itemCount
    required int indexOfElement,
    String name = "",
    double priceOf1kg = 0,
    double priceOf2kg = 0,
    double priceOf5kg = 0,
  }) {
    int indexPrice = 0;
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: HexColor("D9D9D9"),
              ),
              image: DecorationImage(image: image),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (indexPrice == 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rs. $priceOf1kg ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.04,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "1 kg",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 100.0),
                                      child: itemCount[index][indexOfElement] ==
                                              0
                                          ? InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (builder) {
                                                    return Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                name,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                setState(() {
                                                  itemCount[index]
                                                      [indexOfElement] = 1;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 70,
                                                child: Card(
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Add",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              width: 70,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          itemCount[index][
                                                              indexOfElement] += 1;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 15,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    Text(
                                                      itemCount[index]
                                                              [indexOfElement]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          itemCount[index][
                                                              indexOfElement] -= 1;
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
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                if (indexPrice == 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Rs. $priceOf2kg ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "2 kg",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 100.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: 70,
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                if (indexPrice == 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Rs. $priceOf5kg ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "5 kg",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 100.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: 70,
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    //Returns a double, width of the screen multipled by the width given
    //The width given should range between 0-1 (0 -> No width , 1 -> Full screen width)
    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    return SafeArea(
      child: DefaultTabController(
        length: 5,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  ],
                ),
              ),
              DefaultTabController(
                length: 4, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 65,
                      child: TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.red,
                        // indicatorColor: Colors.transparent,
                        labelColor: Colors.red,
                        unselectedLabelColor: HexColor("8A8989"),
                        tabs: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(text: 'Vegetables'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(text: 'Fruits'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(text: 'Herbs'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(text: 'Mushroom'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 460,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: TabBarView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 20),
                            child: ListView(
                              // physics: NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 0,
                                    indexOfElement: 0,
                                    context: context,
                                    name: "Potato",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 0,
                                    indexOfElement: 1,
                                    context: context,
                                    name: "Potato",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 0,
                                    indexOfElement: 2,
                                    context: context,
                                    name: "Potato",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 0,
                                    indexOfElement: 3,
                                    context: context,
                                    name: "Potato",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 20),
                            child: ListView(
                              // physics: NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 1,
                                    indexOfElement: 0,
                                    context: context,
                                    name: "Fruits",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 1,
                                    indexOfElement: 1,
                                    context: context,
                                    name: "Fruits",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 1,
                                    indexOfElement: 2,
                                    context: context,
                                    name: "Fruits",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 1,
                                    indexOfElement: 3,
                                    context: context,
                                    name: "Fruits",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 20),
                            child: ListView(
                              // physics: NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 2,
                                    indexOfElement: 0,
                                    context: context,
                                    name: "Herbs",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 2,
                                    indexOfElement: 1,
                                    context: context,
                                    name: "Herbs",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 2,
                                    indexOfElement: 2,
                                    context: context,
                                    name: "Herbs",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 2,
                                    indexOfElement: 3,
                                    context: context,
                                    name: "Herbs",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 20),
                            child: ListView(
                              // physics: NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 3,
                                    indexOfElement: 0,
                                    context: context,
                                    name: "Mushroom",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 3,
                                    indexOfElement: 1,
                                    context: context,
                                    name: "Mushroom",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 3,
                                    indexOfElement: 2,
                                    context: context,
                                    name: "Mushroom",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: items(
                                    image: AssetImage("assets/potato.png"),
                                    index: 3,
                                    indexOfElement: 3,
                                    context: context,
                                    name: "Mushroom",
                                    priceOf1kg: 25,
                                    priceOf2kg: 50,
                                    priceOf5kg: 125,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

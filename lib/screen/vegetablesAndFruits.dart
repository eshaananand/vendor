// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class vegetablesAndFruits extends StatefulWidget {
  vegetablesAndFruits({Key? key}) : super(key: key);

  @override
  State<vegetablesAndFruits> createState() => _vegetablesAndFruitsState();
}

TextEditingController searchController = TextEditingController();

class _vegetablesAndFruitsState extends State<vegetablesAndFruits> {
  @override
  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  //Returns a double, width of the screen multipled by the width given
  //The width given should range between 0-1 (0 -> No width , 1 -> Full screen width)
  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  //Decides if the view type is grid or not
  bool isGrid = false;

  Widget build(BuildContext context) {
    //Creates widgets for GridView(if isGrid = true)
    Widget storeGrid(
        {String image = "", String storeName = "", double rating = 0}) {
      return IntrinsicHeight(
        child: InkWell(
          onTap: () {},
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              // side: BorderSide(width: 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/$image",
                      width: w(1),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                AutoSizeText(
                  storeName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_purple500_outlined,
                        color: Colors.red, size: 15),
                    Text(
                      rating.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    //Create a store for list view (isGrid = false)
    Widget storesList({
      String imageUrl = "",
      String storeName = "",
      String storeType = "",
      double rating = 0,
      double distance = 0.0,
      int time = 0,
    }) {
      return InkWell(
        onTap: () {},
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    // padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/$imageUrl"),
                          fit: BoxFit.fill,
                        )),
                    // child: Image.asset(
                    //   "assets/$imageUrl",
                    //   fit: BoxFit.fill,
                    //   height: 49.1,
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storeName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_purple500_outlined,
                                  color: Colors.red),
                              Text(
                                rating.toString(),
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 2.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: HexColor("8A8989"),
                                      size: 12,
                                    ),
                                    Text(
                                      distance.toString() + " | ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: HexColor("8A8989"),
                                      ),
                                    ),
                                    Text(
                                      storeType,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: HexColor("8A8989"),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 100),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer_sharp,
                                        size: 15,
                                        color: HexColor("8A8989"),
                                      ),
                                      Text(
                                        time.toString() + " min",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: HexColor("8A8989"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                        Text(
                          "Vegetables and fruits",
                          style: TextStyle(
                            fontSize: 18,
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
                padding:
                    EdgeInsets.symmetric(horizontal: w(0.06), vertical: 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: searchController,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 14.0),
                          border: InputBorder.none,
                          hintText: "Search item or store ",
                          fillColor: HexColor("D9D9D9"),
                          filled: true,
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "5 stores found",
                            style: TextStyle(
                              color: HexColor("8A8989"),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isGrid ? Icons.list : Icons.grid_view_sharp,
                              color: HexColor("8A8989"),
                            ),
                            onPressed: () {
                              setState(() {
                                isGrid = !isGrid;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    isGrid
                        ? Container(
                            height: h(1),
                            width: w(1),
                            child: GridView.count(
                              // padding: const EdgeInsets.all(20),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              childAspectRatio: 5 / 6,
                              children: [
                                storeGrid(
                                  image: "veges.png",
                                  storeName: "Tripathi",
                                  rating: 3.5,
                                ),
                                storeGrid(
                                  image: "veges.png",
                                  storeName: "Tripathi",
                                  rating: 3.5,
                                ),
                                storeGrid(
                                  image: "veges.png",
                                  storeName: "Tripathi",
                                  rating: 3.5,
                                ),
                                storeGrid(
                                  image: "veges.png",
                                  storeName: "Tripathi",
                                  rating: 3.5,
                                ),
                              ],
                            ),
                          )
                        : ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 10.0),
                            children: [
                              storesList(
                                imageUrl: "veges.png",
                                storeName: "Tripati",
                                storeType: "Vegetables",
                                rating: 3.5,
                                distance: 10,
                                time: 40,
                              ),
                              storesList(
                                imageUrl: "veges.png",
                                storeName: "Tripati",
                                storeType: "Vegetables",
                                rating: 4.5,
                                distance: 10,
                                time: 40,
                              ),
                              storesList(
                                imageUrl: "veges.png",
                                storeName: "Tripati",
                                storeType: "Vegetables",
                                rating: 3.5,
                                distance: 10,
                                time: 40,
                              ),
                              storesList(
                                imageUrl: "veges.png",
                                storeName: "Tripati",
                                storeType: "Vegetables",
                                rating: 3.5,
                                distance: 10,
                                time: 40,
                              ),
                              storesList(
                                imageUrl: "veges.png",
                                storeName: "Tripati",
                                storeType: "Vegetables",
                                rating: 3.5,
                                distance: 10,
                                time: 40,
                              ),
                            ],
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

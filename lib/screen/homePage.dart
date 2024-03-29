// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_app/screen/qrScan.dart';
import 'package:vendor_app/screen/subCategories.dart';
import 'package:vendor_app/screen/shopDetails.dart';

import 'categories.dart';
import 'orderHistory.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

TextEditingController searchController = TextEditingController();

class _homepageState extends State<homepage> {
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

//Creates a widget down the Todays Trending shop
    Widget trendingShop({
      String imageUrl = "",
      String storeName = "",
      String storeType = "",
    }) {
      return InkWell(
        onTap: () {},
        child: Container(
          height: 60,
          width: w(1),
          child: Row(
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.circular(0),
                child: Card(
                  shape: StadiumBorder(),
                  child: Image.asset(
                    "assets/$imageUrl",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      storeType,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
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
                              Icons.location_on,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_drop_down_outlined,
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
                            onPressed: () {
                              pushNewScreen(
                                context,
                                screen: QrScan(),
                                withNavBar: false,
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: Colors.red),
                            onPressed: () {
                              pushNewScreen(
                                context,
                                screen: OrderPayment(),
                                withNavBar: false,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: w(0.06), vertical: 20),

                  // height: 40,
                  // borderRadius: BorderRadius.circular(10),
                  child: ClipRRect(
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: h(0.2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/superSales.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h(0.4),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 20),
                          childAspectRatio: 2 / 3,
                          mainAxisSpacing: 10,
                          crossAxisCount: 4,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SubCategories(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/vegetable.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          "Vegetables & Fruits",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // child: TextFormField(
                        //   controller: searchController,
                        //   style: TextStyle(fontSize: 16.0),
                        //   decoration: InputDecoration(
                        //     contentPadding:
                        //         const EdgeInsets.symmetric(vertical: 14.0),
                        //     border: InputBorder.none,
                        //     hintText: "See all categories",
                        //     fillColor: HexColor("D9D9D9"),
                        //     filled: true,
                        //     // prefixIcon: IconButton(
                        //     //   icon: Icon(Icons.calendar_view_month),
                        //     //   onPressed: () {},
                        //     // ),
                        //     prefixIcon: Icon(Icons.calendar_view_month),
                        //   ),
                        // ),
                        child: InkWell(
                          onTap: () {
                            pushNewScreen(context,
                                screen: Categories(), withNavBar: false);
                          },
                          child: Container(
                              width: w(1),
                              height: 50,
                              decoration: BoxDecoration(
                                color: HexColor("D9D9D9"),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.calendar_view_month,
                                      color: HexColor("8A8989")),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("  See all categories",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: HexColor("8A8989"),
                                        )),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "TODAY’S TRENDING SHOP ",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      ),
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10.0),
                        children: <Widget>[
                          trendingShop(
                            imageUrl: "beststore.png",
                            storeName: "Tripathi Store",
                            storeType: "Vegetables & Fruits",
                          ),
                          trendingShop(
                            imageUrl: "beststore1.png",
                            storeName: "Tripathi Store",
                            storeType: "Vegetables & Fruits",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

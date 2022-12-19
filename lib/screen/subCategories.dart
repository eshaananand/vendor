// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_app/screen/shopDetails.dart';

import '../Persistent Nav Bar/persistentNavBar.dart';

class SubCategories extends StatefulWidget {
  SubCategories({Key? key}) : super(key: key);

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  TextEditingController searchController = TextEditingController();

  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  Widget storesList(
      {String imageUrl = "",
      String type = "",
      int numberOfStores = 0,
      required GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
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
                  height: 81,
                  width: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/$imageUrl"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "$numberOfStores stores",
                          style: TextStyle(
                            fontSize: 13,
                            color: HexColor("8A8989"),
                          ),
                        ),
                      ),
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

  @override
  Widget build(BuildContext context) {
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
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "  Vegetables and fruits",
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
                            icon: const Icon(Icons.qr_code, color: Colors.red),
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
                          style: const TextStyle(fontSize: 16.0),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 14.0),
                            border: InputBorder.none,
                            hintText: "Search item or store ",
                            fillColor: HexColor("D9D9D9"),
                            filled: true,
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            storesList(
                              imageUrl: "leafyVegetables.png",
                              numberOfStores: 6,
                              type: "Leafy vegetables ",
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ShopDetails(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                            storesList(
                              imageUrl: "leafyVegetables.png",
                              numberOfStores: 6,
                              type: "Leafy vegetables ",
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ShopDetails(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                            storesList(
                              imageUrl: "leafyVegetables.png",
                              numberOfStores: 6,
                              type: "Leafy vegetables ",
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ShopDetails(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                            storesList(
                              imageUrl: "leafyVegetables.png",
                              numberOfStores: 6,
                              type: "Leafy vegetables ",
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ShopDetails(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                            storesList(
                              imageUrl: "leafyVegetables.png",
                              numberOfStores: 6,
                              type: "Leafy vegetables ",
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ShopDetails(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
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
      ),
    );
  }
}

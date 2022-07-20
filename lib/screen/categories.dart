// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  int index = -1;
  TextEditingController searchController = TextEditingController();

  @override
  initState() {
    super.initState();
    index = -1;
  }

  Widget vegetableCategory({String type = "", GestureTapCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 7, 8, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(Icons.arrow_forward_ios_sharp,
                color: Colors.red, size: 18),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h(0.061),
            ),
            Container(
              //
              height: h(0.058),
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
                      Text(
                        "All Categories",
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
            Row(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: h(0.77),
                    width: w(0.35),
                    color: HexColor("D9D9D9"),
                    child: SingleChildScrollView(
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (index == 0)
                                    index = -1;
                                  else
                                    index = 0;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: Container(
                                  // padding: EdgeInsets.only(top: 4),
                                  height: 100,
                                  // width: 50,
                                  decoration: BoxDecoration(
                                    color: index == 0
                                        ? HexColor("FD2E2E").withOpacity(0.45)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/vegetable.png",
                                      ),
                                      // Text("Vegetables And Fruits"),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10, right: 10),
                                        child: AutoSizeText(
                                          "Vegetables & Fruits",
                                          minFontSize: 1,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (index == 1)
                                    index = -1;
                                  else
                                    index = 1;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    color: index == 1
                                        ? HexColor("FD2E2E").withOpacity(0.45)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/vegetable.png",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10, right: 10),
                                        child: AutoSizeText(
                                          "Vegetables & Fruits",
                                          minFontSize: 1,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2.5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (index == 2)
                                    index = -1;
                                  else
                                    index = 2;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    color: index == 2
                                        ? HexColor("FD2E2E").withOpacity(0.45)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/vegetable.png",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10, right: 10),
                                        child: AutoSizeText(
                                          "Vegetables",
                                          minFontSize: 1,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2.5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (index == 3)
                                    index = -1;
                                  else
                                    index = 3;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    color: index == 3
                                        ? HexColor("FD2E2E").withOpacity(0.45)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/vegetable.png",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10, right: 10),
                                        child: AutoSizeText(
                                          "Vegetables & Fruits",
                                          minFontSize: 1,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2.5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (index == 4)
                                    index = -1;
                                  else
                                    index = 4;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    color: index == 4
                                        ? HexColor("FD2E2E").withOpacity(0.45)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/vegetable.png",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10, right: 10),
                                        child: AutoSizeText(
                                          "Vegetables & Fruits",
                                          minFontSize: 1,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: h(0.77),
                  width: w(0.65),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10.0),
                    children: [
                      if (index == -1)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w(0.06), vertical: 20),
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
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      if (index == 0)
                        SizedBox(
                          height: h(1),
                          width: w(1),
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            children: [
                              vegetableCategory(
                                type: "Leafy vegetables ",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Leafy vegetables ",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Leafy vegetables ",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Leafy vegetables ",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Leafy vegetables ",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Leafy vegetables ",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      if (index == 1)
                        SizedBox(
                          height: h(1),
                          width: w(1),
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            children: [
                              vegetableCategory(
                                type: "Foods and Meals",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Foods and Meals ",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Foods and Meals",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Foods and Meals",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Foods and Meals",
                                onTap: () {},
                              ),
                              vegetableCategory(
                                type: "Foods and Meals",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      if (index == 2)
                        SizedBox(
                          height: h(1),
                          width: w(1),
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            children: [
                              vegetableCategory(
                                type: "Dairy Products",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      if (index == 3)
                        SizedBox(
                          height: h(1),
                          width: w(1),
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            children: [
                              vegetableCategory(
                                type: "Medicine",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      if (index == 4)
                        SizedBox(
                          height: h(1),
                          width: w(1),
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            children: [
                              vegetableCategory(
                                type: "Snacks",
                                onTap: () {},
                              ),
                            ],
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
    );
  }
}

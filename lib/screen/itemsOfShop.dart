// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'cart.dart';

class ItemsOfShop extends StatefulWidget {
  ItemsOfShop({Key? key}) : super(key: key);

  @override
  State<ItemsOfShop> createState() => _ItemsOfShopState();
}

//To be handled bt API
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
List<int> selectedIndex = [-1, -1];
List<int> indexPrice = [0, 0];

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
                if (indexPrice[indexOfElement] == 0)
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
                                                selectedIndex[indexOfElement] =
                                                    0;
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (builder) {
                                                    return StatefulBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            StateSetter set) {
                                                      return Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.34,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 60.0,
                                                                  left: 20,
                                                                  right: 20),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      name,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        selectedIndex[indexOfElement] ==
                                                                            0;
                                                                        setState(
                                                                            () {
                                                                          if (selectedIndex[indexOfElement] ==
                                                                              0) {
                                                                            totalPrice +=
                                                                                priceOf1kg;
                                                                          }
                                                                          if (selectedIndex[indexOfElement] ==
                                                                              1) {
                                                                            totalPrice +=
                                                                                priceOf2kg;
                                                                          }
                                                                          if (selectedIndex[indexOfElement] ==
                                                                              2) {
                                                                            totalPrice +=
                                                                                priceOf5kg;
                                                                          }
                                                                          totalItems +=
                                                                              1;
                                                                          itemCount[index][indexOfElement] =
                                                                              1;
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            70,
                                                                        child:
                                                                            Card(
                                                                          elevation:
                                                                              3,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Add",
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                tabName[index],
                                                                style:
                                                                    TextStyle(
                                                                  color: HexColor(
                                                                      "8A8989"),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            20.0),
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 145,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            160,
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.85,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        set(() {
                                                                                          if (selectedIndex[indexOfElement] == 0) {
                                                                                          } else {
                                                                                            selectedIndex[indexOfElement] = 0;
                                                                                            indexPrice[indexOfElement] = 0;
                                                                                            /////////////////////////////////////////////////////////////
                                                                                          }
                                                                                        });
                                                                                      },
                                                                                      icon: selectedIndex[indexOfElement] == 0 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                    ),
                                                                                    Text("1 kg"),
                                                                                  ],
                                                                                ),
                                                                                Text("Rs. $priceOf1kg"),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        set(() {
                                                                                          if (selectedIndex[indexOfElement] == 1) {
                                                                                          } else {
                                                                                            indexPrice[indexOfElement] = 1;
                                                                                            selectedIndex[indexOfElement] = 1;
                                                                                          }
                                                                                        });
                                                                                      },
                                                                                      icon: selectedIndex[indexOfElement] == 1 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                    ),
                                                                                    Text("2 kg"),
                                                                                  ],
                                                                                ),
                                                                                Text("Rs. $priceOf2kg"),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        set(() {
                                                                                          if (selectedIndex[indexOfElement] == 2) {
                                                                                          } else {
                                                                                            selectedIndex[indexOfElement] = 2;
                                                                                            indexPrice[indexOfElement] = 2;
                                                                                          }
                                                                                        });
                                                                                      },
                                                                                      icon: selectedIndex[indexOfElement] == 2 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                    ),
                                                                                    Text("5 kg"),
                                                                                  ],
                                                                                ),
                                                                                Text("Rs. $priceOf5kg"),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                  },
                                                );
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
                                                          totalItems += 1;
                                                          totalPrice +=
                                                              priceOf1kg;
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
                                                          totalPrice -=
                                                              priceOf1kg;
                                                          totalItems -= 1;
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
                if (indexPrice[indexOfElement] == 1)
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
                                  child: itemCount[index][indexOfElement] == 0
                                      ? InkWell(
                                          onTap: () {
                                            selectedIndex[indexOfElement] = 1;
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (builder) {
                                                return StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter set) {
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.34,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 60.0,
                                                          left: 20,
                                                          right: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  name,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    selectedIndex[
                                                                            indexOfElement] ==
                                                                        0;
                                                                    setState(
                                                                        () {
                                                                      if (selectedIndex[
                                                                              indexOfElement] ==
                                                                          0) {
                                                                        totalPrice +=
                                                                            priceOf1kg;
                                                                      }
                                                                      if (selectedIndex[
                                                                              indexOfElement] ==
                                                                          1) {
                                                                        totalPrice +=
                                                                            priceOf2kg;
                                                                      }
                                                                      if (selectedIndex[
                                                                              indexOfElement] ==
                                                                          2) {
                                                                        totalPrice +=
                                                                            priceOf5kg;
                                                                      }
                                                                      totalItems +=
                                                                          1;
                                                                      itemCount[
                                                                              index]
                                                                          [
                                                                          indexOfElement] = 1;
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      SizedBox(
                                                                    width: 70,
                                                                    child: Card(
                                                                      elevation:
                                                                          3,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Add",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            tabName[index],
                                                            style: TextStyle(
                                                              color: HexColor(
                                                                  "8A8989"),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 20.0),
                                                            child: SizedBox(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 145,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: 160,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.85,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    set(() {
                                                                                      if (selectedIndex[indexOfElement] == 0) {
                                                                                      } else {
                                                                                        selectedIndex[indexOfElement] = 0;
                                                                                        indexPrice[indexOfElement] = 0;
                                                                                        /////////////////////////////////////////////////////////////
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  icon: selectedIndex[indexOfElement] == 0 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                ),
                                                                                Text("1 kg"),
                                                                              ],
                                                                            ),
                                                                            Text("Rs. $priceOf1kg"),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    set(() {
                                                                                      if (selectedIndex[indexOfElement] == 1) {
                                                                                      } else {
                                                                                        indexPrice[indexOfElement] = 1;
                                                                                        selectedIndex[indexOfElement] = 1;
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  icon: selectedIndex[indexOfElement] == 1 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                ),
                                                                                Text("2 kg"),
                                                                              ],
                                                                            ),
                                                                            Text("Rs. $priceOf2kg"),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    set(() {
                                                                                      if (selectedIndex[indexOfElement] == 2) {
                                                                                      } else {
                                                                                        selectedIndex[indexOfElement] = 2;

                                                                                        indexPrice[indexOfElement] = 2;
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  icon: selectedIndex[indexOfElement] == 2 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                ),
                                                                                Text("5 kg"),
                                                                              ],
                                                                            ),
                                                                            Text("Rs. $priceOf5kg"),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                            );
                                          },
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
                                                      totalPrice += priceOf2kg;
                                                      totalItems += 1;
                                                      itemCount[index]
                                                          [indexOfElement] += 1;
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
                                                      totalPrice -= priceOf2kg;
                                                      totalItems -= 1;
                                                      itemCount[index]
                                                          [indexOfElement] -= 1;
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
                      )
                    ],
                  ),
                if (indexPrice[indexOfElement] == 2)
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
                                  child: itemCount[index][indexOfElement] == 0
                                      ? InkWell(
                                          onTap: () {
                                            selectedIndex[indexOfElement] = 2;
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (builder) {
                                                return StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter set) {
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.34,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 60.0,
                                                          left: 20,
                                                          right: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  name,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      if (selectedIndex[
                                                                              indexOfElement] ==
                                                                          0) {
                                                                        totalPrice +=
                                                                            priceOf1kg;
                                                                      } else if (selectedIndex[
                                                                              indexOfElement] ==
                                                                          1) {
                                                                        totalPrice +=
                                                                            priceOf2kg;
                                                                      } else if (selectedIndex[
                                                                              indexOfElement] ==
                                                                          2) {
                                                                        totalPrice +=
                                                                            priceOf5kg;
                                                                      }
                                                                      totalItems +=
                                                                          1;
                                                                      itemCount[
                                                                              index]
                                                                          [
                                                                          indexOfElement] = 1;
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      SizedBox(
                                                                    width: 70,
                                                                    child: Card(
                                                                      elevation:
                                                                          3,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Add",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            tabName[index],
                                                            style: TextStyle(
                                                              color: HexColor(
                                                                  "8A8989"),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 20.0),
                                                            child: SizedBox(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 145,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: 160,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.85,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    set(() {
                                                                                      if (selectedIndex[indexOfElement] == 0) {
                                                                                      } else {
                                                                                        selectedIndex[indexOfElement] = 0;
                                                                                        indexPrice[indexOfElement] = 0;
                                                                                        /////////////////////////////////////////////////////////////
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  icon: selectedIndex[indexOfElement] == 0 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                ),
                                                                                Text("1 kg"),
                                                                              ],
                                                                            ),
                                                                            Text("Rs. $priceOf1kg"),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    set(() {
                                                                                      if (selectedIndex[indexOfElement] == 1) {
                                                                                      } else {
                                                                                        indexPrice[indexOfElement] = 1;
                                                                                        selectedIndex[indexOfElement] = 1;
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  icon: selectedIndex[indexOfElement] == 1 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                ),
                                                                                Text("2 kg"),
                                                                              ],
                                                                            ),
                                                                            Text("Rs. $priceOf2kg"),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    set(() {
                                                                                      if (selectedIndex[indexOfElement] == 2) {
                                                                                      } else {
                                                                                        selectedIndex[indexOfElement] = 2;

                                                                                        indexPrice[indexOfElement] = 2;
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  icon: selectedIndex[indexOfElement] == 2 ? Icon(Icons.radio_button_checked, color: Colors.red) : Icon(Icons.circle_outlined),
                                                                                ),
                                                                                Text("5 kg"),
                                                                              ],
                                                                            ),
                                                                            Text("Rs. $priceOf5kg"),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                            );
                                          },
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
                                                      totalItems += 1;
                                                      totalPrice += priceOf5kg;
                                                      itemCount[index]
                                                          [indexOfElement] += 1;
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
                                                      totalItems -= 1;
                                                      totalPrice -= priceOf5kg;
                                                      itemCount[index]
                                                          [indexOfElement] -= 1;
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
          bottomNavigationBar: Material(
            color: Colors.red,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                height: kToolbarHeight,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "$totalItems items | Rs.$totalPrice",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cart(),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "View Cart",
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
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
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
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 65,
                        child: TabBar(
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.red,
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
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            //For 1st tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
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
                                ],
                              ),
                            ),
                            //For 2nd tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                children: [],
                              ),
                            ),
                            //For 3rd tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                children: [],
                              ),
                            ),
                            //For 4th tab
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 20),
                              child: ListView(
                                children: [],
                              ),
                            ),
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

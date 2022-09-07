import 'package:flutter/material.dart';
import 'package:vendor_app/screen/chatBox.dart';
import 'package:vendor_app/screen/itemsOfShop.dart';

import 'package:vendor_app/screen/login1.dart';
import 'package:vendor_app/screen/qrScan.dart';
import 'package:vendor_app/screen/scratchCard.dart';
import 'package:vendor_app/screen/traclkLocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: LoginPage1(),
      home: QrScan(),
    );
  }
}

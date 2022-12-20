import 'package:flutter/material.dart';
import 'package:vendor_app/screen/add_money.dart';
import 'package:vendor_app/screen/adminVerify.dart';
import 'package:vendor_app/screen/chatBox.dart';
import 'package:vendor_app/screen/itemsOfShop.dart';

import 'package:vendor_app/screen/login1.dart';
import 'package:vendor_app/screen/my_team.dart';
import 'package:vendor_app/screen/profile.dart';
import 'package:vendor_app/screen/qrScan.dart';
import 'package:vendor_app/screen/refer_and_earn.dart';
import 'package:vendor_app/screen/scratchCard.dart';
import 'package:vendor_app/screen/selectPayment.dart';
import 'package:vendor_app/screen/send_to_bank.dart';
import 'package:vendor_app/screen/send_to_friend.dart';
import 'package:vendor_app/screen/support.dart';
import 'package:vendor_app/screen/traclkLocation.dart';
import 'package:vendor_app/screen/wallet.dart';

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
      home: LoginPage1(),
      // home: AdminVerify(),
    );
  }
}

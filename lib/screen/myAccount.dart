// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_app/screen/profile.dart';
import 'package:vendor_app/screen/qrScan.dart';
import 'package:vendor_app/screen/refer_and_earn.dart';
import 'package:vendor_app/screen/savedAddress.dart';
import 'package:vendor_app/screen/support.dart';
import 'package:vendor_app/screen/wallet.dart';

import '../Persistent Nav Bar/persistentNavBar.dart';
import 'my_earning.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

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

    Widget accountSettingsIcon(
        {required String name,
        required IconData icon,
        GestureTapCallback? onTap}) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: SizedBox(
            width: w(1),
            child: Center(
              child: Row(
                children: [
                  Icon(icon, color: Colors.red, size: 35),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget accountSettingsImage(
        {required String name,
        required String icon,
        GestureTapCallback? onTap}) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: SizedBox(
            width: w(1),
            child: Center(
              child: Row(
                children: [
                  ImageIcon(AssetImage(icon), color: Colors.red, size: 35),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    children: [
                      SizedBox(
                        width: 10,
                        height: 50,
                      ),
                      Text(
                        "  My Account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Swayam Verma",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text(
                      "+91 82104444484",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.55),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "dummy@email.com",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.55),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountSettingsIcon(
                    icon: Icons.location_on_outlined,
                    name: "Saved Address",
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: SavedAddress(),
                        withNavBar: false,
                      );
                    },
                  ),
                  accountSettingsImage(
                    icon: "assets/wallet.png",
                    name: "Wallet",
                    onTap: () {
                      pushNewScreen(context,
                          screen: Wallet(), withNavBar: false);
                    },
                  ),
                  accountSettingsIcon(
                    icon: Icons.qr_code_scanner_sharp,
                    name: "QR Scan",
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: QrScan(),
                        withNavBar: false,
                      );
                    },
                  ),
                  accountSettingsIcon(
                    icon: Icons.support_agent_rounded,
                    name: "Support",
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: Support(),
                        withNavBar: false,
                      );
                    },
                  ),
                  accountSettingsIcon(
                    icon: Icons.people,
                    name: "Refer and Earn",
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: ReferAndEarn(),
                        withNavBar: false,
                      );
                    },
                  ),
                  accountSettingsImage(
                    icon: "assets/personal_details.png",
                    name: "Personal Details",
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: Profile(),
                        withNavBar: false,
                      );
                    },
                  ),
                  accountSettingsImage(
                    icon: "assets/cod.png",
                    name: "My Earnings",
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: MyEarning(),
                        withNavBar: false,
                      );
                    },
                  ),
                  accountSettingsIcon(
                    icon: Icons.logout_outlined,
                    name: "Log Out",
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

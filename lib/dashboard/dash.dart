import 'package:ewawepay/Payment/payScreen.dart';
import 'package:ewawepay/Payment/paymentHistoryScreen.dart';
import 'package:ewawepay/Profile/profileScreen.dart';
import 'package:ewawepay/dashboard/error.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ewawegreen,
        elevation: 0.0,
        centerTitle: false,
        title: Image.asset(
          'assets/images/ewawelogowhite.png',
          fit: BoxFit.contain,
          height: 50,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => UserProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 18.0, top: 10, bottom: 12),
            margin: EdgeInsets.only(),
            color: ewawegreen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, User!',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                // SizedBox(
                //   height: ,
                // ),
                Text('Welcome to EwawePay',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ),
            ),
            // padding: EdgeInsets.only(
            //   left: 30,
            //   right: 30,
            //   top: 20,
            // ),

            child: GridView.count(
              // physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: <Widget>[
                _buildCard(
                  "Properties",
                  "House",
                  ErrorScreen(),
                  "assets/images/property.png",
                ),
                _buildCard(
                  "Tenant",
                  "House",
                  ErrorScreen(),
                  "assets/images/ten.png",
                ),
                _buildCard(
                  "Service",
                  "House",
                  ErrorScreen(),
                  "assets/images/service.png",
                ),
                _buildCard(
                  "Mortgage",
                  "House",
                  ErrorScreen(),
                  "assets/images/mortgage.png",
                ),
                _buildCard(
                  "Rent Pay",
                  "House",
                  PayScreen(),
                  "assets/images/pay.png",
                ),
                _buildCard(
                  "Payment History",
                  "House",
                  PaymentHistoryScreen(),
                  "assets/images/trans.png",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(
    String title1,
    String title2,
    dynamic screen,
    String imgPath,
  ) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        border: Border.all(
          // width: 1,
          color: Colors.grey.shade200,
        ),
        // boxShadow: [
        //   // BoxShadow(color: Colors.black, spreadRadius: 3.0, blurRadius: 7)
        // ],
        // color: Colors.green[400],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => screen,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: <Widget>[
                Spacer(),
                Hero(
                    tag: imgPath,
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)))),
                Spacer(),
                Text(title1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 15, color: ewawegrey)),
                Text(title2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 10, color: ewawegrey))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

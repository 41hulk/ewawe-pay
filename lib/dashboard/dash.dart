import 'package:ewawepay/Payment/payScreen.dart';
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
        backgroundColor: ewawegrey,
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
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 18.0, top: 10, bottom: 12),
            margin: EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, Patrick!',
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
                  topRight: Radius.circular(45.0)),
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 50,
            ),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 30,
              mainAxisSpacing: 20,
              children: <Widget>[
                _buildCard(
                  "Properties",
                  "House",
                  () {},
                  "assets/images/ewawelogowhite.png",
                ),
                _buildCard(
                  "Tenant",
                  "House",
                  () {},
                  "assets/images/ewawelogowhite.png",
                ),
                _buildCard(
                  "Service",
                  "House",
                  () {},
                  "assets/images/ewawelogowhite.png",
                ),
                _buildCard(
                  "Morgage",
                  "House",
                  () {},
                  "assets/images/ewawelogowhite.png",
                ),
                _buildCard(
                  "Rent Pay",
                  "House",
                  PayScreen(),
                  "assets/images/ewawelogowhite.png",
                ),
                _buildCard(
                  "Payment History",
                  "House",
                  () {},
                  "assets/images/ewawelogowhite.png",
                ),
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) {
      //           return PayScreen();
      //         }),
      //       );
      //     },
      //     backgroundColor: ewawegreen,
      //     child: Icon(Icons.payments)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomBar(),
    );
  }

  Widget _buildCard(
    String title1,
    String title2,
    dynamic screen,
    String imgPath,
  ) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(39.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 3.0, blurRadius: 7)
              ],
              color: Colors.green[400]),
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Hero(
                        tag: imgPath,
                        child: Container(
                            height: 75.0,
                            width: 75.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imgPath),
                                    fit: BoxFit.contain)))),
                    Spacer(),
                    Text(title1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.white)),
                    Text(title2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

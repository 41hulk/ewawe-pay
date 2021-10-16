import 'package:ewawepay/dashboard/dash.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassScreen extends StatefulWidget {
  @override
  _PassscreenState createState() => _PassscreenState();
}

class _PassscreenState extends State<PassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: Text(
      //     'Opps!!!',
      //     style: GoogleFonts.poppins(
      //         fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      // ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 250),
              child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/checkmark.png'),
                          fit: BoxFit.contain))),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('Thank you',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w300)),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Text('Payment Complete',
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 75.0, right: 75.0),
              child: Text(
                  'You will receiceve an email with all the details of the payment',
                  style: GoogleFonts.poppins(
                      color: Colors.grey[450],
                      fontSize: 15,
                      fontWeight: FontWeight.normal)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 19.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onPressed: () {
                  // Navigator.of(context).pushNamed(HomePage.tag);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => DashboardScreen(),
                      ),
                      (Route<dynamic> route) => false);
                },
                padding: EdgeInsets.all(12),
                color: ewawegrey,
                child: Text('Done',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

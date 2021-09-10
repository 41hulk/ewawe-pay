import 'package:ewawepay/Payment/checkoutScreen.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmScreen extends StatefulWidget {
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  get round => false;

  @override
  Widget build(BuildContext context) {
    final confirmButton = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      child: ElevatedButton(
        child: Text('PROCEED'),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => CheckoutScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            primary: ewawegrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular((this.round) ? 45 : 7),
            ),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
      ),
    );

    return Scaffold(
      backgroundColor: ewawegrey,
      appBar: AppBar(
        backgroundColor: ewawegrey,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Rent Pay',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 114.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0)),
            ),
            child: Container(
              padding: EdgeInsets.all(40),
              // margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    "CONFIRMATION",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50.0),
                  Text('LandLord ID',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.black)),
                  Text('3414ED',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.black54)),
                  SizedBox(height: 40.0),
                  Text('Property Name',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.black)),
                  Text('M&M Building',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black54)),
                  SizedBox(height: 40.0),
                  Text('Amount Pay',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.black)),
                  Text('30,000',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black54)),
                  SizedBox(height: 40.0),
                  Text('Currency',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.black)),
                  Text('USD',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black54)),
                  SizedBox(height: 30.0),
                  confirmButton
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

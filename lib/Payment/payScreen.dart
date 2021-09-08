import 'package:ewawepay/Payment/confirmScreen.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PayScreen extends StatefulWidget {
  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  get round => false;

  @override
  Widget build(BuildContext context) {
    final landlordID = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'LandLord ID',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final propertyName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Property Name',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final amountPay = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Amount Pay',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final currency = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Currency',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final proceedButton = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      child: ElevatedButton(
        child: Text('CONFIRM'),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ConfirmScreen(),
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
                  Row(
                    children: [
                      Text(
                        "Details",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  landlordID,
                  SizedBox(height: 40.0),
                  propertyName,
                  SizedBox(height: 40.0),
                  amountPay,
                  SizedBox(height: 40.0),
                  currency,
                  SizedBox(height: 40.0),
                  proceedButton
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

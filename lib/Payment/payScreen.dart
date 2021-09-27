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
  DropdownMenuItem<String> buildItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  List listItem = ['M&M', 'CHIC', 'MIC', 'NY MARKET', 'TOWN TOWER'];
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

    final propertyName = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 15),
      child: DropdownButton<String>(
          hint: Text('Property Name'),
          dropdownColor: Colors.grey,
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
          items: []),
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
    final currency = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 15),
      child: DropdownButton<String>(
          hint: Text('Currency'),
          dropdownColor: Colors.grey,
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
          items: []),
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
      backgroundColor: ewawegreen,
      appBar: AppBar(
        backgroundColor: ewawegreen,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Rent Pay',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
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

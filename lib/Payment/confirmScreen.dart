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
      appBar: AppBar(
        backgroundColor: ewawegreen,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Rent Pay',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0)),
        ),
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 15,
        ),
        child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Text('CONFIRMATION',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 40,
                ),
                _details(),
                Container(
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
                          borderRadius:
                              BorderRadius.circular((this.round) ? 45 : 7),
                        ),
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal)),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _details() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Landlord details",
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            _texts('Landlord ID', 'EW1311G'),
            _texts('Property Name', 'CHIC'),
            _texts('Amount pay', '100,000 RWF'),
            _texts('Currency', 'USD'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tenant Details",
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            _texts('Tenant Name', 'Mutoni allen'),
            _texts('Building Name', 'CHIC'),
            _texts('Space detail', '2nd floorr'),
            _texts('Phone Number', '0780843521'),
          ],
        ),
      ],
    );
  }

  Widget _texts(String detail, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(detail,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
        Text(value,
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.black54)),
        SizedBox(height: 40.0),
      ],
    );
  }
}

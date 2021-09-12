import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  get round => false;

  @override
  Widget build(BuildContext context) {
    final confirmButton = Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      child: ElevatedButton(
        child: Text('CHECKOUT'),
        onPressed: () {},
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
      body: ListView(
        children: <Widget>[
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
              left: 20,
              right: 20,
              top: 50,
            ),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }

  Widget _masteCard() {
    final cardNumber = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Amount Pay',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final holderName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Amount Pay',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final exDate = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Amount Pay',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final cVV = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Amount Pay',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    return Column(
      children: [cardNumber, holderName, exDate, cVV],
    );
  }

  Widget _buildCard(
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
              color: Colors.grey[350]),
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
                            height: 45.0,
                            width: 45.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imgPath),
                                    fit: BoxFit.contain)))),
                    Spacer(),
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

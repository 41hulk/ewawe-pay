import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorscreenState createState() => _ErrorscreenState();
}

class _ErrorscreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Opps!!!',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text('404',
                  style: GoogleFonts.poppins(
                      fontSize: 50, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('You seem Lost',
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.normal)),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Text(
                  'Yeah, we are confused as you are, you took the wrong turn and came her. Luckily unlike some mistakes, you can fix this',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.normal)),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                  height: 250.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/404.jpeg'),
                          fit: BoxFit.contain))),
            )
          ],
        ),
      ),
    );
  }
}

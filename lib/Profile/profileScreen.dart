import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatars/avatars.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfilecreenState createState() => _UserProfilecreenState();
}

class _UserProfilecreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ewawegrey,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Avatar(
                    name: 'Ntare Guy',
                    placeholderColors: [Colors.white],
                    backgroundColor: Colors.black,
                    textStyle:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 32)),
                _infocard('Name:', 'Ntare Guy'),
                _infocard('TenantID:', 'EWAWE-G342'),
                _infocard('Building:', 'M&M Building'),
                _infocard('Floor:', '2nd Floor'),
                SizedBox(height: 80),
                _logout()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userAvatar() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/ewawelogo.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Icon(Icons.photo_camera, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _infocard(String label, String info) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white24,
          ),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                info,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: ewawegreen),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _logout() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Colors.green[200],
      ),
      onPressed: () {},
      child: Row(
        children: [
          SizedBox(width: 20),
          Expanded(
              child: Text(
            'Logout',
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
          Icon(
            Icons.logout,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

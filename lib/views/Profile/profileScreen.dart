import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ewawepay/utils/authService.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:ewawepay/views/auth/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:avatars/avatars.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfilecreenState createState() => _UserProfilecreenState();
}

var dio = Dio();

// Future<dynamic> logOut() async {
//   var token = getToken();
//   var response = await http.post(Uri.parse("$apiUrl/api/logout"),
//       headers: {'auth': "Bearer $token"});
//   var dataJson = json.decode(response.body);
//   if (dataJson.containsKey('status')) {
//     if (dataJson['status'] == 'success') {
//       Navigator.push(
//         context,
//         CupertinoPageRoute(
//           builder: (context) => UserProfileScreen(),
//         ),
//       );
//     }
//   }
//   print(dataJson);
// }

class _UserProfilecreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Avatar(
                  name: 'Ntare Guy',
                  placeholderColors: [ewawegreen],
                  backgroundColor: Colors.black,
                  textStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 32),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infocard('Name:', 'Ntare Guy'),
                    _infocard('TenantID:', 'EWAWE-G342'),
                    _infocard('Building:', 'M&M Building'),
                    _infocard('Floor:', '2nd Floor'),
                    SizedBox(height: 30),
                    _logout()
                  ],
                ),
              ),
            ],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.bold, color: ewawegreen),
          ),
          Text(
            info,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
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
      onPressed: () async {
        String? token = await getToken();

        var response = await http.post(
          Uri.parse("$apiUrl/api/v1/logout"),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer $token"
          },
        );

        var dataJson = json.decode(response.body);
        print(dataJson);

        if (dataJson.containsKey('status')) {
          if (dataJson['status'] == 'success') {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()),
                (Route<dynamic> route) => false);
          }
        }
      },
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

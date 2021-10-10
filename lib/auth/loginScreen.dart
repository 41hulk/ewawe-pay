import 'package:ewawepay/auth/signUpScreen.dart';
import 'package:ewawepay/dashboard/dash.dart';
import 'package:ewawepay/dashboard/landDashScreen.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 120.0,
        child: Image.asset('assets/images/ewawelogo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
    final forgotpassword = Container(
      padding: EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Text('Don\'t have an Account? '),
          InkWell(
            onTap: () async {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) => SetPhoneScreen(),
              //   ),
              // );
            },
            child: new Text(
              "Forgot password ?",
              style: GoogleFonts.poppins(
                  color: ewawegreen, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 19.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {
          // Navigator.of(context).pushNamed(HomePage.tag);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => LandDashboardScreen()),
              (Route<dynamic> route) => false);
        },
        padding: EdgeInsets.all(12),
        color: ewawegrey,
        child: Text('LOG IN',
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ),
    );

    final signup = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an Account? ',
            style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
          ),
          InkWell(
            onTap: () async {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
            child: new Text(
              "Sign up",
              style: GoogleFonts.poppins(color: ewawegreen),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: ewawegreen,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: 600,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,

                // Make rounded corners
                borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                logo,
                SizedBox(height: 40.0),
                email,
                SizedBox(height: 15.0),
                password,
                forgotpassword,
                SizedBox(height: 12.0),
                loginButton,
                signup
              ],
            ),
          ),
        ),
      ),
    );
  }
}

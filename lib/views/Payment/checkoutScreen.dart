import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:ewawepay/views/Payment/pass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  get round => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ewawegreen,
      appBar: AppBar(
        backgroundColor: ewawegreen,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Payment Method',
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
              left: 30,
              right: 30,
              top: 50,
            ),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 30,
              mainAxisSpacing: 20,
              children: <Widget>[
                ElevatedButton(
                  child: Hero(
                    tag: "assets/images/mastercard.png",
                    child: Container(
                      height: 920,
                      width: 900.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/momo.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  onPressed: () => _mobile(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                ),
                ElevatedButton(
                  child: Hero(
                    tag: "assets/images/mastercard.png",
                    child: Container(
                      height: 920,
                      width: 900.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/airtel.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  onPressed: () => _mobile(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                ),
                ElevatedButton(
                  child: Hero(
                    tag: "assets/images/mastercard.png",
                    child: Container(
                      height: 920,
                      width: 900.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/visa.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  onPressed: () => _creditCard(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                ),
                ElevatedButton(
                  child: Hero(
                    tag: "assets/images/visa.png",
                    child: Container(
                      height: 920,
                      width: 900.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/mastercard.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  onPressed: () => _creditCard(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _mobile() {
    showCupertinoModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Material(
            child: Container(
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          'Mobile Money',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: ArgonButton(
                          height: 40,
                          roundLoadingShape: true,
                          width: 70,
                          onTap: (startLoading, stopLoading, btnState) async {
                            // if (btnState == ButtonState.Idle) {
                            //   startLoading();

                            //   await Future.delayed(Duration(seconds: 5));
                            //   Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //       builder: (context) => PassScreen(),
                            //     ),
                            //   );
                            // }
                          },
                          child: Text(
                            "Pay",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                          loader: Container(
                            padding: EdgeInsets.all(10),
                            child: SpinKitRotatingCircle(
                              color: Colors.white,
                              // size: loaderWidth ,
                            ),
                          ),
                          borderRadius: 5.0,
                          color: ewawegrey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(50),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(4),
                              hintMaxLines: 1,
                              hintText: "Mobile Number",
                              filled: true,
                              fillColor: Colors.grey[00],
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }

  void _creditCard() {
    showCupertinoModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Material(
            child: Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          'Payment Card',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintMaxLines: 1,
                              hintText: "Card number",
                              hintStyle: GoogleFonts.poppins(fontSize: 15),
                              filled: true,
                              fillColor: Colors.grey[300],
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        SizedBox(height: 14),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintMaxLines: 1,
                              hintText: "MM/YY",
                              hintStyle: GoogleFonts.poppins(fontSize: 15),
                              filled: true,
                              fillColor: Colors.grey[300],
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        SizedBox(height: 14),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintMaxLines: 1,
                              hintText: "Security Code",
                              hintStyle: GoogleFonts.poppins(fontSize: 15),
                              filled: true,
                              fillColor: Colors.grey[300],
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        SizedBox(height: 14),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintMaxLines: 1,
                              hintText: "First Name",
                              hintStyle: GoogleFonts.poppins(fontSize: 15),
                              filled: true,
                              fillColor: Colors.grey[300],
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        SizedBox(height: 14),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintMaxLines: 1,
                              hintText: "Last Name",
                              hintStyle: GoogleFonts.poppins(fontSize: 15),
                              filled: true,
                              fillColor: Colors.grey[300],
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: ArgonButton(
                      height: 40,
                      roundLoadingShape: true,
                      width: 100,
                      onTap: (startLoading, stopLoading, btnState) async {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PassScreen(),
                          ),
                        );
                        // if (btnState == ButtonState.Idle) {
                        //   startLoading();
                        //   var add = await addTenant();
                        //   await Future.delayed(Duration(seconds: 5));
                        //   if (add != null) {
                        //     stopLoading();
                        //     Navigator.pop(context);
                        //   }
                        // }
                      },
                      child: Text("Pay",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      loader: Container(
                        padding: EdgeInsets.all(10),
                        child: SpinKitRotatingCircle(
                          color: Colors.white,
                          // size: loaderWidth ,
                        ),
                      ),
                      borderRadius: 5.0,
                      color: ewawegrey,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _grid(String imgPath, void modal) {
    return ElevatedButton(
      child: Hero(
        tag: "assets/images/mastercard.png",
        child: Container(
          height: 920,
          width: 900.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imgPath), fit: BoxFit.contain),
          ),
        ),
      ),
      onPressed: () => modal,
      style: ElevatedButton.styleFrom(
          primary: Colors.grey[350],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          // padding:
          //     EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
    );
  }
}

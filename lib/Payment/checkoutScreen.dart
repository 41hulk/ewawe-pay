import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:ewawepay/utils/colors.dart';
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
                  onPressed: () => _mastercard(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[350],
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
                  onPressed: () => _mastercard(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[350],
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
                  onPressed: () => _mastercard(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[350],
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
                            image: AssetImage("assets/images/momo.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  onPressed: () => _mastercard(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[350],
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
                            image: AssetImage("assets/images/visa.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  onPressed: () => _mastercard(),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[350],
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

  void _mastercard() {
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
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        padding: EdgeInsets.only(right: 80, left: 15),
                        child: Text(
                          'Add Tenant Phone Number',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: productSans,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 10),
                        child: ArgonButton(
                          height: 40,
                          roundLoadingShape: true,
                          width: 70,
                          onTap: (startLoading, stopLoading, btnState) async {
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
                          child: Text(
                            "Add",
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
                          color: red,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Expanded(
                          child: TextField(
                            // controller: myController,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                hintMaxLines: 1,
                                hintText: "Enter Phone Number",
                                filled: true,
                                fillColor: lightGrey,
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
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
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
              onTap: () => screen,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Hero(
                      tag: imgPath,
                      child: Container(
                        height: 120,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath), fit: BoxFit.contain),
                        ),
                      ),
                    ),
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

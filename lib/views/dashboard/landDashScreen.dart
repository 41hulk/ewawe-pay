import 'dart:convert';

import 'package:avatars/avatars.dart';
import 'package:ewawepay/services/properties.dart';

import 'package:ewawepay/utils/colors.dart';
import 'package:ewawepay/views/Payment/invoiceScreen.dart';
import 'package:ewawepay/views/Profile/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

class LandDashboardScreen extends StatefulWidget {
  @override
  _LandDashScreenState createState() => _LandDashScreenState();
}

class _LandDashScreenState extends State<LandDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: false,
          title: Image.asset(
            'assets/images/ewawelogo.png',
            fit: BoxFit.contain,
            height: 50,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => UserProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Container(
              padding: EdgeInsets.only(left: 7.0, bottom: 12),
              margin: EdgeInsets.only(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hi, ',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nicole!',
                        style: GoogleFonts.poppins(
                            color: ewawegreen,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  _accountInfo(),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Buildings',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: getProperty(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error'),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 9,
                                  crossAxisSpacing: 10),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, int index) {
                            return Container();
                            // _propertyCard(
                            //     snapshot.data[index]["profile"]);
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            _houseInfo(),
            _cardInfo()
          ],
        ));
  }

  Widget _propertyCard(img) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: AssetImage(img),
            // NetworkImage(
            //   img,
            // ),
            child: InkWell(
              onTap: () {},
            ),
            height: 240,
            fit: BoxFit.cover,
          ),
          // Text(
          //   propertyname,
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //     fontSize: 15,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _cardInfo() {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20),
      child: TitleScrollNavigation(
        barStyle: TitleNavigationBarStyle(
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          spaceBetween: 40,
        ),
        titles: [
          "List of Tenants",
          "List of Invoices",
          "List of Contract",
        ],
        pages: [
          Container(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
                future: getTenants(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              _transactionCartTenant(
                                  snapshot.data[index]["tenant_name"],
                                  snapshot.data[index]["floor_name"],
                                  snapshot.data[index]["building_name"],
                                  snapshot.data[index]["total_rent"],
                                  snapshot.data[index]["tenant_email"])
                            ],
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
                future: getInvoice(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              _invoiceCard(
                                snapshot.data[index]['tenant_name'],
                                snapshot.data[index]['invoice_period'],
                                snapshot.data[index]['invoice_status'],
                                snapshot.data[index]['invoice_amount'],
                                snapshot.data[index]['invoice_from'],
                                snapshot.data[index]['invoice_to'],
                              )
                            ],
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
                future: getContract(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              _cardContract(
                                snapshot.data[index]['tenant_name'],
                                snapshot.data[index]['building_name'],
                                snapshot.data[index]['currency'],
                                snapshot.data[index]['tenant_email'],
                                snapshot.data[index]['contract_status'],
                                snapshot.data[index]['signed_date'],
                                snapshot.data[index]['end_date'],
                              )
                            ],
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _transactionCartTenant(name, floor, building, amount, email) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: EdgeInsets.only(right: 50),
            // padding: EdgeInsets.only(right: 50),

            child: Avatar(
              name: name,
              placeholderColors: [ewawegreen],
              backgroundColor: ewawegreen,
              textStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 26),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text(
                '$floor Floor, $building',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Amount: $amount',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                'Contact: $email',
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _invoiceCard(name, period, status, amount, from, to) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Material(
        child: InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (context) => InvoiceScreen(),
            //   ),
            // );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    period,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    status,
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    amount,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text('From: $from'),
                  Text('to: $to'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardContract(name, building, amount, email, status, from, to) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Material(
        child: InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (context) => InvoiceScreen(),
            //   ),
            // );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    '$building',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '$amount',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '$email',
                    style: GoogleFonts.poppins(
                        fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status: $status',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text('From: $from'),
                  Text('to: $to'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _accountInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('Paid Invoice',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.caretUp,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '120,000 RWF',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade400),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text('Unpaid Invoice',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.caretDown,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text('120,000 RWF',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade400,
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _houseInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 16.0),
      // decoration: BoxDecoration(
      //      color: Colors.grey.shade300,
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: Color(0xFFE0E0E0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'M&M buildings',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ewawegreen),
              ),
            ],
          ),
          Column(
            children: [
              Text('Total Tenants',
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w600)),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.user, size: 17, color: ewawegreen),
                  SizedBox(
                    width: 5,
                  ),
                  Text('144',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      )),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text('Available Space',
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w600)),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.building,
                      size: 15, color: ewawegreen),
                  SizedBox(
                    width: 5,
                  ),
                  Text('80',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

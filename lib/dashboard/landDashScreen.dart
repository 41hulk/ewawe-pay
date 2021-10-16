import 'package:avatars/avatars.dart';
import 'package:ewawepay/Payment/invoiceScreen.dart';
import 'package:ewawepay/Profile/profileScreen.dart';

import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              padding: EdgeInsets.only(left: 13.0, bottom: 12),
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
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                childAspectRatio: 1,
                mainAxisSpacing: 9,
                children: <Widget>[
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                ],
              ),
            ),
            _cardInfo()
          ],
        ));
  }

  Widget _buildCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage(
              'https://www.newtimes.co.rw/sites/default/files/main/articles/2018/03/08/15204611531.jpg',
            ),
            child: InkWell(
              onTap: () {},
            ),
            height: 240,
            fit: BoxFit.cover,
          ),
          Text(
            'M&M buildings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardInfo() {
    return Container(
      height: 500,
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
          "Financial Report",
        ],
        pages: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                _transactionCart(),
                _transactionCart(),
                _transactionCart(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [_invoiceCard(), _invoiceCard(), _invoiceCard()],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                _transactionCart(),
                _transactionCart(),
                _transactionCart(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                _transactionCart(),
                _transactionCart(),
                _transactionCart(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionCart() {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: EdgeInsets.only(right: 50),
            // padding: EdgeInsets.only(right: 50),

            child: Avatar(
              name: 'T&T group',
              placeholderColors: [ewawegreen],
              backgroundColor: ewawegreen,
              textStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 32),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('T&T Group',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text(
                'East Wing, 7th Floor',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Amount: 200,000RWF',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                'Contact: info@TGroup.com',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _invoiceCard() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => InvoiceScreen(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('M&M',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    'January to February',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'EWAWE-G56345',
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
                    '120,000 RWF',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text('Jun 21, 2021'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

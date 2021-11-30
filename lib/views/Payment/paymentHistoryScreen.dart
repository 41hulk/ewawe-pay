import 'package:ewawepay/services/properties.dart';
import 'package:ewawepay/utils/authService.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:ewawepay/views/Payment/invoiceScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistoryScreen extends StatefulWidget {
  @override
  _PaymentHistoryScreenState createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ewawegreen,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Payment History',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
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
            top: 15,
          ),
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
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          await storeInvoicedata(snapshot.data[index]['id']);
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => InvoiceScreen(),
                            ),
                          );
                        },
                        child: _invoiceCard(
                          snapshot.data[index]['tenant_name'],
                          snapshot.data[index]['invoice_period'],
                          snapshot.data[index]['invoice_status'],
                          snapshot.data[index]['invoice_amount'],
                          snapshot.data[index]['invoice_from'],
                          snapshot.data[index]['invoice_to'],
                          snapshot.data[index]['id'],
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(
                  color: ewawegreen,
                ),
              );
            },
          )
          // ListView.builder(
          //     itemCount: 20,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return _transactionCart();
          //     }),
          ),
    );
  }

  Widget _invoiceCard(name, period, status, amount, from, to, invId) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Material(
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
    );
  }
}

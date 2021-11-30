import 'dart:convert';

import 'package:ewawepay/Networkhandler.dart';
import 'package:ewawepay/services/properties.dart';
import 'package:ewawepay/utils/authService.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:ewawepay/views/dashboard/landDashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  int invoiceID = 0;

  @override
  void initState() {
    super.initState();
    nameUser();
  }

  void nameUser() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      invoiceID = storage.getInt('invId')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Invoice',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 12),
          child: FutureBuilder(
              future: getOneInvoice(invoiceID),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // print(snapshot.data['invoiceDetails'][0]['tenant_name']);
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 30, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Billing From',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(height: 13),
                                  Text(
                                    '${snapshot.data['invoiceDetails'][0]['tenant_name']}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    'Tin:' +
                                        '${snapshot.data['invoiceDetails'][0]['tin_number']}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Tel:' +
                                        '${snapshot.data['invoiceDetails'][0]['tenant_telephone']}',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 30, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Billing to',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey.shade600),
                                  ),
                                  SizedBox(height: 13),
                                  Text(
                                    '${snapshot.data['PropertyDetails'][0]['property_name']}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    'Tin:' +
                                        '${snapshot.data['PropertyDetails'][0]['property_owner_tin_number']}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Tel:' +
                                        '${snapshot.data['PropertyDetails'][0]['property_telephone']}',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  )
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _description(
                          'PMS',
                          '${snapshot.data['invoiceDetails'][0]['invoice_period']}',
                          '${snapshot.data['invoiceDetails'][0]['invoice_amount']}'),
                      SizedBox(
                        height: 40,
                      ),
                      _totals(
                          '${snapshot.data['invoiceDetails'][0]['invoice_amount']}',
                          '${snapshot.data['invoiceDetails'][0]['invoice_amount']}'),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(),
                              onPressed: () {},
                              child: Text('Download'),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                await deleteInvoice(invoiceID);
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => LandDashboardScreen(),
                                  ),
                                );
                              },
                              child: Text('Delete'),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
          //    Column(
          //     children: [
          //       Row(
          //         children: [
          //           Container(
          //             padding: EdgeInsets.only(left: 30, top: 10),
          //             child: _billingInfo(
          //                 'Billing From', 'Ewawe Group', '10456546', '0780823423'),
          //           ),
          //           SizedBox(
          //             width: 40,
          //           ),
          //           Container(
          //             padding: EdgeInsets.only(left: 30, top: 10),
          //             child: _billingInfo(
          //                 'Billing To', 'Makuza LTD', '1086746', '0780878708'),
          //           ),
          //         ],
          //       ),
          //       SizedBox(
          //         height: 50,
          //       ),
          //       _description('PMS', '1', '100,000Rwf'),
          //       SizedBox(
          //         height: 40,
          //       ),
          //       _totals('100,000RWF', '100,000RWF'),
          //       SizedBox(
          //         height: 40,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Container(
          //             child: ElevatedButton(
          //               style: ElevatedButton.styleFrom(),
          //               onPressed: () {},
          //               child: Text('Download'),
          //             ),
          //           ),
          //           Container(
          //             child: ElevatedButton(
          //               onPressed: () {},
          //               child: Text('Share'),
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ));
  }

  Widget _billingInfo(title, name, tin, number) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey.shade600),
        ),
        SizedBox(height: 13),
        Text(
          name,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          'Tin: $tin',
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        Text(
          'Tel: $number',
          style: GoogleFonts.poppins(fontSize: 14),
        )
      ],
    );
  }

  Widget _description(product, qty, totals) {
    return Container(
      child: DataTable(columns: [
        DataColumn(
            label: Text(
          'Product',
          style: GoogleFonts.poppins(),
        )),
        DataColumn(
            label: Text(
          'Quantity',
          style: GoogleFonts.poppins(),
        )),
        DataColumn(
            label: Text(
          'Totals',
          style: GoogleFonts.poppins(),
        ))
      ], rows: [
        DataRow(cells: [
          DataCell(
            Flexible(
              child: Text(
                product,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          DataCell(
            Text(
              qty,
              style: GoogleFonts.poppins(),
            ),
          ),
          DataCell(
            Text(
              totals,
              style: GoogleFonts.poppins(),
            ),
          )
        ])
      ]),
    );
  }

  Widget _totals(subtotal, total) {
    return Container(
      padding: EdgeInsets.only(left: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subtotal:',
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Colors.grey.shade600),
              ),
              SizedBox(height: 13),
              Text(
                'Total:',
                style: GoogleFonts.poppins(
                    color: ewawegreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtotal,
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Colors.grey.shade600),
              ),
              SizedBox(height: 13),
              Text(
                total,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}

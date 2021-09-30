import 'package:ewawepay/main.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: _billingInfo(
                      'Billing From', 'Ewawe Group', '10456546', '0780823423'),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: _billingInfo(
                      'Billing To', 'Makuza LTD', '1086746', '0780878708'),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            _description('PMS', '1', '100,000Rwf'),
            SizedBox(
              height: 40,
            ),
            _totals('100,000RWF', '100,000RWF'),
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
                    onPressed: () {},
                    child: Text('Share'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _billingInfo(String title, String name, String tin, String number) {
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

  Widget _description(String product, String qty, String totals) {
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

  Widget _totals(String subtotal, String total) {
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
                '100,000RWF',
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Colors.grey.shade600),
              ),
              SizedBox(height: 13),
              Text(
                '100,000RWF',
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

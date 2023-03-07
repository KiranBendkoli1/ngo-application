import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PaymentDetailsPage extends StatefulWidget {
  final String apiKey;
  final String apiSecret;

  PaymentDetailsPage({required this.apiKey, required this.apiSecret});

  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  List<dynamic> payments = [];

  @override
  void initState() {
    super.initState();
    fetchPayments();
  }

  Future<void> fetchPayments() async {
    String url = 'https://api.razorpay.com/v1/payments';
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Basic ${base64.encode(utf8.encode('${widget.apiKey}:${widget.apiSecret}'))}'
    });

    var data = json.decode(response.body); //parses json data returned from api
    setState(() {
      payments = data['items'];
    });
  }

  void _launchRazorpayDashboard(String paymentId) async {
    String url = 'https://dashboard.razorpay.com/app/payments/$paymentId';

    if (await canLaunch(Uri.parse(url).toString())) {
      await launch(Uri.parse(url).toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        flexibleSpace: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF024E04),
                  Color(0xFF0B5D0B),
                ]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            //Displays table
            columns: const [
              DataColumn(label: Text('Payment Id')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Contact')),
              DataColumn(label: Text('Created At')),
              DataColumn(label: Text('Status')),
            ],
            rows: payments
                .map(
                  (payment) => DataRow(
                    cells: [
                      DataCell(
                        InkWell(
                          child: Text(
                            payment['id'],
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            _launchRazorpayDashboard(payment['id']);
                          },
                        ),
                      ),
                      DataCell(
                        Text(
                          NumberFormat.currency(
                            symbol: '₹',
                          ).format(double.parse(
                              (payment['amount'] / 100).toString())),
                        ),
                      ),
                      DataCell(
                        Text(payment['email']),
                      ),
                      DataCell(
                        Text(payment['contact'].toString()),
                      ),
                      DataCell(
                        Text(
                          DateFormat.yMMMMd().add_jm().format(
                                DateTime.parse(
                                    payment['created_at'].toString()),
                              ),
                        ),
                      ),
                      DataCell(
                        Text(payment['status']),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

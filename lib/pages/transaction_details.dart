import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Color(0xff0b5d0b),
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
            rows: payments.map((payment) {
              //map to iterate over list of payments
              String paymentId = payment['id'];
              String amount = payment['amount'].toString();
              String email = payment['email'];
              String contact = payment['contact'].toString();
              String createdAt = payment['created_at'].toString();
              String status = payment['status'];

              return DataRow(cells: [
                DataCell(Text(paymentId)),
                DataCell(Text(amount)),
                DataCell(Text(email)),
                DataCell(Text(contact)),
                DataCell(Text(createdAt)),
                DataCell(Text(status)),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

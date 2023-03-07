import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late var _razorpay;
  var amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NGO Payment Gateway",
          style: TextStyle(color: Colors.white),
        ),
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
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextField(
                controller: amountController,
                decoration:
                    const InputDecoration(hintText: "Enter your Amount"),
              ),
            ),
            MaterialButton(
                color: Color(0xff0b5d0b),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  "Pay Amount",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  ///Make payment
                  var options = {
                    'key': "rzp_test_1SzcPrcZbeMtiS",
                    // amount will be multiple of 100
                    'amount': (int.parse(amountController.text) * 100)
                        .toString(), //So its pay 500
                    'name': 'NGO Application',
                    'description': 'Every penny counts',
                    'timeout': 300, // in seconds
                    'prefill': {'contact': '', 'email': ''},
                    'external': {
                      'wallets': ['paytm']
                    }
                  };
                  _razorpay.open(options);
                  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                      (PaymentSuccessResponse response) {
                    String transactionId = response.paymentId.toString();
                    String orderID = response.orderId.toString();
                    String signature = response.signature.toString();

                    // Store transaction details in Firebase database
                    storeTransactionDetails(transactionId, orderID, signature);
                  });

                  _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                      (PaymentFailureResponse response) {
                    String code = response.code.toString();
                    storeTransactionFailureDetails(code);
                    // Handle error
                  });
                })
          ],
        ),
      ),
    );
  }

  void storeTransactionDetails(
      String transactionId, String orderID, String signature) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('transactions').add({
      'transactionId': transactionId,
      'orderId': orderID,
      'signature': signature
    });
  }

  void storeTransactionFailureDetails(String code) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('failedtransactions').add({'code': code});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}

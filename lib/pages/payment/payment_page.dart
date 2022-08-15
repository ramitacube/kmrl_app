import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/pages/payment/payment_successfully.dart';
import 'package:kmrl_connect_to_business/pages/payment/refund_policy.dart';
import 'dart:math';

import 'package:kmrl_connect_to_business/styles/colors.dart';

class SBIPayment extends StatefulWidget {
  final String? amount;
  final String? materialNo;
  final String? date;
  const SBIPayment({Key? key, this.amount, this.materialNo, this.date})
      : super(key: key);

  @override
  State<SBIPayment> createState() => _SBIPaymentState();
}

class _SBIPaymentState extends State<SBIPayment> {
  @override
  Widget build(BuildContext context) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    var orderNo = String.fromCharCodes(Iterable.generate(
        8, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset("assets/images/sbiepay.png"),
                  color: Colors.blue[900],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Billing Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                )
              ],
            ),
          ),
          Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order No.",
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      enabled: false,
                      controller: TextEditingController(text: orderNo),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: bgGreyColor),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                ),
                Text("Amount"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                        enabled: false,
                        controller: TextEditingController(text: widget.amount),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: bgGreyColor),
                                borderRadius: BorderRadius.circular(5)))),
                  ),
                ),
                Text("Date"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                        enabled: false,
                        keyboardType: TextInputType.datetime,
                        controller: TextEditingController(
                            text:
                                "${DateFormat("dd-MM-yyyy").format(DateTime.now())}"),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: bgGreyColor),
                                borderRadius: BorderRadius.circular(5)))),
                  ),
                ),
                Text("Remark"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                      controller: TextEditingController(
                          text:
                              "Station: ${widget.materialNo}\nInvoice as on ${widget.date}"),
                      maxLines: 4,
                      enabled: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: bgGreyColor),
                              borderRadius: BorderRadius.circular(5)))),
                ),
                TextButton(
                    style: ButtonStyle(
                        // padding: const EdgeInsets.all(5),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900])),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SuccessPage(
                                materialNo: widget.materialNo,
                                date: widget.date,
                              )));
                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
            ),
          )),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RefundPolicy()));
              },
              child: Text(
                "Refund Policy",
                style: TextStyle(color: Colors.grey),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_view.dart';

class SuccessPage extends StatefulWidget {
  final String? materialNo;
  final String? date;
  const SuccessPage({Key? key, this.materialNo, this.date}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
              height: 300,
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  size: 200,
                  color: Colors.green,
                ),
              )),
          Text(
            "Payment is successfull",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
            child: Container(
              height: 1,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Material No: ${widget.materialNo}"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("Date: ${widget.date}"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeDashboardView()));
              },
              child: Text("Back Home"),
            ),
          ),
        ],
      ),
    );
  }
}
